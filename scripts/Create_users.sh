#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/users"
mkdir -p "$OUTPUT_DIR"
OUTPUT_FILE="$OUTPUT_DIR/create_users_$(date +%Y%m%d_%H%M%S).sql"

clear
echo -e "${BLUE}"
echo "┌───────────────────────────────────────────────┐"
echo "│ Script de Creacion de Usuarios MySQL          │"
echo "│ InnovateTech                                  │"
echo "└───────────────────────────────────────────────┘"
echo -e "${NC}"
echo ""

read -p "Host de MySQL (defecto: localhost): " DB_HOST
DB_HOST="${DB_HOST:-localhost}"
echo -e "${GREEN}✓ Host: $DB_HOST${NC}"

read -p "Nombre de la base de datos (defecto: innovatetech): " DB_NAME
DB_NAME="${DB_NAME:-innovatetech}"
echo -e "${GREEN}✓ Base de datos: $DB_NAME${NC}"

read -sp "Contraseña del administrador MySQL (root): " DB_ADMIN_PASSWORD
echo ""
if [ -z "$DB_ADMIN_PASSWORD" ]; then
  echo -e "${RED}Error: Debes introducir la contraseña del administrador${NC}"
  exit 1
fi
echo -e "${GREEN}✓ Contraseña recibida${NC}"

read -p "Contraseña para los usuarios (defecto: pirineus): " DEFAULT_USER_PASSWORD
DEFAULT_USER_PASSWORD="${DEFAULT_USER_PASSWORD:-pirineus}"
echo -e "${GREEN}✓ Contraseña usuarios: ${DEFAULT_USER_PASSWORD}${NC}"

> "$OUTPUT_FILE"
cat >> "$OUTPUT_FILE" <<EOF
USE $DB_NAME;
SET AUTOCOMMIT=0;
START TRANSACTION;
EOF

echo ""
echo -e "${YELLOW}=== Crear usuarios ===${NC}"
echo ""

declare -A ADDED_USERS=()
USER_COUNT=0

while true; do
  USER_COUNT=$((USER_COUNT+1))
  echo ""
  echo "Usuario #$USER_COUNT"
  read -p "Nombre de usuario (o 'salir' para terminar): " UNAME
  UNAME="$(echo "$UNAME" | xargs)"
  if [ -z "$UNAME" ] || [ "$UNAME" = "salir" ]; then
    USER_COUNT=$((USER_COUNT-1))
    break
  fi

  if [ "${ADDED_USERS[$UNAME]+_}" ]; then
    echo -e "${YELLOW}Aviso: ${UNAME} ya fue añadido en esta sesion${NC}"
    USER_COUNT=$((USER_COUNT-1))
    continue
  fi

  echo ""
  echo "Roles disponibles:"
  echo "1) admin - Acceso total a la base de datos"
  echo "2) vendes - Gestion de clientes y trucadas"
  echo "3) administracio - Gestion de personal y departamentos"
  echo "4) treballador - Acceso limitado de lectura"
  read -p "Selecciona rol (1/2/3/4): " ROLE_OPT
  ROLE_OPT="${ROLE_OPT:-4}"

  case "$ROLE_OPT" in
    1)
      ROLE_NAME="admin"
      cat >> "$OUTPUT_FILE" <<SQL

DROP USER IF EXISTS '${UNAME}'@'localhost';
CREATE USER '${UNAME}'@'localhost' IDENTIFIED BY '${DEFAULT_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${UNAME}'@'localhost' WITH GRANT OPTION;
GRANT FILE ON *.* TO '${UNAME}'@'localhost';
SQL
      ;;
    2)
      ROLE_NAME="vendes"
      cat >> "$OUTPUT_FILE" <<SQL

DROP USER IF EXISTS '${UNAME}'@'localhost';
CREATE USER '${UNAME}'@'localhost' IDENTIFIED BY '${DEFAULT_USER_PASSWORD}';
GRANT SELECT, INSERT, UPDATE ON \`${DB_NAME}\`.usuaris_sistema TO '${UNAME}'@'localhost';
GRANT SELECT, INSERT, UPDATE ON \`${DB_NAME}\`.registre_trucades TO '${UNAME}'@'localhost';
GRANT SELECT ON \`${DB_NAME}\`.configuracio_trucades TO '${UNAME}'@'localhost';
GRANT FILE ON *.* TO '${UNAME}'@'localhost';
SQL
      ;;
    3)
      ROLE_NAME="administracio"
      cat >> "$OUTPUT_FILE" <<SQL

DROP USER IF EXISTS '${UNAME}'@'localhost';
CREATE USER '${UNAME}'@'localhost' IDENTIFIED BY '${DEFAULT_USER_PASSWORD}';
GRANT SELECT, INSERT, UPDATE ON \`${DB_NAME}\`.empleats TO '${UNAME}'@'localhost';
GRANT SELECT, INSERT, UPDATE ON \`${DB_NAME}\`.departamentos TO '${UNAME}'@'localhost';
GRANT SELECT ON \`${DB_NAME}\`.videos TO '${UNAME}'@'localhost';
GRANT FILE ON *.* TO '${UNAME}'@'localhost';
SQL
      ;;
    4)
      ROLE_NAME="treballador"
      cat >> "$OUTPUT_FILE" <<SQL

DROP USER IF EXISTS '${UNAME}'@'localhost';
CREATE USER '${UNAME}'@'localhost' IDENTIFIED BY '${DEFAULT_USER_PASSWORD}';
GRANT SELECT ON \`${DB_NAME}\`.videos TO '${UNAME}'@'localhost';
GRANT SELECT ON \`${DB_NAME}\`.configuracio_trucades TO '${UNAME}'@'localhost';
GRANT INSERT ON \`${DB_NAME}\`.registre_trucades TO '${UNAME}'@'localhost';
SQL
      ;;
    *)
      ROLE_NAME="treballador"
      echo -e "${YELLOW}Opcion no valida, asignado rol treballador${NC}"
      cat >> "$OUTPUT_FILE" <<SQL

DROP USER IF EXISTS '${UNAME}'@'localhost';
CREATE USER '${UNAME}'@'localhost' IDENTIFIED BY '${DEFAULT_USER_PASSWORD}';
GRANT SELECT ON \`${DB_NAME}\`.videos TO '${UNAME}'@'localhost';
GRANT SELECT ON \`${DB_NAME}\`.configuracio_trucades TO '${UNAME}'@'localhost';
GRANT INSERT ON \`${DB_NAME}\`.registre_trucades TO '${UNAME}'@'localhost';
SQL
      ;;
  esac

  ADDED_USERS["$UNAME"]=1
  echo -e "${GREEN}✓ Usuario: ${UNAME} | Rol: ${ROLE_NAME}${NC}"
done

echo ""
echo "=== Resumen de usuarios ==="
i=0
for u in "${!ADDED_USERS[@]}"; do
  i=$((i+1))
  echo "${i}. ${u}"
done

echo ""
read -n 1 -p "¿Continuar con la generacion del script? (s/n): " CONT
echo ""
if [[ ! "$CONT" =~ ^[sS]$ ]]; then
  echo "Cancelado. Archivo guardado en: $OUTPUT_FILE"
  exit 0
fi

cat >> "$OUTPUT_FILE" <<EOF

FLUSH PRIVILEGES;
COMMIT;
SET AUTOCOMMIT=1;
EOF
echo ""
echo -e "${GREEN}✓ Script SQL generado: ${OUTPUT_FILE}${NC}"
echo ""

while true; do
  echo ""
  echo -e "${YELLOW}Opciones:${NC}"
  echo "1) Ejecutar script en la base de datos"
  echo "2) Ver archivo completo"
  echo "3) Salir sin ejecutar"
  echo ""
  read -p "Selecciona opcion (1/2/3): " OPTION
  case "$OPTION" in
    1)
      echo ""
      echo -e "${BLUE}Conectando a MySQL...${NC}"
      echo ""
      set +e
      mysql -h "$DB_HOST" -u root -p"$DB_ADMIN_PASSWORD" < "$OUTPUT_FILE" 2>/dev/null
      LAST_CODE=$?
      set -e

      if [ $LAST_CODE -eq 0 ]; then
        echo -e "${GREEN}✓ Script ejecutado correctamente${NC}"
        echo ""
        echo -e "${GREEN}=== Usuarios creados ===${NC}"
        for u in "${!ADDED_USERS[@]}"; do
          echo -e "${GREEN}$u${NC}"
        done
        exit 0
      else
        echo -e "${RED}✗ Error al ejecutar${NC}"
        read -n 1 -p "¿Reintentar? (s/n): " RETRY
        echo ""
        if [[ ! "$RETRY" =~ ^[sS]$ ]]; then
          exit 1
        fi
      fi
      ;;
    2)
      echo ""
      cat "$OUTPUT_FILE"
      echo ""
      ;;
    3)
      echo "Saliendo sin ejecutar."
      exit 0
      ;;
    *)
      echo "Opcion no valida."
      ;;
  esac
done
