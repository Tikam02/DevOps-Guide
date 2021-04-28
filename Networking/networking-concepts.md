## Networking Notes:

- [Networking Notes:](#networking-notes)
- [OSI Model](#osi-model)
- [Four DoD layers](#four-dod-layers)
- [TCP/IP Model](#tcpip-model)
- [IP Addresses:](#ip-addresses)
  - [Concepts:](#concepts)
  - [Resources:](#resources)
- [DNS:](#dns)
  - [Concepts:](#concepts-1)
  - [Resources:](#resources-1)
- [Proxy server](#proxy-server)
- [Routing Bridging and NAT](#routing-bridging-and-nat)
- [Firewalls and Ports](#firewalls-and-ports)
- [References:](#references)

**********************



***********************

## OSI Model


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

![Physical layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/tcp_ip_1.gif)


*********************************************
## IP Addresses:

### Concepts:

- Each device connected to the internet has a unique identifier. Most networks today, including all computers on the internet, use the TCP/IP as a standard to communicate on the network. In the TCP/IP protocol, this unique identifier is the IP Address. The two kinds of IP Addresses are IPv4 and IPv6.

- These eight bit sections are known as octets. The example IP address, then, becomes 11000000.10101000.01111011.10000100. This number only makes a little more sense, so for most uses, convert the binary address into dotted-decimal format (192.168.123.132). The decimal numbers separated by periods are the octets converted from binary to decimal notation.

- For a TCP/IP wide area network (WAN) to work efficiently as a collection of networks, the routers that pass packets of data between networks do not know the exact location of a host for which a packet of information is destined. Routers only know what network the host is a member of and use information stored in their route table to determine how to get the packet to the destination host's network. After the packet is delivered to the destination's network, the packet is delivered to the appropriate host.

- IPv4 vs IPv6 

    - IPv4 uses 32 binary bits to create a single unique address on the network. An IPv4 address is expressed by four numbers separated by dots. Each number is the decimal (base-10) representation for an eight-digit binary (base-2) number, also called an octet.
  
    ![Physical layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/ipv4.png)

    - IPv6 uses 128 binary bits to create a single unique address on the network. An IPv6 address is expressed by eight groups of hexadecimal (base-16) numbers separated by colons. Groups of numbers that contain all zeros are often omitted to save space, leaving a colon separator to mark the gap .

    ![Physical layer](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/ipv6.png)


- IP Classes

    - Typically, the IPv4 space allows us to have addresses between 0.0.0.0 to 255.255.255.255. However, some numbers in that range are reserved for specific purposes on TCP/IP networks. These reservations are recognized by the authority on TCP/IP addressing, the Internet Assigned Numbers Authority (IANA). Four specific reservations include the following:

        - 0.0.0.0 — This represents the default network, which is the abstract concept of just being connected to a TCP/IP network.
    
        - 255.255.255.255 — This address is reserved for network broadcasts, or messages that should go to all computers on the network.
    
        - 127.0.0.1 — This is called the loopback address, meaning your computer’s way of identifying itself, whether or not it has an assigned IP address.
    
        - 169.254.0.1 to 169.254.255.254 — This is the Automatic Private IP Addressing (APIPA) range of addresses assigned automatically when a computer’s unsuccessful getting an address from a DHCP server.

    - The other IP address reservations are for subnet classes. A subnet is a smaller network of computers connected to a larger network through a router. The subnet can have its own address system so computers on the same subnet can communicate quickly without sending data across the larger network. A router on a TCP/IP network, including the Internet, is configured to recognize one or more subnets and route network traffic appropriately. The following are the IP addresses reserved for subnets:

        - 10.0.0.0 to 10.255.255.255 — This falls within the Class A address range of 1.0.0.0 to 127.0.0.0, in which the first bit is 0.
    
        - 172.16.0.0 to 172.31.255.255 — This falls within the Class B address range of 128.0.0.0 to 191.255.0.0, in which the first two bits are 10.
    
       - 192.168.0.0 to 192.168.255.255 — This falls within the Class C range of 192.0.0.0 through 223.255.255.0, in which the first three bits are 110.
    
        - Multicast (formerly called Class D) — The first four bits in the address are 1110, with addresses ranging from 224.0.0.0 to 239.255.255.255.
    
        - Reserved for future/experimental use (formerly called Class E) — addresses 240.0.0.0 to 254.255.255.254.

    - The first three (within Classes A, B and C) are those most used in creating subnets. Later, we’ll see how a subnet uses these addresses. The IANA has outlined specific uses for multicast addresses within Internet Engineering Task Force (IETF) document RFC 5771. However, it hasn’t designated a purpose or future plan for Class E addresses since it reserved the block in its 1989 document RFC 1112. Before IPv6, the Internet was filled with debate about whether the IANA should release Class E for general use.

- Subnet mask
  
  - The second item, which is required for TCP/IP to work, is the subnet mask. The subnet mask is used by the TCP/IP protocol to determine whether a host is on the local subnet or on a remote network.

  - In TCP/IP, the parts of the IP address that are used as the network and host addresses are not fixed, so the network and host addresses above cannot be determined unless you have more information. This information is supplied in another 32-bit number called a subnet mask. In this example, the subnet mask is 255.255.255.0. It is not obvious what this number means unless you know that 255 in binary notation equals 11111111; so, the subnet mask is:
 

    11111111.11111111.11111111.0000000
 

  - Lining up the IP address and the subnet mask together, the network and host portions of the address can be separated:
 

    - 11000000.10101000.01111011.10000100 -- IP address (192.168.123.132)
  
    - 11111111.11111111.11111111.00000000 -- Subnet mask (255.255.255.0)
 

  - The first 24 bits (the number of ones in the subnet mask) are identified as the network address, with the last 8 bits (the number of remaining zeros in the subnet mask) identified as the host address. This gives you the following:
 

   11000000.10101000.01111011.00000000 -- Network address (192.168.123.0)
   00000000.00000000.00000000.10000100 -- Host address (000.000.000.132)
 

  - So now you know, for this example using a 255.255.255.0 subnet mask, that the network ID is 192.168.123.0, and the host address is 0.0.0.132. When a packet arrives on the 192.168.123.0 subnet (from the local subnet or a remote network), and it has a destination address of 192.168.123.132, your computer will receive it from the network and process it.

    - Almost all decimal subnet masks convert to binary numbers that are all ones on the left and all zeros on the right. Some other common subnet masks are:
 

        | Decimal          |  Binary                           |
        |------------------|-----------------------------------|
        | 255.255.255.192  | 1111111.11111111.1111111.11000000 |
        | 255.255.255.224  | 1111111.11111111.1111111.11100000 |

- Subnetting
    
    - A Class A, B, or C TCP/IP network can be further divided, or subnetted, by a system administrator. This becomes necessary as you reconcile the logical address scheme of the Internet (the abstract world of IP addresses and subnets) with the physical networks in use by the real world.

    - A system administrator who is allocated a block of IP addresses may be administering networks that are not organized in a way that easily fits these addresses. For example, you have a wide area network with 150 hosts on three networks (in different cities) that are connected by a TCP/IP router. Each of these three networks has 50 hosts. You are allocated the class C network 192.168.123.0. (For illustration, this address is actually from a range that is not allocated on the Internet.) This means that you can use the addresses 192.168.123.1 to 192.168.123.254 for your 150 hosts.

    - Two addresses that cannot be used in your example are 192.168.123.0 and 192.168.123.255 because binary addresses with a host portion of all ones and all zeros are invalid. The zero address is invalid because it is used to specify a network without specifying a host. The 255 address (in binary notation, a host address of all ones) is used to broadcast a message to every host on a network. Just remember that the first and last address in any network or subnet cannot be assigned to any individual host.

    - You should now be able to give IP addresses to 254 hosts. This works fine if all 150 computers are on a single network. However, your 150 computers are on three separate physical networks. Instead of requesting more address blocks for each network, you divide your network into subnets that enable you to use one block of addresses on multiple physical networks.

    - In this case, you divide your network into four subnets by using a subnet mask that makes the network address larger and the possible range of host addresses smaller. In other words, you are 'borrowing' some of the bits usually used for the host address, and using them for the network portion of the address. The subnet mask 255.255.255.192 gives you four networks of 62 hosts each. This works because in binary notation, 255.255.255.192 is the same as 1111111.11111111.1111111.11000000. The first two digits of the last octet become network addresses, so you get the additional networks 00000000 (0), 01000000 (64), 10000000 (128) and 11000000 (192). (Some administrators will only use two of the subnetworks using 255.255.255.192 as a subnet mask. For more information on this topic, see RFC 1878.) In these four networks, the last 6 binary digits can be used for host addresses.

    - Using a subnet mask of 255.255.255.192, your 192.168.123.0 network then becomes the four networks 192.168.123.0, 192.168.123.64, 192.168.123.128 and 192.168.123.192. These four networks would have as valid host addresses:
 

     - 192.168.123.1-62
     - 192.168.123.65-126
     - 192.168.123.129-190
     - 192.168.123.193-254
 

    - Remember, again, that binary host addresses with all ones or all zeros are invalid, so you cannot use addresses with the last octet of 0, 63, 64, 127, 128, 191, 192, or 255.

    - You can see how this works by looking at two host addresses, 192.168.123.71 and 192.168.123.133. If you used the default Class C subnet mask of 255.255.255.0, both addresses are on the 192.168.123.0 network. However, if you use the subnet mask of 255.255.255.192, they are on different networks; 192.168.123.71 is on the 192.168.123.64 network, 192.168.123.133 is on the 192.168.123.128 network.

- Default gateways

    - If a TCP/IP computer needs to communicate with a host on another network, it will usually communicate through a device called a router. In TCP/IP terms, a router that is specified on a host, which links the host's subnet to other networks, is called a default gateway. This section explains how TCP/IP determines whether or not to send packets to its default gateway to reach another computer or device on the network.

    - When a host attempts to communicate with another device using TCP/IP, it performs a comparison process using the defined subnet mask and the destination IP address versus the subnet mask and its own IP address. The result of this comparison tells the computer whether the destination is a local host or a remote host.

    - If the result of this process determines the destination to be a local host, then the computer will simply send the packet on the local subnet. If the result of the comparison determines the destination to be a remote host, then the computer will forward the packet to the default gateway defined in its TCP/IP properties. It is then the responsibility of the router to forward the packet to the correct subnet.
 



### Resources:

- [What computer networks are and how to actually understand them](https://www.freecodecamp.org/news/computer-networks-and-how-to-actually-understand-them-c1401908172d/)
- [Understanding TCP/IP addressing and subnetting basics](https://support.microsoft.com/en-in/help/164015/understanding-tcp-ip-addressing-and-subnetting-basics)
- [Ip addressing guide](https://www.cisco.com/c/dam/en/us/solutions/collateral/enterprise/design-zone-smart-business-architecture/sba_ipAddr_dg.pdf)
- [What is port forwarding and what it is used for?](https://superuser.com/questions/284051/what-is-port-forwarding-and-what-is-it-used-for)
- [Port forwarding for beginners](https://medium.com/datadriveninvestor/port-forwarding-for-beginners-11355d000867)





*********************************************


## DNS:

### Concepts:

- The Domain Name System (DNS) is a distributed directory that resolves human-readable hostnames, such as www.dyn.com, into machine-readable IP addresses like 50.16.85.103. DNS is also a directory of crucial information about domain names, such as email servers (MX records) and sending verification (DKIM, SPF, DMARC), TXT record verification of domain ownership, and even SSH fingerprints (SSHFP).

- Each device connected to the Internet has a unique IP address which other machines use to find the device. DNS servers eliminate the need for humans to memorize IP addresses such as 192.168.1.1 (in IPv4), or more complex newer alphanumeric IP addresses such as 2400:cb00:2048:1::c629:d7a2 (in IPv6).

- How does DNS work?

    - The process of DNS resolution involves converting a hostname (such as www.example.com) into a computer-friendly IP address (such as 192.168.1.1). An IP address is given to each device on the Internet, and that address is necessary to find the appropriate Internet device - like a street address is used to find a particular home. When a user wants to load a webpage, a translation must occur between what a user types into their web browser (example.com) and the machine-friendly address necessary to locate the example.com webpage.

    - In order to understand the process behind the DNS resolution, it’s important to learn about the different hardware components a DNS query must pass between. For the web browser, the DNS lookup occurs “ behind the scenes” and requires no interaction from the user’s computer apart from the initial request.

- There are 4 DNS servers involved in loading a webpage:

   - DNS recursor - The recursor can be thought of as a librarian who is asked to go find a particular book somewhere in a library. The DNS recursor is a server designed to receive queries from client machines through applications such as web browsers. Typically the recursor is then responsible for making additional requests in order to satisfy the client’s DNS query.
  
   - Root nameserver - The root server is the first step in translating (resolving) human readable host names into IP addresses. It can be thought of like an index in a library that points to different racks of books - typically it serves as a reference to other more specific locations.
   
   - TLD nameserver - The top level domain server (TLD) can be thought of as a specific rack of books in a library. This nameserver is the next step in the search for a specific IP address, and it hosts the last portion of a hostname (In example.com, the TLD server is “com”).
   
   - Authoritative nameserver - This final nameserver can be thought of as a dictionary on a rack of books, in which a specific name can be translated into its definition. The authoritative nameserver is the last stop in the nameserver query. If the authoritative name server has access to the requested record, it will return the IP address for the requested hostname back to the DNS Recursor (the librarian) that made the initial request.

- DNS Records

    - A record:
        - The A record, which is also called a host record contains the ipv4-address of a computer.When a DNS client queries a DNS server for an A record, then the DNS server will resolve the hostname in the query to an ip address. An AAAA record is similar but contains an ipv6 address instead of ipv4.

    - PTR record :
        - A PTR record is the reverse of an A record. It contains the name of a computer and can be used to resolve an ip address to a hostname.

    - NS record: 
      - A NS record or nameserver record is a record that points to a DNS name server (in this zone). You can list all your name servers for your DNS zone in distinct NS records.
    
    - glue A record : 
      - An A record that maps the name of an NS record to an ip address is said to be a glue record.

    - SOA record:
      - The SOA record of a zone contains meta information about the zone itself. The contents of the SOA record is explained in detail in the section about zone transfers. There is exactly one SOA record for each zone.

    - CNAME record :
      - A CNAME record maps a hostname to a hostname, creating effectively an alias for an existing hostname. The name of the mail server is often aliased to mail or smtp, and the name of a web server to www.
      - 
    - MX record : 
      - The MX record points to an smtp server. When you send an email to another domain, then your mail server will need the MX record of the target domain's mail server.



### Resources:

- [What is DNS - AWS](https://aws.amazon.com/route53/what-is-dns/)
- [What is DNS - Cloudflare](https://www.cloudflare.com/learning/dns/what-is-dns/)
- [DNS: Why It’s Important and How It Works](https://dyn.com/blog/dns-why-its-important-how-it-works/)
- [An Introduction to DNS Terminology, Components, and Concepts](https://www.digitalocean.com/community/tutorials/an-introduction-to-dns-terminology-components-and-concepts)
- [Reviewing DNS Concepts](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/plan/reviewing-dns-concepts)

********************************************

## Proxy server

- What is an HTTP proxy and how does it work?

 The simple diagram looks like this:

 |CLIENT   <--->   PROXY   <--->   SERVER |
 | (Browser)-------------------(Web Server)|


The HTTP request is sent from Client to port 8080 of the Proxy Server. The Proxy Server then originates a new HTTP request to the destination site. The proxy, depending on the configuration, will often add a "X-Forwarded-For" header to the HTTP request. The log files on the destination web site will show the proxy's IP address, but may or may not be configured to log the "X-Forwarded-For" address.

It was popular years ago, and they still stick around. However, the proxy server, most of the part has been replaced by NAT that is now build into routers. We still use proxy server every once in a while for very specific usage such as hacking/security communities, mostly to hide the id of the connection side.

Internally (within a network), it can be very useful for caching proxy(Squid). For instance, this can be useful when lots of our network computers trying to do Windows Update, the proxy server can cache GBs of files once and for all, and saving bandwidth.


**********************************************

## Routing Bridging and NAT

*********************************************

## Firewalls and Ports

***********************************************





********************

## References:

- [Networking for Devops](https://www.youtube.com/playlist?list=PLFjq8z-aGyQ7BGJKANiIusSq92L7OTytJ)
