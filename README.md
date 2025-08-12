██████╗ ██╗███╗   ██╗ █████╗ ████████╗
██╔══██╗██║████╗  ██║██╔══██╗╚══██╔══╝
██████╔╝██║██╔██╗ ██║███████║   ██║   
██╔═══╝ ██║██║╚██╗██║██╔══██║   ██║   
██║     ██║██║ ╚████║██║  ██║   ██║   
╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝   

SISTEMA DE GESTIÓN DE VLANs CON DOCKER

📁 PINAT/
├── 📁 api/
│   ├── 📁 ejecutables/            ⚙️ Scripts de control
│   │   ├── 📜 apagar.sh           ▫️ Detener servicios
│   │   ├── 📜 editar_cortafuegos.sh ▫️ Configurar firewall
│   │   ├── 📜 editar_dhcp.sh      ▫️ Editar configuración DHCP
│   │   └── 📜 encender.sh         ▫️ Iniciar servicios
│   │
│   ├── 📁 entorno_api_router/     🐍 Entorno Python
│   │   ├── 📁 bin/
│   │   ├── 📁 include/
│   │   ├── 📁 lib/
│   │   ├── 📁 lib64/
│   │   ├── 📜 pyvenv.cfg
│   │   ├── 📜 api.py              ▫️ API principal
│   │   └── 📜 estado.txt          ▫️ Estado del sistema
│   │
│   ├── 📁 datos/                  🗃️ Configuraciones
│   │   ├── 📜 cortafuegos.sh      ▫️ Reglas de iptables
│   │   ├── 📜 dhcpd.conf          ▫️ Configuración DHCP
│   │   └── 📜 isc-dhcp-server     ▫️ Configuración servicio
│   │
│   ├── 📁 imagen/                 🐳 Configuración Docker
│   │   ├── 📜 Dockerfile          ▫️ Definición de imagen
│   │   ├── 📜 script.sh           ▫️ Script para habilitar servicios dentro del contenedor
│   │── 📜 crear_imagen.sh     ▫️ Constructor de imagen
│   │── 📜 docker-compose.yml  ▫️ Orquestación
│   │── 📜 interfaces.sh       ▫️ Configuración interfaces
│   │
│   ├── 📁 instaladores/           📦 Scripts de instalación
│   │   └── 📜 entorno_api.sh      ▫️ Instalador de entorno
│   │
│   ├── 📁 interface-host-anfttri/ 🔌 Interfaces de red
│   │   ├── 📜 create-interface.sh ▫️ Creador de interfaces
│   │   └── 📜 delete-interface.sh ▫️ Eliminador de interfaces
│   │
│   └── 📜 run_api.sh              ▶️ Punto de entrada principal
|   └── 📜 doc.pdf                 📦 Documentación

📌 REQUISITOS:
  - Docker 🐳
  - Python 3.8+ 🐍
  - Linux (Debian/Ubuntu) 🐧

🚀 INSTRUCCIONES RÁPIDAS:
1. Clonar repositorio
2. Ejecutar: chmod +x instaladores/entorno_api.sh
3. Ejecutar: ./instaladores/entorno_api.sh
4. Ejecutar: chmod +x run_api.sh
5. Iniciar: ./run_api.sh

📞 CONTACTO:
  ✉️ alex14torresano@gmail.com
  🌐 github.com/Alex-tor07/PINAT
