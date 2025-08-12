# Apagar contenedor
cd ../
cd contenedor/
docker-compose down

# Eliminar interface creada y la macvlan
cd ../
cd interface-host-anfitrion/
./delete-interface.sh

