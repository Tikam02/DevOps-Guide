# Devops Notes

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