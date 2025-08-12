#!/bin/bash
# vlan 10
set -e

# Parámetros
PARENT_IF_10="enp0s8"
MACVLAN_IF_10="macvlan_10"
DOCKER_NET_NAME_10="pinat_macvlan_10"
SUBNET_10="10.10.0.0/24"
GATEWAY_10="10.10.0.1"
IP_HOST_10="10.10.0.254/24"

echo "[+] Limpiando configuraciones anteriores..."

# Eliminar interfaces si ya existen
ip link delete "$PARENT_IF_10" 2>/dev/null || true
ip link delete "$MACVLAN_IF_10" 2>/dev/null || true

# Eliminar red Docker si existe
docker network rm "$DOCKER_NET_NAME_10" 2>/dev/null || true

echo "[+] Creando interfaz dummy '$PARENT_IF_10'"
ip link add "$PARENT_IF_10" type dummy
ip link set "$PARENT_IF_10" up

echo "[+] Creando red Docker macvlan '$DOCKER_NET_NAME_10'"
docker network create -d macvlan \
  --subnet=$SUBNET_10 \
  --gateway=$GATEWAY_10 \
  -o parent=$PARENT_IF_10 \
  $DOCKER_NET_NAME_10

echo "[+] Creando interfaz macvlan '$MACVLAN_IF_10' para el host"
ip link add "$MACVLAN_IF_10" link "$PARENT_IF_10" type macvlan mode bridge
ip addr add "$IP_HOST_10" dev "$MACVLAN_IF_10"
ip link set "$MACVLAN_IF_10" up

echo "[✔] Entorno macvlan creado:"
echo "    - Interfaz dummy '$PARENT_IF_10'"
echo "    - Red Docker '$DOCKER_NET_NAME_10' (subnet $SUBNET_10)"
echo "    - Interfaz host '$MACVLAN_IF_10' con IP $IP_HOST_10"


# vlan 20

# Parámetros
PARENT_IF_20="enp0s9"
MACVLAN_IF_20="macvlan_20"
DOCKER_NET_NAME_20="pinat_macvlan_20"
SUBNET_20="10.20.0.0/24"
GATEWAY_20="10.20.0.1"
IP_HOST_20="10.20.0.254/24"

echo "[+] Limpiando configuraciones anteriores..."

# Eliminar interfaces si ya existen
ip link delete "$PARENT_IF_20" 2>/dev/null || true
ip link delete "$MACVLAN_IF_20" 2>/dev/null || true

# Eliminar red Docker si existe
docker network rm "$DOCKER_NET_NAME_20" 2>/dev/null || true

echo "[+] Creando interfaz dummy '$PARENT_IF_20'"
ip link add "$PARENT_IF_20" type dummy
ip link set "$PARENT_IF_20" up

echo "[+] Creando red Docker macvlan '$DOCKER_NET_NAME_20'"
docker network create -d macvlan \
  --subnet=$SUBNET_20 \
  --gateway=$GATEWAY_20 \
  -o parent=$PARENT_IF_20 \
  $DOCKER_NET_NAME_20

echo "[+] Creando interfaz macvlan '$MACVLAN_IF_20' para el host"
ip link add "$MACVLAN_IF_20" link "$PARENT_IF_20" type macvlan mode bridge
ip addr add "$IP_HOST_20" dev "$MACVLAN_IF_20"
ip link set "$MACVLAN_IF_20" up

echo "[✔] Entorno macvlan creado:"
echo "    - Interfaz dummy '$PARENT_IF_20'"
echo "    - Red Docker '$DOCKER_NET_NAME_20' (subnet $SUBNET_20)"
echo "    - Interfaz host '$MACVLAN_IF_20' con IP $IP_HOST_20"