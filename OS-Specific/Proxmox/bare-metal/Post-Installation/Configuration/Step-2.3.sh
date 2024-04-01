# This script should be ran after "Login with your created user (USERNAME) and connect to the the WIFI." Step which is as followed,
## DNS SERVERS : 1.1.1.1
## address : 10.0.0.2
## netmask : 255.255.255.0
## gateway : 10.0.0.1



# Restart Network Manager
sudo service NetworkManager restart

wifi=$(cat ~/wifi_dev)

tee << EOF >> /etc/network/interfaces
auto lo
iface lo inet loopback

iface enp3s0 inet manual

auto vmbr0
iface vmbr0 inet static
        address 10.0.0.2/24
        gateway 10.0.0.1
        bridge-ports enp3s0
        bridge-stp off
        bridge-fd 0



auto vmbr2
iface vmbr2 inet static
        address 12.0.0.1/24
        bridge-ports none
        bridge-stp off
        bridge-fd 0
        post-up echo 1 > /proc/sys/net/ipv4/ip_forward
        post-up iptables -t nat -A POSTROUTING -s '12.0.0.1/24' -o $wifi -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING -s '12.0.0.1/24' -o $wifi -j MASQUERADE



EOF
exit


#

tee << EOF > /etc/dnsmasq.conf
domain=sitar-pve.rohanbatra.in
interface=vmbr2
dhcp-range=12.0.0.2,12.0.0.254,24h
dhcp-option=vmbr2,3,12.0.0.1
server=1.1.1.1
server=8.8.8.8
dhcp-leasefile=/var/lib/misc/dnsmasq.leases
EOF
exit
