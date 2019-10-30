## Networking Notes:

- [OSI Models](#osi-model) 
- [Four Dod Layers](#four-dod-layers)
- [TCP/IP](#)
- Routing Bridging and NAT
- Firewalls and Ports
- Basic Utils - netstat,ping,mtr,nc,ip
- DNS
- Load Balancing
- Proxies
- SSH Port forwarding
- TLS Encryption
- CIDR | Subnet Math | General Concepts of maths
- VPC's
- Firewall Concepts 
- SSL|TLS

**********************



***********************

## OSI Model

- What is the OSI model?

    - The Open Systems Interconnection (OSI) model is a conceptual model created by the International Organization for Standardization which enables diverse communication systems to communicate using standard protocols. In plain English, the OSI provides a standard for different computer systems to be able to communicate with each other.

    - The OSI model can be seen as a universal language for computer networking. It’s based on the concept of splitting up a communication system into seven abstract layers, each one stacked upon the last.    
    -      

![OSI Model](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/osi-model-7-layers.svg)

-  7. The Application Layer

   - This is the only layer that directly interacts with data from the user. Software applications like web browsers and email clients rely on the application layer to initiate communications. But it should be made clear that client software applications are not part of the application layer; rather the application layer is responsible for the protocols and data manipulation that the software relies on to present meaningful data to the user. Application layer protocols include HTTP as well as SMTP (Simple Mail Transfer Protocol is one of the protocols that enables email communications).

![OSI Model](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/7-application-layer.svg)

- 6. The Presentation Layer

    - This layer is primarily responsible for preparing data so that it can be used by the application layer; in other words, layer 6 makes the data presentable for applications to consume. The presentation layer is responsible for translation, encryption, and compression of data.

    - Two communicating devices communicating may be using different encoding methods, so layer 6 is responsible for translating incoming data into a syntax that the application layer of the receiving device can understand.

    - If the devices are communicating over an encrypted connection, layer 6 is responsible for adding the encryption on the sender’s end as well as decoding the encryption on the receiver's end so that it can present the application layer with unencrypted, readable data.

    - Finally the presentation layer is also responsible for compressing data it receives from the application layer before delivering it to layer 5. This helps improve the speed and efficiency of communication by minimizing the amount of data that will be transferred.

![Presentation layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/6-presentation-layer.svg)

- 5. The Session Layer

    - This is the layer responsible for opening and closing communication between the two devices. The time between when the communication is opened and closed is known as the session. The session layer ensures that the session stays open long enough to transfer all the data being exchanged, and then promptly closes the session in order to avoid wasting resources.

    - The session layer also synchronizes data transfer with checkpoints. For example, if a 100 megabyte file is being transferred, the session layer could set a checkpoint every 5 megabytes. In the case of a disconnect or a crash after 52 megabytes have been transferred, the session could be resumed from the last checkpoint, meaning only 50 more megabytes of data need to be transferred. Without the checkpoints, the entire transfer would have to begin again from scratch.

![session layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/5-session-layer.svg)


- 4. The Transport Layer

    - Layer 4 is responsible for end-to-end communication between the two devices. This includes taking data from the session layer and breaking it up into chunks called segments before sending it to layer 3. The transport layer on the receiving device is responsible for reassembling the segments into data the session layer can consume.

    - The transport layer is also responsible for flow control and error control. Flow control determines an optimal speed of transmission to ensure that a sender with a fast connection doesn’t overwhelm a receiver with a slow connection. The transport layer performs error control on the receiving end by ensuring that the data received is complete, and requesting a retransmission if it isn’t.

![transport layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/4-transport-layer.svg)


- 3. The Network Layer

    - The network layer is responsible for facilitating data transfer between two different networks. If the two devices communicating are on the same network, then the network layer is unnecessary. The network layer breaks up segments from the transport layer into smaller units, called packets, on the sender’s device, and reassembling these packets on the receiving device. The network layer also finds the best physical path for the data to reach its destination; this is known as routing.

![network layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/3-network-layer.svg)


- 2. The Data Link Layer

    - The data link layer is very similar to the network layer, except the data link layer facilitates data transfer between two devices on the SAME network. The data link layer takes packets from the network layer and breaks them into smaller pieces called frames. Like the network layer, the data link layer is also responsible for flow control and error control in intra-network communication (The transport layer only does flow control and error control for inter-network communications).

![Data link layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/2-data-link-layer.svg)


- 1. The Physical Layer

    - This layer includes the physical equipment involved in the data transfer, such as the cables and switches. This is also the layer where the data gets converted into a bit stream, which is a string of 1s and 0s. The physical layer of both devices must also agree on a signal convention so that the 1s can be distinguished from the 0s on both devices.

![Physical layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/1-physical-layer.svg)


***************************
## Four DoD layers

- The DoD (or tcp/ip) model has only four layers, roughly mapping its network access layer to OSI layers 1 and 2 (Physical and Datalink), its internet (IP) layer to the OSI network layer, its host-to-host (tcp, udp) layer to OSI layer 4 (transport) and its application layer to OSI layers 5, 6 and 7.

![Physical layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/dod_layers.png)


*****************************

## TCP/IP Model

- the TCP/IP model,similar to the OSI model, has a set of layers.The OSI has seven layers and TCP/IP model has four layers.

- Ths OSI model and the TCP/Ip models were both created independently.The TCP/IP network model represents reality in the world whereas the OSI model represents an ideal.

![Physical layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/tcp_ip_0.png)

- Application Layer: 
  - Defines TCP/IP application protocols and how host programs interface with transport layer services to use the network.
 
  - Protocols : HTTP, FTP,SMTP, DNS

- Transport Layer:
  - Provides communication session management between the nodes/computers.Defines the level of service and states of the connection used when transporting data.
  
  - Protocols: TCP, UDP,RTP

- Internet Layer:
  - Packages Data into IP datagrams which contains source and destination address information that is used to forward the datagrams between host and networks.Performs routing of Ip datagrams.
  
  - Protocols: IP,ICMP,ARP,RARP

- Network Access Layer:
  - Specifies details of how data is physically sent through the network,including how bits are electronically signaled by hardware devices.
  
  - Protocols: Ethernet,Frame relays,RS-2

![Physical layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/tcp_ip_1.png)


*********************************************



*****************************
## General networking concepts that will help you in troubleshooting networks on Linux.


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
***************************


## Extra 

### Networking Basics


- The moment you see an ip address, you should be able to answer 2 questions
1. is this is a public ip addresss or a private ip address
2. what class of Ip address is this.


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


********************

## References:

- [Networking for Devops](https://www.youtube.com/playlist?list=PLFjq8z-aGyQ7BGJKANiIusSq92L7OTytJ)