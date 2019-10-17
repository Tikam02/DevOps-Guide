## Networking Notes:
*****************
* OSI Models 
* TCP/IP
* Routing Bridging and NAT
* Firewalls and Ports
* Basic Utils - netstat,ping,mtr,nc,ip
* DNS
* Load Balancing
* Proxies
* SSH Port forwarding
* TLS Encryption
* CIDR | Subnet Math | General Concepts of maths
* VPC's
* Firewall Concepts 
* SSL|TLS

**********************

### Networking Basics


- The moment you see an ip address, you should be able to answer 2 questions
* 1. is this is a public ip addresss or a private ip address
* 2. what class of Ip address is this.


– Every company, website has a public ip address (1 or 2 or 3 ) … max 10
– these public ip addresses are provided by ISP providers
– these have a charge attached to it.

– every company has a range of private ip addresses
– these are free to use
– configured and manatained by internal network administrator


****************
Ip address

[1-255].[0-255].[0-255].[0-255]
1.1.1.1
100.126.10.240
50.111.175.250

100.0.1.2
*******************

Classes of Ipaddress
PUBLIC RANGE PRIVATE RANGE
class A = [1.0.0.1 to 126.255.255.254][10.0.0.0 to 10.255.255.255]
Class B = [128.1.0.1 to 191.255.255.254][172.16.0.0 to 172.31.255.255]
Class c = [192.0.1.1 to 223.255.254.254][192.168.0.0 to 192.168.255.255]
Class D — not used
Class E — not used
1 – Public
2 – public
3 – public
4 – public
5 – public
6 – private
7 – public
8 – public
9 – public
10 – public
versions of Ip address
Ipv4 64bit
Ipv6 128 bit
127.0.0.1 to 127.255.255.255 = these are loop back address.
every computer will have this address names as “loopback”
this is used for testing connectivity and some application services.
169.X.X.X
– if a computer|server doesnt get a ip address from the dhcp server or router, this ip address is auto assigned by the system NIC card. this cannot be used to communicate either privately or publicly.
************

network devices
1. routers
– communicate based on Ip address
– these are called as layer 3 devices

2. switches
– layer 2 switches communicate based on MAC address
– layer 3 switches communicate based on IP address

3. hubs
– these are repeators
– not intelligent devices like routers and switches

4. Firewall
5. load balancers

Vendors
– cisco router
– Juniper
– citrix -> netscaler
– home user – netgear
Additional learns
– subnetting
– nating
– pating
– Switching protocols
– spannning tree protocol
– RSVP

– routing protocols
– RIP V1
– EIGRP
– OSPF
– RIP V2
– BGP

——————————

Assignments
1. read about basic networking concepts
2. learn 50 most commonly used linux commands, learn vim
3. learn how to install a web server in Centos | Ubuntu | windows
4. OSI layers

DevOps – Server and networking basics:

Operating system
Windows
– Desktop editions
– windows XP, 7, 8, 10, vista (home, professional, ultimate)
– server edition
– Windows 2000, 2003, 2008, 2012
(standard, Enterpise, datacenter)
(32 bit or 64 bit)

Linux | Unix (Flavors)

Desktop – Ubuntu, RHEL 7.
server
– ubuntu | Debian, (OS) | version 17, most used is 12.04 and 14.04 (LTS)
– Long term support
– RHEL (Paid) | Centos (OS)
– unix
– fedora
– suse
– mandraike
– solaris
– slackware
– gentoo

* Multi threading operating system
– multiple users can log into the same machine at same time and work
– there will be no conflict of resouces (RAM, CPU etc )

Mac
vmware
– virtualization technology
– It is a hypervisor Operating system
– ampligies the resources that are given to it and will allocate to the respective vms inside it

What is diff between a desktop and server

– desktop is single users
– server is multiple services
What are the services that a server can | will provide

– webserver
– webserver
– internal and external websites
– windows = IIS (internet information services)
– Linux = RHEL = Httpd, ubuntu = apache2
– ftp
– File transfer protocol
– huge or bulk file transfers
– DNS
– Domain Name service
– Ip address to Name and Name to ip address
– save the details in DNS server as records
– study about types of records
– AAAA
– CNAME
– MX
– WWW
– pointer

– there are global DNS server which are maintainer by internet board
– there are called as root server
– when you join a company
– your desktops are servers are pointed to Local DNS servers which are installed, configured, managed by your IT team or local administrator
– internal resouces are having a DNS record.
– other configurations in DNS server
– zones
– Primary and secondary
– master and slave
– DHCP
dynamic host control protocol
– how to assign a static ip address in windows

– Mail
windows – Exchange
linux – zimra, sendmail, postfix

– Print
– AD | LDAP
– Samba
– File Server
– Application server

***************************

### General networking concepts that will help you in troubleshooting networks on Linux.


```bash
$ watch ss -tp                               # Network connections
$ netstat -ant                               # Tcp connections -anu=udp
$ netstat -tulpn                             # Connections with PIDs
$ lsof -i                                    # Established connections
$ smb:// ip /share                           # Access windows smb share
$ share user x.x.x.x c$                      # Mount Windows share
$ smbclient -0 user\\\\ ip \\ share          # SMB connect
$ ifconfig eth# ip / cidr                    # Set IP and netmask
$ ifconfig ethO:l ip / cidr                  # Set virtual interface
$ route add default gw gw_ip                 # Set GW
$ ifconfig eth# mtu [size]                   # Change MTU size
$ export MAC=xx: xx: xx: xx: xx: xx          # Change MAC 
$ ifconfig int hw ether MAC                  # Change MAC
$ macchanger -m MAC int                      # Backtrack MAC changer
$ iwlist int scan                            # Built-in wifi scanner
$ dig -x ip                                  # Domain lookup for IP
$ host ip                                    # Domain lookup for IP
$ host -t SRV _ service _tcp.url.com         # Domain SRV lookup
$ dig @ ip domain -t AXFR                    # DNS Zone Xfer
$ host -l domain namesvr                     # DNS Zone Xfer
$ ip xfrm state list                         # Print existing VPN keys
$ ip addr add ip / cidr dev ethO             # Adds 'hidden' interface
$ /var/log/messages | grep DHCP              # List DHCP assignments
$ tcpkill host ip and port port              # Block ip:port
$ echo "1" /proc/sys/net/ipv4/ip_forward     # Turn on IP Forwarding
$ echo "nameserver x.x.x.x" /etc/resolv.conf # Add DNS Server
```