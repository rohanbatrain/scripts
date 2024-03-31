# root 

wifi=$(cat ~/wifi_dev)

tee << EOF >> /etc/network/interfaces
auto vmbr0
iface vmbr0 inet static
        address 10.0.0.1/24
        bridge-ports none
        bridge-stp off
        bridge-fd 0
        post-up echo 1 > /proc/sys/net/ipv4/ip_forward
        post-up iptables -t nat -A POSTROUTING -s '10.0.0.1/24' -o $wifi -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING -s '10.0.0.1/24' -o $wifi -j MASQUERADE
EOF
exit


#

tee << EOF > /etc/dnsmasq.conf
domain=pv.local
interface=vmbr0
dhcp-range=10.0.0.2,10.0.0.250,24h
dhcp-option=vmbr0,3,10.0.0.1
server=1.1.1.1
server=8.8.8.8
dhcp-leasefile=/var/lib/misc/dnsmasq.leases
EOF
exit