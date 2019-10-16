## Interview Preparation:
*********
## Topics
    - DevOps
    - Programming
    - OS/LINUX
    - Networking
    - Security
    - Architecture
    - Setup
    - Infrastructure as Code
    - CI/CD
    - Testing
********
### DevOps:

* What DevOps is? Why do we need it?
    * Example of answers:
        * Why do we need it?
            * Increase deployment frequency
            * Lower failure rate of new releases
            * Shortened lead time between fixes
            * Faster mean time to recovery in the event of new release crashing
        * What DevOps is?
            * CALMS
            * C – Culture (promotes collaborative and open culture between Dev and Ops)
            * A – Automation (automate wherever applicable)
            * L- Learning (continuous learning & experimentation)
            * M – Measure (Measure with shared metrics across the Dev and ops for better management)
            * S – Sharing (Shared delivery process across Dev and Ops to build , deploy, maintain and monitor product with mentality of One Team – One Goal)
* What is the purpose of a post-mortem meeting?
* What is meant by Continuous Integration?
* What are the success factors for Continuous Integration?
  * Examples of answers:
      * Maintain a code repository
      * Automate the build
      * Make the build self-testing
      * Everyone commits to the baseline every day
      * Every commit (to baseline) should be built
      * Keep the build fast
      * Test in a clone of the production environment
      * Make it easy to get the latest deliverables
      * Everyone can see the results of the latest build
      * Automate deployment
* How would you implement CI (continuous delivery) - end to end, including source control, branches, tools, etc. ?
* What is Continious Delivery? Continious Deployment?
* What is the difference between Continuous Integration, Continious Delivery and Continious Deployment?
* What’s the difference between git and github ? What about git and SVN ?
* What is `git rebase`?
* In Git how do you revert a commit that has already been pushed and made public?
* What is puppet/chef/ansible used for? What are the advantages over shell scripts ?
* What do you understand by “Infrastructure as code”? How does it fit into the DevOps methodology? What purpose does it achieve?
* How do you give your developers access to the production logs ?
* Tell me about the worst-run/best-run outage you’ve been a part of. What made it bad/well-run?
* How do you monitor your application ? How do you make sure it is working ? How do you get alerts when it stops working ?
* What would be the availability and performance metrics for a key value store ? What about for MySQL replication ?
* How would you deploy software to 5000 systems?
* What is caching ? Where should a large scale application cache, and what data should be cached ?

************
### Programming:

- What is your favorite scripting/programming language(s)? Why ?
    - General CS, algorithms Q&A: 5 minutes
        - Data structures - discuss possible implementations and applications:
            - Binary tree
            - Hash map
            - Heap
        - Complexity classes - discuss and give examples:
            - Linear
            - Polynomial
            - NP Complete / NP Hard
        - Sorting algorithms - discuss:
            - What is the fastest sorting algorithm?
            - What is the complexity of quick sort?
        - Distributed systems:
            - What’s Paxos?
            - What's Raft?
            - What’s consistent hashing?
        - Hands-on coding:
            - Inverse a string in place
    - Deep Concept of DP and Graphs:
- Development Coding Questions.
- Describe a dev/test/production workflow using GIT
    - Feature branching vs trunk based development
    - Advantages of requiring pull requests and approvals
- More on Front-end Developer Job Interview Questions


***********

### OS/LINUX:

* How can you view running processes?

* How do you check server uptime?

* How do you start/stop services?

* How do you display the shell’s environment variables?

* What does #!/bin/bash at the top of a script do?

* What does "&" after a command do?

* What does piping commands mean?

* What distributions have you used on servers?Why?

* What is your favorite editor?
* What is RAID? What is RAID0, RAID1, RAID5, RAID10?
* Describe the general file system hierarchy of a Linux system.
* Describe what each of the following command line utilities do:
    * tee
    * awk
    * tr
    * cut
    * curl
    * tail
    * sed
* Command line demo:
  * Search for "my konfu is the best" in all *.py files
  * Replace the occurrence of "my konfu is the best" with "I'm a linux jedi master" in all *.txt files
  * Find all files which have been accessed within the last 30 days
* What is the difference between virtual memory and swap ?
* What is the difference between hardlinks and symlinks?
* What is an inode and what fields are stored in an inode?
* What are zombie processes ?
* Can you have several HTTPS virtual hosts sharing the same IP?
* What is the difference between processes and threads?
* What is the difference between exec and fork?
* How nginx can handle a lot of connections? What does it use inside?
    * Example of answer: Eventloop.
* What is "nohup" used for?
* What is an atomic operation?
* I've added my public ssh key into authorized_keys but I'm still getting a password prompt, what can be wrong?
* How do you catch a SIGHUP ? What about SIGSEGV ? What about SIGKILL ?
* What is the Linux Kernel OOM and how does it work ?
* What's a chroot jail?
* Describe the Linux boot process with as much detail as possible, starting from when the system is powered on and ending when you get a prompt.
* What's LD_PRELOAD and when is it used?
* You ran a binary and nothing happened. How would you debug this?
* When can a socket receive E_AGAIN ?
* What is a dynamically/statically linked file?
* A careless sysadmin executes the following command: chmod 444 /bin/chmod - what do you do to fix this?
* I've lost my root password, what can I do?
* You have accidentally deleted a running script, how could you restore it ?
* What load balancers have you used ?
* AWS:
    * What is the difference between an AMI and an instance ?
    * What’s EBS ? What’s an EBS snapshot ? What is the real cost of having an EBS snapshot ?
    * What’s a VPC ?
    * What’s the difference between a region and an availability zone ?
    * What’s an ELB ?
    * What’s S3 ? What are the features supported on S3 ?

******************

### Networking:

* What is IPv6 ? Why should we care?
* How does ping work ? What about traceroute ?
* I type http://www.yahoo.com in my browser’s URL bar and I press enter. What happens ? (discuss at every OSI layer - Physical, data link, network, transport, session, presentation, application)
    * DNS & anycast, IP, UDP, routing, BGP, TCP, HTTP, transparent proxy
    * What is BGP?
    * What’s a PTR in DNS? Why should we care?
* What if I change from http://www.yahoo.com to https://www.yahoo.com  ?
    * Public/private certificates, CAs, proxying, MiTM, etc.
* What happens when I press the send button in my email client ?
* How do we prevent bots crawling ? How would you deal with a syn flood ?
* How many hosts in a /24  network? What about a /22 ?
* What is the difference between DNAT and SNAT ? When do you use either ?
* What is a virtual IP address? What is a cluster?
* What is IPv6 ? Why should we care?



*******************

### Security:


What is the importance of SSL?

* What is a SQL injection?

* What is cross-site scripting (XSS)?

* Why shouldn’t you roll your own crypto?

* How are passwords stored on databases?

* What is a Man-in-the-middle attack?

* How do you safely manage environment variables in a cloud environment?

* How do you manage security updates?

* How do you keep encryption keys and credentials secure but make them available to machines that need them?


**********************


### CI/CD:



*********************


###  System Setup:



**********************


### Architecture:


******************


### Infrastructure as Code:



*******************
