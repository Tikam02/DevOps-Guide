# Firewall

Firewalls act as your first line of defense against network intrusion. Firewalls are a network security system that monitors and controls incoming and outgoing traffic based upon some predetermined rules, acting as a barrier against trusted and untrusted network.

A few types of firewalls:

  - Proxy Firewall
  - Stateful Firewall
  - Unified Threat Management (UTM) Firewall
  - Next-generation Firewall
  - Threat-focused Firewall
  - Virtual Firewall

Firewalls can be implemented both at hardware and software level. For the sake of this example we will only focus on the software part.

## Windows Firewall

Windows Firewall (called Windows Defender in Windows 10) is a firewall component provided in Microsoft Windows.

An official link to Microsoft Defender's manual can be found at the bottom.

## Linux Firewall

Firewall in Linux can be implemented in different ways. These are only few of those.

### Using IPTables

IPTables is a rule based firewall and comes pre-installed on most Linux distributions. By default it runs without any rules and has been a part of the Linux kernel since version 2.4

However if you want to install it or update it yourself

For apt based distributions
`$ sudo apt install iptables`

For dnf based distributions
`$ sudo dnf install iptables`

For pacman based distributions
`$ sudo pacman -Syu iptables`

IPTables services and protocols

  - iptables applies to **IPv4**
  - ip6tables applies to **IPv6**
  - arptables to **ARP**
  - ebtables to **Ethernet** frames

IPTables main config files

  - `/etc/init.d/iptables` - init script to start|stop|restart and save rulesets.
  - `/sbin/iptables` - the IPTables binary

IPTables chains
  
  - **Input**: Used to control the behavior of input traffic. For example if you want to match an incoming SSH IP and port to a rule in the input chain.
  - **Forward**: Used for incoming connections that aren't being delivered locally. `$ iptables -L -v` can be used to check this. For example in router data is always sent to it but rarely is destined for the router itself; the data is just forwarded to the target.
  - **Output**: Used for outgoing connections. For example if we want to ping a certain IP or site IPTables will check it's output chain to see if there exist any rule for that IP or site before making the decision to allow or deny the ping.

Connection Specific Response

  - **Accept**: Allow the connection.
  - **Drop**: Drop the connection and act as if it never happened. Best if you don't want the source to know of your systems existence.
  - **Reject**: Don't allow the connection but send back an error. Best if you want don't want the source to connect to your system, but don't want them to learn that a firewall blocked their request.

Allowing or Blocking specific connections
  
  - Connections from single IP Source

    `$ iptables -A INPUT  -s 10.10.10.10 -j DROP` this blocks all connections form IP 10.10.10.10

  - Connections form a range of IP Source

    `$ iptables -A INPUT  -s 10.10.10.10/24 -j DROP` this blocks all connections form IP 10.10.10.10/24 network range

    Netmask or standard slash can also be used

    `$ iptables -A INPUT  -s 10.10.10.10/255.255.255.0 -j DROP`

Saving changes

```
$ sudo /sbin/iptables save

or

$ sudo iptables save

or

$ sudo /sbin/service iptables save

or

/etc/init.d/iptables save
```

### Using Firewalld

IPTables was superseded as firewalld was introduced by Red Hat Enterprise Linux 7.0. Firewalld is a zone-based firewall. A zone is associated with at least one network interface (eth0 for instance). Firewalld provides different levels of security for different connection zones.

`$ firewall-cmd --get-zones` can be used to get the list of preconfigured zones.

`$ firewall-cmd --list-all` can be used to display services associated to different zones. If the zone is not defined by the user, the `public` zone is taken as default. The `--zone=zonename` can be used to specify a zone.

For example `$ firewall-cmd --zone=external --list-all` can be used to see the `external` zone.

* **Allow and Deny by service**

  `# firewall-cmd --zone=external --add-service=ftp` can be use to allow `ftp` service in the external zone.

  To make rule persistent `# firewall-cmd --permanent --zone=external --add-service=ftp`

  Removing a service can be as simple as `# firewall-cmd --permanent --zone=external --remove-service=ftp`

* **Allow and Deny by port**

  `# firewall-cmd --permanent --zone=external --add-port=60001/udp` can be used to add a dedicated `UDP` port to your external zone, where 60001 is your port number.

  `# firewall-cmd --zone=external --list-ports` can be used to check the allowed ports in the given zone. For some other zone `--zone` should be changed.

  Similar to removing services, ports can be removed using `--remove-port` option. For example `# firewall-cmd --permanent --zone=external --remove-port=60001/udp`

### Using the UFW or the Uncomplicated Firewall

As the name suggests ufw provides us with a much user friendly approach to managing firewall on Linux. ufw also has an GUI interface named gufw.

Installation

`$ sudo apt install ufw`

You will need to start the service.

`$ sudo systemctl enable ufw` and then `$ sudo systemctl start ufw`

A fundamental ufw command may look like `ufw [--dry-run] [option] [rule syntax]`

**Few useful commands**:

  > Change the port number (here 22, 8 and 25), I.P. ( here 192.168.2.100 or 192.168.2.101 ), protocol and services (here TCP, UDP and SSH) according to your requirement.

  - `$ sudo ufw allow 22` can be used to allow traffic on port 22.
  - `$ sudo ufw deny 22` can be used to deny traffic on port 22.
  - `$ sudo ufw deny 22/tcp` can be used to deny traffic and TCP protocol on port 22, same goes for `allow`.
  - `$ sudo ufw allow ssh` can be used to allow ssh traffic. This is done by defining a rule using a service and ufw will run against `/etc/services`. Same applies for `deny`
  - `$ sudo ufw allow ssh/tcp` can be used to add protocols on top of services.
  - `$ sudo ufw deny from 192.168.2.100/8 to 192.168.2.101 port 25`, this will deny 192.168.2.100 from gaining access (through any port) to 192.168.2.101's port 25.
  - `$ sudo ufw limit 80/tcp` can be used to limit connections to that port.

  > ufw will not work if iptables is enabled.

---

##### Resources used to write this

- [Wikipedia](https://en.wikipedia.org/wiki/Firewall_(computing))
- [Cisco](https://www.cisco.com/c/en/us/products/security/firewalls/what-is-a-firewall.html)
- [Microsoft Defender Manual](https://support.microsoft.com/en-in/help/4028544/windows-10-turn-microsoft-defender-firewall-on-or-off)
- [Techmint's IPTables article](https://www.tecmint.com/basic-guide-on-iptables-linux-firewall-tips-commands/)
- [howtogeek's IPTables article](https://www.howtogeek.com/177621/the-beginners-guide-to-iptables-the-linux-firewall/)
- [RedHat's firewalld beginner guide](https://www.redhat.com/sysadmin/beginners-guide-firewalld)
- [Firewalld user manual](https://firewalld.org/documentation/man-pages/firewall-cmd.html)
- [Arch Linux's ufw wiki page](https://wiki.archlinux.org/index.php/Uncomplicated_Firewall)
- [An useful ufw tutorial](https://www.linux.com/training-tutorials/introduction-uncomplicated-firewall-ufw/)
