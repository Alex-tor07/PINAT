# Crear interface con el host, y crear la red macvlan

cd ../
cd interface-host-anfitrion/
./create-interface.sh
# Crear el conedor y sus redes
cd ../
cd contenedor/
./crear_imagen.sh
docker-compose up -d
./interfaces.sh
