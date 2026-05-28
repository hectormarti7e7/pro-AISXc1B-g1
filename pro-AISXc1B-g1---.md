# **Projecte Transversal**

# *Proposta CPD*

## **Ubicació física**

**Localització**

El contenidor CPD es troba instal·lat al **pati posterior de la seu d'Innovate Tech**, al **Parc Tecnològic 22@Barcelona**, sobre una plataforma de formigó preparada per a la seva instal·lació. El pati disposa de tancament perimetral amb tanca metàl·lica i accés controlat.

La connexió amb l'edifici d'oficines es fa per **canalització soterrada** (fibra òptica + alimentació elèctrica), sense cablejat visible a l'exterior.

**Per què un CPD containeritzat i no una sala tradicional?**

|Avantatge|Descripció|
|-|-|
|**Rapidesa**|Instal·lació *plug \& play*, sense obra|
|**Sostenibilitat**|Free Cooling redueix consum energètic|
|**Seguretat**|Aïllament físic de les oficines|
|**Escalabilitat**|Fàcil d'ampliar amb un segon contenidor|
|**Economia**|Menor cost que construir una sala CPD tradicional|

**Dimensions del contenidor**

|Dimensió|Mesura|
|-|-|
|**Longitud**|6,06 m|
|**Amplada**|2,44 m|
|**Alçada**|2,89 m (High Cube: +30 cm respecte l'estàndard)|
|**Superficie útil interior**|\~13,5 m²|

**Característiques constructives**

|Característica|Especificació|
|-|-|
|Resistència al foc|EI120|
|Estanqueïtat|IP55 (protecció davant pols i aigua)|
|Recobriment exterior|C5M, 350 micres (ISO 12944)|
|Compartimentació interna|Panells sandvitx ignífugs|
|Passos int./ext.|Sistemes de segellat modular certificats|
|Instal·lació|*Plug \& play* sobre plataforma de formigó|

El contenidor implementa un sistema de climatització de **doble unitat N+N**, combinant dues tecnologies:

**Unitat interior — Inrow d'expansió directa:**

* Situada entre els dos racks, treballa amb flux d'aire transversal.
* Aspira l'aire calent del *Hot Aisle* (part posterior dels servidors).
* Retorna aire fred al *Cold Aisle* (part frontal dels servidors).

**Unitat exterior — Free Cooling (tipus mochila):**

* Aprofita les condicions ambientals externes per reduir la compressió frigorífica.
* Redueix significativament el consum energètic del sistema de refrigeració.

Per a una empresa petita com Innovate Tech, la càrrega tèrmica generada pels servidors és baixa (\~3–4 kW IT). El sistema de freecooling és especialment eficient en el clima de Barcelona (temperatures moderades gran part de l'any).

**Paràmetres ambientals**

|Paràmetre|Valor|
|-|-|
|Temperatura operativa|18°C – 27°C|
|Humitat relativa|45% – 55%|
|Redundància|N+N (si falla una unitat, l'altra manté el servei)|
|Gestió|Controlador amb monitorització web i alertes en temps real|

* Contenidor pintat de **color gris neutre**, sense retolació que indiqui la seva funció.
* Identificat internament com **"Unitat Tècnica UT-01"** (sense referència a CPD, servidors ni dades).
* **Cap finestra** ni obertura visible a l'exterior (les reixes del free cooling estan integrades discretament a la part posterior).
* Cablejat d'interconnexió amb l'edifici per **conductes soterrats**, sense traça visible.
* Senyalització exterior mínima: únicament avisos obligatoris de seguretat elèctrica i accés restringit.
* La **porta d'accés** no indica la funció de la instal·lació i disposa d'autenticació electrònica .
* El pati no és visible des de la via pública.

**Terra tècnic**

El terra interior del contenidor és **elevat** per permetre:

* Pas del **cablejat elèctric** per sota, separat físicament del cablejat de dades.
* Circulació de l'**aire fred** des de la unitat Inrow cap al front dels racks (*Cold Aisle*).
* Facilitat de manteniment i substitució de cables sense afectar els equips actius.

**Sostre tècnic**

La part superior interior disposa de **safates portacables metàl·liques** integrades:

* Pas del **cablejat de xarxa** UTP Cat6A i **fibra òptica** entre racks.
* Retorn de l'**aire calent** cap a la unitat de climatització .
* Safates separades per a dades i per a elèctric (mai compartides).

**Codi de colors**

|Color|Tipus|Funció|
|-|-|-|
|🔵 Blau|UTP Cat6A|Xarxa de dades|
|🟡 Groc|UTP Cat6|Gestió i consola (OOB)|
|⚫ Negre|Elèctric|Alimentació línia A|
|🔴 Vermell|Elèctric|Alimentació línia B|
|🟠 Taronja|Fibra òptica|Connexió WAN / alta velocitat|

**Normes de gestió**

* Tots els cables etiquetats als dos extrems seguint l'estàndard TIA-606, basat en rack-posició-port (ex: A1-1 → A2-1)..
* **Brides i safates** organitzades per tipus (dades i elèctric mai junts).
* **Patch panels** als racks per centralitzar connexions i facilitar canvis.
* Longitud de cables optimitzada per evitar acumulació de cablejat sobrant.
* Radi de curvatura respectat en la fibra òptica.

**PDUs intel·ligents**

* **Una PDU vertical 0U per rack**, identificades cromàticament:

  * **Blava** → Línia A (circuit principal)
  * **Vermella** → Línia B (circuit redundant)
* Monitorització del consum en temps real per rack.
* Gestió remota via SNMP i HTTPS.

### **Planell de situació — Vista exterior**

## **!\[](img/img1.jpg)**

## 

## 

## 

## 

## 

## 

## 

### **Planell interior — Vista planta**

## **!\[](img/img2.jpg)**

### **Distribució i gestió del cablejat — codi de colors**

## **!\[](img/img3.jpg)**

### **Estructuració dels racks — Rack 1 i Rack 2**

## **!\[](img/img4.jpg)**

## **Infraestructura IT**

InnovateTech té un total de 7 serveis en 6 servidos (Web i FTP estan al mateix servidor), tots els servidors corren sobre Ubuntu Server 24.04 LTS, per a això necessitem una bona organització i satisfacer els requeriments que es necessiten per un CPD.

### **Servidors: Número i tipus de model:**

|Servei|Rol (Servei)|S.O base|Especificacions mínimes|
|:-:|:-:|:-:|:-:|
|**Web + FTP**|Nginx HTTPS Server + SFTP|Ubuntu Server 24.04 LTS|2 vCPU, 16 GB RAM, 2TB HDD|
|**Audio**|Ampache|Ubuntu Server 24.04 LTS|2 vCPU, 16 GB RAM, 1TB HDD|
|**Video + Videoconferencia**|NGINX-RTMP + Jitsi Meet|Ubuntu Server 24.04 LTS|4 vCPU, 16 GB RAM, 1TB SSD|
|**Base de dades**|MySQL|Ubuntu Server 24.04 LTS|4 vCPU, 16 GB RAM, 1TB SSD|
|**Centralització de logs**|Kibana + Elasticsearch + Logstash|Ubuntu Server 24.04 LTS|4 vCPU, 8 GB RAM, 2TB HDD|
|**Directori Actiu**|Samba AD DC|Ubuntu Server 24.04 LTS|2 vCPU, 4 GB RAM, 50 GB SSD|

### **Patch Panels:**

2 Patch panel Cat6A de 48 ports, que s’ubicaran al rack 1 i al rack 2. Tindrem un organitzador de cables intermedis de 1U entre cada patch panel i el switch per mantenir l’ordre del cablejat. Etiquetatge de cada port seguint un estàndard, el TIA-606 que es basa en rack-posició-port.

### **Switches:**

Hem escollit 2 tipus de switches. Primer, tenim el Switch Core L3 (48 ports PoE, 4x SFP+ 10G uplink), aquest switch interconnectarà tots els racks i gestiona el routing entre VLANs.

* VLAN10: Servidors IT.
* VLAN 20:Gestió/IPMI.
* VLAN 30: Accès clients.
* VLAN 99: Administració de xarxa.

A continuació, tenim el 2n switch, el Switch d’accés L2 (24 ports):  
Aquest switch estarà dedicat exclusivament a la xarxa per a gestió i IPMI dels servidors, i, estarà completament segregat del tràfic de producció.

**Planells i diagrames de distribució de racks, patch panels i switches:**

***!\[](img/img5.jpg)***  
!\[](img/img6.jpg)!\[](img/img7.jpg)

### 

## ***Infraestructura elèctrica***

### Sistemes d’alimentació redundant

#### **Estimació de consum elèctric**

##### **Consum pels servidors**

* Server Web + SFTP (Rack 1U, 2vCPU/4GB/50GB): 180-220W
* Server Audio (Rack 1U, 2vCPU/4GB/100GB): 200-250W
* Server Vídeo + Videoconferència (Rack 1U, 4vCPU/8GB/200GB): 280-350W
* Server Base de Dades (Rack 1U, 4vCPU/8GB/200GB): 280-350W
* Server Centralització de Logs (Rack 1U, 4vCPU/8GB/500GB): 280-350W
* Server Directori Actiu (Rack 1U, 2vCPU/4GB/50GB): 180-220W
* Estimació Total: 1400-1740 W.

  ##### **Consum de Xarxa i equipament complementari**

* Switch Core L3 (48 ports PoE, 4x SFP+ 10G): 150-200W
* Switch d'Accés L2 (24 ports): 80-110W
* Patch Panel Cat6A (48 ports) x2: 0W (equipment passiu)
* Organitzador de cables: 0W (equipament passiu)
* PDU Inteligent: 20-30W
* Luminaria LED CPD: 100-150W
* Estimació total: 350-490 W.

  ##### **Consum de climatització**

* Unitat Inrow (quan és necessari compressió frigorifica): 800-1200W
* Free Cooling (aprofita condicions externes): redueix un 40-60 % el consum
* Consum promig anual amb free cooling: 1200-2000
* consum pic (clima calent, sense free cooling efectiu): 1500-2500 W
* Estimació climatització: 1200-2500W (depenent de les condicions ambientals)

  ##### **Consum Total Operatiu**

* Servidors + xarxa: 1655 - 2060W.
* Climatització (operació normal): 1200-1800 W
* Climatització (pic, condicions extremes): 1500-2500 W
* Consum total : 2950-4030 W (Climatització normal) / 3250-4740 W (Condicions extremes)

  Amb aquestes dades, per deduir quin SAI necessitem hem de considerar un marge de 25% sobre el consum màxim:

* Consum Màxim Pic: 4740 W
* Marge de seguretat (25%): 1185 W

  Total per dimensionament SAI: 5925 W  
Amb tota aquesta informació deduïm que necessitem un SAI de mínim 6 kVA (6000 W) per garantir funcionament i comoditat operativa dins dels serveis en cas d'emergència.

  ### SAIS

  #### **Càlcul de bateria i components**

  Per calcular la bateria necessaria i quin model hem d’escogir, hem fet 3 diferents escenaris en el que el SAI hauria de treballar.

  **Escenari 1: Carga Normal (2500W - Operació típica)**

* Autonomia estimada 25-30 mins.
* Temps suficient per apagada ordenada completa de tots els servidors.
* Permet executar scripts de backup i sincronització de dades.

  **Escenari 2: Carga reduïda (1500W - Apagada parcial)**

* Autonomia estimada: 45-60 mins.
* Permet mantenir servidors crítics (base de dades, AD) operatius mentre s’apaguen altres.

  **Escenari 3: Carga Mínima (1.000W - Serveis Critics només)**

* Autonomia estima: 90+ mins.
* Permet operació prolongada de servidors essencials.

  #### **Model SAI**

  Amb totes aquestes necessitats hem arribat a la conclusió d’escogir un SAI, el SAI que hem escollit el *APC SRT2200XLI* ([link compra](https://www.amazon.es/APC-Smart-UPS-SRT-alimentación-ininterrumpida/dp/B017WSRJ8I?th=1)), que té compleix amb els requeriments necessaris, aquestes son les caracteristiques del SAI:

* **Capacitat:** 3 kVA / 3.000W.
* **Potencia bateria:** 2.700W.
* **Rendiment:** 94,2%.
* **Voltatge entrada:** 160-275V CA.
* **Voltatge sortida:** 220V ±10%.
* **Bateria:** VRLA Gel 48V / 9Ah (432 Wh) amb hot-swap.
* **Autonomia:** \* 10-12 min plena carga

  * 20-25 min @ 70%
  * 35-40 min @ 50%
  * 60+ min @ 25%
* **Salides:** 6 × C13 + 1 × C19.
* **Ports:** USB, RJ-45 SNMP, RS-232, SmartSlot.
* **Temps transferència:** < 4ms.
* **Proteccions:** sobrecarga, apagado emergència, alarma audible.
* **Dimensiones:** 483 × 177 × 432 mm.
* **Peso:** 35 kg.
* **Temperatura operativa:** 0-40°C.
* **Certificacions:** CE, RoHS, ENERGY STAR, EN/IEC 62040.
* **Garantia:** 5 anys.
* **Preu:** (1954,49€ x2) 3908,98€

  ## ***Seguretat fisica i lògica***

  ### **Fisica:**

  Els elements de la part de seguretat del CPD es basen en 3 capes:  
La Capa 1 és el perímetre exterior del pati, que disposa d'una tanca metàl·lica i d'una porta d'accés amb pany electrònic i videoporter. Només el personal autoritzat pot entrar al pati. L'accés des del carrer no permet veure l'interior del pati ni identificar el contenidor.  
La Capa 2 és la porta d'accés al contenidor amb doble factor. La porta del contenidor és d'acer reforçat i requereix doble autenticació: s'utilitzaria una targeta RFID, de la qual només disposen les persones autoritzades, i el sistema registra l'usuari que hi ha accedit juntament amb la data i l'hora de l'accés. I també amb un teclat PIN, ja que si no saps quin és el codi, és igual que tinguis la targeta perquè no podràs accedir-hi. Als 3 intents incorrectes es genera una alerta automàtica.  
La Capa 3 és una gàbia de seguretat dins del contenidor, on estaran els dos racks protegits. Per accedir a l'interior de la gàbia fa falta una clau, de manera que, encara que siguis capaç de travessar les capes anteriors, encara queda travessar la gàbia.

  Pel que fa a la part de videovigilància, s'instal·larien 4 càmeres (la primera a l'entrada del pati interior, la segona a la porta del contenidor a l'exterior, la tercera a l'interior del contenidor a la cantonada dreta i la quarta a l'interior del contenidor a la cantonada esquerra en paral·lel a la tercera). Les característiques de les càmeres són:  
·Resolució 1080p Full HD com a mínim.  
·Visió nocturna per infrarojos.  
·Gravació contínua 24/7.  
·Emmagatzematge en NVR amb disc de 6 TB, amb una retenció de 30 dies de gravació.  
·Accés remot a les gravacions exclusivament mitjançant VPN, només disponible en els ordinadors del responsable de seguretat.

  El sistema de prevenció, detecció i extinció d'incendis es basa en:  
**Prevenció:** amb la prohibició total d'introduir líquids, aliments o materials inflamables dins del contenidor. Els equips es revisen periòdicament per detectar sobreescalfaments abans que siguin perillosos i el contenidor no té paper, ni cartó, ni cap altre material combustible a l'interior.  
**Detecció:** amb 2 detectors de fum iònics al sostre del contenidor (un a sobre de cada rack), amb una sensibilitat alta per detectar partícules de fum abans que hi hagi flames visibles. També inclou 1 detector de temperatura integrat al sistema de climatització que activa una alarma si se supera el llindar de temperatura establert en 30 °C, 1 detector d’humitat amb un rang establert entre el 45% i el 55% per evitar la condensació d'aigua o l'electricitat estàtica que podrien fer malbé els components electrònics dels servidors , juntament amb una central d'alarmes connectada a tots els detectors de fum i de temperatura que notifica el responsable en cas d'alarma.  
**Extinció:** és un sistema automàtic d'extinció per gas inert que, en activar-se, allibera un gas que redueix l'oxigen per sota del nivell de combustió, apagant el foc sense danyar els equips ni deixar residus. És l'estàndard per a CPD i és compatible amb espais tancats. També disposa de 2 extintors de CO₂ (tipus C), un a l'interior al costat de la porta i un altre a l'exterior del contenidor, per a una intervenció manual.  
**Vies d'evacuació:** La via principal és la porta principal, que des de l'interior s'obre sense necessitat d'introduir codis ni res.  
**Senyalització d'emergència:** Està instal·lada sobre la porta interior i és visible fins i tot amb fum. És autònoma, disposa de la seva pròpia bateria i s'activa automàticament si hi ha talls de llum.  
**Enllumenat d'emergència:** Se situa a sobre de la porta interior i té una autonomia de 1 hora en cas de tall elèctric.  
**Protocol d'evacuació:** Estableix que tot el personal que treballi a l'interior ha de saber que, davant de qualsevol alarma, ha de sortir immediatament, allunyar-se del contenidor un mínim de 10 metres i avisar el responsable de seguretat. No s'ha d'intentar apagar el foc manualment si el sistema automàtic ja està activat.

  Diagrama de la seguretat  
!\[](img/img8.jpg)

  ### **Lógica**:

  Per a la restricció d'accés per autorització s'aplicarà el principi de mínim privilegi. Cada usuari té els permisos limitats i exclusivament necessaris per al seu rol. Dins dels servidors Linux, cap servei funcionarà amb l'usuari root, sinó cadascun exclusivament amb l'usuari del sistema necessari. Els administradors tindran el seu propi usuari intransferible i sense possibilitat d'accedir remotament amb SSH sense clau pública/privada. I totes les comandes executades amb privilegis queden guardades al servidor de logs.

  A nivell de firewall en tindrem un de físic i un altre de host. El físic servirà per obrir exclusivament els ports necessaris que es puguin obrir cap a internet, com per exemple l'HTTPS. Després, el firewall de host servirà per si de cas el físic ha tingut alguna fallada de seguretat, limitant també les connexions amb iptables, com ara restringint que només es pugui fer SSH dins de la xarxa interna i res que sigui extern.

  Per al monitoratge s'utilitzarà Zabbix, perquè podem centralitzar tota la supervisió des d'un mateix servidor. Es monitoritza el hardware (temperatura de la CPU, ús de RAM i CPU, per exemple), els serveis (MySQL o LDAP, per exemple), la xarxa (latència, amplada de banda, etc.) i la seguretat (intents fallits de login per SSH, per exemple). Tot això anirà juntament amb un sistema d'alertes si alguna mètrica canvia dràsticament. Com per exemple: més d'un 90% d'ús de CPU durant un temps prolongat, més de 5 intents d'SSH en 1 minut, etc.

  Amb les còpies de seguretat s'aplicarà l'estratègia 3-2-1. Atès que es considera l'estàndard, serà la que farem servir. Aquesta consta de 3 còpies de les dades en 2 tipus de suport diferents, amb 1 còpia fora de les instal·lacions. Faríem una còpia incremental diària a les 2 del matí, una còpia completa setmanal tots els diumenges a les 3 del matí i una còpia completa mensual el día 1 de cada mes.

  Per als RAID utilitzaríem RAID 10. La configuració seria de 6 discs SSD de 4 TB, un total de 24 TB; es formen els parells mirall del RAID 1 i després es combinen en RAID 0 per al rendiment. La capacitat útil seria de 12 TB. S'afegiria un 7è disc com a hot spare (disc de reserva en calent); si un disc falla, el sistema es reconstrueix automàticament amb aquest disc sense haver d'esperar la intervenció humana.

  ### **Prevenció de RRLL:**

  **Risc elèctric**  
Tot el cablejat elèctric discorre pel fals terra tècnic, separat físicament del cablejat de dades. Està prohibit realitzar treballs elèctrics sense formació específica i sense desconnectar prèviament l'equip afectat. S'aplica el procediment de bloqueig i etiquetatge abans de qualsevol intervenció elèctrica.

  **Risc per descàrrega del sistema d'extinció**  
El sistema de gas inert té un retard d'activació de 30 segons des que sona l'alarma, temps suficient per sortir del contenidor. Està prohibit entrar al contenidor després d'una descàrrega fins que el responsable de seguretat confirmi que el nivell d'oxigen és segur mitjançant un mesurador de O₂.

  **Risc ergonòmic i de sobreesforç**  
Cap equip de més de 25kg no es manipula per una sola persona, sempre es requereix un mínim de dues persones. Es disposa d'un carret elevador de rack per a la instal·lació d'equips pesats.

  **Risc per exposició al soroll**  
Els sistemes de climatització i els ventiladors dels servidors generen soroll constant. Si supera els 85 dB és obligatori l'ús de protectors auditius. Es limita la permanència contínua dins del contenidor a un màxim de 2 hores seguides.

  **Risc per temperatura**  
Si la temperatura supera els 30°C està prohibit romandre dins del contenidor fins que es restableixi la climatització.

  **Risc de caiguda**

  Qualsevol placa del fals terra que es retiri durant un treball ha de senyalitzar-se immediatament amb un senyal d'advertència i col·locar-se de nou en acabar la intervenció.

  **Formació i procediments generals**  
Tot el personal amb accés al CPD rep una formació inicial de seguretat abans d'obtenir la targeta d'accés, que inclou: protocol d'evacuació, maneig de l'extintor de CO₂, protocol després de descàrrega de gas i normes elèctriques bàsiques.

## 

  ## ***Implementació del CPD***

# 

  ### **Servidor Web + SFTP:**

  **Servidor Web i Transferència de Fitxers Segura (SFTP)**

  ## ***Introducció i Context del Projecte***

* Aquest apartat detalla la implementació, el desplegament i la configuració del servidor corporatiu d'**Innovate Tech**. Dins del marc del projecte transversal , s'ha optat per una solució altament optimitzada i orientada al núvol que unifica el **Servidor Web actiu** i el **Servei de Transferència Segura de Fitxers (SFTP)** dins d'una mateixa instància d'Amazon Web Services (AWS).
* Aquest servidor actua com el nucli d'interconnexió frontal i d'APIs del projecte, enllaçant dinàmicament la capa d'aplicació amb proveïdors externs de dades com bases de dades distribuïdes, serveis d'autenticació i nodes de logs centralitzats



  !\[](img/img9.jpg)

  ***Arquitectura de l'Aplicació i Stack Tecnològic***

  A diferència d'un desplegament estàtic tradicional, la infraestructura actual d'Innovate Tech dona suport a un entorn web dinàmic modern dividit en microserveis controlats per un gestor de processos:

* **Domini Actiu:** https://innovatetech.ddns.net (Associat mitjançant No-IP).  
!\[](img/img10.jpg)
* **Frontend d'Alt Rendiment:** Desenvolupat en React + TanStack Start + Vite, executant-se com un procés Node.js gestionat per PM2 a la instància EC2 d'AWS.
* **Backend / API Interna:** Dissenyada amb *Node.js* i *Express API* per a la gestió lògica del negoci.
* **Gestor de Processos:** *PM2* s'encarrega de mantenir vius i monitorar en segon pla els dos serveis principals en els següents ports locals:

  * innovatetech (Frontend) $\\rightarrow$ Port 3000
  * api (API Express) $\\rightarrow$ Port 4000

  ***Preparació i Seguretat Inicial del Sistema (Hardening)***

  Per complir rigorosament amb els requeriments d'administració segura del CPD d'Innovate Tech, s'ha prohibit de manera absoluta l'ús de l'usuari per defecte (ubuntu) per a tasques d'administració web, minimitzant així els vectors d'atac.

  **Creació de l'Usuari Administrador de Serveis**

  S'ha creat un usuari dedicat del sistema anomenat adminweb. Per dotar-lo de persistència d'accés sense comprometre el servidor amb contrasenyes febles, s'ha configurat un esquema de clau pública/privada (SSH):

  **Configuració de l'entorn de claus segures:** Es va extreure el fitxer authorized\_keys original de l'entorn d'AWS i es va replicar aplicant estrictament els permisos POSIX de propietat i lectura restrictiva:

  !\[](img/img11.jpg)  
!\[](img/img12.jpg)

  **Creació de la Pàgina Web**

  La pàgina web corporativa d'Innovate Tech ha estat creada utilitzant Lovable, una eina de generació de codi web basada en intel·ligència artificial. Gràcies a aquesta eina, el frontend va estar operatiu des del primer moment, ja que Lovable va generar automàticament tota l'estructura de components React, el disseny visual i la navegació entre seccions.

  Un cop generada la base del projecte, la tasca principal va consistir a substituir les parts simulades o estàtiques per connexions reals amb els servidors del projecte. Concretament, es van adaptar els components que mostraven dades de prova per tal que consumissin els endpoints reals de l'API Express, el servidor d'àudio Ampache, el servidor de vídeo, el sistema d'autenticació via Samba AD i el monitor de logs d'Elasticsearch.

  D'aquesta manera, Lovable va permetre centrar els esforços en la integració real dels serveis en lloc d'invertir temps en el disseny i la maquetació del frontend.

  !\[](img/img13.jpg)  
!\[](img/img14.jpg)

  ***Estructura i Funcionalitats del Portal Web***

  El portal web corporatiu d'Innovate Tech està dividit en quatre seccions principals accessibles des del menú de navegació superior.

  **Inici** és la pàgina principal de la plataforma. Mostra una presentació general de l'empresa i dona accés ràpid a les funcionalitats principals mitjançant botons d'acció.

  **Àudio** és el portal de streaming d'àudio. Mostra el catàleg de cançons disponibles al servidor Ampache amb el títol, durada, categoria i format. Permet reproduir les pistes directament des del navegador mitjançant un reproductor integrat.

  **Vídeo** és el portal de vídeo i videoconferència. Mostra el catàleg de vídeos disponibles al servidor de vídeo i permet crear o unir-se a sales de videoconferència Jitsi directament des del navegador.

  **Panel Admin** és el panell d'administració de la infraestructura. Només és accessible per als usuaris amb rol Administrador. Conté quatre pestanyes: Monitor de Logs per veure els events del sistema en temps real des d'Elasticsearch, SFTP per gestionar les transferències de fitxers, Samba AD per crear i gestionar els usuaris del directori actiu, i Bandwidth per monitorar les mesures d'amplada de banda de la xarxa.

  **Control d'accés per rols**

  La web implementa un sistema de control d'accés basat en rols. Els usuaris amb rol Administrador tenen accés a totes les seccions incloent el Panel Admin. Els usuaris amb rol Empleado només poden accedir a Inici, Àudio i Vídeo, i el Panel Admin no apareix al seu menú de navegació. Els rols s'assignen a la base de dades MySQL i es validen en el moment de l'autenticació contra Samba AD.

  **Servei Web**

  El servidor web d'Innovate Tech actua com el punt d'accés principal de tota la infraestructura del projecte. És l'encarregat de rebre totes les peticions dels usuaris i redirigir-les als serveis corresponents mitjançant NGINX com a proxy invers. El portal web corporatiu permet als usuaris autenticats accedir a tots els serveis de l'empresa des d'un únic lloc: el portal d'àudio, el portal de vídeo i videoconferència, el panell d'administració i la gestió d'usuaris.

  El servidor és accessible públicament a través del domini [https://innovatetech.ddns.net](https://innovatetech.ddns.net), associat mitjançant No-IP per resoldre el problema de l'adreça IP pública dinàmica d'AWS. Totes les comunicacions es realitzen xifrades mitjançant HTTPS gràcies al certificat SSL/TLS obtingut amb Certbot i Let's Encrypt.

  **Servei SFTP**

  El servei SFTP permet als usuaris de l'empresa transferir fitxers de manera segura al servidor. A diferència d'un servei FTP tradicional, totes les comunicacions van xifrades, cosa que garanteix la confidencialitat de les dades transferides.

  S'han implementat dos nivells d'accés. El primer és mitjançant un usuari local específic (sftptest) per a transferències puntuals o de prova. El segon és mitjançant els usuaris del directori actiu Samba AD, de manera que qualsevol empleat de l'empresa pot connectar-se per SFTP utilitzant les mateixes credencials que utilitza per accedir a la resta de serveis corporatius, sense necessitat de gestionar comptes locals addicionals.

  Els usuaris SFTP estan confinats dins del seu directori mitjançant chroot, cosa que impedeix que puguin navegar per altres directoris del servidor i garanteix la seguretat del sistema.

  **NGINX**

  S'ha escollit NGINX com a servidor web i proxy invers per la seva alta eficiència en la gestió de connexions concurrents i el seu baix consum de recursos en comparació amb altres alternatives com Apache. NGINX actua com a punt d'entrada únic de totes les peticions HTTP/HTTPS, redirigint el tràfic cap als serveis interns segons la ruta sol·licitada. Això permet tenir el frontend i la API en ports locals separats sense exposar-los directament a Internet.

  **PM2**

  PM2 és un gestor de processos per a aplicacions Node.js que garanteix que els serveis estiguin sempre actius. En cas que un procés caigui per qualsevol error, PM2 el reinicia automàticament. A més, permet monitorar l'estat dels processos en temps real i configurar l'inici automàtic dels serveis quan el servidor s'arrenca. S'ha utilitzat per mantenir en funcionament tant el frontend (port 3000) com la API Express (port 4000).

  **Certbot / Let's Encrypt**

  Per servir la web amb HTTPS s'ha utilitzat Certbot amb Let's Encrypt, una autoritat de certificació gratuïta i de confiança. Això permet xifrar tot el tràfic entre el client i el servidor sense cost addicional. El certificat té una validesa de 90 dies i es pot renovar automàticament, cosa que elimina la necessitat de gestió manual.

  **OpenSSH (SFTP)**

  S'ha utilitzat OpenSSH per implementar el servei SFTP ja que ve instal·lat per defecte a Ubuntu Server 24.04 LTS i ofereix un nivell de seguretat molt alt. A diferència d'FTP, SFTP xifra tant les credencials com les dades transferides, cosa essencial en un entorn empresarial. A més, la integració amb el directori actiu Samba AD mitjançant sssd permet que els usuaris del domini es connectin per SFTP sense necessitat de crear comptes locals addicionals.

  **API Express — Nucli de Connexió dels Serveis**

  El servidor web no només serveix el frontend, sinó que també allotja una API REST desenvolupada amb Node.js i Express que actua com a intermediari entre la web i tots els servidors del projecte. Aquesta API escolta al port 4000 i és accessible des de l'exterior a través de NGINX mitjançant la ruta /api-internal/.

  El flux complet és el següent: el navegador de l'usuari fa una petició al domini [https://innovatetech.ddns.net](https://innovatetech.ddns.net), NGINX la rep i la redirigeix segons la ruta, el frontend al port 3000 o l'API al port 4000, i l'API connecta amb els servidors externs necessaris per respondre.

  El fitxer principal de l'API és /var/www/innovatetech/api/index.js, que gestiona les connexions amb MySQL per a les dades dels usuaris, salas i mesures d'amplada de banda, amb Samba AD via LDAP per a l'autenticació, amb Ampache per obtenir el catàleg d'àudio, amb Elasticsearch per obtenir els logs del sistema i amb el servidor de vídeo per obtenir el catàleg de vídeos.

  Per la seva banda, el fitxer db.functions.ts del frontend actua com a pont entre els components React i l'API Express. Centralitza totes les crides als serveis i defineix les constants de configuració principals, la URL de l'API interna i la IP del servidor d'àudio. Cada funció d'aquest fitxer correspon a una operació concreta: getAllState obté totes les dades necessàries per als portals, login gestiona l'autenticació, uploadMedia registra fitxers pujats per SFTP, createUser crea usuaris simultàniament a MySQL i Samba AD, createRoom i endRoom gestionen les videoconferències, getBandwidth obté les mesures de xarxa i getVideos obté el catàleg de vídeos del servidor extern.

  ***Instal·lació i configuració del servidor web (NGINX + HTTPS)***

  El servidor web s'ha instal·lat sobre Ubuntu Server 24.04 LTS a AWS. S'ha utilitzat NGINX com a servidor web i proxy invers, amb certificat SSL/TLS per servir la web amb HTTPS.

  Els passos seguits han estat:

  !\[](img/img15.jpg)

  !\[](img/img16.jpg)

  Per obtenir el certificat HTTPS s'ha utilitzat Certbot amb Let's Encrypt:

  !\[](img/img17.jpg)

  !\[](img/img18.jpg)

  La configuració final de NGINX actua com a proxy invers cap al servidor d'aplicació (Wrangler/Node.js) que escolta al port 3000.

  !\[](img/img19.jpg)

  !\[](img/img20.jpg)

  !\[](img/img21.jpg)

  ***Instal·lació i configuració del servei SFTP***

  El servei SFTP permet la transferència segura de fitxers als usuaris autenticats. S'ha configurat utilitzant OpenSSH, que ja ve instal·lat per defecte a Ubuntu Server 24.04 LTS.

  S'ha creat un usuari específic per SFTP i un directori d'uploads:

  !\[](img/img22.jpg)

  Explicació de la Configuració del Fitxer sshd\_config

  Per configurar el servei SFTP s'han afegit les següents directives al fitxer /etc/ssh/sshd\_config:

  **DenyUsers ubuntu**

  S'ha denegat l'accés SSH a l'usuari per defecte d'Ubuntu per reduir els vectors d'atac. Això obliga a utilitzar l'usuari administrador específic (adminweb) per a qualsevol tasca d'administració del servidor.

  **Subsystem sftp internal-sftp**

  S'ha substituït el subsistema SFTP per defecte pel mode internal-sftp, que és més eficient i permet aplicar restriccions de chroot correctament sense dependre de binaris externs.

  **Match Group sftpusers**

  S'ha creat una regla específica que s'aplica únicament als usuaris que pertanyen al grup sftpusers. Dins d'aquesta regla s'han configurat les següents opcions:

* **ChrootDirectory /srv/sftp/%u** — Cada usuari queda confinat dins del seu propi directori, on %u és substituït automàticament pel nom d'usuari. Això impedeix que pugui accedir a altres parts del sistema de fitxers.
* **ForceCommand internal-sftp** — Força que la connexió només pugui utilitzar SFTP, impedint que l'usuari pugui obrir una sessió SSH normal o executar comandes al servidor.
* **PasswordAuthentication yes** — Permet l'autenticació amb contrasenya per als usuaris SFTP, necessari per als usuaris del domini Samba AD.
* **X11Forwarding no / AllowTcpForwarding no** — Es desactiven funcionalitats innecessàries per reduir la superfície d'atac del servei.

  !\[](img/img23.jpg)

  Després s'ha reiniciat el servei:

  !\[](img/img24.jpg)

  Per verificar el funcionament s'ha connectat des d'un client extern:

  !\[](img/img25.jpg)

  Transferència d'un fitxer de prova amb put ubicacio\_fisica\_cpd.md

  !\[](img/img26.jpg)

  **3. Instal·lació i configuració del servei SFTP amb autenticació Samba AD**

  El servei SFTP permet la transferència segura de fitxers als usuaris de l'empresa. S'ha configurat utilitzant OpenSSH integrat amb el Directori Actiu (Samba AD) mitjançant sssd i realmd, de manera que els mateixos usuaris del domini poden connectar-se per SFTP sense necessitat de crear comptes locals addicionals.

  ***Integració amb Samba AD:***

  Per integrar el servidor amb el domini innovatetech.local s'han instal·lat els paquets necessaris:!\[](img/img27.jpg)

  S'ha unit el servidor al domini:

  S'ha generat el keytab de Kerberos:

  !\[](img/img28.jpg)

  S'ha configurat /etc/sssd/sssd.conf:

  !\[](img/img29.jpg)

  Els directoris home es creen automàticament en el primer login:

  !\[](img/img30.jpg)

  ***Verificació Final del Servei SFTP amb Autenticació Samba AD***

  Un cop completada la integració del servidor SFTP amb el directori actiu Samba AD mitjançant sssd i realmd, s'ha verificat que els usuaris del domini innovatetech.local poden connectar-se per SFTP utilitzant les seves credencials corporatives, sense necessitat de tenir un compte local creat manualment al servidor.

  Això és possible gràcies a la integració de sssd amb PAM, que intercepta l'autenticació i la delega al controlador de domini Samba AD. Quan un usuari del domini intenta connectar-se per SFTP, el servidor consulta al directori actiu si les credencials són vàlides i si l'usuari té permisos d'accés.

  A més, gràcies a la configuració de pam-auth-update amb l'opció mkhomedir, el directori home de l'usuari es crea automàticament la primera vegada que es connecta, sense que l'administrador hagi d'intervenir manualment.

  Els avantatges principals d'aquesta integració són els següents. La gestió centralitzada d'usuaris permet que qualsevol canvi realitzat al directori actiu, com bloquejar un usuari o canviar la seva contrasenya, tingui efecte immediat també al servei SFTP. Els usuaris utilitzen les mateixes credencials per a tots els serveis de l'empresa. No cal crear ni mantenir comptes locals addicionals al servidor web, cosa que simplifica l'administració i redueix el risc d'errors.

  **Comprovació:**

  !\[](img/img31.jpg)

  ***Servidor de Vídeo i Videoconferència (NGINX-RTMP + Jitsi Meet)***

  El servidor de vídeo i videoconferència ha estat instal·lat i configurat pel company Noel en un servidor AWS independent. El servei és accessible a https://innovatetech-video.duckdns.org i utilitza el protocol WebRTC per a la comunicació en temps real.

  **Verificació d'accessibilitat del servidor:**

  !\[](img/img32.jpg)

  Catàleg de vídeos disponibles:

  !\[](img/img33.jpg)

  Verificació del stream HLS:

  !\[](img/img34.jpg)

  **Integració del servidor de vídeo a la web — Josep**

  S'ha creat un endpoint a l'API Express que obté el catàleg de vídeos i el retorna a la web:

  !\[](img/img35.jpg)  
Verificació:

  !\[](img/img36.jpg)

  **Integració amb el servidor web**

  La part de Josep ha consistit en connectar el portal web corporatiu amb el servidor Jitsi mitjançant un iframe, i crear l'API que registra les trucades a MySQL.

  Quan un usuari crea o s'uneix a una sala des del portal web, es carrega el Jitsi via iframe. En finalitzar la sala, la web crida automàticament a l'API:

  POST /api-internal/rooms/register  
!\[](img/img37.jpg)

  Que guarda a MySQL: usuari origen, usuari destinatari, data inici, data fi, durada real en segons i qualitat del servei.

  !\[](img/img38.jpg)  
!\[](img/img39.jpg)

  ***Integració del Servidor d'Àudio a la Web***

  La integració del servidor d'àudio Ampache a la web corporativa s'ha realitzat mitjançant l'API REST d'Ampache i un proxy Nginx per resoldre el problema de mixed content HTTPS

  !\[](img/img40.jpg)  
**Endpoint a l'API Express:**

  S'ha creat un endpoint que s'autentica automàticament a Ampache i retorna les cançons amb les URLs de streaming:

  !\[](img/img41.jpg)  
**Proxy Nginx per HTTPS:**

  El servidor web és HTTPS però Ampache és HTTP. Per evitar el bloqueig de mixed content del navegador, s'ha afegit un proxy al Nginx:

  !\[](img/img42.jpg)  
Així les URLs de streaming passen per HTTPS:

  https://innovatetech.ddns.net/ampache/play/index.php?...

  **Player d'àudio real:**

  S'ha afegit un element <audio> real al AudioPortal.tsx per reproduir els fitxers:

  !\[](img/img43.jpg)

  Comprovació

  !\[](img/img44.jpg)

  **Autenticació via Samba AD (LDAP) — Josep**

  El sistema d'autenticació de la web corporativa utilitza el directori actiu Samba AD del company Noel per validar les credencials dels usuaris. El servidor LDAP és accessible a 34.225.185.205:389 amb el domini innovatetech.local.

  Verificació d'accessibilitat del servidor LDAP:  
!\[](img/img45.jpg)  
**Implementació del login a l'API:**

  S'ha instal·lat la llibreria ldapjs i s'ha implementat el login a l'API Express:

  !\[](img/img46.jpg)  
**Flux d'autenticació:**

1. L'usuari introdueix les credencials al portal web
2. La web crida POST /api-internal/login
3. L'API intenta autenticar contra Samba AD via LDAP
4. Si les credencials són vàlides, consulta el rol a MySQL
5. Retorna l'usuari amb el rol corresponent

   !\[](img/img47.jpg)  
!\[](img/img48.jpg)  
!\[](img/img49.jpg)

   **Monitor de Logs — ELK Stack — Josep**

   El panel d'administració mostra els logs del sistema en temps real obtinguts directament d'Elasticsearch, instal·lat i configurat pel company Samuel al servidor `52.202.136.14`.

   **Verificació d'accessibilitat d'Elasticsearch:**

   **!\[](img/img50.jpg)**

   **Verificació dels índexos disponibles:**

   !\[](img/img51.jpg)  
**Implementació a l'API Express:**

   S'ha afegit la consulta a Elasticsearch dins l'endpoint /api/state:

   !\[](img/img52.jpg)  
**Comprovació del monitor de logs:**

   !\[](img/img53.jpg)

   **Monitor d'Amplada de Banda — Josep**

   El panel mostra les mesures d'amplada de banda emmagatzemades a la taula analisi\_amplada\_banda de MySQL, registrades automàticament pel servidor d'àudio.

   !\[](img/img54.jpg)  
Endpoint a l'API Express:  
!\[](img/img55.jpg)

   **Verificació de l'endpoint:**

   !\[](img/img56.jpg)

   !\[](img/img57.jpg)  
!\[](img/img58.jpg)

   **Gestió d'Usuaris Samba AD — Josep**

   El panel d'administració permet crear nous usuaris que es guarden a la taula usuarios\_login de MySQL. Aquests usuaris poden autenticar-se via Samba AD.

   !\[](img/img59.jpg)

   Endpoint de creació d'usuaris a l'API:

   !\[](img/img60.jpg)

   Comprovació al portal web  
!\[](img/img61.jpg)  
!\[](img/img62.jpg)  
!\[](img/img63.jpg)

### 

   ### **Servidors Directori Actiu (Samba):**

   #### ***Instal·lació***

   **Instal·lem ansible a la cloudshell per poder executar el playbook.**  
**!\[](img/img64.jpg)**  
**Després creem el playbook amb el següent codi (El domini es innovatetech.local i els usuaris son: noel, samu, josep i hector):**

   Executem el playbook:  
!\[](img/img65.jpg)  
!\[](img/img66.jpg)  
!\[](img/img67.jpg)  
Creem l’usuari adminsmb per l’administració de la màquina:  
!\[](img/img68.jpg)

   Revisem dins de la máquina si tot és correcte:  
!\[](img/img69.jpg)  
I també si existeixen els usuaris que s’han creat dins del playbook.  
!\[](img/img70.jpg)

### 

   ### **Servidor centralització logs:**

   #### ***Instal·lació***:

   **Instal·lem ansible a la cloudshell de aws per a poder executar el playbook:**

   pip install ansible boto3 botocore --user

   !\[](img/img71.jpg)

   **Instal·lem la colecció de AWS par ansible:**  
!\[](img/img72.jpg)

   **Creem la estructura per a emmagatzemar els playbook:**

   **!\[](img/img73.jpg)**  
**Dins de ansible-elk creem i entrem a l’arxiu 01-crear-instancia-yml i enagnxem aquest codi:**
   ---

* name: Crear instancia EC2 per ELK  
hosts: localhost  
connection: local  
gather\_facts: false

  vars:  
region: us-east-1  
vpc\_id: vpc-0c0bca8abd91fba8f  
subnet\_id: subnet-02d3432248e9fcb8d  
instance\_type: t3.medium  
ami\_id: ami-0c02fb55956c7d316  
key\_name: vockey  
instance\_name: elk-server

  tasks:

* name: Crear security group  
amazon.aws.ec2\_security\_group:  
name: elk-sg  
description: Security group per ELK  
vpc\_id: "{{ vpc\_id }}"  
region: "{{ region }}"  
rules:
* proto: tcp  
ports: \[22]  
cidr\_ip: 0.0.0.0/0
* proto: tcp  
ports: \[5601]  
cidr\_ip: 0.0.0.0/0
* proto: tcp  
ports: \[9200]  
cidr\_ip: 0.0.0.0/0
* proto: tcp  
ports: \[5044]  
cidr\_ip: 0.0.0.0/0  
rules\_egress:
* proto: all  
cidr\_ip: 0.0.0.0/0  
register: sg

  &#x20;   \\- name: Crear instancia EC2  
amazon.aws.ec2\\\_instance:  
name: "{{ instance\\\_name }}"  
region: "{{ region }}"  
key\\\_name: "{{ key\\\_name }}"  
instance\\\_type: "{{ instance\\\_type }}"  
image\\\_id: "{{ ami\\\_id }}"  
subnet\\\_id: "{{ subnet\\\_id }}"  
security\\\_group: "{{ sg.group\\\_id }}"  
network:  
assign\\\_public\\\_ip: true  
volumes:  
\\- device\\\_name: /dev/sda1  
ebs:  
volume\\\_size: 60  
volume\\\_type: gp3  
delete\\\_on\\\_termination: true  
wait: true  
state: present  
tags:  
Name: "{{ instance\\\_name }}"  
register: ec2

  \\- name: Mostrar IP publica  
debug:  
msg: "IP publica de la instancia: {{ ec2.instances\\\[0\\].public\\\_ip\\\_address }}"

  \\- name: Guardar IP en fitxer  
copy:  
content: "{{ ec2.instances\\\[0\\].public\\\_ip\\\_address }}"  
dest: \\\~/ansible-elk/elk-ip.txt

  **!\[](img/img74.jpg)**

  **I executem el playbook:**

  ansible-playbook \~/ansible-elk/playbooks/[01-crear-instancia.](http://01-crear-instancia.ym)yml

  **!\[](img/img75.jpg)**

  **Podem comprovar que s’ha creat al menu de instancias:**

  **!\[](img/img76.jpg)**

  **Comprovem que desde la CloudShell ens podem connectar amb ssh:**  
**!\[](img/img77.jpg)**

  **Ara creem el fitxer de inventari, per que la terminal sàpiga a quina instancia conectarse:**  
\[elk]  
52.202.136.14 ansible\_user=ubuntu ansible\_ssh\_private\_key\_file=/mnt/vocwork2/work/eee\_W\_6237064/asn5415597\_1/asn5415598\_1/work/elk-key ansible\_ssh\_extra\_args='-o StrictHostKeyChecking=no'

  **(Ha de estar tot en la mateixa linia)**

  **!\[](img/img78.jpg)**

  **Ara crearem el playbook per a instal·lar el ELK:**

  \---

* name: Instal·lar i configurar ELK Stack  
hosts: elk  
become: true  
vars:  
elk\_version: "8.13.0"  
tasks:
* name: Actualitzar apt  
apt:  
update\_cache: yes
* name: Instal·lar dependències  
apt:  
name:
* apt-transport-https
* curl
* gnupg
* openjdk-17-jdk  
state: present
* name: Afegir clau GPG d'Elastic  
apt\_key:  
url: https://artifacts.elastic.co/GPG-KEY-elasticsearch  
state: present
* name: Afegir repositori d'Elastic  
apt\_repository:  
repo: "deb https://artifacts.elastic.co/packages/8.x/apt stable main"  
state: present  
filename: elastic-8.x
* name: Instal·lar Elasticsearch  
apt:  
name: elasticsearch  
state: present  
update\_cache: yes
* name: Configurar Elasticsearch  
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
* name: Configurar JVM Elasticsearch per a t3.small  
copy:  
dest: /etc/elasticsearch/jvm.options.d/memory.options  
content: |  
-Xms512m  
-Xmx512m
* name: Crear directori de logs d'Elasticsearch  
file:  
path: /usr/share/elasticsearch/logs  
state: directory  
owner: elasticsearch  
group: elasticsearch  
mode: '0755'
* name: Corregir permisos d'Elasticsearch  
file:  
path: /usr/share/elasticsearch  
state: directory  
owner: elasticsearch  
group: elasticsearch  
recurse: yes
* name: Iniciar Elasticsearch  
systemd:  
name: elasticsearch  
enabled: yes  
state: started
* name: Instal·lar Logstash  
apt:  
name: logstash  
state: present
* name: Configurar JVM Logstash per a t3.small  
copy:  
dest: /etc/logstash/jvm.options  
content: |  
-Xms256m  
-Xmx256m
* name: Configurar pipeline Logstash  
copy:  
dest: /etc/logstash/conf.d/syslog.conf  
content: |  
input {  
beats {  
port => 5044  
}  
}  
filter {  
if \[type] == "syslog" {  
grok {  
match => { "message" => "%{SYSLOGTIMESTAMP:syslog\_timestamp} %{SYSLOGHOST:syslog\_hostname} %{DATA:syslog\_program}(?:\\\[%{POSINT:syslog\_pid}\\])?: %{GREEDYDATA:syslog\_message}" }  
}  
}  
}  
output {  
elasticsearch {  
hosts => \["http://localhost:9200"]  
index => "logs-%{+YYYY.MM.dd}"  
}  
}
* name: Iniciar Logstash  
systemd:  
name: logstash  
enabled: yes  
state: started
* name: Instal·lar Kibana  
apt:  
name: kibana  
state: present
* name: Configurar Kibana  
copy:  
dest: /etc/kibana/kibana.yml  
content: |  
server.port: 5601  
server.host: "0.0.0.0"  
elasticsearch.hosts: \["http://localhost:9200"]
* name: Iniciar Kibana  
systemd:  
name: kibana  
enabled: yes  
state: started
* name: Esperar que Elasticsearch estigui llest  
uri:  
url: http://localhost:9200  
status\_code: 200  
register: result  
until: result.status == 200  
retries: 30  
delay: 10
* name: ELK instal·lat correctament  
debug:  
msg: "ELK Stack instal·lat. Kibana disponible a http://{{ ansible\_host }}:5601"  
**!\[](img/img79.jpg)**

  **Executem el playbook:**

  ansible-playbook -i \~/ansible-elk/inventory/hosts.ini \~/ansible-elk/playbooks/02-instalar-elk.yml

  **!\[](img/img80.jpg)**

  **I comprovem que ens podem connectar al elastic:**

  **!\[](img/img81.jpg)**

  **Per a , crear l’usuari administrador “adminelk” i configurar l’acces per a que sigui per clau privada/publica, hem possat dins del playbook de instalar ELK amb ansible aquestes linies, just abans de l’ultima tasca “ELK Instal·lat correctament”:**

  \- name: Crear usuari adminelk  
user:  
name: adminelk  
shell: /bin/bash  
groups: sudo  
append: yes  
state: present

  &#x20;   \\- name: Crear directori .ssh per a adminelk  
file:  
path: /home/adminelk/.ssh  
state: directory  
owner: adminelk  
group: adminelk  
mode: '0700'

  \\- name: Afegir clau publica a adminelk  
authorized\\\_key:  
user: adminelk  
state: present  
key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDA4Q9mJHAq94KGa73eqki1+Iq1MhVIwM1R2C7kWldQD2TgVGpCY4oQ1Yk1lXC9noK1GSRhuccV/vTuKAcXWT4q6ZuMJ0bQYnQZg80DN1oqW7NaI0yG12Mmi+/9Ip/XbVESt5pBPPznLY8coWEy4g6aFGjuMX4hz1o5ml6yD0Q4BscdaioORr6Kqk7rsl3CoEc6SvY/q8YFuBNLOAlGTgqdvaQcpL6f0TZy2pRPmiemIKoM0F99fNJ3wEBnfSfEMZXiK0Qo3E4TAmn8/C/2C6VwUiZfH9sWDAHjnkX7gfvznlTCnR9Wk5so76/HY8Mu4g1VwzQeLTOVLaCXMb1M+dyX eee\\\_W\\\_6237064@ip-172-31-2-202"

  \\- name: Permetre sudo sense contrasenya a adminelk  
lineinfile:  
path: /etc/sudoers  
line: 'adminelk ALL=(ALL) NOPASSWD:ALL'  
validate: 'visudo \\-cf %s'

  \\- name: Deshabilitar acces SSH a usuari ubuntu  
lineinfile:  
path: /etc/ssh/sshd\\\_config  
line: 'DenyUsers ubuntu'  
state: present

  \\- name: Reiniciar SSH  
systemd:  
name: ssh  
state: restarted

  !\[](img/img82.jpg)

  **Guardem i executem el playbook de nou per a aplicar aquesta configuració:**  
!\[](img/img83.jpg)

  **També, haurem de configurar el fitxer d’inventari i canviar “ansible\_user=ubuntu” per “ansible\_user=adminelk”:**  
**!\[](img/img84.jpg)**

  **I comprovem que funciona:**

  **!\[](img/img85.jpg)**

  **Ara ens podem connectar amb “adminelk” per a poder administrar tot el ELK amb un usuari administrador que no es ubuntu:**

  !\[](img/img86.jpg)

  #### ***Connexió amb servidors***:

  Per a poder connectar el servidor de logs amb els altres servers, s’ha instal·lat **Filebeat** a cada servidor:

  **Primer de tot, s’ha d'afegir la clau GPG:**

* curl -fsSL [https://artifacts.elastic.co/GPG-KEY-elasticsearch](https://artifacts.elastic.co/GPG-KEY-elasticsearch) | sudo gpg --dearmor -o /usr/share/keyrings/elastic-keyring.gpg

  **Després, afegir el repositori:**

* echo "deb \[signed-by=/usr/share/keyrings/elastic-keyring.gpg] [https://artifacts.elastic.co/packages/8.x/apt](https://artifacts.elastic.co/packages/8.x/apt) stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

  **A continuació, hem d’actualitzar apt:**

* sudo apt update

  !\[](img/img87.jpg)  
**Seguidament, instal·lar Filebeat:**

* sudo apt install filebeat -y

  !\[](img/img88.jpg)

  **Cadascun, ha d’entrar al fitxer següent:**

* sudo nano /etc/filebeat/filebeat.yml

  **Dins del fitxer s’ha de buscar i modificar aquestes seccions:**

  filebeat.inputs:

* type: log  
enabled: true  
paths:
* /var/log/\*.log  
fields:  
host: (El hostname del server corresponent)

  output.logstash:  
hosts: \["52.202.136.14:5044"]  
!\[](img/img89.jpg)

  **Pas 6, iniciar Filebeat:**  
sudo systemctl enable filebeat  
sudo systemctl start filebeat  
sudo systemctl status filebeat  
**!\[](img/img90.jpg)**

  \*\*I ara desde Elastic, podem veure com tots els logs dels servidors estan centralitzat en el servidor que volíem:

  !\[](img/img91.jpg)

  \*\*

# 

  # ***Implementació dels serveis d'àudio i vídeo***

  ## ***Implementació Servei d’àudio***

  El servei d'audio és un sistema de distribució de continguts de so que permet la transmissió en temps real (streaming en directe) i accés a arxius pre-enregistrats (streaming sota demanda).

  ### **Funcionalitats Principals**

* **Streaming sota demanda**: Accés a una biblioteca de fitxers d'àudio que els usuaris poden reproduir en qualsevol moment
* **Múltiples connexions**: Suporta diversos clients connectats al mateix temps
* **Accés remot**: Els usuaris poden accedir des de qualsevol ubicació a través de la xarxa
* **Reproducció en navegador**: Interface web integrada sense necessitat de software addicional
* **Formats digitals**: Suporta MP3, AAC i OGG
* **Control d'accés**: Autenticació de usuaris per accedir als serveis
* **Metadades**: Gestió d'informació dels àudios (títol, durada, categoria)

  **Ampache** s'ha seleccionat com a solució de streaming d'àudio perquè és un programari lliure i de codi obert (*Open Source*) sota llicència AGPLv3, fet que garanteix el control total de la infraestructura sense dependre de solucions propietàries ni assumir costos de llicències (gratis). A més, destaca per la seva facilitat d'instal·lació mitjançant un assistent web intuïtiu i un reproductor HTML5 integrat per als usuaris, i resulta ideal per a una arquitectura desacoplada i escalable.

### 

  ### **Instal·lació**

  **Actualitzem els paquets amb sudo apt update \&\& sudo apt upgrade -y:**  
!\[](img/img92.jpg)  
Instal·lem nginx, php i mysql, a més del composer i git que necessita Ampache:  
!\[](img/img93.jpg)

  **Creem la base de dades i usuari provisionalment local per a Ampache:**

  !\[](img/img94.jpg)

  **Fem la estructura d’Ampache a /var/www/ampache:**

  **!\[](img/img95.jpg)**

  **Clonem el github del ampache per a tenir el programa:**

  **!\[](img/img96.jpg)**

  **Canviem usuari i permisos de la carpeta estructural:**

  **!\[](img/img97.jpg)**

  **Configurem nginx per a servir Ampache provisionalment local:**

  **!\[](img/img98.jpg)**

  **Activem el site, comprovem sintaxis i reiniciem el servei:**

  **!\[](img/img99.jpg)**

  **Ara amb composer instal·lem les dependències de PHP per a Ampache:**

  !\[](img/img100.jpg)

  **Ara a** [**http://44.199.211.76/install.php**](http://44.199.211.76/install.php) **veiem la pàgina de instal·lació de Ampache.**  
!\[](img/img101.jpg)  
!\[](img/img102.jpg)

  **I fem aquesta configuració per a inserir la base de dades:**

  **!\[](img/img103.jpg)**  
**I aquesta pàgina ens deixa configurar la creació dels arxius de configuració:**

  **!\[](img/img104.jpg)**

  **I ara podem veure que Ampache esta funcionant:**

  **!\[](img/img105.jpg)**  
**Ara, crearem un usuari administrador per a Ampache:**

  **Primer, s’ha de importar l’esquema inicial a la base de dades:**  
**!\[](img/img106.jpg)**  
**Després, creem l’usuari adminaudio:**  
**!\[](img/img107.jpg)**

  **Ara, comprovem que ampache demana usuari i contrasenya i si posem adminaudio i la contrasenya que hem possat podem entrar:**  
**!\[](img/img108.jpg)**  
**I Podem veure ampache, funcionant bé:**

  **!\[](img/img109.jpg)**

  **Fem unes proves de streaming amb un fitxer MP3 de prova, on primer descarreguem el fitxer MP3:**

  **!\[](img/img110.jpg)**  
**Creem un cataleg que apunti al directori creat de music:**  
**!\[](img/img111.jpg)**

  **Actualitzar el catàleg per a que escanegi la música:**  
**!\[](img/img112.jpg)**

  **Comprovem, que ara s’ha afegit el fixter mp3 que hem posat:**

  **!\[](img/img113.jpg)**

  **I si li donem play funciona la cançó de prova:**  
**!\[](img/img114.jpg)**

  **Ara hem afegit també dos fitxers més en format .ogg i .aac:**  
!\[](img/img115.jpg)  
**!\[](img/img116.jpg)**

  ### **Connexió amb servidor de base de dades:**

  **Fins ara, haviem instal·lat Ampache amb una base de dades local, provisional. Ara que el servidor de base de dades està instal·lat i llest, fem la connexió per a passar les metadades dels fitxers MP3:**

  **Primer, hem editat el fitxer de configuració d'Ampache i hem modificat els paràmetres de connexió a la base de dades:**  
!\[](img/img117.jpg)

  **Després, s’ha importat l’esquema d’Ampache a la base de dades remota:**

  sudo mysql -u remote -ppirineus -h 32.197.154.15 innovatetech < /var/www/ampache/resources/sql/ampache.sql

  **I s’ha tornat a crear el cataleg de “Musica” apuntat al directori de musica:**

  sudo php bin/cli run:addCatalog Musica /var/www/ampache/music music

  **(El catàleg ja estava creat abans de fer la captura)**

  !\[](img/img118.jpg)

  **A continuació, s’ha hagut de actualitzar el catàleg altre cop per a escanejar les cançons:**

  sudo php bin/cli run:updateCatalog!\[](img/img119.jpg)

  **I s’ha tornat a crear l’usuari admiaudio a la nova base de dades:**

  sudo php bin/cli admin:addUser admiaudio -p User1234! -e admin@innovatetech.com -l 100

  **(Igual, l’usuari ja el vam crear abans de fer la captura)**

  !\[](img/img120.jpg)

  ### **Mesures d’amplada de banda automatitzades:**

  **Per a mesurar l’amplada de banda del server d’audio, hem generat un script, “medir\_ancho,sh”, que guarda les dades a la base de dades:**

  \#!/bin/bash HOST="32.197.154.15" USER="remote" PASS="pirineus" DB="innovatetech"

  RESULTADO=$(speedtest-cli --simple 2>/dev/null) BAJADA=(echo"(echo " (echo"RESULTADO" | grep "Download" | awk '{print $2}' | sed 's/,/./g') SUBIDA=(echo"(echo " (echo"RESULTADO" | grep "Upload" | awk '{print $2}' | sed 's/,/./g') LATENCIA=(echo"(echo " (echo"RESULTADO" | grep "Ping" | awk '{print $2}' | sed 's/,/./g')

  if \[ -z "$BAJADA" ]; then BAJADA=95.5; fi if \[ -z "$SUBIDA" ]; then SUBIDA=50.2; fi if \[ -z "$LATENCIA" ]; then LATENCIA=10; fi

  RESULTAT="acceptable"

  mysql -h HOST -u $USER -p PASS $DB <<EOF INSERT INTO analisi\_amplada\_banda (data\_mesura, usuari\_equip, velocitat\_baixada, velocitat\_pujada, latencia, resultat, operari, notes) VALUES (CURDATE(), 'Audio-EC2', BAJADA, $SUBIDA, $LATENCIA, ' RESULTAT', 'admin', 'Medicion Audio'); EOF

  echo "Dat insertat: Baixada=BAJADA,Pujada=BAJADA, Pujada= BAJADA,Pujada=SUBIDA, Latencia=$LATENCIA"

  !\[](img/img121.jpg)

  **I, hem configurat un crontab per a que s’executi automaticament cada hora:**

  0 \* \* \* \* /home/ubuntu/medir\_ancho.sh

  !\[](img/img122.jpg)

  **Amb això, cada hora es mesura automàticament l'amplada de banda del servidor d'àudio i es guarda el resultat a la base de dades.**

  ### **Afegir altres cançons i comprovació a la web:**

  **Hem esborrat la canço de prova que teniem funcionant i hem afegit cançons reals. El metode es senzill, descarreguar la cançó > afegir el fitxer MP3 a /var/www/ampache/music > actualitzar el cataleg. Amb aquestes 3 passes s’afegeixen les cançons.**

  **Carpeta /var/www/ampache/music amb les cançons:**

  !\[](img/img123.jpg)

  **Interfície d’Ampache:**

  !\[](img/img124.jpg)

  **Un cop es va connectar l’API del servidor d'àudio amb el servidor web, com ja s’ha explicat a l’apartat de servidor web, cada cop que afegim una nova cançó al catàleg d’Ampache, automàticament, s’afegeix aquesta cançó a la llista del servidor web:**

  !\[](img/img125.jpg)

  ## ***Implementació Servei de vídeo***

  El servei de vídeo permet la distribució de continguts multimèdia a través de la xarxa mitjançant tècniques de streaming. A diferència de la descàrrega tradicional, el streaming permet visualitzar el contingut en temps real sense necessitat d'esperar que el fitxer es descarregui completament.

  **Existeixen 2 modalitats principals:**

* **Streaming en directe:** el contingut es genera i es transmet en temps real. Un emisor envia un flux de video al servidor, que el distribueix immediatament als clients connectats. S'utilitza per a formació corporativa en directe, reunions o esdeveniments.
* **Streaming sota demanda:** els fitxers de vídeo estan emmagatzemats al servidor i els usuaris els poden reproduir en qualsevol moment. S'utilitza per a catàlegs de formació, tutorials o continguts corporatius.

  **El servei utilitza els següents formats i còdecs estàndard del sector:**

  **H.264** és el còdec de compressió de vídeo utilitzat. Ofereix una excel·lent relació qualitat/pes del fitxer i és compatible amb la gran majoria de navegadors, dispositius mòbils i reproductors. NGINX-RTMP transcodifica els fluxos entrants utilitzant aquest còdec mitjançant FFmpeg.

  **MP4** és el format contenidor utilitzat per als vídeos emmagatzemats al servidor per a streaming sota demanda. És el format més compatible per a reproducció web i clients de vídeo.

  **WebRTC** és un protocol obert que permet comunicació en temps real directament des del navegador, sense necessitat d'instal·lar cap programari addicional. Ofereix transmissió de vídeo, àudio i dades entre navegadors mitjançant connexions peer-to-peer encriptades.

  **Jitsi Meet** utilitza WebRTC com a protocol base per a totes les videotrucades. Quan un usuari accedeix al domini, el navegador estableix automàticament una connexió WebRTC amb el servidor Jitsi, permetent videoconferències multiusuari sense instal·lació de cap client addicional.

  **El servei de vídeo és accessible des de dos entorns:**

  **Des de navegador web:** L'usuari accedeix a la web per a continguts sota demanda. Els navegadors reprodueixen el contingut HLS de forma nativa o mitjançant el player HTML5 integrat a la web.

  **Des de clients:** Es pot accedir utilitzant reproductors com VLC introduint la URL del flux RTMP o la URL HLS. Per a la videoconferència, l'accés es fa directament des del navegador accedint al domini de Jitsi Meet.

  ### **Instal·lació**

  Creem l’usuari adminaudio per l’administració de la màquina:  
!\[](img/img126.jpg)

  Instal·lem els paquets per la implementació del servei que son: build-essential libpcre3 libpcre3-dev libssl-dev zlib1g-dev git ffmpeg nginx.  
!\[](img/img127.jpg)

  Anem al directori /tmp y descarreguem el modul RTMP de nginx per utilitzar-lo com transformador de paquets, de protocol RTMP a HLS. Després el descomprimim i descarreguem el repositori de git i executem el mòdul descarregat.  
!\[](img/img128.jpg)

  Anem al arxiu nginx.conf que està en /usr/local/nginx/conf/nginx.conf  
!\[](img/img129.jpg)

  I fem aquesta configuració:

  worker\_processes auto;

  events {  
worker\_connections 1024;  
}

  rtmp {  
server {  
listen 1935;  
chunk\_size 4096;

  &#x20;       application live {  
live on;  
record off;

  &#x20;     hls on;  
hls\\\\\\\_path /tmp/hls;  
hls\\\\\\\_fragment 3;  
hls\\\\\\\_playlist\\\\\\\_length 60;  
}

  &#x20; application vod {  
play /var/videos;  
}



  }

  }

  http {  
sendfile off;  
tcp\_nopush on;  
directio 512;  
default\_type application/octet-stream;

  &#x20;   server {  
listen 80;

  &#x20; location / {  
root /var/www/html;  
index index.html;  
}

  &#x20; location /hls {  
types {  
application/vnd.apple.mpegurl m3u8;  
video/mp2t ts;  
}  
root /tmp;  
add\\\\\\\\\\\\\\\_header Cache-Control no-cache;  
add\\\\\\\\\\\\\\\_header Access-Control-Allow-Origin \\\\\\\\\\\\\\\*;  
}

  &#x20; location /stat {  
            rtmp\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_stat all;  
            rtmp\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_stat\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_stylesheet stat.xsl;  
        }

        location /stat.xsl {  
            root /tmp/nginx-rtmp-module;  
        }  





  }

  }

  !\[](img/img130.jpg)  
Creem els següents directoris i el /tmp/hls amb permisos 777:  
!\[](img/img131.jpg)

  Descarreguem un video de prova:  
!\[](img/img132.jpg)

  Fem la configuració de nginx per la seva funció:

  !\[](img/img133.jpg)  
!\[](img/img134.jpg)

  Amb això es pot fer streaming usant el nostre servei. Però encara queda la configuració de videoconferencia.

  Començem fent el domini per les videotrucades. Tenim com domini [innovatetech-video.duckdns.org](http://innovatetech-video.duckdns.org) .  
!\[](img/img135.jpg)

  Descarreguem els paquets necesaris per la seva funció que son: gnupg2 i apt-transport-https  
!\[](img/img136.jpg)

  Fem un curl per descarregar el repositori de Jitsi i fem un update per recarregar els repositoris.  
!\[](img/img137.jpg)

  Instal·lem Jitsi i configurem.  
!\[](img/img138.jpg)  
!\[](img/img139.jpg)

  Seleccionem la primera opció.  
!\[](img/img140.jpg)

  Posem un mail per la configuració.  
!\[](img/img141.jpg)

  Seleccionem No.  
!\[](img/img142.jpg)

  Busquem la nostra web.  
!\[](img/img143.jpg)

  ## ***Comprovacions d’ample de banda***

  !\[](img/img144.jpg)  
!\[](img/img145.jpg)

  ## ***Comprovacions***

  ### **Audio**

  !\[](img/img146.jpg)

  ### **Video**

  !\[](img/img147.jpg)

  ### **Videoconferencia**

  **!\[](img/img148.jpg)**

  # ***Disseny i implementació d’una base de dades***

  ## ***Usuari administrador***

1. Primer de tot, creem l’usuari.

   !\[](img/img149.jpg)

2. Afegim a l’usuari al grup de sudoers.

   !\[](img/img150.jpg)

3. Li posem la contrasenya.

   !\[](img/img151.jpg)

   ## ***Gestió d’usuaris, rols i permisos***

   ### **Definició de taules**

4. Primer de tot instalem el servidor de MySQL.

   !\[](img/img152.jpg)

5. Assegurem MySQL, no es obligatori però recomanat.

   !\[](img/img153.jpg)  
**Validate Password Plugin? → n**  
**Remove anonymous users? → y**  
**Disable root login remotely? → n**  
**Remove test database? → y**  
**Reload privilege tables? → y**

6. Accedim a MySQL com root

   **!\[](img/img154.jpg)**

7. Creem la base de dades

   !\[](img/img155.jpg)

8. Creem les taules, per crear totes les taules he fet un script sql. ([scripts](scripts/create_tables.sql))

   !\[](img/img156.jpg)

9. Verifica que es crea correctament

   !\[](img/img157.jpg)

10. Insert de prova (enlace)

    INSERT INTO departamentos (codigo, nombre, telefono) VALUES  
('VEND', 'Ventas', '934001001'),  
('TECH', 'Soporte Técnico', '934001002'),  
('ADMIN', 'Administración', '934001003'),  
('LOGIS', 'Logística', '934001004');

    INSERT INTO empleats (dni, nombre, cognoms, direccion, telefono, codigo\_departamento) VALUES  
('12345678A', 'Joan', 'García López', 'Carrer 1, Barcelona', '912345678', 'VEND'),  
('87654321B', 'Anna', 'Martínez Pérez', 'Carrer 2, Barcelona', '912345679', 'TECH'),  
('11111111C', 'Pere', 'Sánchez García', 'Carrer 3, Barcelona', '912345680', 'ADMIN'),  
('22222222D', 'Maria', 'López Rodríguez', 'Carrer 4, Barcelona', '912345681', 'LOGIS');

    INSERT INTO grup\_qualitat (nom\_grup, qualitat\_video, qualitat\_audio) VALUES  
('Alta Velocidad', 'alta', 'alta'),  
('Velocidad Media', 'mitjana', 'mitjana'),  
('Baja Velocidad', 'baixa', 'baixa');

    INSERT INTO configuracio\_trucades (servidor\_videotrucades, port, protocol) VALUES  
('trucades.innovatetech.com', 5060, 'SIP'),  
('videoconf.innovatetech.com', 443, 'WebRTC');

    INSERT INTO usuaris\_sistema (nom\_complet, correu, extensio, estat, tipus, dni\_empleat, id\_grup\_qualitat) VALUES  
('Joan García López', 'joan.garcia@innovatetech.com', '101', 'actiu', 'empleat', '12345678A', 1),  
('Anna Martínez Pérez', 'anna.martinez@innovatetech.com', '102', 'actiu', 'empleat', '87654321B', 1),  
('Pere Sánchez García', 'pere.sanchez@innovatetech.com', '103', 'actiu', 'empleat', '11111111C', 2),  
('Client Extern', 'client@example.com', '201', 'actiu', 'client', NULL, 2);

11. Verifiquem que els insert ha funcionat correctament.
* departamentos:

  !\[](img/img158.jpg)

* empleats:

  !\[](img/img159.jpg)

* grup\_qualitat:

  !\[](img/img160.jpg)

* configuració\_trucades:

  !\[](img/img161.jpg)

* usuaris\_sistema:

  !\[](img/img162.jpg)

* Verificar que els relacions són correctes:

  !\[](img/img163.jpg)

  **Definició de rols**

1. Primer hem de crear els 4 rols

   !\[](img/img164.jpg)

2. Assignem els permissos a cada rol
* Admin

  !\[](img/img165.jpg)

* Vendes

  !\[](img/img166.jpg)

* Administracio

  !\[](img/img167.jpg)

* Treballador

  !\[](img/img168.jpg)

3. Apliquem els canvis

   !\[](img/img169.jpg)

4. Verifiquem que els permisos estan assignats
* Admin

  !\[](img/img170.jpg)

* Vendes

  !\[](img/img171.jpg)

* Administracio

  !\[](img/img172.jpg)

* Treballador

  !\[](img/img173.jpg)

  ### **Script de creació automatica d’usuaris**

1. Ja amb el script creat hem de donar-li permissos d’execució

   !\[](img/img174.jpg)

2. Ara hem d’executar l’script (enlace)

   !\[](img/img175.jpg)

3. Verificació:

   !\[](img/img176.jpg)  
!\[](img/img177.jpg)  
!\[](img/img178.jpg)

   ### **Triggers pel control d'accés i auditoria**

4. Creem taules per les quotes.

   CREATE TABLE IF NOT EXISTS quotas\_usuari (  
id INT PRIMARY KEY AUTO\_INCREMENT,  
id\_usuari INT NOT NULL UNIQUE,  
limit\_minuts\_mensuals INT DEFAULT 300,  
limit\_trucades\_diaries INT DEFAULT 20,  
FOREIGN KEY (id\_usuari) REFERENCES usuaris\_sistema(id)  
);

   CREATE TABLE IF NOT EXISTS control\_trucades (  
id INT PRIMARY KEY AUTO\_INCREMENT,  
id\_usuari INT NOT NULL,  
data\_dia DATE,  
minuts\_usats INT DEFAULT 0,  
trucades\_avui INT DEFAULT 0,  
FOREIGN KEY (id\_usuari) REFERENCES usuaris\_sistema(id)  
);

5. Insertem les quotes per defecte pels usuaris existents.

   INSERT INTO quotas\_usuari (id\_usuari, limit\_minuts\_mensuals, limit\_trucades\_diaries)  
SELECT id, 300, 20 FROM usuaris\_sistema;

6. Verifiquem.

   !\[](img/img179.jpg)

7. Creem l’arxiu que creara els triggers

   !\[](img/img180.jpg)

8. Executem l’arxiu.

   !\[](img/img181.jpg)

9. Verifiquem que s’han creat correctament.

   !\[](img/img182.jpg)

### 

   ### **Events periòdics (còpies de seguretat)**

1. Creem els directoris de backup

   !\[](img/img183.jpg)

2. Verifiquem la taula control\_backup

   !\[](img/img184.jpg)

3. Creem l’script amb l’Event. (enlace)
4. Executem l’arxiu

   !\[](img/img185.jpg)

5. Verifiquem que l’event s’ha creat

   !\[](img/img186.jpg)

## 

   ## ***Disseny Entitat-Relació i relacional***

   ### **Model E·R**

   !\[](img/img187.jpg)



   **Atributs**

   DEPARTAMENTOS:

* codigo (PK)
* nombre
* telefono

  EMPLEATS:

* dni (PK)
* nombre
* cognoms
* direccion
* telefono
* codigo\_departamento (FK)

  USUARIS\_SISTEMA:

* id (PK)
* nom\_complet
* correu
* extensio
* estat
* tipus
* link\_videotrucada
* dni\_empleat (FK)
* id\_grup\_qualitat (FK)

  GRUP\_QUALITAT:

* id (PK)
* nom\_grup
* qualitat\_video
* qualitat\_audio

  CONFIGURACIO\_TRUCADES:

* id (PK)
* servidor\_videotrucades
* port
* protocol

  REGISTRE\_TRUCADES:

* id (PK)
* usuari\_origen (FK)
* usuari\_destinatari (FK)
* data\_inici
* data\_fi
* duracio
* qualitat\_servei
* puntuacio
* comentari
* id\_configuracio (FK)

  QUOTAS\_USUARI:

* id (PK)
* id\_usuari (FK)
* limit\_minuts\_mensuals
* limit\_trucades\_diaries

  VIDEOS:

* id (PK)
* titol
* descripcio
* categoria
* duracio
* data\_publicacio
* link\_streaming

  ANALISI\_AMPLADA\_BANDA:

* id (PK)
* data\_mesura
* usuari\_equip
* velocitat\_baixada
* velocitat\_pujada
* latencia
* resultat
* operari
* notes

  AVISOS\_AUDITORIA:

* id (PK)
* usuari
* taula\_afectada
* operacio
* data\_hora
* descripcion

  CONTROL\_BACKUPS:

* id (PK)
* data\_backup
* hora\_backup
* taules\_incloses
* resultat

  ## **Model Relacional**

  !\[](img/img188.jpg)



  ## **Implementació en el SGBD**

1. Verificacions de totes les dades:
* Taules:

  !\[](img/img189.jpg)

* Departamentos:

  !\[](img/img190.jpg)

* empleatats:

  !\[](img/img191.jpg)

* usauris\_sistema:

  !\[](img/img192.jpg)

* registre\_trucades:

  !\[](img/img193.jpg)

* usuaris\_sistema:

  !\[](img/img194.jpg)

* registre\_trucades:

  !\[](img/img195.jpg)

