./datos/cortafuegos.sh
rm /var/lib/dhcp/dhcpd.leases
service isc-dhcp-server restart
