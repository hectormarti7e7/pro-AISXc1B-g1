USE innovatetech;

CREATE TABLE IF NOT EXISTS departamentos (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    UNIQUE KEY uk_nombre (nombre)
);

CREATE TABLE IF NOT EXISTS empleats (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100),
    direccion TEXT,
    telefono VARCHAR(20),
    codigo_departamento VARCHAR(10) NOT NULL,
    FOREIGN KEY (codigo_departamento) REFERENCES departamentos(codigo),
    INDEX idx_departamento (codigo_departamento)
);

CREATE TABLE IF NOT EXISTS grup_qualitat (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom_grup VARCHAR(50) UNIQUE NOT NULL,
    qualitat_video ENUM('alta', 'mitjana', 'baixa') DEFAULT 'mitjana',
    qualitat_audio ENUM('alta', 'mitjana', 'baixa') DEFAULT 'mitjana'
);

CREATE TABLE IF NOT EXISTS configuracio_trucades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    servidor_videotrucades VARCHAR(255),
    port INT,
    protocol VARCHAR(50),
    UNIQUE KEY uk_servidor (servidor_videotrucades, port)
);

CREATE TABLE IF NOT EXISTS usuaris_sistema (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom_complet VARCHAR(100) NOT NULL,
    correu VARCHAR(100) UNIQUE,
    extensio VARCHAR(20),
    estat ENUM('actiu', 'bloquejat') DEFAULT 'actiu',
    tipus ENUM('client', 'empleat') DEFAULT 'empleat',
    link_videotrucada VARCHAR(255),
    dni_empleat VARCHAR(20),
    id_grup_qualitat INT,
    FOREIGN KEY (dni_empleat) REFERENCES empleats(dni),
    FOREIGN KEY (id_grup_qualitat) REFERENCES grup_qualitat(id),
    INDEX idx_correu (correu),
    INDEX idx_estat (estat),
    INDEX idx_tipus (tipus)
);

CREATE TABLE IF NOT EXISTS registre_trucades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuari_origen INT NOT NULL,
    usuari_destinatari INT NOT NULL,
    data_inici DATETIME NOT NULL,
    data_fi DATETIME,
    duracio INT,
    qualitat_servei VARCHAR(50),
    puntuacio INT CHECK (puntuacio >= 1 AND puntuacio <= 5),
    comentari TEXT,
    id_configuracio INT,
    FOREIGN KEY (usuari_origen) REFERENCES usuaris_sistema(id),
    FOREIGN KEY (usuari_destinatari) REFERENCES usuaris_sistema(id),
    FOREIGN KEY (id_configuracio) REFERENCES configuracio_trucades(id),
    INDEX idx_data_inici (data_inici),
    INDEX idx_usuari_origen (usuari_origen),
    INDEX idx_usuari_destinatari (usuari_destinatari)
);

CREATE TABLE IF NOT EXISTS videos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titol VARCHAR(200) NOT NULL,
    descripcio TEXT,
    categoria VARCHAR(100),
    duracio INT,
    data_publicacio DATETIME,
    link_streaming VARCHAR(255) UNIQUE,
    INDEX idx_categoria (categoria),
    INDEX idx_data (data_publicacio)
);

CREATE TABLE IF NOT EXISTS analisi_amplada_banda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_mesura DATETIME NOT NULL,
    usuari_equip VARCHAR(100),
    velocitat_baixada FLOAT,
    velocitat_pujada FLOAT,
    latencia FLOAT,
    resultat ENUM('acceptable', 'no_acceptable'),
    operari VARCHAR(100),
    notes TEXT,
    INDEX idx_data_mesura (data_mesura),
    INDEX idx_resultat (resultat)
);

CREATE TABLE IF NOT EXISTS avisos_auditoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuari VARCHAR(100),
    taula_afectada VARCHAR(100),
    operacio VARCHAR(50),
    data_hora DATETIME NOT NULL,
    descripcion TEXT,
    INDEX idx_usuari (usuari),
    INDEX idx_data_hora (data_hora),
    INDEX idx_taula (taula_afectada)
);

CREATE TABLE IF NOT EXISTS control_backups (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_backup DATE NOT NULL,
    hora_backup TIME,
    taules_incloses TEXT,
    resultat VARCHAR(50),
    INDEX idx_data_backup (data_backup)
);

INSERT INTO departamentos (codigo, nombre, telefono) VALUES
('VEND', 'Ventas', '934001001'),
('TECH', 'Soporte Tecnico', '934001002'),
('ADMIN', 'Administracion', '934001003'),
('LOGIS', 'Logistica', '934001004');

INSERT INTO empleats (dni, nombre, cognoms, direccion, telefono, codigo_departamento) VALUES
('12345678A', 'Joan', 'Garcia Lopez', 'Carrer 1, Barcelona', '912345678', 'VEND'),
('87654321B', 'Anna', 'Martinez Perez', 'Carrer 2, Barcelona', '912345679', 'TECH'),
('11111111C', 'Pere', 'Sanchez Garcia', 'Carrer 3, Barcelona', '912345680', 'ADMIN'),
('22222222D', 'Maria', 'Lopez Rodriguez', 'Carrer 4, Barcelona', '912345681', 'LOGIS');

INSERT INTO grup_qualitat (nom_grup, qualitat_video, qualitat_audio) VALUES
('Alta Velocidad', 'alta', 'alta'),
('Velocidad Media', 'mitjana', 'mitjana'),
('Baja Velocidad', 'baixa', 'baixa');

INSERT INTO configuracio_trucades (servidor_videotrucades, port, protocol) VALUES
('trucades.innovatetech.com', 5060, 'SIP'),
('videoconf.innovatetech.com', 443, 'WebRTC');

INSERT INTO usuaris_sistema (nom_complet, correu, extensio, estat, tipus, dni_empleat, id_grup_qualitat) VALUES
('Joan Garcia Lopez', 'joan.garcia@innovatetech.com', '101', 'actiu', 'empleat', '12345678A', 1),
('Anna Martinez Perez', 'anna.martinez@innovatetech.com', '102', 'actiu', 'empleat', '87654321B', 1),
('Pere Sanchez Garcia', 'pere.sanchez@innovatetech.com', '103', 'actiu', 'empleat', '11111111C', 2),
('Client Extern', 'client@example.com', '201', 'actiu', 'client', NULL, 2);


