
# Projecte Transversal
# Proposta CPD
## Ubicació física
## Localització
El contenidor CPD es troba instal·lat al pati posterior de la seu d'Innovate Tech, al Parc
Tecnològic 22@Barcelona, sobre una plataforma de formigó preparada per a la seva
instal·lació. El pati disposa de tancament perimetral amb tanca metàl·lica i accés controlat.
La connexió amb l'edifici d'oficines es fa per canalització soterrada (fibra òptica +
alimentació elèctrica), sense cablejat visible a l'exterior.
## Per què un CPD containeritzat i no una sala tradicional?
Avantatge Descripció
Rapidesa Instal·lació plug & play, sense obra
Sostenibilitat Free Cooling redueix consum energètic
Seguretat Aïllament físic de les oficines
Escalabilitat Fàcil d'ampliar amb un segon contenidor
Economia Menor cost que construir una sala CPD
tradicional

## Dimensions del contenidor
Dimensió Mesura
Longitud 6,06 m
Amplada 2,44 m
Alçada 2,89 m (High Cube: +30 cm respecte
l'estàndard)
Superficie útil interior ~13,5 m²
## Característiques constructives
Característica Especificació
Resistència al foc EI120
Estanqueïtat IP55 (protecció davant pols i aigua)
Recobriment exterior C5M, 350 micres (ISO 12944)
Compartimentació interna Panells sandvitx ignífugs
Passos int./ext. Sistemes de segellat modular certificats
Instal·lació Plug & play sobre plataforma de formigó
El contenidor implementa un sistema de climatització de doble unitat N+N, combinant dues
tecnologies:
Unitat interior — Inrow d'expansió directa:
- Situada entre els dos racks, treballa amb flux d'aire transversal.
- Aspira l'aire calent del Hot Aisle (part posterior dels servidors).
- Retorna aire fred al Cold Aisle (part frontal dels servidors).
Unitat exterior — Free Cooling (tipus mochila):
- Aprofita les condicions ambientals externes per reduir la compressió frigorífica.
- Redueix significativament el consum energètic del sistema de refrigeració.

Per a una empresa petita com Innovate Tech, la càrrega tèrmica generada pels
servidors és baixa (~3–4 kW IT). El sistema de freecooling és especialment
eficient en el clima de Barcelona (temperatures moderades gran part de l'any).
## Paràmetres ambientals
Paràmetre Valor
Temperatura operativa 18°C – 27°C
Humitat relativa 45% – 55%
Redundància N+N (si falla una unitat, l'altra manté el
servei)
Gestió Controlador amb monitorització web i
alertes en temps real
- Contenidor pintat de color gris neutre, sense retolació que indiqui la seva funció.
- Identificat internament com "Unitat Tècnica UT-01" (sense referència a CPD,
servidors ni dades).
- Cap finestra ni obertura visible a l'exterior (les reixes del free cooling estan
integrades discretament a la part posterior).
- Cablejat d'interconnexió amb l'edifici per conductes soterrats, sense traça visible.
- Senyalització exterior mínima: únicament avisos obligatoris de seguretat elèctrica i
accés restringit.
- La porta d'accés no indica la funció de la instal·lació i disposa d'autenticació
electrònica .
- El pati no és visible des de la via pública.
## Terra tècnic
El terra interior del contenidor és elevat per permetre:
- Pas del cablejat elèctric per sota, separat físicament del cablejat de dades.
- Circulació de l'aire fred des de la unitat Inrow cap al front dels racks (Cold Aisle).
- Facilitat de manteniment i substitució de cables sense afectar els equips actius.
## Sostre tècnic
La part superior interior disposa de safates portacables metàl·liques integrades:

- Pas del cablejat de xarxa UTP Cat6A i fibra òptica entre racks.
- Retorn de l'aire calent cap a la unitat de climatització .
- Safates separades per a dades i per a elèctric (mai compartides).
## Codi de colors
Color Tipus Funció
🔵 Blau UTP Cat6A Xarxa de dades
🟡 Groc UTP Cat6 Gestió i consola (OOB)
⚫ Negre Elèctric Alimentació línia A
🔴 Vermell Elèctric Alimentació línia B
🟠 Taronja Fibra òptica Connexió WAN / alta
velocitat
## Normes de gestió
- Tots els cables etiquetats als dos extrems seguint l'estàndard TIA-606, basat en
rack-posició-port (ex: A1-1 → A2-1)..
- Brides i safates organitzades per tipus (dades i elèctric mai junts).
- Patch panels als racks per centralitzar connexions i facilitar canvis.
- Longitud de cables optimitzada per evitar acumulació de cablejat sobrant.
- Radi de curvatura respectat en la fibra òptica.
## PDUs intel·ligents
- Una PDU vertical 0U per rack, identificades cromàticament:
- Blava → Línia A (circuit principal)
- Vermella → Línia B (circuit redundant)
- Monitorització del consum en temps real per rack.
- Gestió remota via SNMP i HTTPS.

## Planell de situació — Vista exterior
![Imatge 1](img/img1.png)

## Planell interior — Vista planta
## Distribució i gestió del cablejat — codi de colors
![Imatge 2](img/img2.png)
![Imatge 3](img/img3.png)

## Estructuració dels racks — Rack 1 i Rack 2
![Imatge 4](img/img4.png)

# Infraestructura IT
InnovateTech té un total de 7 serveis en 6 servidors (Web i FTP estan al mateix servidor),
tots els servidors corren sobre Ubuntu Server 24.04 LTS, per a això necessitem una bona
organització i satisfacer els requeriments que es necessiten per un CPD.
## Servidors: Número i tipus de model:
Servei Rol (Servei) S.O base Especificacions
mínimes
Web + FTP Nginx HTTPS Ubuntu Server 2 vCPU, 16 GB
Server + SFTP 24.04 LTS RAM, 2TB HDD
Audio Ampache Ubuntu Server 2 vCPU, 16 GB
24.04 LTS RAM, 1TB HDD
Video + NGINX-RTMP + Jitsi Ubuntu Server 4 vCPU, 16 GB
Videoconferencia Meet 24.04 LTS RAM, 1TB SSD
Base de dades MySQL Ubuntu Server 4 vCPU, 16 GB
24.04 LTS RAM, 1TB SSD
Centralització de Kibana + Ubuntu Server 4 vCPU, 8 GB RAM,
logs Elasticsearch + 24.04 LTS 2TB HDD
Logstash
Directori Actiu Samba AD DC Ubuntu Server 2 vCPU, 4 GB RAM,
24.04 LTS 50 GB SSD
## Patch Panels:
2 Patch panel Cat6A de 48 ports, que s’ubicaran al rack 1 i al rack 2. Tindrem un
organitzador de cables intermedis de 1U entre cada patch panel i el switch per mantenir
l’ordre del cablejat. Etiquetatge de cada port seguint un estàndard, el TIA-606 que es basa
en rack-posició-port.
## Switches:
Hem escollit 2 tipus de switches. Primer, tenim el Switch Core L3 (48 ports PoE, 4x SFP+
10G uplink), aquest switch interconnectarà tots els racks i gestiona el routing entre VLANs.
- VLAN10: Servidors IT.
- VLAN 20:Gestió/IPMI.

- VLAN 30: Accès clients.
- VLAN 99: Administració de xarxa.
A continuació, tenim el 2n switch, el Switch d’accés L2 (24 ports):
Aquest switch estarà dedicat exclusivament a la xarxa per a gestió i IPMI dels servidors, i,
estarà completament segregat del tràfic de producció.
## Planells i diagrames de distribució de racks, patch panels i switches:
![Imatge 5](img/img5.png)

![Imatge 6](img/img6.png)
![Imatge 7](img/img7.png)

# Infraestructura elèctrica
Sistemes d’alimentació redundant
## Estimació de consum elèctric
## Consum pels servidors
- Server Web + SFTP (Rack 1U, 2vCPU/4GB/50GB): 180-220W
- Server Audio (Rack 1U, 2vCPU/4GB/100GB): 200-250W
- Server Vídeo + Videoconferència (Rack 1U, 4vCPU/8GB/200GB): 280-350W
- Server Base de Dades (Rack 1U, 4vCPU/8GB/200GB): 280-350W
- Server Centralització de Logs (Rack 1U, 4vCPU/8GB/500GB): 280-350W
- Server Directori Actiu (Rack 1U, 2vCPU/4GB/50GB): 180-220W
- Estimació Total: 1400-1740 W.
## Consum de Xarxa i equipament complementari
- Switch Core L3 (48 ports PoE, 4x SFP+ 10G): 150-200W
- Switch d'Accés L2 (24 ports): 80-110W
- Patch Panel Cat6A (48 ports) x2: 0W (equipment passiu)
- Organitzador de cables: 0W (equipament passiu)
- PDU Inteligent: 20-30W
- Luminaria LED CPD: 100-150W
- Estimació total: 350-490 W.
## Consum de climatització
- Unitat Inrow (quan és necessari compressió frigorifica): 800-1200W
- Free Cooling (aprofita condicions externes): redueix un 40-60 % el consum
- Consum promig anual amb free cooling: 1200-2000
- consum pic (clima calent, sense free cooling efectiu): 1500-2500 W
- Estimació climatització: 1200-2500W (depenent de les condicions ambientals)
## Consum Total Operatiu
- Servidors + xarxa: 1655 - 2060W.
- Climatització (operació normal): 1200-1800 W
- Climatització (pic, condicions extremes): 1500-2500 W
- Consum total : 2950-4030 W (Climatització normal) / 3250-4740 W (Condicions
extremes)
Amb aquestes dades, per deduir quin SAI necessitem hem de considerar un marge de 25%
sobre el consum màxim:
- Consum Màxim Pic: 4740 W
- Marge de seguretat (25%): 1185 W
Total per dimensionament SAI: 5925 W
Amb tota aquesta informació deduïm que necessitem un SAI de mínim 6 kVA (6000 W) per
garantir funcionament i comoditat operativa dins dels serveis en cas d'emergència.

SAIS
Càlcul de bateria i components
Per calcular la bateria necessaria i quin model hem d’escogir, hem fet 3 diferents escenaris
en el que el SAI hauria de treballar.
Escenari 1: Carga Normal (2500W - Operació típica)
- Autonomia estimada 25-30 mins.
- Temps suficient per apagada ordenada completa de tots els servidors.
- Permet executar scripts de backup i sincronització de dades.
Escenari 2: Carga reduïda (1500W - Apagada parcial)
- Autonomia estimada: 45-60 mins.
- Permet mantenir servidors crítics (base de dades, AD) operatius mentre s’apaguen
altres.
Escenari 3: Carga Mínima (1.000W - Serveis Critics només)
- Autonomia estima: 90+ mins.
- Permet operació prolongada de servidors essencials.
Model SAI
Amb totes aquestes necessitats hem arribat a la conclusió d’escogir un SAI, el SAI que hem
escollit el APC SRT2200XLI (link compra), que té compleix amb els requeriments
necessaris, aquestes son les caracteristiques del SAI:
● Capacitat: 3 kVA / 3.000W.
● Potencia bateria: 2.700W.
● Rendiment: 94,2%.
● Voltatge entrada: 160-275V CA.
● Voltatge sortida: 220V ±10%.
● Bateria: VRLA Gel 48V / 9Ah (432 Wh) amb hot-swap.
● Autonomia: * 10-12 min plena carga
○ 20-25 min @ 70%
○ 35-40 min @ 50%
○ 60+ min @ 25%
● Salides: 6 × C13 + 1 × C19.
● Ports: USB, RJ-45 SNMP, RS-232, SmartSlot.
● Temps transferència: < 4ms.
● Proteccions: sobrecarga, apagado emergència, alarma audible.
● Dimensiones: 483 × 177 × 432 mm.
● Peso: 35 kg.
● Temperatura operativa: 0-40°C.
● Certificacions: CE, RoHS, ENERGY STAR, EN/IEC 62040.
● Garantia: 5 anys.
● Preu: (1954,49€ x2) 3908,98€

Seguretat fisica i lògica
Fisica:
Els elements de la part de seguretat del CPD es basen en 3 capes:
La Capa 1 és el perímetre exterior del pati, que disposa d'una tanca metàl·lica i d'una porta
d'accés amb pany electrònic i videoporter. Només el personal autoritzat pot entrar al pati.
L'accés des del carrer no permet veure l'interior del pati ni identificar el contenidor.
La Capa 2 és la porta d'accés al contenidor amb doble factor. La porta del contenidor és
d'acer reforçat i requereix doble autenticació: s'utilitzaria una targeta RFID, de la qual només
disposen les persones autoritzades, i el sistema registra l'usuari que hi ha accedit juntament
amb la data i l'hora de l'accés. I també amb un teclat PIN, ja que si no saps quin és el codi,
és igual que tinguis la targeta perquè no podràs accedir-hi. Als 3 intents incorrectes es
genera una alerta automàtica.
La Capa 3 és una gàbia de seguretat dins del contenidor, on estaran els dos racks protegits.
Per accedir a l'interior de la gàbia fa falta una clau, de manera que, encara que siguis capaç
de travessar les capes anteriors, encara queda travessar la gàbia.
Pel que fa a la part de videovigilància, s'instal·larien 4 càmeres (la primera a l'entrada del
pati interior, la segona a la porta del contenidor a l'exterior, la tercera a l'interior del
contenidor a la cantonada dreta i la quarta a l'interior del contenidor a la cantonada esquerra
en paral·lel a la tercera). Les característiques de les càmeres són:
·Resolució 1080p Full HD com a mínim.
·Visió nocturna per infrarojos.
·Gravació contínua 24/7.
·Emmagatzematge en NVR amb disc de 6 TB, amb una retenció de 30 dies de gravació.
·Accés remot a les gravacions exclusivament mitjançant VPN, només disponible en els
ordinadors del responsable de seguretat.
El sistema de prevenció, detecció i extinció d'incendis es basa en:
Prevenció: amb la prohibició total d'introduir líquids, aliments o materials inflamables dins
del contenidor. Els equips es revisen periòdicament per detectar sobreescalfaments abans
que siguin perillosos i el contenidor no té paper, ni cartó, ni cap altre material combustible a
l'interior.
Detecció: amb 2 detectors de fum iònics al sostre del contenidor (un a sobre de cada rack),
amb una sensibilitat alta per detectar partícules de fum abans que hi hagi flames visibles.
També inclou 1 detector de temperatura integrat al sistema de climatització que activa una
alarma si se supera el llindar de temperatura establert en 30 °C, 1 detector d’humitat amb un
rang establert entre el 45% i el 55% per evitar la condensació d'aigua o l'electricitat estàtica
que podrien fer malbé els components electrònics dels servidors , juntament amb una
central d'alarmes connectada a tots els detectors de fum i de temperatura que notifica el
responsable en cas d'alarma.

Extinció: és un sistema automàtic d'extinció per gas inert que, en activar-se, allibera un gas
que redueix l'oxigen per sota del nivell de combustió, apagant el foc sense danyar els equips
ni deixar residus. És l'estàndard per a CPD i és compatible amb espais tancats. També
disposa de 2 extintors de CO₂ (tipus C), un a l'interior al costat de la porta i un altre a
l'exterior del contenidor, per a una intervenció manual.
Vies d'evacuació: La via principal és la porta principal, que des de l'interior s'obre sense
necessitat d'introduir codis ni res.
Senyalització d'emergència: Està instal·lada sobre la porta interior i és visible fins i tot amb
fum. És autònoma, disposa de la seva pròpia bateria i s'activa automàticament si hi ha talls
de llum.
Enllumenat d'emergència: Se situa a sobre de la porta interior i té una autonomia de 1
hora en cas de tall elèctric.
Protocol d'evacuació: Estableix que tot el personal que treballi a l'interior ha de saber que,
davant de qualsevol alarma, ha de sortir immediatament, allunyar-se del contenidor un
mínim de 10 metres i avisar el responsable de seguretat. No s'ha d'intentar apagar el foc
manualment si el sistema automàtic ja està activat.
Diagrama de la seguretat
Lógica:
Per a la restricció d'accés per autorització s'aplicarà el principi de mínim privilegi. Cada
usuari té els permisos limitats i exclusivament necessaris per al seu rol. Dins dels servidors
Linux, cap servei funcionarà amb l'usuari root, sinó cadascun exclusivament amb l'usuari del
sistema necessari. Els administradors tindran el seu propi usuari intransferible i sense
possibilitat d'accedir remotament amb SSH sense clau pública/privada. I totes les comandes
executades amb privilegis queden guardades al servidor de logs.
A nivell de firewall en tindrem un de físic i un altre de host. El físic servirà per obrir
exclusivament els ports necessaris que es puguin obrir cap a internet, com per exemple
l'HTTPS. Després, el firewall de host servirà per si de cas el físic ha tingut alguna fallada de
seguretat, limitant també les connexions amb iptables, com ara restringint que només es
pugui fer SSH dins de la xarxa interna i res que sigui extern.
![Imatge 8](img/img8.png)

Per al monitoratge s'utilitzarà Zabbix, perquè podem centralitzar tota la supervisió des d'un
mateix servidor. Es monitoritza el hardware (temperatura de la CPU, ús de RAM i CPU, per
exemple), els serveis (MySQL o LDAP, per exemple), la xarxa (latència, amplada de banda,
etc.) i la seguretat (intents fallits de login per SSH, per exemple). Tot això anirà juntament
amb un sistema d'alertes si alguna mètrica canvia dràsticament. Com per exemple: més
d'un 90% d'ús de CPU durant un temps prolongat, més de 5 intents d'SSH en 1 minut, etc.
Amb les còpies de seguretat s'aplicarà l'estratègia 3-2-1. Atès que es considera l'estàndard,
serà la que farem servir. Aquesta consta de 3 còpies de les dades en 2 tipus de suport
diferents, amb 1 còpia fora de les instal·lacions. Faríem una còpia incremental diària a les 2
del matí, una còpia completa setmanal tots els diumenges a les 3 del matí i una còpia
completa mensual el día 1 de cada mes.
Per als RAID utilitzaríem RAID 10. La configuració seria de 6 discs SSD de 4 TB, un total de
24 TB; es formen els parells mirall del RAID 1 i després es combinen en RAID 0 per al
rendiment. La capacitat útil seria de 12 TB. S'afegiria un 7è disc com a hot spare (disc de
reserva en calent); si un disc falla, el sistema es reconstrueix automàticament amb aquest
disc sense haver d'esperar la intervenció humana.
Prevenció de RRLL:
Risc elèctric
Tot el cablejat elèctric discorre pel fals terra tècnic, separat físicament del cablejat de dades.
Està prohibit realitzar treballs elèctrics sense formació específica i sense desconnectar
prèviament l'equip afectat. S'aplica el procediment de bloqueig i etiquetatge abans de
qualsevol intervenció elèctrica.
Risc per descàrrega del sistema d'extinció
El sistema de gas inert té un retard d'activació de 30 segons des que sona l'alarma, temps
suficient per sortir del contenidor. Està prohibit entrar al contenidor després d'una
descàrrega fins que el responsable de seguretat confirmi que el nivell d'oxigen és segur
mitjançant un mesurador de O₂.
Risc ergonòmic i de sobreesforç
Cap equip de més de 25kg no es manipula per una sola persona, sempre es requereix un
mínim de dues persones. Es disposa d'un carret elevador de rack per a la instal·lació
d'equips pesats.
Risc per exposició al soroll
Els sistemes de climatització i els ventiladors dels servidors generen soroll constant. Si
supera els 85 dB és obligatori l'ús de protectors auditius. Es limita la permanència contínua
dins del contenidor a un màxim de 2 hores seguides.
Risc per temperatura

Si la temperatura supera els 30°C està prohibit romandre dins del contenidor fins que es
restableixi la climatització.
Risc de caiguda
Qualsevol placa del fals terra que es retiri durant un treball ha de senyalitzar-se
immediatament amb un senyal d'advertència i col·locar-se de nou en acabar la intervenció.
Formació i procediments generals
Tot el personal amb accés al CPD rep una formació inicial de seguretat abans d'obtenir la
targeta d'accés, que inclou: protocol d'evacuació, maneig de l'extintor de CO₂, protocol
després de descàrrega de gas i normes elèctriques bàsiques.

Implementació del CPD
Servidor Web + SFTP:
Servidor Web i Transferència de Fitxers Segura (SFTP)
Introducció i Context del Projecte
● Aquest apartat detalla la implementació, el desplegament i la configuració del
servidor corporatiu d'Innovate Tech. Dins del marc del projecte transversal , s'ha
optat per una solució altament optimitzada i orientada al núvol que unifica el
Servidor Web actiu i el Servei de Transferència Segura de Fitxers (SFTP) dins
d'una mateixa instància d'Amazon Web Services (AWS).
● Aquest servidor actua com el nucli d'interconnexió frontal i d'APIs del projecte,
enllaçant dinàmicament la capa d'aplicació amb proveïdors externs de dades com
bases de dades distribuïdes, serveis d'autenticació i nodes de logs centralitzats
![Imatge 9](img/img9.png)

Arquitectura de l'Aplicació i Stack Tecnològic
A diferència d'un desplegament estàtic tradicional, la infraestructura actual d'Innovate Tech
dona suport a un entorn web dinàmic modern dividit en microserveis controlats per un gestor
de processos:
● Domini Actiu: https://innovatetech.ddns.net (Associat mitjançant No-IP).
● Frontend d'Alt Rendiment: Desenvolupat en React + TanStack Start + Vite,
executant-se com un procés Node.js gestionat per PM2 a la instància EC2 d'AWS.
● Backend / API Interna: Dissenyada amb Node.js i Express API per a la gestió lògica
del negoci.
● Gestor de Processos: PM2 s'encarrega de mantenir vius i monitorar en segon pla
els dos serveis principals en els següents ports locals:
○ innovatetech (Frontend) $\rightarrow$ Port 3000
○ api (API Express) $\rightarrow$ Port 4000
![Imatge 10](img/img10.png)

Preparació i Seguretat Inicial del Sistema (Hardening)
Per complir rigorosament amb els requeriments d'administració segura del CPD d'Innovate
Tech, s'ha prohibit de manera absoluta l'ús de l'usuari per defecte (ubuntu) per a tasques
d'administració web, minimitzant així els vectors d'atac.
Creació de l'Usuari Administrador de Serveis
S'ha creat un usuari dedicat del sistema anomenat adminweb. Per dotar-lo de persistència
d'accés sense comprometre el servidor amb contrasenyes febles, s'ha configurat un
esquema de clau pública/privada (SSH):
Configuració de l'entorn de claus segures: Es va extreure el fitxer authorized_keys
original de l'entorn d'AWS i es va replicar aplicant estrictament els permisos POSIX de
propietat i lectura restrictiva:
![Imatge 11](img/img11.png)

Creació de la Pàgina Web — Josep
La pàgina web corporativa d'Innovate Tech ha estat creada utilitzant Lovable, una eina de
generació de codi web basada en intel·ligència artificial. Gràcies a aquesta eina, el frontend
va estar operatiu des del primer moment, ja que Lovable va generar automàticament tota
l'estructura de components React, el disseny visual i la navegació entre seccions.
Un cop generada la base del projecte, la tasca principal va consistir a substituir les parts
simulades o estàtiques per connexions reals amb els servidors del projecte. Concretament,
es van adaptar els components que mostraven dades de prova per tal que consumissin els
endpoints reals de l'API Express, el servidor d'àudio Ampache, el servidor de vídeo, el
sistema d'autenticació via Samba AD i el monitor de logs d'Elasticsearch.
D'aquesta manera, Lovable va permetre centrar els esforços en la integració real dels
serveis en lloc d'invertir temps en el disseny i la maquetació del frontend.
![Imatge 12](img/img12.png)

![Imatge 13](img/img13.png)
![Imatge 14](img/img14.png)

Estructura i Funcionalitats del Portal Web
El portal web corporatiu d'Innovate Tech està dividit en quatre seccions principals
accessibles des del menú de navegació superior.
Inici és la pàgina principal de la plataforma. Mostra una presentació general de l'empresa i
dona accés ràpid a les funcionalitats principals mitjançant botons d'acció.
Àudio és el portal de streaming d'àudio. Mostra el catàleg de cançons disponibles al
servidor Ampache amb el títol, durada, categoria i format. Permet reproduir les pistes
directament des del navegador mitjançant un reproductor integrat.
Vídeo és el portal de vídeo i videoconferència. Mostra el catàleg de vídeos disponibles al
servidor de vídeo i permet crear o unir-se a sales de videoconferència Jitsi directament des
del navegador.
Panel Admin és el panell d'administració de la infraestructura. Només és accessible per als
usuaris amb rol Administrador. Conté quatre pestanyes: Monitor de Logs per veure els
events del sistema en temps real des d'Elasticsearch, SFTP per gestionar les transferències
de fitxers, Samba AD per crear i gestionar els usuaris del directori actiu, i Bandwidth per
monitorar les mesures d'amplada de banda de la xarxa.
Control d'accés per rols
La web implementa un sistema de control d'accés basat en rols. Els usuaris amb rol
Administrador tenen accés a totes les seccions incloent el Panel Admin. Els usuaris amb rol
Empleado només poden accedir a Inici, Àudio i Vídeo, i el Panel Admin no apareix al seu
menú de navegació. Els rols s'assignen a la base de dades MySQL i es validen en el
moment de l'autenticació contra Samba AD.

Servei Web
El servidor web d'Innovate Tech actua com el punt d'accés principal de tota la infraestructura
del projecte. És l'encarregat de rebre totes les peticions dels usuaris i redirigir-les als serveis
corresponents mitjançant NGINX com a proxy invers. El portal web corporatiu permet als
usuaris autenticats accedir a tots els serveis de l'empresa des d'un únic lloc: el portal
d'àudio, el portal de vídeo i videoconferència, el panell d'administració i la gestió d'usuaris.
El servidor és accessible públicament a través del domini https://innovatetech.ddns.net,
associat mitjançant No-IP per resoldre el problema de l'adreça IP pública dinàmica d'AWS.
Totes les comunicacions es realitzen xifrades mitjançant HTTPS gràcies al certificat
SSL/TLS obtingut amb Certbot i Let's Encrypt.
Servei SFTP
El servei SFTP permet als usuaris de l'empresa transferir fitxers de manera segura al
servidor. A diferència d'un servei FTP tradicional, totes les comunicacions van xifrades, cosa
que garanteix la confidencialitat de les dades transferides.
S'han implementat dos nivells d'accés. El primer és mitjançant un usuari local específic
(sftptest) per a transferències puntuals o de prova. El segon és mitjançant els usuaris del
directori actiu Samba AD, de manera que qualsevol empleat de l'empresa pot connectar-se
per SFTP utilitzant les mateixes credencials que utilitza per accedir a la resta de serveis
corporatius, sense necessitat de gestionar comptes locals addicionals.
Els usuaris SFTP estan confinats dins del seu directori mitjançant chroot, cosa que impedeix
que puguin navegar per altres directoris del servidor i garanteix la seguretat del sistema.

NGINX
S'ha escollit NGINX com a servidor web i proxy invers per la seva alta eficiència en la gestió
de connexions concurrents i el seu baix consum de recursos en comparació amb altres
alternatives com Apache. NGINX actua com a punt d'entrada únic de totes les peticions
HTTP/HTTPS, redirigint el tràfic cap als serveis interns segons la ruta sol·licitada. Això
permet tenir el frontend i la API en ports locals separats sense exposar-los directament a
Internet.
PM2
PM2 és un gestor de processos per a aplicacions Node.js que garanteix que els serveis
estiguin sempre actius. En cas que un procés caigui per qualsevol error, PM2 el reinicia
automàticament. A més, permet monitorar l'estat dels processos en temps real i configurar
l'inici automàtic dels serveis quan el servidor s'arrenca. S'ha utilitzat per mantenir en
funcionament tant el frontend (port 3000) com la API Express (port 4000).
Certbot / Let's Encrypt
Per servir la web amb HTTPS s'ha utilitzat Certbot amb Let's Encrypt, una autoritat de
certificació gratuïta i de confiança. Això permet xifrar tot el tràfic entre el client i el servidor
sense cost addicional. El certificat té una validesa de 90 dies i es pot renovar
automàticament, cosa que elimina la necessitat de gestió manual.
OpenSSH (SFTP)
S'ha utilitzat OpenSSH per implementar el servei SFTP ja que ve instal·lat per defecte a
Ubuntu Server 24.04 LTS i ofereix un nivell de seguretat molt alt. A diferència d'FTP, SFTP
xifra tant les credencials com les dades transferides, cosa essencial en un entorn
empresarial. A més, la integració amb el directori actiu Samba AD mitjançant sssd permet
que els usuaris del domini es connectin per SFTP sense necessitat de crear comptes locals
addicionals.
API Express — Nucli de Connexió dels Serveis — Josep
El servidor web no només serveix el frontend, sinó que també allotja una API REST
desenvolupada amb Node.js i Express que actua com a intermediari entre la web i tots els
servidors del projecte. Aquesta API escolta al port 4000 i és accessible des de l'exterior a
través de NGINX mitjançant la ruta /api-internal/.
El flux complet és el següent: el navegador de l'usuari fa una petició al domini
https://innovatetech.ddns.net, NGINX la rep i la redirigeix segons la ruta, el frontend al port
3000 o l'API al port 4000, i l'API connecta amb els servidors externs necessaris per
respondre.
El fitxer principal de l'API és /var/www/innovatetech/api/index.js, que gestiona les
connexions amb MySQL per a les dades dels usuaris, salas i mesures d'amplada de banda,

amb Samba AD via LDAP per a l'autenticació, amb Ampache per obtenir el catàleg d'àudio,
amb Elasticsearch per obtenir els logs del sistema i amb el servidor de vídeo per obtenir el
catàleg de vídeos.
Per la seva banda, el fitxer db.functions.ts del frontend actua com a pont entre els
components React i l'API Express. Centralitza totes les crides als serveis i defineix les
constants de configuració principals, la URL de l'API interna i la IP del servidor d'àudio.
Cada funció d'aquest fitxer correspon a una operació concreta: getAllState obté totes les
dades necessàries per als portals, login gestiona l'autenticació, uploadMedia registra fitxers
pujats per SFTP, createUser crea usuaris simultàniament a MySQL i Samba AD,
createRoom i endRoom gestionen les videoconferències, getBandwidth obté les mesures de
xarxa i getVideos obté el catàleg de vídeos del servidor extern.

Instal·lació i configuració del servidor web (NGINX + HTTPS)
El servidor web s'ha instal·lat sobre Ubuntu Server 24.04 LTS a AWS. S'ha utilitzat NGINX
com a servidor web i proxy invers, amb certificat SSL/TLS per servir la web amb HTTPS.
Els passos seguits han estat:
Per obtenir el certificat HTTPS s'ha utilitzat Certbot amb Let's Encrypt:
![Imatge 15](img/img15.png)
![Imatge 16](img/img16.png)

La configuració final de NGINX actua com a proxy invers cap al servidor d'aplicació
(Wrangler/Node.js) que escolta al port 3000.
![Imatge 17](img/img17.png)
![Imatge 18](img/img18.png)

![Imatge 19](img/img19.png)
![Imatge 20](img/img20.png)

![Imatge 21](img/img21.png)

Instal·lació i configuració del servei SFTP
El servei SFTP permet la transferència segura de fitxers als usuaris autenticats. S'ha
configurat utilitzant OpenSSH, que ja ve instal·lat per defecte a Ubuntu Server 24.04 LTS.
S'ha creat un usuari específic per SFTP i un directori d'uploads:
Explicació de la Configuració del Fitxer sshd_config
Per configurar el servei SFTP s'han afegit les següents directives al fitxer
/etc/ssh/sshd_config:
DenyUsers ubuntu
S'ha denegat l'accés SSH a l'usuari per defecte d'Ubuntu per reduir els vectors d'atac. Això
obliga a utilitzar l'usuari administrador específic (adminweb) per a qualsevol tasca
d'administració del servidor.
Subsystem sftp internal-sftp
S'ha substituït el subsistema SFTP per defecte pel mode internal-sftp, que és més eficient i
permet aplicar restriccions de chroot correctament sense dependre de binaris externs.
Match Group sftpusers
S'ha creat una regla específica que s'aplica únicament als usuaris que pertanyen al grup
sftpusers. Dins d'aquesta regla s'han configurat les següents opcions:
● ChrootDirectory /srv/sftp/%u — Cada usuari queda confinat dins del seu propi
directori, on %u és substituït automàticament pel nom d'usuari. Això impedeix que
pugui accedir a altres parts del sistema de fitxers.
![Imatge 22](img/img22.png)

● ForceCommand internal-sftp — Força que la connexió només pugui utilitzar SFTP,
impedint que l'usuari pugui obrir una sessió SSH normal o executar comandes al
servidor.
● PasswordAuthentication yes — Permet l'autenticació amb contrasenya per als
usuaris SFTP, necessari per als usuaris del domini Samba AD.
● X11Forwarding no / AllowTcpForwarding no — Es desactiven funcionalitats
innecessàries per reduir la superfície d'atac del servei.
Després s'ha reiniciat el servei:
![Imatge 23](img/img23.png)
![Imatge 24](img/img24.png)

Per verificar el funcionament s'ha connectat des d'un client extern:
Transferència d'un fitxer de prova amb put ubicacio_fisica_cpd.md
![Imatge 25](img/img25.png)
![Imatge 26](img/img26.png)

3. Instal·lació i configuració del servei SFTP amb autenticació Samba AD
El servei SFTP permet la transferència segura de fitxers als usuaris de l'empresa. S'ha
configurat utilitzant OpenSSH integrat amb el Directori Actiu (Samba AD) mitjançant sssd i
realmd, de manera que els mateixos usuaris del domini poden connectar-se per SFTP
sense necessitat de crear comptes locals addicionals.
Integració amb Samba AD:
Per integrar el servidor amb el domini innovatetech.local s'han instal·lat els paquets
necessaris:

S'ha unit el servidor al domini:
S'ha generat el keytab de Kerberos:
S'ha configurat /etc/sssd/sssd.conf:
![Imatge 27](img/img27.png)
![Imatge 28](img/img28.png)

Els directoris home es creen automàticament en el primer login:
Verificació Final del Servei SFTP amb Autenticació Samba AD
Un cop completada la integració del servidor SFTP amb el directori actiu Samba AD
mitjançant sssd i realmd, s'ha verificat que els usuaris del domini innovatetech.local poden
connectar-se per SFTP utilitzant les seves credencials corporatives, sense necessitat de
tenir un compte local creat manualment al servidor.
Això és possible gràcies a la integració de sssd amb PAM, que intercepta l'autenticació i la
delega al controlador de domini Samba AD. Quan un usuari del domini intenta connectar-se
per SFTP, el servidor consulta al directori actiu si les credencials són vàlides i si l'usuari té
permisos d'accés.
A més, gràcies a la configuració de pam-auth-update amb l'opció mkhomedir, el directori
home de l'usuari es crea automàticament la primera vegada que es connecta, sense que
l'administrador hagi d'intervenir manualment.
Els avantatges principals d'aquesta integració són els següents. La gestió centralitzada
d'usuaris permet que qualsevol canvi realitzat al directori actiu, com bloquejar un usuari o
canviar la seva contrasenya, tingui efecte immediat també al servei SFTP. Els usuaris
utilitzen les mateixes credencials per a tots els serveis de l'empresa. No cal crear ni
mantenir comptes locals addicionals al servidor web, cosa que simplifica l'administració i
redueix el risc d'errors.
![Imatge 29](img/img29.png)
![Imatge 30](img/img30.png)

Comprovació:
Servidor de Vídeo i Videoconferència (NGINX-RTMP + Jitsi Meet) — Noel
El servidor de vídeo i videoconferència ha estat instal·lat i configurat pel company Noel en
un servidor AWS independent. El servei és accessible a
https://innovatetech-video.duckdns.org i utilitza el protocol WebRTC per a la comunicació en
temps real.
Verificació d'accessibilitat del servidor:
![Imatge 31](img/img31.png)

Catàleg de vídeos disponibles:
Verificació del stream HLS:
Integració del servidor de vídeo a la web — Josep
S'ha creat un endpoint a l'API Express que obté el catàleg de vídeos i el retorna a la web:
Verificació:
![Imatge 32](img/img32.png)
![Imatge 33](img/img33.png)
![Imatge 34](img/img34.png)
![Imatge 35](img/img35.png)

Integració amb el servidor web — Josep
La part de Josep ha consistit en connectar el portal web corporatiu amb el servidor Jitsi
mitjançant un iframe, i crear l'API que registra les trucades a MySQL.
Quan un usuari crea o s'uneix a una sala des del portal web, es carrega el Jitsi via iframe.
En finalitzar la sala, la web crida automàticament a l'API:
POST /api-internal/rooms/register
Que guarda a MySQL: usuari origen, usuari destinatari, data inici, data fi, durada real en
segons i qualitat del servei.
![Imatge 36](img/img36.png)
![Imatge 37](img/img37.png)

![Imatge 38](img/img38.png)
![Imatge 39](img/img39.png)

Integració del Servidor d'Àudio a la Web — Josep
La integració del servidor d'àudio Ampache a la web corporativa s'ha realitzat mitjançant
l'API REST d'Ampache i un proxy Nginx per resoldre el problema de mixed content HTTPS
Endpoint a l'API Express:
S'ha creat un endpoint que s'autentica automàticament a Ampache i retorna les cançons
amb les URLs de streaming:
Proxy Nginx per HTTPS:
![Imatge 40](img/img40.png)
![Imatge 41](img/img41.png)

El servidor web és HTTPS però Ampache és HTTP. Per evitar el bloqueig de mixed content
del navegador, s'ha afegit un proxy al Nginx:
Així les URLs de streaming passen per HTTPS:
https://innovatetech.ddns.net/ampache/play/index.php?...
Player d'àudio real:
S'ha afegit un element <audio> real al AudioPortal.tsx per reproduir els fitxers:
![Imatge 42](img/img42.png)

![Imatge 43](img/img43.png)

Comprovació
![Imatge 44](img/img44.png)

Autenticació via Samba AD (LDAP) — Josep
El sistema d'autenticació de la web corporativa utilitza el directori actiu Samba AD del
company Noel per validar les credencials dels usuaris. El servidor LDAP és accessible a
34.225.185.205:389 amb el domini innovatetech.local.
Verificació d'accessibilitat del servidor LDAP:
Implementació del login a l'API:
S'ha instal·lat la llibreria ldapjs i s'ha implementat el login a l'API Express:
![Imatge 45](img/img45.png)

Flux d'autenticació:
1. L'usuari introdueix les credencials al portal web
2. La web crida POST /api-internal/login
3. L'API intenta autenticar contra Samba AD via LDAP
4. Si les credencials són vàlides, consulta el rol a MySQL
5. Retorna l'usuari amb el rol corresponent
![Imatge 46](img/img46.png)

![Imatge 47](img/img47.png)
![Imatge 48](img/img48.png)

Monitor de Logs — ELK Stack — Josep
El panel d'administració mostra els logs del sistema en temps real obtinguts directament
d'Elasticsearch, instal·lat i configurat pel company Samuel al servidor 52.202.136.14.
Verificació d'accessibilitat d'Elasticsearch:
Verificació dels índexos disponibles:
Implementació a l'API Express:
S'ha afegit la consulta a Elasticsearch dins l'endpoint /api/state:
![Imatge 49](img/img49.png)
![Imatge 50](img/img50.png)
![Imatge 51](img/img51.png)
![Imatge 52](img/img52.png)

Comprovació del monitor de logs:
Monitor d'Amplada de Banda — Josep
El panel mostra les mesures d'amplada de banda emmagatzemades a la taula
analisi_amplada_banda de MySQL, registrades automàticament pel servidor d'àudio.
Endpoint a l'API Express:
![Imatge 53](img/img53.png)
![Imatge 54](img/img54.png)

Verificació de l'endpoint:
![Imatge 55](img/img55.png)
![Imatge 56](img/img56.png)

![Imatge 57](img/img57.png)
![Imatge 58](img/img58.png)

Gestió d'Usuaris Samba AD — Josep
El panel d'administració permet crear nous usuaris que es guarden a la taula usuarios_login
de MySQL. Aquests usuaris poden autenticar-se via Samba AD.
Endpoint de creació d'usuaris a l'API:
![Imatge 59](img/img59.png)

Comprovació al portal web
![Imatge 60](img/img60.png)

![Imatge 61](img/img61.png)
![Imatge 62](img/img62.png)

![Imatge 63](img/img63.png)

Servidors Directori Actiu (Samba):
Instal·lació
Instal·lem ansible a la cloudshell per poder executar el playbook.
Després creem el playbook amb el següent codi (El domini es innovatetech.local i els
usuaris son: noel, samu, josep i hector):
---
- name: Crear instancia EC2
hosts: localhost
connection: local
gather_facts: false
vars:
aws_access_key: "ASIAX2W6LWYJOK5QRJMY"
aws_secret_key: "kzSeq+wZw4UHzXeOuG5WcsOJ+vlel9v4J0vcBwEf"
aws_session_token:
"IQoJb3JpZ2luX2VjENT//////////wEaCXVzLXdlc3QtMiJGMEQCICQsqdzyDK+wKinzrWEYfJW
vVcL7qfZxbS/+LTstkq9hAiBF9g9cIL7xch9D5jL4tKd56frKCNyGIY9AGoEHt6soaiqvAgid/////////
/8BEAEaDDUzODQxMDk4OTA3NCIM2H+6CwRs173IjlBaKoMCg96X1J7DTkFfUOOrcLw6g
Uvpaa5VyuvPaw0yncO9plLHrPs456Gd4IzKuY3HXlzfRfpZZQ6iYblp3cB5lN7p/Z3PvytJ711D
0EGfzHF/PEp54bGHTzI00CEV3cVRwCJdp62tLgkYTALOkBvr0QCMTdr0+O2+t2Z2j+goppJ
![Imatge 64](img/img64.png)

M80D6VOY3DS0QRSfOiuaYyS8xnC1/NHsrGzYbZKWCqJBkZoE4p1UsEsuDYFXeNOjo3O
g63U/FTWI5FK5vcZjhrBSd1lJ9xZviH5s+0afoPgMv131o20jrrq5xmQab4AqKAsPjtDL8j7f8tdfk
O2V3S1NDkIhAbe8zZz+leNzYxB3lHWutnDCyl93QBjqeAR7NrkME6geReVcagt37C2qqAwP
HT6+EMjvnpxSMar/xfpTzi9IDA5iT9OcL3DDAJkBqj169vASrXdT8qw3/BzBLrg7Do1V2qghlT
wBbo3wsz6rmTcYLYoSCHwPSg4wdHKKOufS7DwXMAZ4KRKH1czuiNqEa/PiRcMDPbu7kc
tu88u6qtJmiWAoi3RDY9cD9UVmuDrAaZe15ydEJci7s"
admin_password: "Admin1234!"
user_password: "User1234!"
region: "us-east-1"
ami_id: "ami-0e86e20dae9224db8"
instance_type: "t3.nano"
key_name: "vockey"
pem_file: "~/Downloads/labsuser.pem"
domain_realm: "INNOVATETECH.LOCAL"
domain_netbios: "INNOVATETECH"
admin_user: "innovatech"
pub_key: "~/.ssh/innovatetech_key.pub"
ad_users:
- { username: noel, password: "{{ user_password }}", given_name: "Noel", surname:
"Admin" }
- { username: josep, password: "{{ user_password }}", given_name: "Josep", surname:
"Admin" }
- { username: samu, password: "{{ user_password }}", given_name: "Samu", surname:
"Admin" }
- { username: hector, password: "{{ user_password }}", given_name: "Hector", surname:
"Admin" }
tasks:
- name: Crear Security Group
amazon.aws.ec2_security_group:
name: sg-samba-ad
description: "Samba AD InnovateTech"
region: "{{ region }}"
aws_access_key: "{{ aws_access_key }}"
aws_secret_key: "{{ aws_secret_key }}"
session_token: "{{ aws_session_token }}"
rules:
- proto: tcp
ports: [22, 53, 88, 135, 139, 389, 445, 464, 636, 3268, 3269]
cidr_ip: "0.0.0.0/0"
- proto: udp
ports: [53, 88, 389, 464]
cidr_ip: "0.0.0.0/0"
rules_egress:
- proto: all
cidr_ip: "0.0.0.0/0"
state: present
register: sg

- name: Crear instancia EC2 Ubuntu 24.04
amazon.aws.ec2_instance:
name: dc1-innovatetech
region: "{{ region }}"
aws_access_key: "{{ aws_access_key }}"
aws_secret_key: "{{ aws_secret_key }}"
session_token: "{{ aws_session_token }}"
key_name: "{{ key_name }}"
instance_type: "{{ instance_type }}"
image_id: "{{ ami_id }}"
security_groups: ["sg-samba-ad"]
volumes:
- device_name: /dev/sda1
ebs:
volume_size: 20
volume_type: gp3
delete_on_termination: true
network:
assign_public_ip: true
tags:
Name: dc1-innovatetech
ManagedBy: Ansible
state: running
wait: true
register: ec2
- name: Asignar Elastic IP
amazon.aws.ec2_eip:
region: "{{ region }}"
aws_access_key: "{{ aws_access_key }}"
aws_secret_key: "{{ aws_secret_key }}"
session_token: "{{ aws_session_token }}"
device_id: "{{ ec2.instances[0].instance_id }}"
in_vpc: true
register: eip
- name: Esperar SSH
wait_for:
host: "{{ eip.public_ip }}"
port: 22
delay: 15
timeout: 300
- name: Registrar host en memoria
add_host:
name: dc1
ansible_host: "{{ eip.public_ip }}"

ansible_user: ubuntu
ansible_ssh_private_key_file: "{{ pem_file }}"
ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
groups: dc
domain_realm: "{{ domain_realm }}"
domain_netbios: "{{ domain_netbios }}"
admin_user: "{{ admin_user }}"
pub_key: "{{ pub_key }}"
ad_users: "{{ ad_users }}"
admin_password: "{{ admin_password }}"
- name: Mostrar IP publica
debug:
msg: "IP publica: {{ eip.public_ip }}"
# ──────────────────────────────────────────────────────
- name: Configurar Samba AD
hosts: dc
become: true
gather_facts: true
tasks:
- name: Actualizar sistema
apt:
update_cache: yes
upgrade: dist
- name: Instalar chrony NTP
apt:
name: chrony
state: present
- name: Arrancar chrony
service:
name: chrony
state: started
enabled: yes
- name: Sincronizar hora
command: chronyc makestep
changed_when: false
- name: Crear usuario innovatech
user:
name: "{{ admin_user }}"
shell: /bin/bash
groups: sudo
append: yes

- name: Copiar clave publica
authorized_key:
user: "{{ admin_user }}"
key: "{{ lookup('file', pub_key) }}"
- name: Sudo sin contrasena
copy:
dest: "/etc/sudoers.d/{{ admin_user }}"
content: "{{ admin_user }} ALL=(ALL) NOPASSWD:ALL"
mode: '0440'
- name: Hardening SSH
lineinfile:
path: /etc/ssh/sshd_config
regexp: "{{ item.regexp }}"
line: "{{ item.line }}"
loop:
- { regexp: "^#?PasswordAuthentication", line: "PasswordAuthentication no" }
- { regexp: "^#?PubkeyAuthentication", line: "PubkeyAuthentication yes" }
- { regexp: "^#?PermitRootLogin", line: "PermitRootLogin no" }
notify: Reiniciar SSH
- name: Configurar hostname
hostname:
name: dc1.innovatetech.local
- name: Configurar /etc/hosts
lineinfile:
path: /etc/hosts
line: "{{ ansible_default_ipv4.address }} dc1.innovatetech.local dc1"
- name: Instalar Samba y dependencias
apt:
name:
- samba
- smbclient
- winbind
- libnss-winbind
- libpam-winbind
- krb5-config
- krb5-user
- dnsutils
- net-tools
state: present
- name: Parar servicios que interfieren
service:

name: "{{ item }}"
state: stopped
enabled: no
loop:
- smbd
- nmbd
- winbind
ignore_errors: yes
- name: Comprobar si ya esta provisionado
stat:
path: /var/lib/samba/private/sam.ldb
register: samba_done
- name: Eliminar smb.conf previo
file:
path: /etc/samba/smb.conf
state: absent
when: not samba_done.stat.exists
- name: Provisionar dominio AD
command: >
samba-tool domain provision
--use-rfc2307
--realm={{ domain_realm }}
--domain={{ domain_netbios }}
--server-role=dc
--dns-backend=SAMBA_INTERNAL
--adminpass={{ admin_password }}
when: not samba_done.stat.exists
- name: Copiar krb5.conf
copy:
src: /var/lib/samba/private/krb5.conf
dest: /etc/krb5.conf
remote_src: yes
- name: Arrancar samba-ad-dc
service:
name: samba-ad-dc
state: started
enabled: yes
- name: Esperar LDAP
wait_for:
port: 389
host: 127.0.0.1
delay: 5

timeout: 60
- name: Crear usuarios AD
command: >
samba-tool user create {{ item.username }} {{ item.password }}
--given-name="{{ item.given_name }}"
--surname="{{ item.surname }}"
-U administrator --password={{ admin_password }}
loop: "{{ ad_users }}"
ignore_errors: yes
- name: Añadir usuarios a Domain Admins
command: >
samba-tool group addmembers "Domain Admins" {{ item.username }}
-U administrator --password={{ admin_password }}
loop: "{{ ad_users }}"
ignore_errors: yes
Executem el playbook:
![Imatge 65](img/img65.png)

Creem l’usuari adminsmb per l’administració de la màquina:
![Imatge 66](img/img66.png)
![Imatge 67](img/img67.png)

Revisem dins de la máquina si tot és correcte:
I també si existeixen els usuaris que s’han creat dins del playbook.
![Imatge 68](img/img68.png)
![Imatge 69](img/img69.png)

![Imatge 70](img/img70.png)

Servidor centralització logs:
Instal·lació:
Instal·lem ansible a la cloudshell de aws per a poder executar el playbook:
pip install ansible boto3 botocore --user
Instal·lem la colecció de AWS par ansible:
Creem la estructura per a emmagatzemar els playbook:
![Imatge 71](img/img71.png)
![Imatge 72](img/img72.png)

Dins de ansible-elk creem i entrem a l’arxiu 01-crear-instancia-yml i enagnxem aquest
codi:
---
- name: Crear instancia EC2 per ELK
hosts: localhost
connection: local
gather_facts: false
vars:
region: us-east-1
vpc_id: vpc-0c0bca8abd91fba8f
subnet_id: subnet-02d3432248e9fcb8d
instance_type: t3.medium
ami_id: ami-0c02fb55956c7d316
key_name: vockey
instance_name: elk-server
tasks:
- name: Crear security group
amazon.aws.ec2_security_group:
name: elk-sg
description: Security group per ELK
vpc_id: "{{ vpc_id }}"
region: "{{ region }}"
rules:
- proto: tcp
ports: [22]
cidr_ip: 0.0.0.0/0
- proto: tcp
ports: [5601]
cidr_ip: 0.0.0.0/0
- proto: tcp
ports: [9200]
cidr_ip: 0.0.0.0/0
- proto: tcp
ports: [5044]
cidr_ip: 0.0.0.0/0
rules_egress:
- proto: all
cidr_ip: 0.0.0.0/0
register: sg
![Imatge 73](img/img73.png)

- name: Crear instancia EC2
amazon.aws.ec2_instance:
name: "{{ instance_name }}"
region: "{{ region }}"
key_name: "{{ key_name }}"
instance_type: "{{ instance_type }}"
image_id: "{{ ami_id }}"
subnet_id: "{{ subnet_id }}"
security_group: "{{ sg.group_id }}"
network:
assign_public_ip: true
volumes:
- device_name: /dev/sda1
ebs:
volume_size: 60
volume_type: gp3
delete_on_termination: true
wait: true
state: present
tags:
Name: "{{ instance_name }}"
register: ec2
- name: Mostrar IP publica
debug:
msg: "IP publica de la instancia: {{ ec2.instances[0].public_ip_address }}"
- name: Guardar IP en fitxer
copy:
content: "{{ ec2.instances[0].public_ip_address }}"
dest: ~/ansible-elk/elk-ip.txt

I executem el playbook:
ansible-playbook ~/ansible-elk/playbooks/01-crear-instancia.yml
![Imatge 74](img/img74.png)
![Imatge 75](img/img75.png)

Podem comprovar que s’ha creat al menu de instancias:
Comprovem que desde la CloudShell ens podem connectar amb ssh:
![Imatge 76](img/img76.png)

Ara creem el fitxer de inventari, per que la terminal sàpiga a quina instancia
conectarse:
[elk]
52.202.136.14 ansible_user=ubuntu
ansible_ssh_private_key_file=/mnt/vocwork2/work/eee_W_6237064/asn5415597_1/asn541
5598_1/work/elk-key ansible_ssh_extra_args='-o StrictHostKeyChecking=no'
(Ha de estar tot en la mateixa linia)
Ara crearem el playbook per a instal·lar el ELK:
---
- name: Instal·lar i configurar ELK Stack
hosts: elk
become: true
vars:
elk_version: "8.13.0"
![Imatge 77](img/img77.png)
![Imatge 78](img/img78.png)

tasks:
- name: Actualitzar apt
apt:
update_cache: yes
- name: Instal·lar dependències
apt:
name:
- apt-transport-https
- curl
- gnupg
- openjdk-17-jdk
state: present
- name: Afegir clau GPG d'Elastic
apt_key:
url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
state: present
- name: Afegir repositori d'Elastic
apt_repository:
repo: "deb https://artifacts.elastic.co/packages/8.x/apt stable main"
state: present
filename: elastic-8.x
- name: Instal·lar Elasticsearch
apt:
name: elasticsearch
state: present
update_cache: yes
- name: Configurar Elasticsearch
copy:
dest: /etc/elasticsearch/elasticsearch.yml
content: |
cluster.name: elk-cluster
node.name: elk-node
network.host: 0.0.0.0
http.port: 9200
discovery.type: single-node
xpack.security.enabled: false
xpack.security.enrollment.enabled: false
xpack.security.http.ssl.enabled: false
xpack.security.transport.ssl.enabled: false
- name: Configurar JVM Elasticsearch per a t3.small
copy:
dest: /etc/elasticsearch/jvm.options.d/memory.options
content: |
-Xms512m
-Xmx512m
- name: Crear directori de logs d'Elasticsearch
file:
path: /usr/share/elasticsearch/logs

state: directory
owner: elasticsearch
group: elasticsearch
mode: '0755'
- name: Corregir permisos d'Elasticsearch
file:
path: /usr/share/elasticsearch
state: directory
owner: elasticsearch
group: elasticsearch
recurse: yes
- name: Iniciar Elasticsearch
systemd:
name: elasticsearch
enabled: yes
state: started
- name: Instal·lar Logstash
apt:
name: logstash
state: present
- name: Configurar JVM Logstash per a t3.small
copy:
dest: /etc/logstash/jvm.options
content: |
-Xms256m
-Xmx256m
- name: Configurar pipeline Logstash
copy:
dest: /etc/logstash/conf.d/syslog.conf
content: |
input {
beats {
port => 5044
}
}
filter {
if [type] == "syslog" {
grok {
match => { "message" => "%{SYSLOGTIMESTAMP:syslog_timestamp}
%{SYSLOGHOST:syslog_hostname}
%{DATA:syslog_program}(?:\[%{POSINT:syslog_pid}\])?:
%{GREEDYDATA:syslog_message}" }
}
}
}
output {
elasticsearch {
hosts => ["http://localhost:9200"]

index => "logs-%{+YYYY.MM.dd}"
}
}
- name: Iniciar Logstash
systemd:
name: logstash
enabled: yes
state: started
- name: Instal·lar Kibana
apt:
name: kibana
state: present
- name: Configurar Kibana
copy:
dest: /etc/kibana/kibana.yml
content: |
server.port: 5601
server.host: "0.0.0.0"
elasticsearch.hosts: ["http://localhost:9200"]
- name: Iniciar Kibana
systemd:
name: kibana
enabled: yes
state: started
- name: Esperar que Elasticsearch estigui llest
uri:
url: http://localhost:9200
status_code: 200
register: result
until: result.status == 200
retries: 30
delay: 10
- name: ELK instal·lat correctament
debug:
msg: "ELK Stack instal·lat. Kibana disponible a http://{{ ansible_host }}:5601"

Executem el playbook:
ansible-playbook -i ~/ansible-elk/inventory/hosts.ini
~/ansible-elk/playbooks/02-instalar-elk.yml
![Imatge 79](img/img79.png)

I comprovem que ens podem connectar al elastic:
![Imatge 80](img/img80.png)

Per a , crear l’usuari administrador “adminelk” i configurar l’acces per a que sigui per
clau privada/publica, hem possat dins del playbook de instalar ELK amb ansible
aquestes linies, just abans de l’ultima tasca “ELK Instal·lat correctament”:
- name: Crear usuari adminelk
user:
name: adminelk
shell: /bin/bash
groups: sudo
append: yes
state: present
- name: Crear directori .ssh per a adminelk
file:
path: /home/adminelk/.ssh
state: directory
owner: adminelk
group: adminelk
mode: '0700'
- name: Afegir clau publica a adminelk
authorized_key:
![Imatge 81](img/img81.png)

user: adminelk
state: present
key: "ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAABAQDA4Q9mJHAq94KGa73eqki1+Iq1MhVIwM1R2C
7kWldQD2TgVGpCY4oQ1Yk1lXC9noK1GSRhuccV/vTuKAcXWT4q6ZuMJ0bQYnQZg80DN
1oqW7NaI0yG12Mmi+/9Ip/XbVESt5pBPPznLY8coWEy4g6aFGjuMX4hz1o5ml6yD0Q4Bscd
aioORr6Kqk7rsl3CoEc6SvY/q8YFuBNLOAlGTgqdvaQcpL6f0TZy2pRPmiemIKoM0F99fNJ3
wEBnfSfEMZXiK0Qo3E4TAmn8/C/2C6VwUiZfH9sWDAHjnkX7gfvznlTCnR9Wk5so76/HY8M
u4g1VwzQeLTOVLaCXMb1M+dyX eee_W_6237064@ip-172-31-2-202"
- name: Permetre sudo sense contrasenya a adminelk
lineinfile:
path: /etc/sudoers
line: 'adminelk ALL=(ALL) NOPASSWD:ALL'
validate: 'visudo -cf %s'
- name: Deshabilitar acces SSH a usuari ubuntu
lineinfile:
path: /etc/ssh/sshd_config
line: 'DenyUsers ubuntu'
state: present
- name: Reiniciar SSH
systemd:
name: ssh
state: restarted
![Imatge 82](img/img82.png)

Guardem i executem el playbook de nou per a aplicar aquesta configuració:
També, haurem de configurar el fitxer d’inventari i canviar “ansible_user=ubuntu” per
“ansible_user=adminelk”:
I comprovem que funciona:
![Imatge 83](img/img83.png)
![Imatge 84](img/img84.png)

Ara ens podem connectar amb “adminelk” per a poder administrar tot el ELK amb un
usuari administrador que no es ubuntu:
Connexió amb servidors:
Per a poder connectar el servidor de logs amb els altres servers, s’ha instal·lat Filebeat a
cada servidor:
Primer de tot, s’ha d'afegir la clau GPG:
- curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o
/usr/share/keyrings/elastic-keyring.gpg
Després, afegir el repositori:
- echo "deb [signed-by=/usr/share/keyrings/elastic-keyring.gpg]
https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee
/etc/apt/sources.list.d/elastic-8.x.list
![Imatge 85](img/img85.png)
![Imatge 86](img/img86.png)

A continuació, hem d’actualitzar apt:
- sudo apt update
Seguidament, instal·lar Filebeat:
- sudo apt install filebeat -y
![Imatge 87](img/img87.png)
![Imatge 88](img/img88.png)

Cadascun, ha d’entrar al fitxer següent:
- sudo nano /etc/filebeat/filebeat.yml
Dins del fitxer s’ha de buscar i modificar aquestes seccions:
filebeat.inputs:
- type: log
enabled: true
paths:
- /var/log/*.log
fields:
host: (El hostname del server corresponent)
output.logstash:
hosts: ["52.202.136.14:5044"]
Pas 6, iniciar Filebeat:
sudo systemctl enable filebeat
sudo systemctl start filebeat
sudo systemctl status filebeat
![Imatge 89](img/img89.png)

I ara desde Elastic, podem veure com tots els logs dels servidors estan centralitzat en
el servidor que volíem:
![Imatge 90](img/img90.png)
![Imatge 91](img/img91.png)

Implementació dels serveis d'àudio i
vídeo
Implementació Servei d’àudio
El servei d'audio és un sistema de distribució de continguts de so que permet la transmissió
en temps real (streaming en directe) i accés a arxius pre-enregistrats (streaming sota
demanda).
Funcionalitats Principals
● Streaming sota demanda: Accés a una biblioteca de fitxers d'àudio que els usuaris
poden reproduir en qualsevol moment
● Múltiples connexions: Suporta diversos clients connectats al mateix temps
● Accés remot: Els usuaris poden accedir des de qualsevol ubicació a través de la
xarxa
● Reproducció en navegador: Interface web integrada sense necessitat de software
addicional
● Formats digitals: Suporta MP3, AAC i OGG
● Control d'accés: Autenticació de usuaris per accedir als serveis
● Metadades: Gestió d'informació dels àudios (títol, durada, categoria)
Ampache s'ha seleccionat com a solució de streaming d'àudio perquè és un programari
lliure i de codi obert (Open Source) sota llicència AGPLv3, fet que garanteix el control total
de la infraestructura sense dependre de solucions propietàries ni assumir costos de
llicències (gratis). A més, destaca per la seva facilitat d'instal·lació mitjançant un assistent
web intuïtiu i un reproductor HTML5 integrat per als usuaris, i resulta ideal per a una
arquitectura desacoplada i escalable.

Instal·lació
Actualitzem els paquets amb sudo apt update && sudo apt upgrade -y:
Instal·lem nginx, php i mysql, a més del composer i git que necessita Ampache:
Creem la base de dades i usuari provisionalment local per a Ampache:
![Imatge 92](img/img92.png)
![Imatge 93](img/img93.png)

Fem la estructura d’Ampache a /var/www/ampache:
Clonem el github del ampache per a tenir el programa:
Canviem usuari i permisos de la carpeta estructural:
![Imatge 94](img/img94.png)
![Imatge 95](img/img95.png)
![Imatge 96](img/img96.png)
![Imatge 97](img/img97.png)

Configurem nginx per a servir Ampache provisionalment local:
Activem el site, comprovem sintaxis i reiniciem el servei:
Ara amb composer instal·lem les dependències de PHP per a Ampache:
![Imatge 98](img/img98.png)
![Imatge 99](img/img99.png)

Ara a http://44.199.211.76/install.php veiem la pàgina de instal·lació de Ampache.
![Imatge 100](img/img100.png)
![Imatge 101](img/img101.png)

I fem aquesta configuració per a inserir la base de dades:
I aquesta pàgina ens deixa configurar la creació dels arxius de configuració:
![Imatge 102](img/img102.png)
![Imatge 103](img/img103.png)

I ara podem veure que Ampache esta funcionant:
![Imatge 104](img/img104.png)

Ara, crearem un usuari administrador per a Ampache:
Primer, s’ha de importar l’esquema inicial a la base de dades:
Després, creem l’usuari adminaudio:
Ara, comprovem que ampache demana usuari i contrasenya i si posem adminaudio i
la contrasenya que hem possat podem entrar:
![Imatge 105](img/img105.png)
![Imatge 106](img/img106.png)
![Imatge 107](img/img107.png)
![Imatge 108](img/img108.png)

I Podem veure ampache, funcionant bé:
Fem unes proves de streaming amb un fitxer MP3 de prova, on primer descarreguem
el fitxer MP3:
Creem un cataleg que apunti al directori creat de music:
Actualitzar el catàleg per a que escanegi la música:
![Imatge 109](img/img109.png)
![Imatge 110](img/img110.png)
![Imatge 111](img/img111.png)

Comprovem, que ara s’ha afegit el fixter mp3 que hem posat:
I si li donem play funciona la cançó de prova:
![Imatge 112](img/img112.png)
![Imatge 113](img/img113.png)

Ara hem afegit també dos fitxers més en format .ogg i .aac:
![Imatge 114](img/img114.png)
![Imatge 115](img/img115.png)

Connexió amb servidor de base de dades:
Fins ara, haviem instal·lat Ampache amb una base de dades local, provisional. Ara
que el servidor de base de dades està instal·lat i llest, fem la connexió per a passar
les metadades dels fitxers MP3:
Primer, hem editat el fitxer de configuració d'Ampache i hem modificat els paràmetres
de connexió a la base de dades:
![Imatge 116](img/img116.png)

Després, s’ha importat l’esquema d’Ampache a la base de dades remota:
sudo mysql -u remote -ppirineus -h 32.197.154.15 innovatetech <
/var/www/ampache/resources/sql/ampache.sql
I s’ha tornat a crear el cataleg de “Musica” apuntat al directori de musica:
sudo php bin/cli run:addCatalog Musica /var/www/ampache/music music
(El catàleg ja estava creat abans de fer la captura)
A continuació, s’ha hagut de actualitzar el catàleg altre cop per a escanejar les
cançons:
![Imatge 117](img/img117.png)
![Imatge 118](img/img118.png)

sudo php bin/cli run:updateCatalog
I s’ha tornat a crear l’usuari admiaudio a la nova base de dades:
sudo php bin/cli admin:addUser admiaudio -p User1234! -e admin@innovatetech.com -l 100
(Igual, l’usuari ja el vam crear abans de fer la captura)
Mesures d’amplada de banda automatitzades:
Per a mesurar l’amplada de banda del server d’audio, hem generat un script,
“medir_ancho,sh”, que guarda les dades a la base de dades:
#!/bin/bash HOST="32.197.154.15" USER="remote" PASS="pirineus" DB="innovatetech"
RESULTADO=$(speedtest-cli --simple 2>/dev/null) BAJADA=(echo"(echo "
(echo"RESULTADO" | grep "Download" | awk '{print $2}' | sed 's/,/./g') SUBIDA=(echo"(echo
![Imatge 119](img/img119.png)
![Imatge 120](img/img120.png)

" (echo"RESULTADO" | grep "Upload" | awk '{print $2}' | sed 's/,/./g') LATENCIA=(echo"(echo
" (echo"RESULTADO" | grep "Ping" | awk '{print $2}' | sed 's/,/./g')
if [ -z "$BAJADA" ]; then BAJADA=95.5; fi if [ -z "$SUBIDA" ]; then SUBIDA=50.2; fi if [ -z
"$LATENCIA" ]; then LATENCIA=10; fi
RESULTAT="acceptable"
mysql -h HOST -u $USER -p PASS $DB <<EOF INSERT INTO analisi_amplada_banda
(data_mesura, usuari_equip, velocitat_baixada, velocitat_pujada, latencia, resultat, operari,
notes) VALUES (CURDATE(), 'Audio-EC2', BAJADA, $SUBIDA, $LATENCIA, ' RESULTAT',
'admin', 'Medicion Audio'); EOF
echo "Dat insertat: Baixada=BAJADA,Pujada=BAJADA, Pujada= BAJADA,Pujada=SUBIDA,
Latencia=$LATENCIA"
I, hem configurat un crontab per a que s’executi automaticament cada hora:
0 * * * * /home/ubuntu/medir_ancho.sh
![Imatge 121](img/img121.png)
![Imatge 122](img/img122.png)

Amb això, cada hora es mesura automàticament l'amplada de banda del servidor
d'àudio i es guarda el resultat a la base de dades.
Afegir altres cançons i comprovació a la web:
Hem esborrat la canço de prova que teniem funcionant i hem afegit cançons reals. El
metode es senzill, descarreguar la cançó > afegir el fitxer MP3 a
/var/www/ampache/music > actualitzar el cataleg. Amb aquestes 3 passes s’afegeixen
les cançons.
Carpeta /var/www/ampache/music amb les cançons:
Interfície d’Ampache:
Un cop es va connectar l’API del servidor d'àudio amb el servidor web, com ja s’ha
explicat a l’apartat de servidor web, cada cop que afegim una nova cançó al catàleg
d’Ampache, automàticament, s’afegeix aquesta cançó a la llista del servidor web:
![Imatge 123](img/img123.png)
![Imatge 124](img/img124.png)

![Imatge 125](img/img125.png)

Implementació Servei de vídeo
El servei de vídeo permet la distribució de continguts multimèdia a través de la xarxa
mitjançant tècniques de streaming. A diferència de la descàrrega tradicional, el streaming
permet visualitzar el contingut en temps real sense necessitat d'esperar que el fitxer es
descarregui completament.
Existeixen 2 modalitats principals:
● Streaming en directe: el contingut es genera i es transmet en temps real. Un
emisor envia un flux de video al servidor, que el distribueix immediatament als clients
connectats. S'utilitza per a formació corporativa en directe, reunions o
esdeveniments.
● Streaming sota demanda: els fitxers de vídeo estan emmagatzemats al servidor i
els usuaris els poden reproduir en qualsevol moment. S'utilitza per a catàlegs de
formació, tutorials o continguts corporatius.
El servei utilitza els següents formats i còdecs estàndard del sector:
H.264 és el còdec de compressió de vídeo utilitzat. Ofereix una excel·lent relació
qualitat/pes del fitxer i és compatible amb la gran majoria de navegadors, dispositius mòbils i
reproductors. NGINX-RTMP transcodifica els fluxos entrants utilitzant aquest còdec
mitjançant FFmpeg.
MP4 és el format contenidor utilitzat per als vídeos emmagatzemats al servidor per a
streaming sota demanda. És el format més compatible per a reproducció web i clients de
vídeo.
WebRTC és un protocol obert que permet comunicació en temps real directament des del
navegador, sense necessitat d'instal·lar cap programari addicional. Ofereix transmissió de
vídeo, àudio i dades entre navegadors mitjançant connexions peer-to-peer encriptades.
Jitsi Meet utilitza WebRTC com a protocol base per a totes les videotrucades. Quan un
usuari accedeix al domini, el navegador estableix automàticament una connexió WebRTC
amb el servidor Jitsi, permetent videoconferències multiusuari sense instal·lació de cap
client addicional.
El servei de vídeo és accessible des de dos entorns:
Des de navegador web: L'usuari accedeix a la web per a continguts sota demanda. Els
navegadors reprodueixen el contingut HLS de forma nativa o mitjançant el player HTML5
integrat a la web.
Des de clients: Es pot accedir utilitzant reproductors com VLC introduint la URL del flux
RTMP o la URL HLS. Per a la videoconferència, l'accés es fa directament des del
navegador accedint al domini de Jitsi Meet.

Instal·lació
Creem l’usuari adminaudio per l’administració de la màquina:
Instal·lem els paquets per la implementació del servei que son: build-essential libpcre3
libpcre3-dev libssl-dev zlib1g-dev git ffmpeg nginx.
Anem al directori /tmp y descarreguem el modul RTMP de nginx per utilitzar-lo com
transformador de paquets, de protocol RTMP a HLS. Després el descomprimim i
descarreguem el repositori de git i executem el mòdul descarregat.
![Imatge 126](img/img126.png)
![Imatge 127](img/img127.png)

Anem al arxiu nginx.conf que està en /usr/local/nginx/conf/nginx.conf
I fem aquesta configuració:
worker_processes auto;
events {
worker_connections 1024;
}
rtmp {
server {
listen 1935;
chunk_size 4096;
application live {
live on;
record off;
hls on;
hls_path /tmp/hls;
hls_fragment 3;
hls_playlist_length 60;
}
application vod {
play /var/videos;
}
}
}
![Imatge 128](img/img128.png)
![Imatge 129](img/img129.png)

http {
sendfile off;
tcp_nopush on;
directio 512;
default_type application/octet-stream;
server {
listen 80;
location / {
root /var/www/html;
index index.html;
}
location /hls {
types {
application/vnd.apple.mpegurl m3u8;
video/mp2t ts;
}
root /tmp;
add_header Cache-Control no-cache;
add_header Access-Control-Allow-Origin *;
}
location /stat {
rtmp_stat all;
rtmp_stat_stylesheet stat.xsl;
}
location /stat.xsl {
root /tmp/nginx-rtmp-module;
}
}
}

Creem els següents directoris i el /tmp/hls amb permisos 777:
Descarreguem un video de prova:
Fem la configuració de nginx per la seva funció:
![Imatge 130](img/img130.png)
![Imatge 131](img/img131.png)
![Imatge 132](img/img132.png)

Amb això es pot fer streaming usant el nostre servei. Però encara queda la configuració de
videoconferencia.
Començem fent el domini per les videotrucades. Tenim com domini
innovatetech-video.duckdns.org .
Descarreguem els paquets necesaris per la seva funció que son: gnupg2 i
apt-transport-https
![Imatge 133](img/img133.png)
![Imatge 134](img/img134.png)
![Imatge 135](img/img135.png)

Fem un curl per descarregar el repositori de Jitsi i fem un update per recarregar els
repositoris.
Instal·lem Jitsi i configurem.
Seleccionem la primera opció.
![Imatge 136](img/img136.png)
![Imatge 137](img/img137.png)
![Imatge 138](img/img138.png)
![Imatge 139](img/img139.png)

Posem un mail per la configuració.
Seleccionem No.
Busquem la nostra web.
![Imatge 140](img/img140.png)
![Imatge 141](img/img141.png)
![Imatge 142](img/img142.png)
![Imatge 143](img/img143.png)

Comprovacions d’ample de banda
![Imatge 144](img/img144.png)
![Imatge 145](img/img145.png)

Comprovacions
Audio
Video
![Imatge 146](img/img146.png)
![Imatge 147](img/img147.png)

Videoconferencia
![Imatge 148](img/img148.png)

Disseny i implementació d’una base
de dades
Usuari administrador
1. Primer de tot, creem l’usuari.
2. Afegim a l’usuari al grup de sudoers.
3. Li posem la contrasenya.
Gestió d’usuaris, rols i permisos
Definició de taules
1. Primer de tot instalem el servidor de MySQL.
2. Assegurem MySQL, no es obligatori però recomanat.
Validate Password Plugin? → n
Remove anonymous users? → y
Disable root login remotely? → n
Remove test database? → y
Reload privilege tables? → y
3. Accedim a MySQL com root
![Imatge 149](img/img149.png)
![Imatge 150](img/img150.png)
![Imatge 151](img/img151.png)
![Imatge 152](img/img152.png)
![Imatge 153](img/img153.png)

4. Creem la base de dades
5. Creem les taules, per crear totes les taules he fet un script sql. (Script: (enlace) )
6. Verifica que es crea correctament
7. Insert de prova (enlace)
INSERT INTO departamentos (codigo, nombre, telefono) VALUES
('VEND', 'Ventas', '934001001'),
('TECH', 'Soporte Técnico', '934001002'),
('ADMIN', 'Administración', '934001003'),
('LOGIS', 'Logística', '934001004');
INSERT INTO empleats (dni, nombre, cognoms, direccion, telefono, codigo_departamento)
VALUES
('12345678A', 'Joan', 'García López', 'Carrer 1, Barcelona', '912345678', 'VEND'),
('87654321B', 'Anna', 'Martínez Pérez', 'Carrer 2, Barcelona', '912345679', 'TECH'),
('11111111C', 'Pere', 'Sánchez García', 'Carrer 3, Barcelona', '912345680', 'ADMIN'),
('22222222D', 'Maria', 'López Rodríguez', 'Carrer 4, Barcelona', '912345681', 'LOGIS');
INSERT INTO grup_qualitat (nom_grup, qualitat_video, qualitat_audio) VALUES
![Imatge 154](img/img154.png)
![Imatge 155](img/img155.png)
![Imatge 156](img/img156.png)
![Imatge 157](img/img157.png)

('Alta Velocidad', 'alta', 'alta'),
('Velocidad Media', 'mitjana', 'mitjana'),
('Baja Velocidad', 'baixa', 'baixa');
INSERT INTO configuracio_trucades (servidor_videotrucades, port, protocol) VALUES
('trucades.innovatetech.com', 5060, 'SIP'),
('videoconf.innovatetech.com', 443, 'WebRTC');
INSERT INTO usuaris_sistema (nom_complet, correu, extensio, estat, tipus, dni_empleat,
id_grup_qualitat) VALUES
('Joan García López', 'joan.garcia@innovatetech.com', '101', 'actiu', 'empleat', '12345678A',
1),
('Anna Martínez Pérez', 'anna.martinez@innovatetech.com', '102', 'actiu', 'empleat',
'87654321B', 1),
('Pere Sánchez García', 'pere.sanchez@innovatetech.com', '103', 'actiu', 'empleat',
'11111111C', 2),
('Client Extern', 'client@example.com', '201', 'actiu', 'client', NULL, 2);
8. Verifiquem que els insert ha funcionat correctament.
- departamentos:
- empleats:
- grup_qualitat:
![Imatge 158](img/img158.png)
![Imatge 159](img/img159.png)

- configuració_trucades:
- usuaris_sistema:
- Verificar que els relacions són correctes:
![Imatge 160](img/img160.png)
![Imatge 161](img/img161.png)
![Imatge 162](img/img162.png)

Definició de rols
1. Primer hem de crear els 4 rols
2. Assignem els permissos a cada rol
- Admin
- Vendes
![Imatge 163](img/img163.png)
![Imatge 164](img/img164.png)
![Imatge 165](img/img165.png)

- Administracio
- Treballador
3. Apliquem els canvis
4. Verifiquem que els permisos estan assignats
- Admin
- Vendes
![Imatge 166](img/img166.png)
![Imatge 167](img/img167.png)
![Imatge 168](img/img168.png)
![Imatge 169](img/img169.png)
![Imatge 170](img/img170.png)

- Administracio
- Treballador
![Imatge 171](img/img171.png)
![Imatge 172](img/img172.png)
![Imatge 173](img/img173.png)

Script de creació automatica d’usuaris
1. Ja amb el script creat hem de donar-li permissos d’execució
2. Ara hem d’executar l’script (enlace)
![Imatge 174](img/img174.png)

3. Verificació:
![Imatge 175](img/img175.png)
![Imatge 176](img/img176.png)

![Imatge 177](img/img177.png)
![Imatge 178](img/img178.png)

Triggers pel control d'accés i auditoria
1. Creem taules per les quotes.
CREATE TABLE IF NOT EXISTS quotas_usuari (
id INT PRIMARY KEY AUTO_INCREMENT,
id_usuari INT NOT NULL UNIQUE,
limit_minuts_mensuals INT DEFAULT 300,
limit_trucades_diaries INT DEFAULT 20,
FOREIGN KEY (id_usuari) REFERENCES usuaris_sistema(id)
);
CREATE TABLE IF NOT EXISTS control_trucades (
id INT PRIMARY KEY AUTO_INCREMENT,
id_usuari INT NOT NULL,
data_dia DATE,
minuts_usats INT DEFAULT 0,
trucades_avui INT DEFAULT 0,
FOREIGN KEY (id_usuari) REFERENCES usuaris_sistema(id)
);
2. Insertem les quotes per defecte pels usuaris existents.
INSERT INTO quotas_usuari (id_usuari, limit_minuts_mensuals, limit_trucades_diaries)
SELECT id, 300, 20 FROM usuaris_sistema;
3. Verifiquem.
4. Creem l’arxiu que creara els triggers
![Imatge 179](img/img179.png)

5. Executem l’arxiu.
6. Verifiquem que s’han creat correctament.
![Imatge 180](img/img180.png)
![Imatge 181](img/img181.png)
![Imatge 182](img/img182.png)

Events periòdics (còpies de seguretat)
1. Creem els directoris de backup
2. Verifiquem la taula control_backup
3. Creem l’script amb l’Event. (enlace)
4. Executem l’arxiu
5. Verifiquem que l’event s’ha creat
![Imatge 183](img/img183.png)
![Imatge 184](img/img184.png)
![Imatge 185](img/img185.png)
![Imatge 186](img/img186.png)

Disseny Entitat-Relació i relacional
Model E·R
Atributs
DEPARTAMENTOS:
● codigo (PK)
● nombre
● telefono
EMPLEATS:
● dni (PK)
● nombre
● cognoms
● direccion
● telefono
● codigo_departamento (FK)
USUARIS_SISTEMA:
● id (PK)
● nom_complet
● correu
● extensio
● estat
● tipus
![Imatge 187](img/img187.png)

● link_videotrucada
● dni_empleat (FK)
● id_grup_qualitat (FK)
GRUP_QUALITAT:
● id (PK)
● nom_grup
● qualitat_video
● qualitat_audio
CONFIGURACIO_TRUCADES:
● id (PK)
● servidor_videotrucades
● port
● protocol
REGISTRE_TRUCADES:
● id (PK)
● usuari_origen (FK)
● usuari_destinatari (FK)
● data_inici
● data_fi
● duracio
● qualitat_servei
● puntuacio
● comentari
● id_configuracio (FK)
QUOTAS_USUARI:
● id (PK)
● id_usuari (FK)
● limit_minuts_mensuals
● limit_trucades_diaries
VIDEOS:
● id (PK)
● titol
● descripcio
● categoria
● duracio
● data_publicacio
● link_streaming
ANALISI_AMPLADA_BANDA:

● id (PK)
● data_mesura
● usuari_equip
● velocitat_baixada
● velocitat_pujada
● latencia
● resultat
● operari
● notes
AVISOS_AUDITORIA:
● id (PK)
● usuari
● taula_afectada
● operacio
● data_hora
● descripcion
CONTROL_BACKUPS:
● id (PK)
● data_backup
● hora_backup
● taules_incloses
● resultat

Model Relacional
![Imatge 188](img/img188.png)

Implementació en el SGBD
1. Verificacions de totes les dades:
- Taules:
- Departamentos:
- empleatats:
![Imatge 189](img/img189.png)
![Imatge 190](img/img190.png)

- usauris_sistema:
![Imatge 191](img/img191.png)
![Imatge 192](img/img192.png)

- registre_trucades:
- usuaris_sistema:
![Imatge 193](img/img193.png)
![Imatge 194](img/img194.png)

- registre_trucades:
![Imatge 195](img/img195.png)
