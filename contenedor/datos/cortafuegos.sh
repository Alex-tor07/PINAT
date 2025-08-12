#!/bin/bash

# Limpiar todas las reglas existentes
iptables -F
iptables -X
iptables -Z
iptables -t nat -F

# Activar el reenvío IP en el kernel
echo 1 > /proc/sys/net/ipv4/ip_forward

# Permitir reenvío desde eth1 hacia eth0
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

# Permitir reenvío desde eth2 hacia eth0
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT

# (Opcional) Permitir el tráfico de respuesta de eth0 hacia eth1 y eth2
iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth2 -m state --state ESTABLISHED,RELATED -j ACCEPT


# Cortar el trafico entre las vlan
iptables -A OUTPUT -s 10.10.0.0/24 -d 10.20.0.0/24 -j DROP
iptables -A OUTPUT -s 10.20.0.0/24 -d 10.10.0.0/24 -j DROP
iptables -A INPUT -s 10.10.0.0/24 -d 10.20.0.0/24 -j DROP
iptables -A INPUT -s 10.20.0.0/24 -d 10.10.0.0/24 -j DROP

# Habilitar NAT (mascaradeo) para que las redes internas salgan por eth0
iptables -t nat -A POSTROUTING -s 10.10.0.0/24 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.20.0.0/24 -o eth0 -j MASQUERADE
