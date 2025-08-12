#!/bin/bash

# vlan 10
set -e

PARENT_IF_10="enp0s8"
MACVLAN_IF_10="macvlan_10"
DOCKER_NET_NAME_10="pinat_macvlan_10"

echo "[+] Eliminando interfaz macvlan del host: $MACVLAN_IF_10"
ip link delete "$MACVLAN_IF_10" 2>/dev/null || echo "Interfaz $MACVLAN_IF_10 no existe"

echo "[+] Eliminando interfaz dummy del host: $PARENT_IF_10"
ip link delete "$PARENT_IF_10" 2>/dev/null || echo "Interfaz $PARENT_IF_10 no existe"

echo "[+] Eliminando red Docker: $DOCKER_NET_NAME_10"
docker network rm "$DOCKER_NET_NAME_10" 2>/dev/null || echo "Red Docker $DOCKER_NET_NAME_10 no existe"

echo "[✔] Limpieza completada."

# vlan 20
set -e

PARENT_IF_20="enp0s9"
MACVLAN_IF_20="macvlan_20"
DOCKER_NET_NAME_20="pinat_macvlan_20"

echo "[+] Eliminando interfaz macvlan del host: $MACVLAN_IF_20"
ip link delete "$MACVLAN_IF_20" 2>/dev/null || echo "Interfaz $MACVLAN_IF_20 no existe"

echo "[+] Eliminando interfaz dummy del host: $PARENT_IF_20"
ip link delete "$PARENT_IF_20" 2>/dev/null || echo "Interfaz $PARENT_IF_20 no existe"

echo "[+] Eliminando red Docker: $DOCKER_NET_NAME_20"
docker network rm "$DOCKER_NET_NAME_20" 2>/dev/null || echo "Red Docker $DOCKER_NET_NAME_20 no existe"

echo "[✔] Limpieza completada."