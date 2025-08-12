# Usa Debian como base
FROM debian:latest

# Actualiza el sistema y agrega algunas herramientas básicas
RUN apt-get update && \
    apt-get install -y \
        iptables \
        iproute2 \
        nano \
        iputils-ping \
        traceroute \
        net-tools \
        dnsutils \
        tcpdump \
        procps \
        systemd systemd-sysv \
        isc-dhcp-server \
        bash && \
        apt-get clean && rm -rf /var/lib/apt/lists/*

# Para el funcionamiento de dhcp
RUN mkdir -p /var/lib/dhcp && touch /var/lib/dhcp/dhcpd.leases

# Volumen para poder alamacenar datos
VOLUME /datos

# Para poder habilitar los servicios
COPY scrip.sh scrip.sh
RUN chmod o+x scrip.sh


# Arranca supervisord (que gestionará BIND9)
CMD ["tail", "-f", "/dev/null"]

