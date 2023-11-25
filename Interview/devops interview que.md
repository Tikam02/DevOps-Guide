

DevOps Interview Questions

1. List the essential DevOps tools?
Answer:

Git
Jenkins
Selenium
Puppet
Chef
Ansible
Nagios
Docker
Monit
ELK –Elasticsearch, Logstash, Kibana
Collected/Collect
Git(GitHub)

2. Why Hybrid Clouds are so important?
Answer: Cloud Bursting:
Access capacity or specialized software is available in the public cloud and not in a private cloud
Examples: Virtual Amazon and Dynamo
Leverage the best of both worlds:
VCloud:
It is VM Ware cloud
It is Expensive
Enterprise quality
Open stack:
It has commodity servers and storage.
It is less reliable.
We can run Web servers on OpenStack.
The database is built on VCloud.

3. Explain how can I vertically scale an Amazon instance?
Answer: This is one of the essential features of AWS and cloud virtualization. SpinUp a newly developed large instance where we pause that instance and detach the root Ebs volume from the server and discard. Later stop your live instance, detach its root volume connected. Note down the unique device ID and attach the same root volume to the new server. And restart it again. This results in a vertically scaled Amazon instance.

Server group provides 80 and 443 from around the world, but only port 22 are vital among the jump box group. Database group allows port 3306 from the webserver group and port 22 from the jump box group. Addition of any machines to the webserver group can store in the database. No one can directly ssh to any of your boxes.

4. What are the building blocks in cloud architecture?
Answer:

Reference architecture
Technical architecture
Deployment operation architecture
Reference architecture
Technical architecture
Deployment operation architecture

5. DevOps Toolchain?
Answer: DevOps Toolchain:

Code: code development and review, source code management tools, code merging
Build: continuous integration tools, build status
Test: continuous testing tools that provide feedback on business risks
Package: artifact repository, application pre-deployment staging
Release: change management, release approvals, release automation
Configure: infrastructure configuration and management, Infrastructure as Code tools
Monitor: applications performance monitoring, end-user experience
Some categories are more essential in a DevOps toolchain than others; especially continuous integration (e.g. Jenkins) and infrastructure as code (e.g. Puppet).
Source: Wikipedia
We have the comprehensive DevOps Training Courses to give you a head start in your career.

6. Mention some important features of Memcached?
Answer: Important features of Memcached includes:
CAS Tokens: A CAS token is attached to any object retrieved from cache. You can use that token to save your updated object.
Callbacks: It simplifies the code
Get Delayed: It reduces the delay time of your script which is waiting for results to come back from the server
Binary protocol: You can use binary protocol instead of ASCII with the newer client

In binary: Previously, the client always used to do serialization of the value with complex data, but with Memcached, you can use the binary option.

7. How is DevOps different from Agile / SDLC?
Answer: I would advise you to go with the below explanation:
Agile is a set of values and principles about how to produce i.e. develop software. Example: if you have some ideas and you want to turn those ideas into working software, you can use the Agile values and principles as a way to do that. But, that software might only be working on a developer’s laptop or in a test environment. You want a way to quickly, easily and repeatably move that software into production infrastructure, in a safe and simple way. To do that you need DevOps tools and techniques.

You can summarize by saying Agile software development methodology focuses on the development of software but DevOps, on the other hand, is responsible for development as well as the deployment of the software in the safest and most reliable way possible. Here’s a blog that will give you more information on the evolution of DevOps.

8. List the major difference between the Agile and DevOps?
Agile:
Agile is about software development
Devops:
DevOps is about software deployment and management.
DevOps does not replace Agile or Lean. It does this by killing waste, removing handovers, and streamlining deployments to allow faster and more continuous deployments to PRODUCTION.

9. What are the core roles of DevOps Engineers in terms of development and Infrastructure?
Answer:

The core job roles of DevOps Engineer
Application development
Code developing
Code coverage
Unit testing
Packaging
Deployment With infrastructure
Continuous Integration
Continuous Testing
Continuous Deployment
Provisioning
Configuration
Orchestration
Deployment

10. What is Version control?
Answer: This is probably the easiest question you will face in the interview. My suggestion is to first give a definition of Version control. It is a system that records changes to a file or set of files over time so that you can recall specific versions later. Version control systems consist of a central shared repository where teammates can commit changes to a file or set of file. Then you can mention the uses of version control.

Revert files back to a previous state.
Revert the entire project back to a previous state.
Compare changes over time.
See who last modified something that might be causing a problem.
Who introduced an issue and when.

11. How would you prepare for migration?
Answer: This question evaluates your experience of real projects with all the awkwardness and complexity they bring. Include terms like cut-over, dress rehearsals, roll-back and roll-forward, DNS solutions, feature toggles, branch by abstraction, and automation in your answer. Developing greenfield systems with little or no existing technology in place is always easier than having to deal with legacy components.

12. Explain Security management in terms of Cloud Computing?
Answer: Identity management access provides the authorization of application services.
Access control permission is given to the users to have complete controlling access of another user who is entering into the cloud environment.
Authentication and Authorization provide access to only the authorized and authenticated users only to access the data and applications.

13. What are the anti-patterns of DevOps?
Answer: A pattern is a common usage usually followed. If a pattern commonly adopted by others does not work for your organization and you continue to blindly follow it, you are essentially adopting an anti-pattern. There are myths about DevOps. (oracle apex training online )

14. How do all these tools work together?
Answer:
Given below is a generic logical flow where everything gets automated for seamless delivery. However, this flow may vary from organization to organization as per the requirement.
Developers develop the code and this source code is managed by Version Control System tools like Git etc.
Developers send this code to the Git repository and any changes made in the code is committed to this Repository.
Jenkins pulls this code from the repository using the Git plugin and builds it using tools like Ant or Maven.
Configuration management tools like puppet deploys & provisions testing environment and then Jenkins releases this code on the test environment on which testing is done using tools like selenium.
Once the code is tested, Jenkins send it for deployment on the production server (even production server is provisioned & maintained by tools like a puppet).
After deployment, It is continuously monitored by tools like Nagios.
Docker containers provide a testing environment to test the build features.

15. What is the difference between Active and Passive check in Nagios?
Answer: For this answer, first, point out the basic difference Active and Passive checks. The major difference between Active and Passive checks is that Active checks are initiated and performed by Nagios, while passive checks are performed by external applications.
If your interviewer is looking unconvinced with the above explanation then you can also mention some key features of both Active and Passive.

16. Mention what are the key aspects or principle behind DevOps?
Answer: The key aspects or principle behind DevOps is

Infrastructure as code
Continuous deployment
Automation
Monitoring
Security

17. What DevOps tools have you worked with?
Answer: Software configuration management and build/release (version control) tools, including Apache Subversion, Mercurial, Fossil and others, help document change requests. Developers can more easily follow the company’s best practices and policies while software changes.
Continuous integration (CI) tools such as Rational Build Forge, Jenkins and Semaphore merge all developer copies of the working code into a central version. These tools are important for larger groups where teams of developers work on the same codebase simultaneously. QA experts use code analyzers to test software for bugs, security, and performance. If you’ve used HP’s Fortify Static Code Analyzer, talk about how it identified security vulnerabilities in coding languages. Also speak about tools like Gramma Tech’s Code Sonar that you used to identify memory leaks, buffer underruns and other defects for C/C++ and Java code. It is essential that you have an adequate command of the principal languages like Ruby, C#, .NET, Perl, Python, Java, PHP, Windows Power Shell, and are comfortable with the associated OS environments Windows, Linux, and Unix.

18. What testing is necessary to ensure a new service is ready for production?
Answer: DevOps is all about continuous testing throughout the process, starting with development through to production. Everyone shares the testing responsibility. This ensures that developers are delivering code that doesn’t have any errors and is of high quality, and it also helps everyone leverage their time most effectively. ( oracle apex training online )

19. What is State Stalking in Nagios?
Answer: I will advise you to first give a small introduction on State Stalking. It is used for logging purposes. When Stalking is enabled for a particular host or service, Nagios will watch that host or service very carefully and log any changes it sees in the output of check results.
Depending on the discussion between you and interviewer you can also add, “It can be very helpful in later analysis of the log files. Under normal circumstances, the result of a host or service check is only logged if the host or service has changed state since it was last checked.

20. What is meant by Continuous Integration?
Answer:
I will advise you to begin this answer by giving a small definition of Continuous Integration (CI). It is a development practice that requires developers to integrate code into a shared repository several times a day. Each check-in is then verified by an automated build, allowing teams to detect problems early.
I suggest that you explain how you have implemented it in your previous job. You can refer to the below-given example:
Developers check out code into their private workspaces.
When they are done with it they commit the changes to the shared repository (Version Control Repository).
The CI server monitors the repository and checks out changes when they occur.
The CI server then pulls these changes and builds the system and also runs unit and integration tests.
The CI server will now inform the team of the successful build.
If the build or tests fail, the CI server will alert the team.
The team will try to fix the issue at the earliest opportunity.
This process keeps on repeating.

21. Why do you need a Continuous Integration of Dev & Testing?
Answer: For this answer, you should focus on the need for Continuous Integration. My suggestion would be to mention the below explanation in your answer:
Continuous Integration of Dev and Testing improves the quality of software and reduces the time taken to deliver it, by replacing the traditional practice of testing after completing all development. It allows the Dev team to easily detect and locate problems early because developers need to integrate code into a shared repository several times a day (more frequently). Each check-in is then automatically tested. ( data science training )

22. What is Git?
Answer: I will suggest that you attempt this question by first explaining the architecture of git as shown in the below diagram. You can refer to the explanation given below:

Git is a Distributed Version Control system (DVCS). It can track changes to a file and allows you to revert back to any particular change.
Its distributed architecture provides many advantages over other Version Control Systems (VCS) like SVN one major advantage is that it does not rely on a central server to store all the versions of a project’s files. Instead, every developer “clones” a copy of a repository I have shown in the diagram below with “Local repository” and has the full history of the project on his hard drive so that when there is a server outage, all you need for recovery is one of your teammate’s local Git repository.

There is a central cloud repository as well where developers can commit changes and share it with other teammates as you can see in the diagram where all collaborators are committing changes “Remote repository”. ()

23. Explain what is Memcached?
Answer: Memcached is a free and open-source, high-performance, distributed memory object caching system. The primary objective of Memcached is to enhance the response time for data that can otherwise be recovered or constructed from some other source or database. It is used to avoid the need to operate SQL database or another source repetitively to fetch data for the concurrent request.
Memcached can be used for

Social Networking -> Profile Caching
Content Aggregation -> HTML/ Page Caching
Ad targeting -> Cookie/profile tracking
Relationship -> Session caching
E-commerce -> Session and HTML caching
Location-based services -> Database query scaling
Gaming and entertainment -> Session caching
Memcache helps in
Speed up application processes
It determines what to store and what not to
Reduce the number of retrieval requests to the database
Cuts down the I/O ( Input/Output) access (hard disk)
The drawback of Memcached is
It is not a persistent data store
Not a database
It is not an application-specific
It cannot cache large object

24. What is Automation Testing?
Answer: Automation testing or Test Automation is a process of automating the manual process to test the application/system under test. Automation testing involves the use of separate testing tools which lets you create test scripts which can be executed repeatedly and doesn’t require any manual intervention.

25. How to launch the Browser using WebDriver?
Answer:
The following syntax can be used to launch Browser:

WebDriver driver = new FirefoxDriver();
WebDriver driver = new ChromeDriver();
WebDriver driver = new InternetExplorerDriver();

26. What are the goals of Configuration management processes?
Answer: The purpose of Configuration Management (CM) is to ensure the integrity of a product or system throughout its life-cycle by making the development or deployment process controllable and repeatable, therefore creating a higher quality product or system. The CM process allows orderly management of system information and system changes for purposes such as to:

Revise capability,
Improve performance,
Reliability or maintainability,
Extend life,
Reduce cost,
Reduce risk and
Liability, or correct defects.

27. What is Chef?
Answer: Begin this answer by defining Chef. It is a powerful automation platform that transforms infrastructure into code. A chef is a tool for which you write scripts that are used to automate processes. What processes? Pretty much anything related to IT.
Now you can explain the architecture of Chef, it consists of:

Chef Server: The Chef Server is the central store of your infrastructure’s configuration data. The Chef Server stores the data necessary to configure your nodes and provides search, a powerful tool that allows you to dynamically drive node configuration based on data.

Chef Node: A Node is any host that is configured using Chef-client. Chef-client runs on your nodes, contacting the Chef Server for the information necessary to configure the node. Since a Node is a machine that runs the Chef-client software, nodes are sometimes referred to as “clients”.

Chef Workstation: A Chef Workstation is a host you use to modify your cookbooks and other configuration data.

28. What is Continuous Testing?
Answer: I will advise you to follow the below-mentioned explanation:
Continuous Testing is the process of executing automated tests as part of the software delivery pipeline to obtain immediate feedback on the business risks associated with the latest build. In this way, each build is tested continuously, allowing Development teams to get fast feedback so that they can prevent those problems from progressing to the next stage of Software delivery life-cycle. This dramatically speeds up a developer’s workflow as there’s no need to manually rebuild the project and re-run all tests after making changes.

29. What are the success factors for Continuous Integration?
Answer: Here you have to mention the requirements for Continuous Integration. You could include the following points in your answer:

Maintain a code repository
Automate the build
Make the build self-testing
Everyone commits to the baseline every day
Every commit (to baseline) should be built
Keep the build fast
Test in a clone of the production environment
Make it easy to get the latest deliverables
Everyone can see the results of the latest build
Automate deployment.

30. What is Puppet?
Answer: I will advise you to first give a small definition of Puppet. It is a Configuration Management tool which is used to automate administration tasks.

Now you should describe its architecture and how Puppet manages its Agents. Puppet has a Master-Slave architecture in which the Slave has to first send a Certificate signing request to Master and Master has to sign that Certificate in order to establish a secure connection between Puppet Master and Puppet Slave as shown in the diagram below. Puppet Slave sends a request to Puppet Master and Puppet Master then pushes configuration on Slave.

31. What is the Puppet Manifests?
Answer: It is a very important question so make sure you go in the correct flow. According to me, you should first define Manifests. Every node (or Puppet Agent) has got its configuration details in Puppet Master, written in the native Puppet language. These details are written in the language which Puppet can understand and are termed as Manifests. They are composed of Puppet code and their filenames use the .pp extension.

Now give an example. You can write a manifest in Puppet Master that creates a file and installs apache on all Puppet Agents (Slaves) connected to the Puppet Master.

32. What testing is necessary to ensure that a new service is ready for production?
Answer: DevOps is all about continuous testing throughout the process, starting with development through to production. Everyone shares the testing responsibility. This ensures that developers are delivering code that doesn’t have any errors and is of high quality, and it also helps everyone leverage their time most effectively.

33. Explain how Memcached should not be used?
Answer:
Memcached common misuse is to use it as a data store, and not as a cache Never use Memcached as the only source of the information you need to run your application. Data should always be available through another source as well. Memcached is just a key or value store and cannot perform query over the data or iterate over the contents to extract information. Memcached does not offer any form of security either in encryption or authentication

34. Explain your understanding and expertise on both the software development side and the technical operations side of an organization you’ve worked for in the past?
Answer: DevOps engineers almost always work in a 24/7 business-critical online environment. I was adaptable to on-call duties and able to take up real-time, live-system responsibility. I successfully automated processes to support continuous software deployments. I have experience with public/private clouds, tools like Chef or Puppet, scripting and automation with tools like Python and PHP, and a background in AGILE.

35. Explain whether it is possible to share a single instance of a Memcache between multiple projects?
Answer: Yes, it is possible to share a single instance of Memcache between multiple projects. Memcache is a memory store space, and you can run Memcache on one or more servers. You can also configure your client to speak to a particular set of instances. So, you can run two different Memcache processes on the same host and yet they are completely independent. Unless, if you have partitioned your data, then it becomes necessary to know from which instance to get the data from or to put into.

36. Explain how you can minimize the Memcached server outages?
Answer:
When one instance fails, several of them goes down, this will put a larger load on the database server when lost data is reloaded as the client make a request. To avoid this, if your code has been written to minimize cache stampedes then it will leave a minimal impact
Another way is to bring up an instance of Memcached on a new machine using the lost machines IP address
Code is another option to minimize server outages as it gives you the liberty to change the Memcached server list with minimal work
Setting timeout value is another option that some Memcached clients implement for Memcached server outage. When your Memcached server goes down, the client will keep trying to send a request till the time-out limit is reached

37. Is continuous delivery related to the dev-ops movement? How so?
Answer: Absolutely. In any organization where there is a separate operations department, and especially where there is an independent QA or testing function, we see that much of the pain in getting software delivered is caused by poor communication between these groups, exacerbated by an underlying cultural divide. Apps are measured according to throughput, and ops are measured according to stability. Testing gets it in the neck from both sides, and like release management, is often a political pawn in the fight between apps and ops. The point of dev-ops is that developers need to learn how to create high-quality, production-ready software, and ops need to learn that Agile techniques are actually powerful tools to enable effective, low-risk change management. Ultimately, we’re all trying to achieve the same thing – creating business value through software – but we need to get better at working together and focusing on this goal rather than trying to optimize our own domains. Unfortunately, many organizations aren’t set up in a way that rewards that kind of thinking. According to Forrester.

38. What are the advantages of DevOps with respect to Technical and Business perspective?
Answer:
Technical benefits:

Software delivery is continuous.
Reduces Complexity in problems.
Faster approach to resolve problems
Manpower is reduced.
Business benefits:

The high rate of delivering its features
Stable operating environments
More time gained to Add values.
Enabling faster feature time to market

39. Explain AWS?
Answer: AWS stands for Amazon Web Service which is a collection of remote computing services also known as cloud computing. This technology of cloud computing is also known as IaaS or Infrastructure as a Service.

40. What is DevOps engineer’s duty with regards to Agile development?
Answer: DevOps engineer works very closely with Agile development teams to ensure they have an environment necessary to support functions such as automated testing, Continuous Integration, and Continuous Delivery. DevOps engineer must be in constant contact with the developers and make all required parts of the environment work seamlessly.

41. What is the most important thing DevOps helps us achieve?
Answer: According to me, the most important thing that DevOps helps us achieve is to get the changes into production as quickly as possible while minimizing risks in software quality assurance and compliance. This is the primary objective of DevOps. Learn more in this DevOps tutorial blog.
However, you can add many other positive effects of DevOps. For example, clearer communication and better working relationships between teams i.e. both the Ops team and Dev team collaborate together to deliver good quality software which in turn leads to higher customer satisfaction.

42. Which VCS tool you are comfortable with?
Answer: You can just mention the VCS tool that you have worked on like this: “I have worked on Git and one major advantage it has over other VCS tools like SVN is that it is a distributed version control system.”
Distributed VCS tools do not necessarily rely on a central server to store all the versions of a project’s files. Instead, every developer “clones” a copy of a repository and has the full history of the project on their own hard drive.

43. Which Testing tool are you comfortable with and what are the benefits of that tool?
Answer: Here mention the testing tool that you have worked with and accordingly frame your answer. I have mentioned an example below:
I have worked on Selenium to ensure high quality and more frequent releases.

Some advantages of Selenium are:

It is free and open source
It has a large user base and helping communities
It has cross Browser compatibility (Firefox, Chrome, Internet Explorer, Safari, etc.)
It has great platform compatibility (Windows, Mac OS, Linux, etc.)
It supports multiple programming languages (Java, C#, Ruby, Python, Pearl, etc.)
It has fresh and regular repository developments
It supports distributed testing

44. Why is Continuous monitoring necessary
Answer: I will suggest you go with the below-mentioned flow:
Continuous Monitoring allows timely identification of problems or weaknesses and quick corrective action that helps reduce expenses of an organization. Continuous monitoring provides a solution that addresses three operational disciplines known as:

continuous audit
continuous controls monitoring
continuous transaction inspection
45. What is the one most important thing DevOps helps do?
Answer: The most important thing DevOps helps do is to get the changes into production as quickly as possible while minimizing risks in software quality assurance and compliance. That is the primary objective of DevOps. However, there are many other positive side-effects to DevOps. For example, clearer communication and better working relationships between teams which creates a less stressful working environment.

46. Describe two-factor authentication?
Answer: Two-factor authentication is a security process in which the user provides two means of identification from separate categories of credentials; one is typically a physical token,

47. Explain how can create a backup and copy files in Jenkins?
Answer: Answer to this question is really direct. To create a backup, all you need to do is to periodically back up your JENKINS_HOME directory. This contains all of your build jobs configurations, your slave node configurations, and your build history. To create a back-up of your Jenkins setup, just copy this directory. You can also copy a job directory to clone or replicate a job or rename the directory.

48. What is Cloud Computing?
Answer: It is advance stage technology implemented so that the cloud provides the services globally as per the user requirements. It provides a method to access several servers worldwide.

49. Explain with a use case where DevOps can be used in industry/ real-life?
Answer: There are many industries that are using DevOps so you can mention any of those use cases, you can also refer the below example:
Etsy is a peer-to-peer e-commerce website focused on handmade or vintage items and supplies, as well as unique factory-manufactured items. Etsy struggled with slow, painful site updates that frequently caused the site to go down. It affected sales for millions of Etsy’s users who sold goods through the online market place and risked driving them to the competitor.

With the help of a new technical management team, Etsy transitioned from its waterfall model, which produced four-hour full-site deployments twice weekly, to a more agile approach. Today, it has a fully automated deployment pipeline, and its continuous delivery practices have reportedly resulted in more than 50 deployments a day with fewer disruptions.

50. Explain how would you handle revision (version) control?
Answer: My approach to handling revision control would be to post the code on SourceForge or GitHub so everyone can view it. Also, I will post the checklist from the last revision to make sure that any unsolved issues are resolved.

51. How would you make software deployable?
Answer: The ability to script the installation and reconfiguration of software systems is essential towards controlled and automated change. Although there is an increasing trend for new software to enable this, older systems and products suffer from the assumption that changes would be infrequent and minor, and so make automated changes difficult. As a professional who appreciates the need to expose configuration and settings in a manner accessible to automation, I will work with concepts like Inversion of Control (IoC) and Dependency Injection, scripted installation, test harnesses, separation of concerns, command-line tools, and infrastructure as code.

