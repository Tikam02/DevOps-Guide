# Topics  ![Learn](https://img.shields.io/badge/Interview-Preparation-blueviolet?style=for-the-badge)

- [Topics !Learn](#topics-learn)
  - [DevOps Interview Questions](#devops-interview-questions)
  - [Programming:](#programming)
  - [OS-LINUX:](#os-linux)
  - [Networking:](#networking)
  - [Security:](#security)
  - [Docker](#docker)
  - [kubernetes](#kubernetes)
  - [Architecture:](#architecture)
  - [Infrastructure as Code:](#infrastructure-as-code)
  - [Setup](#setup)
  - [Testing](#testing)
  
********
## DevOps Interview Questions


- Q1) Can you tell us the fundamental differences between DevOps & Agile?
  - A: Although DevOps shares some similarities with the Agile methodology, which is one of the most popular SDLC methodologies, both are fundamentally different approaches to software development. Following are the various fundamental differences between the two:

    - Agile Approach – The agile approach is only meant for development in Agile while the agile approach is meant for both development and operations in DevOps.

    - Practices and Processes – While agile involves practices such as Agile Scrum and Agile Kanban, DevOps involves processes such as CD (Continuous Delivery), CI (Continuous Integration), and CT (Continuous Testing).

    - Priority – Agile prioritizes timeliness whereas, DevOps gives equal priority to timeliness and quality.

    - Release Cycles – DevOps offers smaller release cycles with immediate feedback while Agile offers only smaller release cycles without immediate feedback.

    - Feedback Source – Agile relies on feedback from customers while feedback from self (monitoring tools) is involved in DevOps.

    - Scope of Work – For Agile, the scope of work is agility only but for DevOps, it is agility and the need for automation.

- Q2) Why do we need DevOps?

  - A: Organizations these days are trying to transport small features to customers via a series of release trains instead of releasing big feature sets. There are several benefits of doing so, including better software quality and quick customer feedback.

  - All such benefits lead to a higher level of customer satisfaction, which is the most important goal for any product development project. To do so, companies need to:

      - Increase deployment frequency
      - Lessen lead time between fixes
      - Lower failure rate of new releases
      - In case of new release crashing, have a faster mean time to recovery

  - DevOps helps in fulfilling all these requirements and thus, achieving seamless software delivery. Full-fledged organizations like Amazon, Etsy, and Google have adopted DevOps methodology resulting in achieving performance levels that were previously uncharted.

  - With the adoption of DevOps methodology, organizations are able to accomplish tens to thousands of deployments in a single day. Moreover, doing so while offering first-rate reliability, security, and stability.

- Q3) What are the important business and technical benefits of using DevOps?

  - A: DevOps brings a lot of business and technical benefits to the table. Some of the most important ones are listed down as follows:

    - Business benefits:

      - Enhanced operating environment stability
      - Faster delivery of features
      - More time for adding value to the product

    - Technical benefits:

      - Continuous software delivery
      - Faster problem resolution
      - Lesser complex problems

- Q4) Can you name some of the most-used DevOps tools?

  - A: Following is a list of some of the most widely used DevOps tools:

      - Ansible – A configuration management and application deployment tool
      - Chef – A configuration management and application deployment tool
      - Docker – A containerization tool
      - Git – A version control system (VCS) tool
      - Jenkins – A continuous integration (CI) tool
      - Jira – An agile team collaboration tool
      - Nagios – A continuous monitoring tool
      - Puppet – A configuration management and application deployment tool
      - Selenium – A continuous testing (CT) tool

- Q5) What is Selenium used for?

  - A: Selenium is used for continuous testing in DevOps. The tool specializes in functional and regression forms of testing.

- Q6) What do you understand by Puppet in DevOps?
  
  - A: It is a configuration management tool that is used for automating administration tasks. Puppet makes use of the Master-Slave architecture in which the two entities communicate via an encrypted channel.

  - System admins need to perform a lot of repetitive tasks, notably installing and configuring servers. Writing scripts for automating such tasks is an option but it becomes hectic when the infrastructure is large. Configuration management is a great workaround for this.

  - Puppet helps in configuring, deploying, and managing servers. Not only does it make such redundant tasks easier but also cuts a significant portion of the total work time. The mature configuration management tool:

      - Continuously checks whether the needed configuration for a host is in place or not. If altered, the configuration is automatically reverted back
      - Defines distinct configurations for every host
      - Does dynamic scaling (up and down) of machines
      - Provides control over all the configured machines so that a centralized change can automatically get propagated to all of them

- Q7) What do you understand by anti-patterns of DevOps?
  
  - A: When a DevOps pattern commonly adopted by other organizations doesn’t work in a specific context and still the organization continues using it, it leads to the adoption of an anti-pattern. In other words, anti-patterns are myths about DevOps. Some of the notable anti-patterns are:

      - An organization needs to have a separate DevOps group
      - Agile equals DevOps
      - DevOps is a process
      - DevOps is development-driven release management
      - DevOps is not possible because the organization is unique
      - DevOps is not possible because the people available are unsuitable
      - DevOps means Developers Managing Production
      - DevOps will solve all problems
      - Failing to include all aspects of the organization in an ongoing DevOps transition
      - Not defining KPIs at the start of a DevOps transition
      - Reduce the silo-based isolation of development and operations with a new DevOps team that silos itself from other parts of the organization

- Q8) DevOps has something called CI. What is it and what is its purpose?
  - A: CI in DevOps stands for Continuous Integration. CI is a development practice in which developers integrate code into a shared repository multiple times in a single day.

    - Continuous Integration of development and testing enhances the quality of the software as well as reducing the total time required for delivery.

    - The developer has broken the build if a team member checking in code runs into a compilation failure. As such, other developers are not able to sync with the shared source code repository without introducing compilation errors into their own workspaces.

    - This disrupts the collaborative and shared development process. Hence, as soon as a CI build breaks, it’s important to identify and correct the problem immediately.

    - Typically, a CI process includes a suite of unit, integration, and regression tests that run each time the compilation succeeds. In case any of the aforesaid tests fail, the CI build is considered unstable (which is common during an Agile sprint when development is ongoing) and not broken.

- Q9) More often than not we hear shift left in DevOps. What is it?
  - A: The traditional software development lifecycle when graphed on a paper has two sides, left and right. While the left side of the graph includes design and development, the right side includes production staging, stress testing, and user acceptance.

  - To shift left in DevOps simply means the necessity of taking as many tasks on the right i.e. that typically happens toward the end of the application development process and incorporate them into earlier stages of a DevOps methodology.

    - There are several ways of accomplishing a shit left in DevOps, most notably:
    - Create production-ready artifacts at the end of every Agile sprint 
    - Incorporating static code analysis routines in every build

  - The level of doing the DevOps the right way is directly dependent on the degree of shifting left as much as possible.

- Q10) What does CAMS in DevOps stand for?
  - A: The acronym CAMS is usually used for describing the core creeds of DevOps methodology. It stands for:

   - Culture
   - Automation
   - Measurement
   - Sharing

- Q11) What are the several KPIs used to gauge DevOps success?
  - A: KPIs is a contracted form of Key Performance Indicators. In order to measure the success of a DevOps process, several KPIs can be used. Some of the most popular ones are:

   - Application performance
   - Application usage and traffic
   - The automated test pass percentage
   - Availability
   - Change volume
   - Customer tickets
   - Defect escape rate
   - Deployment frequency
   - Deployment time
   - Error rates
   - Failed deployments
   - Lead time
   - Meantime to detection (MTTD)
   - Mean time to recovery (MTTR)

- Q12) In your opinion, what are the major benefits of implementing DevOps automation?
  - A: Following are the major benefits of implementing DevOps automation:

    - Removal of the possibility of human error from the CD equation (Core benefit)

    - As tasks become more predictable and repeatable, it is easy to identify and correct when something goes wrong. Hence, it results in producing more reliable and robust systems

    - Removes bottlenecks from the CI pipeline. It results in increased deployment frequency and decreased number of failed deployments. Both of them are important DevOps KPIs

- Q13) What do you understand by containers?
  - A: Containers are a form of lightweight virtualization that help in providing isolation among processes. Containers are heavier than a chroot but lighter than a hypervisor.

- Q14) Microservices are a core part of DevOps. Can you name any two popular Java development frameworks for creating microservices?
  - A: There are several Java frameworks that allow creating microservices. However, Eclipse MicroProfile and Spring Boot stand out from the herd as the two leading Java development frameworks used in DevOps for creating microservices.

- Q15) What do you understand by a Version Control System (VCS)? Define its uses.
  - A: A Version Control System or VCS is a system that is capable of recording changes made to a file or a group of files over time. Git and Mercurial are two of the most popular version control systems. Important uses of a VCS are:

   - Check what was the last modification that caused a problem
   - Compare the changes made over time
   - Identifying who introduced a new issue and at what time
   - Revert a file or files to some earlier state
   - Revert the complete project to a previous state

- Q16) Git is a popular DevOps tool. Tell us how you will revert a commit that has already been pushed and made public.
  - A: There are two ways of doing so:

    - By creating a new commit to undo all changes made by the commit that has already been pushed and made public. Following command is used for doing so:
    - git revert

    - By fixing or removing the bad file in a new commit and then pushing it to the remote repository. After making necessary changes to the file, commit it to the remote repository using the command:
    - git commit -m “commit message”

- Q17) What are post mortem meetings?
  - A: Many times there is a need to discuss what went wrong during a DevOps process. For this, post mortem meetings are arranged. These meetings yield steps that should be taken to avoid the same failure or set of failures in the future for which the meeting was arranged in the first place.

- Q18) Draw a comparison between Asset Management and Configuration Management.
  - A: The process of monitoring as well as maintaining things of value to an entity or group is called an Asset Management.

 - Configuration Management refers to the process of controlling, identifying, planning for, and verifying the configuration items within service in support of Change Management.

- Q19) Can you state and explain various key elements of continuous testing?
  - A: Various key elements of continuous testing are:

      - Advanced analysis – Used for forecasting and predicting unknown future events
      - Policy analysis – Meant for improving the testing process
      - Requirement traceability – Refers to the ability to describe as well as follow the life of a requirement, from its origin to deployment
      - Risk assessment – The method or process of identifying hazards and risk factors that can cause potential damage
      - Service virtualization – Allows using virtual services instead of production services. Emulates software components for simple testing
      - Test optimization – Improve the overall testing process

- Q20) Please explain the core operations of DevOps in terms of development and infrastructure.
- A: Core operations of DevOps in terms of development and infrastructure are:

    - Application development – Developing a product that is able to meet all customer requirements and offers a remarkable level of quality
    - Code coverage – Measurement of the total number of blocks or lines or arcs of the code executed while the automated tests are running
    - Code developing – Prepare the code base required for the product development
    - Configuration – Allowing the product to be used in an optimum way
    - Deployment – Installing the software to be used by the end-user
    - Orchestration – Arrangement of several automated tasks
    - Packaging – Activities involved when the release is ready for deployment
    - Provisioning – Ensuring that the infrastructure changes arrive just-in-time with the code that requires it
    - Unit testing – Meant for testing individual units or components

- Q21) What Do You Know about DevOps?

  - Your answer must be simple and straightforward. Begin by explaining the growing importance of DevOps in the IT industry. Discuss how such an approach aims to synergize the efforts of the development and operations teams to accelerate the delivery of software products, with a minimal failure rate. Include how DevOps is a value-added practice, where development and operations engineers join hands throughout the product or service lifecycle, right from the design stage to the point of deployment.


- Q22) Why Has DevOps Gained Prominence over the Last Few Years?

  - Before talking about the growing popularity of DevOps, discuss the current industry scenario. Begin with some examples of how big players such as Netflix and Facebook are investing in DevOps to automate and accelerate application deployment and how this has helped them grow their business. Using Facebook as an example, you would point to Facebook’s continuous deployment and code ownership models and how these have helped it scale up but ensure the quality of experience at the same time. Hundreds of lines of code are implemented without affecting quality, stability, and security.

  - Your next use case should be Netflix. This streaming and on-demand video company follow similar practices with fully automated processes and systems. Mention the user base of these two organizations: Facebook has 2 billion users while Netflix streams online content to more than 100 million users worldwide.

  - These are great examples of how DevOps can help organizations to ensure higher success rates for releases, reduce the lead time between bug fixes, streamline and continuous delivery through automation, and an overall reduction in manpower costs.

- Q23) Which Are Some of the Most Popular DevOps Tools? Do You Have Experience Working with Any of These Tools?

  - The more popular DevOps tools include:

     - Selenium
     - Puppet
     - Chef
     - Git
     - Jenkins
     - Ansible
     - Docker

- Q24) Do You Want to Master All These Devops Tools?

  - Thoroughly describe any tools that you are confident about, what it’s abilities are and why you prefer using it. For example, if you have expertise in Git, you would tell the interviewer that Git is a distributed Version Control System (VCS) tool that allows the user to track file changes and revert to specific changes when required. Discuss how Git’s distributed architecture gives it an added edge where developers make changes locally and can have the entire project history on their local Git repositories, which can be later shared with other team members.

- Q25) What Is Version Control and Why Should VCS Be Used?

  - Define version control and talk about how this system records any changes made to one or more files and saves them in a centralized repository. VCS tools will help you recall previous versions and perform the following:

  - Go through the changes made over a period of time and check what works versus what doesn’t.
    - Revert specific files or specific projects back to an older version.
    - Examine issues or errors that have occurred due to a particular change

  - Using VCS gives developers the flexibility to simultaneously work on a particular file and all modifications can be logically combined later.


- Q26) Is There a Difference Between Agile and DevOps? If Yes, Please Explain.

  - As a DevOps Engineer, interview questions like this are quite expected. Start by describing the obvious overlap between DevOps and Agile. Although the implementation of DevOps is always in sync with Agile methodologies, there is a clear difference between the two. The principles of Agile are associated with seamless production or development of a piece of software. On the other hand, DevOps deals with the development, followed by deployment of the software, ensuring faster turnaround time, minimum errors, and reliability.

- Q27) Why Are Configuration Management Processes and Tools Important?

  - Talk about multiple software builds, releases, revisions, and versions for each software or testware that is being developed. Move on to explain the need for storing and maintaining data, keeping track of development builds and simplified troubleshooting. Don’t forget to mention the key CM tools that can be used to achieve these objectives. Talk about how tools like Puppet, Ansible, and Chef help in automating software deployment and configuration on several servers.

- Q28) How Is Chef Used as a CM Tool?

  - The chef is considered to be one of the preferred industry-wide CM tools. Facebook migrated its infrastructure and backend IT to the Chef platform, for example. Explain how Chef helps you to avoid delays by automating processes. The scripts are written in Ruby. It can integrate with cloud-based platforms and configure new systems. It provides many libraries for infrastructure development that can later be deployed within a software. Thanks to its centralized management system, one Chef server is enough to be used as the center for deploying various policies.


- Q29) How Would You Explain the Concept of “Infrastructure as Code”(IaC)?

  - It is a good idea to talk about IaC as a concept, which is sometimes referred to as a programmable infrastructure, where infrastructure is perceived in the same way as any other code. Describe how the traditional approach to managing infrastructure is taking a back seat and how manual configurations, obsolete tools, and custom scripts are becoming less reliable. Next, accentuate the benefits of IaC and how changes to IT infrastructure can be implemented in a faster, safer and easier manner using IaC. Include the other benefits of IaC like applying regular unit testing and integration testing to infrastructure configurations, and maintaining up-to-date infrastructure documentation.

  - If you have completed a certification on Amazon Web Services (AWS), and are interviewing for niche roles such as AWS-certified DevOps engineer, here are some AWS DevOps interview questions that you must be prepared for:

- Q30) What Is the Role of AWS in DevOps?

  - When asked this question in an interview, get straight to the point by explaining that AWS is a cloud-based service provided by Amazon that ensures scalability through unlimited computing power and storage. AWS empowers IT enterprises to develop and deliver sophisticated products and deploy applications on the cloud. Some of its key services include Amazon CloudFront, Amazon SimpleDB, - - - Amazon Relational Database Service, and Amazon Elastic Computer Cloud. Discuss the various cloud platforms and emphasize any big data projects that you have handled in the past using cloud infrastructure.


- Q31) How Is IaC Implemented Using AWS?

  - Start by talking about the age-old mechanisms of writing commands onto script files and testing them in a separate environment before deployment and how this approach is being replaced by IaC. Similar to the codes written for other services, with the help of AWS, IaC allows developers to write, test, and maintain infrastructure entities in a descriptive manner, using formats such as JSON or YAML. This enables easier development and faster deployment of infrastructure changes.

  - Go through this Simplilearn video on “DevOps Interview Questions” delivered by our DevOps certification expert that will help you crack any interview.



- Q32) What are the success factors for Continuous Integration?
  - Examples of answers:
      - Maintain a code repository
      - Automate the build
      - Make the build self-testing
      - Everyone commits to the baseline every day
      - Every commit (to baseline) should be built
      - Keep the build fast
      - Test in a clone of the production environment
      - Make it easy to get the latest deliverables
      - Everyone can see the results of the latest build
      - Automate deployment

- Q33) How would you implement CI (continuous delivery) - end to end, including source control, branches, tools, etc. ?

- Q34) What is Continious Delivery? Continious Deployment?
  
- Q35) What is the difference between Continuous Integration, Continious Delivery and Continious Deployment?

- Q36) What’s the difference between git and github ? What about git and SVN ?

- Q37) What is git rebase?

- Q38) In Git how do you revert a commit that has already been pushed and made public?

- Q39)  What is puppet/chef/ansible used for? What are the advantages over shell scripts ?

- Q40) What do you understand by “Infrastructure as code”? How does it fit into the DevOps methodology? What purpose does it achieve?

- Q41) How do you give your developers access to the production logs ?

- Q42) Tell me about the worst-run/best-run outage you’ve been a part of. What made it bad/well-run?

- Q43) How do you monitor your application ? How do you make sure it is working ? How do you get alerts when it stops working ?

- Q44) What would be the availability and performance metrics for a key value store ? What about for MySQL replication ?

- Q45) How would you deploy software to 5000 systems?

- Q46) What is caching ? Where should a large scale application cache, and what data should be cached ?


************
## Programming:

- Q1) What is your favorite scripting/programming language(s)? Why ?

- Q2) General CS, algorithms Q&A: 5 minutes

- Q3) Data structures - discuss possible implementations and applications:
    - Binary tree
    - Hash map
    - Heap

- Q4) Complexity classes - discuss and give examples:
  - Linear
  - Polynomial
  - NP Complete / NP Hard

- Q5) Sorting algorithms - discuss:
  - What is the fastest sorting algorithm?
  - What is the complexity of quick sort?

- Q6) Distributed systems:
    - What’s Paxos?
    - What's Raft?
    - What’s consistent hashing?

- Q7) Hands-on coding:
    - Inverse a string in place

- Q8) Deep Concept of DP and Graphs:

- Q9) Development Coding Questions.

- Q10) Describe a dev/test/production workflow using GIT
  - Feature branching vs trunk based development
  - Advantages of requiring pull requests and approvals
  
- Q11) More on Front-end Developer Job Interview Questions


***********

## OS-LINUX:

- Q1) How can you view running processes?
  - ps aux
  - top(htop)

- Q2) How do you check server uptime?
  - uptime
  - top

- Q3) How do you start/stop services?
  - (deprecated) service start/stop service_name
  - systemctl strat/stop service_name

- Q4) How do you display the shell’s environment variables?
  - env
  - printenv

- Q5) What does #!/bin/bash at the top of a script do?
  - It say to shell, what interpreter to use when run this script

- Q6) What does "&" after a command do?
  - It run command in background

- Q7) What does piping commands mean?
  - piping with '|' transfer stdout of one command to another, for example,
  `ps aux | grep httpd` - first command show all running processes, then, transfer stdout to stdin of second command, whose find only strings where 'httpd'.

- Q8) What distributions have you used on servers?Why?
  - Ubuntu - very fresh kernels and packages
  - CentOS/RHEL - Enterprise and stability

- Q9) What is your favorite editor?

- Q10) What is RAID? What is RAID0, RAID1, RAID5, RAID10?

- Q11) Describe the general file system hierarchy of a Linux system.

- Q12) Describe what each of the following command line utilities do:
  - tee
  - awk
  - tr
  - cut
  - curl
  - tail
  - sed


- Q13)Command line demo:
  - Search for "my konfu is the best" in all *.py files
  - Replace the occurrence of "my konfu is the best" with "I'm a linux jedi master" in all *.txt files
  - Find all files which have been accessed within the last 30 days
  
- Q14) What is the difference between virtual memory and swap ?

- Q15) What is the difference between hardlinks and symlinks?

- Q16) What is an inode and what fields are stored in an inode?

- Q17) What are zombie processes ?

- Q18) Can you have several HTTPS virtual hosts sharing the same IP?
  - Yes, I can. I can setup several virtual hosts on one IP and split up yhem with different ports.

- Q19) What is the difference between processes and threads?

- Q20) What is the difference between exec and fork?

- Q21) How nginx can handle a lot of connections? What does it use inside?
  - Example of answer: Eventloop.

- Q22) What is "nohup" used for?

- Q23) What is an atomic operation?

- Q24) I've added my public ssh key into authorized_keys but I'm still getting a password prompt, what can be wrong?

- Q25) How do you catch a SIGHUP ? What about SIGSEGV ? What about SIGKILL ?

- Q26) What is the Linux Kernel OOM and how does it work ?

- Q27) What's a chroot jail?

- Q28) Describe the Linux boot process with as much detail as possible, starting from when the system is powered on and ending when you get a prompt.

- Q29) What's LD_PRELOAD and when is it used?

- Q30) You ran a binary and nothing happened. How would you debug this?
  - I run binary with strace, for example: strace binary_name

- Q31) When can a socket receive E_AGAIN ?

- Q32) What is a dynamically/statically linked file?

- Q33) A careless sysadmin executes the following command: chmod 444 /bin/chmod - what do you do to fix this?

- Q34) I've lost my root password, what can I do?

- Q35) You have accidentally deleted a running script, how could you restore it ?

- Q36) What load balancers have you used ?

- Q37) AWS:
    - What is the difference between an AMI and an instance ?
    - What’s EBS ? What’s an EBS snapshot ? What is the real cost of having an EBS snapshot ?
    - What’s a VPC ?
    - What’s the difference between a region and an availability zone ?
    - What’s an ELB ?
    - What’s S3 ? What are the features supported on S3 ?

- Q38) What is your experience with Linux? When you can set up an application on multiple operating systems, on which one would you prefer to set it up and why?

- Q39) Explain what each of the following commands does and give an example on how to use it:

  - ls
  - rm
  - rmdir (can you achieve the same result by using rm?)
  - grep
  - wc
  - curl
  - touch
  - man
  - nslookup or dig
  - df

- Q40) Running the command df you get "command not found". What could be wrong and how to fix it?

- Q41) How to make sure a service will start on a OS of your choice?

- Q42) How do you schedule tasks periodically?
  - with cron

- Q43) Have you scheduled tasks in the past? What kind of tasks?

- Permissions
- Q44) How to change the permissions of a file?

- Q45) What does the following permissions mean?:

  - 777 
  - 644
  - 750

- Q46) Explain what is setgid, setuid and sticky bit?You try to delete a file but it fails. Name at least three different reason as to why it could happen.
  
- Q47) What is systemd?On a system which uses systemd, how would display the logs?

- Debugging

- Q48) What are you using for troubleshooting and debugging network issues?

- Q49) What are you using for troubleshooting and debugging disk & file system issues?

- Q50) What are you using for troubleshooting and debugging process issues?

- Q51) What are you using for debugging CPU related issues?

- Q52) You get a call saying "my system is slow" - how would you deal with it?

- Q53) How to debug binaries?

- Q54) What is a Linux kernel module and how do you load a new module?

- Q55) What is KVM?

- Q56) What is the difference between SSH and SSL?

- Q57) What is SSH port forwarding?

- Q58)Explain redirection

- Q59) What are wildcards? Can you give an example of how to use them?

- Q60) What do we grep for in each of the following commands?:

  - grep '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}' some_file
  - grep -E "error|failure" some_file
  - grep '[0-9]$' some_file

- Q61) Tell me everything you know about Linux boot process?

- Q63) What is an exit code? What exit codes are you familiar with?


- Q64) What is the difference between a soft link and hard link?

- Q65) What happens when you delete the original file in case of soft link and hard link?

- Q66) What is a swap partition? What is it used for?

- Q67) You are trying to create a new file but you get "File system is full". You check with df for free space and you see you used only 20% of the space. What could be the problem?

- Q68) What do you know about LVM?

- Q69) Explain the following in regards to LVM:

  - PV
  - VG
  - LV


- Q70) What is NFS? What is it used for?

- Q71) What RAID is used for? Can you explain the differences between RAID 0, 1, 5 and 10?

- Q72) What is lazy umount?

- Q73) Fix the following commands:

  - ```sed "s/1/2/g' /tmp/myFile```
  - ```find . -iname *.yaml -exec sed -i "s/1/2/g" {} ;```

- Q74) Explain what is stored in each of the following paths and if there is anything unique about it:

- Q75) What is chroot?

- Processes

- Q76) How to run a process in the background and why to do that in the first place?

- Q77) How can you find how much memory a specific process consumes?

- Q78) What signal is used when you run 'kill '?

- Q79) What signals are you familiar with?

- Q80) What is a trap?

- Q81) What happens when you press ctrl + c?

- Q82) What are daemons?

- Q83) What are the possible states of a process in Linux?

- Q84) What is a zombie process? How do you get rid of it?

- Q85) What is the init process?

- Q86) How to change the priority of a process? Why would you want to do that?

- Q87) Can you explain how network process/connection is established and how it's terminated?>

- Q88) What are system calls? What system calls are you familiar with?

- Q89) What strace does?

- Q90) Find all the files which end with '.yml' and replace the number 1 in 2 in each file

- Q91) How to check how much free memory a system has? How to check memory consumption by each process?

- Q92) How would you split a 50 lines file into 2 files of 25 lines each?

- Q92) What is a file descriptor? What file descriptors are you familiar with?

- Q93) What's an inode?

- Q94) How to list active connections?

- Q95) What is NTP? What is it used for?

- Q96) Explain Kernel OOM

- Q97) What is SELiunx?

- Q98) What is Kerberos?

- Q99) What is nftables?

- Q100) What firewalld daemon is responsible for?
  
- Network

- Q101) What is a network namespace? What is it used for?

- Q102) How can you turn your Linux server into a router?

- Q103) What is a virtual IP? In what situation would you use it?

- Q104) Which port is used in each of the following protocols?:

  - SSH
  - HTTP
  - DNS
  - HTTPS


- Q105) What is the routing table? How do you view it?

- Q106) What are packet sniffers? Have you used one in the past? If yes, which packet sniffers have you used and for what purpose?

- DNS

- Q107) What is DNS? Why do we need it?

- Q108) What the file /etc/resolv.conf is used for? What does it include?

- Q109) What is a "A record"?

- Q110) What is a PTR record?

- Q111) What is a MX record?

- Q112) Is DNS using TCP or UDP?

- Packaging

- Q113) Do you have experience with packaging? Can you explain how it works?
  - RPM: explain the spec format(what it should and can include)

- Q114) How do you list the content of a package without actually installing it?

- Applications and Services
- Q115) What is a load balancer?
  
- Q116) What load balancer algorithms are you familiar with?

- Q117) What is a proxy?

- Q118) What is a reverse proxy?

- Q119)What can you find in /etc/services

- Q120) You run ssh 127.0.0.1 but it fails with "connection refused". What could be the problem?

- Q121) What happens when you execute ls?. Provide a detailed answer

- Q122) Can you describe how processes are being created?


- Q123) What is the difference between a process and a thread?

- Q124) When you run ip a you see there is a device called 'lo'. What is it and why do we need it?

- Q125) What traceroute command does? How it works?

- Q126) What is network bonding? What types are you familiar with?

- Q127) How to link two separate network namespaces so you can ping an interface on one namespace from the second one?

- Q128) What are cgroups? In what scenario would you use them?

- Q129) How to create a file of a certain size?

- Q130) What are the differences between the following system calls?: exec(), fork(), vfork() and clone()?

- Q131) Explain Process Descriptor and Task Structure?

- Q132) What are the differences between threads and processes?

- Q133) Explain Kernel Threads

- Q134What happens when socket system call is used?

- Q135) You executed a script and while still running, it got accidentally removed. Is it possible to restore the script while it's still running?

******************

## Networking:

- Q1) What is IPv6 ? Why should we care?

- Q2) How does ping work ? What about traceroute ?

- Q3) I type http://www.yahoo.com in my browser’s URL bar and I press enter. What happens ? (discuss at every OSI layer - Physical, data link, network, transport, session, presentation, application)
    - DNS & anycast, IP, UDP, routing, BGP, TCP, HTTP, transparent proxy
    - What is BGP?
    - What’s a PTR in DNS? Why should we care?

- Q4) What if I change from http://www.yahoo.com to https://www.yahoo.com  ?
    - Public/private certificates, CAs, proxying, MiTM, etc.

- Q5) What happens when I press the send button in my email client ?

- Q6) How do we prevent bots crawling ? How would you deal with a syn flood ?

- Q7) How many hosts in a /24  network? What about a /22 ?

- Q8) What is the difference between DNAT and SNAT ? When do you use either ?

- Q9) What is a virtual IP address? What is a cluster?
  
- Q10) What is IPv6 ? Why should we care?



- Q11) What is Ethernet?

- Q12) What is a MAC address? What is it used for?

- Q13) When this MAC address is used?: ff:ff:ff:ff:ff:ff

- Q14) What is an IP address?

- Q15) Explain subnet mask and given an example

- Q16) What is a private IP address? What do we need it for?

- Q17) Explain the OSI model. What layers there are? What each layer is responsible for?

- Q18) For each of the following determine to which OSI layer it belongs:

  - Error correction
  - Packets routing
  - Cables and electrical signals
  - MAC address
  - IP address
  - Sessions between applications
  - 3 way handshake

- Q19) What delivery schemes are you familiar with?

- Q20)What is CSMA/CD? Is it used in modern ethernet networks?

- Q21) Describe the following network devices and the difference between them:

  - router
  - switch
  - hub

- Q22) What is NAT?

- Q23) What is a proxy? How it works? What do we need it for?

- Q24) What is the difference between TCP and UDP?

- Q25) Explain "default gateway"

- Q26) How TCP works? What is the 3 way handshake?

- Q27) What is ARP? How it works?

- Q28) What is TTL?

- Q29) What is DHCP? How it works?

- Q30) What is SSL tunneling? How it works?

- Q31) What is a socket? Where can you see the list of sockets in your system?

- Q32) What is IPv6? Why should we consider using it if we have IPv4?

- Q33) What is VLAN?

- Q34) What is MTU?

- Q35) True or False?. Ping is using UDP because it doesn't care about reliable connection

- Q36) What is SDN?

- Q37) What is ICMP? What is it used for?

- Q38) What is NAT? How it works?

- Q39) Explain Spanning Tree Protocol (STP)

- Q40) What is link aggregation? Why is it used?

- Q41) What is Asymmetric Routing? How do deal with it?

- Q42) What overlay (tunnel) protocols are you familiar with?

- Q43) What is GRE? How it works?

- Q44) What is VXLAN? How it works?

- Q45) What is SNAT?

- Q46) Explain OSPF

- Q47) Explain Spine & Leaf

- Q48) Using Hamming code, what would be the code word for the following data word 100111010001101?


*******************

## Security:


- Q1) What is the importance of SSL?

- Q2) What is a SQL injection?

- Q3) What is cross-site scripting (XSS)?

- Q4) Why shouldn’t you roll your own crypto?

- Q5) How are passwords stored on databases?

- Q6) What is a Man-in-the-middle attack?

- Q7) How do you safely manage environment variables in a cloud environment?

- Q8) How do you manage security updates?

- Q9) How do you keep encryption keys and credentials secure but make them available to machines that need them?


**********************


## Docker

- Q1) What is docker for?

- Q2) How to ask docker cli to show all containers&

- Q3) How to delete image with container, who use this image?

- Q4) What command help you to delete all old unused images?

- Q5) What is docker-compose? What is docker-compose.yml?

- Q6) How to expose ports in docker-compose file?

- Q7) How to reduce docker images?

- Q8) Where you  can store docker images?

- Q9) What is alpine and why we need it?

*********************


##  kubernetes



**********************


## Architecture:


******************


## Infrastructure as Code:



*******************

## Setup


**************


## Testing
