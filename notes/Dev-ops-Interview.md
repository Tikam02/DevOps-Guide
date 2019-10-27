 ![Learn](https://img.shields.io/badge/Interview-Preparation-blueviolet?style=for-the-badge)

*********
## Topics

* [DevOps](#devops)
* [Programming](#programming)
* [OS-LINUX](#os-linux)
* [Networking](#networking)
* [Security](#security)
* [Architecture](#architecture)
* [Setup](#setup)
* [Infrastructure as Code](#infrastructure-as-code)
* [CI-CD](#ci-cd)
* [Testing](#testing)

***********
### Top 5 DevOps Tools You Should Know In 2019

#### Ansible

- Ansible is a quite simple software provisioning, configuration management and application deployment          tool, which ensures faster time-to-market for your applications. Whether you are a one-man company or an enterprise, you can automate orchestration, cloud provisioning, computing machines deployment and other tasks. I like Ansible because it is not as complex as Puppet or Chef, but speeds up productivity just as well.

   - Ansible playbooks are written in YAML, which is one of the easiest data-serialization languages for creating configuration files.
   - It’s fast, performs all its functions over SSH and doesn't require agent installation.
    -It allows you to create groups of servers, describe how these should be configured and what actions should be performed on these machines.



#### Jenkins
 - A lot of DevOps engineers call Jenkins the best CI/CD tool available in the market, since it’s incredibly useful. Jenkins is an automation server that is written in Java and is used to report changes, conduct live testing and distribute code across multiple machines. As Jenkins has a built-in GUI and over 1,000 plugins to support building and testing your application, it is considered a really powerful, yet easy to use tool. Thanks to these plugins, Jenkins integrates well with practically every other instrument in the continuous integration and continuous delivery toolchain.

    - Easy to install and a lot of support available from the community.
    - 1,000+ plugins are available and easy to create your own, if needed.
    - It can be used to publish results and send email notifications.

#### Docker

- Docker is a software containerization platform that allows DevOps to build, ship, and run distributed processes within containers. This gives developers the ability to create predictable environments that are isolated from the rest of the applications and can be run anywhere. Containers are isolated but share the same OS kernel. This way you get to use hardware resources more efficiently compared to virtual machines.

- Each container can hold a single process, like a web server or database management system. You can create a cluster of containers distributed across different nodes to have your application up and running in both load balancing and high availability modes. Containers can communicate on a private network, as you most likely want to keep some of your application parts private for security purposes. Simply expose your web server to the Internet and you are good to go.

- What I like most is that you can install Docker on your computer to run containers locally to make some ad-hoc software tests without installing its dependencies globally. When you are done, you simply terminate your Docker container and your computer is as clean as new.

    - Build once, run anywhere! You can package an application from your laptop and run it unmodified on any public/private cloud or bare metal server.
    - Containers are lightweight and fast.
    - Docker Hub offers many official and community-built public Docker images.
    - Separating different components of a large application into containers have security benefits: if one container is compromised, others remain unaffected.

####  Kubernetes

- While Docker allows developers to build, ship and run applications in containers easily, Kubernetes makes running containers in a cluster as easy as ever. You can automatically deploy, scale, monitor and manage your cloud-native application with Kubernetes. It is a powerful orchestrator that allows you to manage communication between containerized components, known as pods, and coordinate them as a cluster.

- Kubernetes has now become the heart of a microservices application. The ecosystem around it is expanding by the minute with the Cloud Native Computing Foundation ensuring its future success. There are now many additional observability, networking, and distributed data storage services that complement Kubernetes in building a loosely coupled distributed system that is resilient, manageable and observable.

    - Open-source orchestrator.
    - Easy container management.
    - Horizontal autoscaling — If you get high loads, you can replicate your pods and balance the load across them to avoid downtime.
    - Self-healing, Automated Rollouts and Rollbacks — If something goes wrong, you can automatically replace, restart, reschedule your containers or rollout/rollback to the desired state of the containerized application.
    - Service Discovery — Kubernetes uses unique IP addresses and can put a set of containers behind a single DNS name. This allows you easily track and identify your across the cluster.


####  RabbitMQ

- RabbitMQ is a great messaging and queuing tool that you can use for applications that runs on most operating systems. Managing queues, exchanges and routing with it is a breeze. Even if you have an elaborate configuration to be built, it’s relatively easy to do so, since the tool is really well-documented. You can stream a lot of different high-performance processes and avoid system crashes through a friendly user interface. It's a durable and robust messaging broker that is worth your attention. As RabbitMQ developers like to say, it’s "messaging that just works."

    - Guaranteed message delivery.
    - Push work into background processes, freeing your web server up to handle more users.
    - Scale the most frequently used parts of your system, without having to scale everything.
    - Handling everything with ease even if it seems to be a huge crash.


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

*********************

### DevOps Interview Questions


#### Q1) Can you tell us the fundamental differences between DevOps & Agile?
- A: Although DevOps shares some similarities with the Agile methodology, which is one of the most popular SDLC methodologies, both are fundamentally different approaches to software development. Following are the various fundamental differences between the two:

    - Agile Approach – The agile approach is only meant for development in Agile while the agile approach is meant for both development and operations in DevOps.

    - Practices and Processes – While agile involves practices such as Agile Scrum and Agile Kanban, DevOps involves processes such as CD (Continuous Delivery), CI (Continuous Integration), and CT (Continuous Testing).

    - Priority – Agile prioritizes timeliness whereas, DevOps gives equal priority to timeliness and quality.

    - Release Cycles – DevOps offers smaller release cycles with immediate feedback while Agile offers only smaller release cycles without immediate feedback.

    - Feedback Source – Agile relies on feedback from customers while feedback from self (monitoring tools) is involved in DevOps.

    - Scope of Work – For Agile, the scope of work is agility only but for DevOps, it is agility and the need for automation.

#### Q2) Why do we need DevOps?

  - A: Organizations these days are trying to transport small features to customers via a series of release trains instead of releasing big feature sets. There are several benefits of doing so, including better software quality and quick customer feedback.

  - All such benefits lead to a higher level of customer satisfaction, which is the most important goal for any product development project. To do so, companies need to:

      - Increase deployment frequency
      - Lessen lead time between fixes
      - Lower failure rate of new releases
      - In case of new release crashing, have a faster mean time to recovery

  - DevOps helps in fulfilling all these requirements and thus, achieving seamless software delivery. Full-fledged organizations like Amazon, Etsy, and Google have adopted DevOps methodology resulting in achieving performance levels that were previously uncharted.

  - With the adoption of DevOps methodology, organizations are able to accomplish tens to thousands of deployments in a single day. Moreover, doing so while offering first-rate reliability, security, and stability.

#### Q3) What are the important business and technical benefits of using DevOps?

- A: DevOps brings a lot of business and technical benefits to the table. Some of the most important ones are listed down as follows:

    - Business benefits:

      - Enhanced operating environment stability
      - Faster delivery of features
      - More time for adding value to the product

    - Technical benefits:

      - Continuous software delivery
      - Faster problem resolution
      - Lesser complex problems

#### Q4) Can you name some of the most-used DevOps tools?

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

#### Q5) What is Selenium used for?

  - A: Selenium is used for continuous testing in DevOps. The tool specializes in functional and regression forms of testing.

#### Q6) What do you understand by Puppet in DevOps?
  
  - A: It is a configuration management tool that is used for automating administration tasks. Puppet makes use of the Master-Slave architecture in which the two entities communicate via an encrypted channel.

  - System admins need to perform a lot of repetitive tasks, notably installing and configuring servers. Writing scripts for automating such tasks is an option but it becomes hectic when the infrastructure is large. Configuration management is a great workaround for this.

  - Puppet helps in configuring, deploying, and managing servers. Not only does it make such redundant tasks easier but also cuts a significant portion of the total work time. The mature configuration management tool:

      - Continuously checks whether the needed configuration for a host is in place or not. If altered, the configuration is automatically reverted back
      - Defines distinct configurations for every host
      - Does dynamic scaling (up and down) of machines
      - Provides control over all the configured machines so that a centralized change can automatically get propagated to all of them

#### Q7) What do you understand by anti-patterns of DevOps?
  
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

#### Q8) DevOps has something called CI. What is it and what is its purpose?
- A: CI in DevOps stands for Continuous Integration. CI is a development practice in which developers integrate code into a shared repository multiple times in a single day.

- Continuous Integration of development and testing enhances the quality of the software as well as reducing the total time required for delivery.

- The developer has broken the build if a team member checking in code runs into a compilation failure. As such, other developers are not able to sync with the shared source code repository without introducing compilation errors into their own workspaces.

- This disrupts the collaborative and shared development process. Hence, as soon as a CI build breaks, it’s important to identify and correct the problem immediately.

- Typically, a CI process includes a suite of unit, integration, and regression tests that run each time the compilation succeeds. In case any of the aforesaid tests fail, the CI build is considered unstable (which is common during an Agile sprint when development is ongoing) and not broken.

#### Q9) More often than not we hear shift left in DevOps. What is it?
- A: The traditional software development lifecycle when graphed on a paper has two sides, left and right. While the left side of the graph includes design and development, the right side includes production staging, stress testing, and user acceptance.

- To shift left in DevOps simply means the necessity of taking as many tasks on the right i.e. that typically happens toward the end of the application development process and incorporate them into earlier stages of a DevOps methodology.

- There are several ways of accomplishing a shit left in DevOps, most notably:
 - Create production-ready artifacts at the end of every Agile sprint 
 - Incorporating static code analysis routines in every build

- The level of doing the DevOps the right way is directly dependent on the degree of shifting left as much as possible.

#### Q10) What does CAMS in DevOps stand for?
- A: The acronym CAMS is usually used for describing the core creeds of DevOps methodology. It stands for:

 - Culture
 - Automation
 - Measurement
 - Sharing

#### Q11) What are the several KPIs used to gauge DevOps success?
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

#### Q12) In your opinion, what are the major benefits of implementing DevOps automation?
- A: Following are the major benefits of implementing DevOps automation:

- Removal of the possibility of human error from the CD equation (Core benefit)

- As tasks become more predictable and repeatable, it is easy to identify and correct when something goes wrong. Hence, it results in producing more reliable and robust systems

- Removes bottlenecks from the CI pipeline. It results in increased deployment frequency and decreased number of failed deployments. Both of them are important DevOps KPIs

#### Q13) What do you understand by containers?
- A: Containers are a form of lightweight virtualization that help in providing isolation among processes. Containers are heavier than a chroot but lighter than a hypervisor.

#### Q14) Microservices are a core part of DevOps. Can you name any two popular Java development frameworks for creating microservices?
- A: There are several Java frameworks that allow creating microservices. However, Eclipse MicroProfile and Spring Boot stand out from the herd as the two leading Java development frameworks used in DevOps for creating microservices.

#### Q15) What do you understand by a Version Control System (VCS)? Define its uses.
- A: A Version Control System or VCS is a system that is capable of recording changes made to a file or a group of files over time. Git and Mercurial are two of the most popular version control systems. Important uses of a VCS are:

 - Check what was the last modification that caused a problem
 - Compare the changes made over time
 - Identifying who introduced a new issue and at what time
 - Revert a file or files to some earlier state
 - Revert the complete project to a previous state

#### Q16) Git is a popular DevOps tool. Tell us how you will revert a commit that has already been pushed and made public.
- A: There are two ways of doing so:

    - By creating a new commit to undo all changes made by the commit that has already been pushed and made public. Following command is used for doing so:
    - git revert

    - By fixing or removing the bad file in a new commit and then pushing it to the remote repository. After making necessary changes to the file, commit it to the remote repository using the command:
    - git commit -m “commit message”

#### Q17) What are post mortem meetings?
  - A: Many times there is a need to discuss what went wrong during a DevOps process. For this, post mortem meetings are arranged. These meetings yield steps that should be taken to avoid the same failure or set of failures in the future for which the meeting was arranged in the first place.

#### Q18) Draw a comparison between Asset Management and Configuration Management.
  - A: The process of monitoring as well as maintaining things of value to an entity or group is called an Asset Management.

 - Configuration Management refers to the process of controlling, identifying, planning for, and verifying the configuration items within service in support of Change Management.

#### Q19) Can you state and explain various key elements of continuous testing?
  - A: Various key elements of continuous testing are:

      - Advanced analysis – Used for forecasting and predicting unknown future events
      - Policy analysis – Meant for improving the testing process
      - Requirement traceability – Refers to the ability to describe as well as follow the life of a requirement, from its origin to deployment
      - Risk assessment – The method or process of identifying hazards and risk factors that can cause potential damage
      - Service virtualization – Allows using virtual services instead of production services. Emulates software components for simple testing
      - Test optimization – Improve the overall testing process

#### Q20) Please explain the core operations of DevOps in terms of development and infrastructure.
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

#### Q21) What Do You Know about DevOps?

  - Your answer must be simple and straightforward. Begin by explaining the growing importance of DevOps in the IT industry. Discuss how such an approach aims to synergize the efforts of the development and operations teams to accelerate the delivery of software products, with a minimal failure rate. Include how DevOps is a value-added practice, where development and operations engineers join hands throughout the product or service lifecycle, right from the design stage to the point of deployment.


#### Q22) Why Has DevOps Gained Prominence over the Last Few Years?

  - Before talking about the growing popularity of DevOps, discuss the current industry scenario. Begin with some examples of how big players such as Netflix and Facebook are investing in DevOps to automate and accelerate application deployment and how this has helped them grow their business. Using Facebook as an example, you would point to Facebook’s continuous deployment and code ownership models and how these have helped it scale up but ensure the quality of experience at the same time. Hundreds of lines of code are implemented without affecting quality, stability, and security.

  - Your next use case should be Netflix. This streaming and on-demand video company follow similar practices with fully automated processes and systems. Mention the user base of these two organizations: Facebook has 2 billion users while Netflix streams online content to more than 100 million users worldwide.

  - These are great examples of how DevOps can help organizations to ensure higher success rates for releases, reduce the lead time between bug fixes, streamline and continuous delivery through automation, and an overall reduction in manpower costs.

#### Q23) Which Are Some of the Most Popular DevOps Tools? Do You Have Experience Working with Any of These Tools?

  - The more popular DevOps tools include:

     - Selenium
     - Puppet
     - Chef
     - Git
     - Jenkins
     - Ansible
     - Docker

#### Q24) Do You Want to Master All These Devops Tools?

  - Thoroughly describe any tools that you are confident about, what it’s abilities are and why you prefer using it. For example, if you have expertise in Git, you would tell the interviewer that Git is a distributed Version Control System (VCS) tool that allows the user to track file changes and revert to specific changes when required. Discuss how Git’s distributed architecture gives it an added edge where developers make changes locally and can have the entire project history on their local Git repositories, which can be later shared with other team members.

#### Q25) What Is Version Control and Why Should VCS Be Used?

  - Define version control and talk about how this system records any changes made to one or more files and saves them in a centralized repository. VCS tools will help you recall previous versions and perform the following:

  - Go through the changes made over a period of time and check what works versus what doesn’t.
    Revert specific files or specific projects back to an older version.
    Examine issues or errors that have occurred due to a particular change

  - Using VCS gives developers the flexibility to simultaneously work on a particular file and all modifications can be logically combined later.


#### Q26) Is There a Difference Between Agile and DevOps? If Yes, Please Explain.

  - As a DevOps Engineer, interview questions like this are quite expected. Start by describing the obvious overlap between DevOps and Agile. Although the implementation of DevOps is always in sync with Agile methodologies, there is a clear difference between the two. The principles of Agile are associated with seamless production or development of a piece of software. On the other hand, DevOps deals with the development, followed by deployment of the software, ensuring faster turnaround time, minimum errors, and reliability.

#### Q27) Why Are Configuration Management Processes and Tools Important?

  - Talk about multiple software builds, releases, revisions, and versions for each software or testware that is being developed. Move on to explain the need for storing and maintaining data, keeping track of development builds and simplified troubleshooting. Don’t forget to mention the key CM tools that can be used to achieve these objectives. Talk about how tools like Puppet, Ansible, and Chef help in automating software deployment and configuration on several servers.

#### Q28) How Is Chef Used as a CM Tool?

  - The chef is considered to be one of the preferred industry-wide CM tools. Facebook migrated its infrastructure and backend IT to the Chef platform, for example. Explain how Chef helps you to avoid delays by automating processes. The scripts are written in Ruby. It can integrate with cloud-based platforms and configure new systems. It provides many libraries for infrastructure development that can later be deployed within a software. Thanks to its centralized management system, one Chef server is enough to be used as the center for deploying various policies.


#### Q29) How Would You Explain the Concept of “Infrastructure as Code”(IaC)?

  - It is a good idea to talk about IaC as a concept, which is sometimes referred to as a programmable infrastructure, where infrastructure is perceived in the same way as any other code. Describe how the traditional approach to managing infrastructure is taking a back seat and how manual configurations, obsolete tools, and custom scripts are becoming less reliable. Next, accentuate the benefits of IaC and how changes to IT infrastructure can be implemented in a faster, safer and easier manner using IaC. Include the other benefits of IaC like applying regular unit testing and integration testing to infrastructure configurations, and maintaining up-to-date infrastructure documentation.

  - If you have completed a certification on Amazon Web Services (AWS), and are interviewing for niche roles such as AWS-certified DevOps engineer, here are some AWS DevOps interview questions that you must be prepared for:

#### Q30) What Is the Role of AWS in DevOps?

  - When asked this question in an interview, get straight to the point by explaining that AWS is a cloud-based service provided by Amazon that ensures scalability through unlimited computing power and storage. AWS empowers IT enterprises to develop and deliver sophisticated products and deploy applications on the cloud. Some of its key services include Amazon CloudFront, Amazon SimpleDB, - - - Amazon Relational Database Service, and Amazon Elastic Computer Cloud. Discuss the various cloud platforms and emphasize any big data projects that you have handled in the past using cloud infrastructure.


#### Q31) How Is IaC Implemented Using AWS?

  - Start by talking about the age-old mechanisms of writing commands onto script files and testing them in a separate environment before deployment and how this approach is being replaced by IaC. Similar to the codes written for other services, with the help of AWS, IaC allows developers to write, test, and maintain infrastructure entities in a descriptive manner, using formats such as JSON or YAML. This enables easier development and faster deployment of infrastructure changes.

  - Go through this Simplilearn video on “DevOps Interview Questions” delivered by our DevOps certification expert that will help you crack any interview.


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

### OS-LINUX:

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


* What is the importance of SSL?

* What is a SQL injection?

* What is cross-site scripting (XSS)?

* Why shouldn’t you roll your own crypto?

* How are passwords stored on databases?

* What is a Man-in-the-middle attack?

* How do you safely manage environment variables in a cloud environment?

* How do you manage security updates?

* How do you keep encryption keys and credentials secure but make them available to machines that need them?


**********************


### CI-CD:



*********************


###  System Setup:



**********************


### Architecture:


******************


### Infrastructure as Code:



*******************

### Setup


**************


### Testing
