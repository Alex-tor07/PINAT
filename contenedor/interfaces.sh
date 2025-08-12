
# Creando la red del router
# vlan 10
docker network connect --ip 10.10.0.2 pinat_macvlan_10 routcort
# vlan 20
docker network connect --ip 10.20.0.2 pinat_macvlan_20 routcort