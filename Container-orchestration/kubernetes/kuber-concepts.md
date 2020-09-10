# Kubernetes Concepts

***************************
## Table Of Contents: 
  - [Introduction](#introdution)
  - [Kubernetes Objects](#kubernetes-objects)
  - [Kubernetes Architecture](#kubernetes-architecture)
  - [Tutorial Resources](#tutorial-resources)
  - [References](#reference)


*****************

## Introdution
 - What is Kubernetes?

    - Kubernetes, at its basic level, is a system for running and coordinating containerized applications across a cluster of machines. It is a platform designed to completely manage the life cycle of containerized applications and services using methods that provide predictability, scalability, and high availability.

    - As a Kubernetes user, you can define how your applications should run and the ways they should be able to interact with other applications or the outside world. You can scale your services up or down, perform graceful rolling updates, and switch traffic between different versions of your applications to test features or rollback problematic deployments. Kubernetes provides interfaces and composable platform primitives that allow you to define and manage your applications with high degrees of flexibility, power, and reliability.


## Kubernetes Objects

  - Kubernetes contains a number of abstractions that represent the state of your system: deployed containerized applications and workloads, their associated network and disk resources, and other information about what your cluster is doing. These abstractions are represented by objects in the Kubernetes API. See Understanding Kubernetes Objects for more details.

    - The basic Kubernetes objects include:

        -  Pod
        -  Service
        -  Volume
        -  Namespace

    - ## Pod

        - A pod (as in a pod of whales or pea pod) is a group of one or more containers (such as Docker containers), with shared storage/network, and a specification for how to run the containers.
    
    - ## Replica Set

        - A Replica Set ensures that a specified number of pod replicas are running at any one time. In other words, a Replica Set makes sure that a pod or a homogeneous set of pods is always up and available. A Replica set help you to define how many pods are available. If you define replica as three, then one pod die, the Replica Set create a pod to make it three.

    - ## Deployment

        - A Deployment controller provides declarative updates for Pods and ReplicaSets.You describe a desired state in a Deployment object, and the Deployment controller changes the actual state to the desired state at a controlled rate. You can define Deployments to create new ReplicaSets, or to remove existing Deployments and adopt all their resources with new Deployments. A Deployment include Pod(s) and Replica Set. It also help to update the resources when you deploy new version.

    - ## Service

        - A Kubernetes Service is an abstraction which defines a logical set of Pods and a policy by which to access them - sometimes called a micro-service. If you create a pod, you don’t know where it is. Also, a pod might be killed by someone or some shortage of a node. Service provide an endpoint of the pods for you. If you specify “type=LoadBalancer” it actually create an Azure Load Balancer to expose pod with Public IP address.

    - ## Storage Class

        - A StorageClass provides a way for administrators to describe the “classes” of storage they offer. It represent a Persistent Volume like Azure Disk or Azure File or some other storage.

    - ## Persistent Volume Claim

        - Presistent Volume Claim is the abstruction of the Persistent Volume. Persistent Volume is physical resources of inflastructure. Kubernetes want to hide the detail from developers. Using Persistent Volume Claim, you can hide the physical declaration defined by Persistent Volume or Storage Class. Pod can mount the Volume using Persistent Volume Claim object.


    - ## Difference Between Daemonset and deployment 
        - Kubernetes deployments manage stateless services running on your cluster (as opposed to for example StatefulSets which do manage stateful services). Their purpose is to keep a set of identical pods running and upgrade them in a controlled way. For example, you define how many replicas(pods) you want to run of your app in deployment definition and kubernetes will make that many replicas of your application spread over nodes. If you say 5 replica's over 3 node then some nodes have more than one replica of your app running.

        - DaemonSets manage groups of replicated Pods. However, DaemonSets attempt to adhere to a one-Pod-per-node model, either across the entire cluster or a subset of nodes. Daemonset will not run more than one replica per node. Another advantage of using Daemonset is, If you add a node to the cluster then Daemonset will automatically spawn pod on that node, which deployment will not do.

        - DaemonSets are useful for deploying ongoing background tasks that you need to run on all or certain nodes, and which do not require user intervention. Examples of such tasks include storage daemons like ceph, log collection daemons like fluentd, and node monitoring daemons like collected

       > Lets take example you mentioned in question, why kube-dns is deployment and kube-proxy is daemonset?

        The reason behind that is kube-proxy is needed on every node in cluster to run IP tables so that every node can access every pod no matter on which node it resides. Hence, when we make kube-proxy a daemonset and another node is added to cluster at later time kube-proxy is automatically spawned on that node.

        Kube-dns responsibility is to discover the service IP using its name and even one replica of kube-dns is enough to resolve the service name to its IP and hence we make kube-dns a deployment because we don't need kube-dns on every node.

    - ## Target Port

        - Target ports allows us to separate the port the service is available on from the port the application is listening on. TargetPort is the Port which the application is configured to listen on. Port is how the application will be accessed from the outside.
  
    - ## Cluster IP

        - Cluster IP is the default approach when creating a Kubernetes Service. The service is allocated an internal IP that other components can use to access the pods.By having a single IP address it enables the service to be load balanced across multiple Pods.

    - ## Nodeport

        - While TargetPort and ClusterIP make it available to inside the cluster, the NodePort exposes the service on each Node’s IP via the defined static port. No matter which Node within the cluster is accessed, the service will be reachable based on the port number defined.

    - ## External IP

        - Another approach to making a service available outside of the cluster is via External IP addresses.

    - ## Loadbalancer

        - When running in the cloud, such as EC2 or Azure, it's possible to configure and assign a Public IP address issued via the cloud provider. This will be issued via a Load Balancer such as ELB. This allows additional public IP addresses to be allocated to a Kubernetes cluster without interacting directly with the cloud provider.

    - ## Ingress

        - Ingress enables externally-reachable urls, load balance traffic, terminate SSL, offer name based virtual hosting for a Kubernetes cluster.
        - Ingress rules are an object type with Kubernetes. The rules can be based on a request host (domain), or the path of the request, or a combination of both
        - Kubernetes ingress is a collection of routing rules that govern how external users access services running in a Kubernetes cluster.

    - ## In Kubernetes, there are three general approaches to exposing your application.

        - Using a Kubernetes service of type NodePort, which exposes the application on a port across each of your nodes
        - Use a Kubernetes service of type LoadBalancer, which creates an external load balancer that points to a Kubernetes service in your cluster
        - Use a Kubernetes Ingress Resource

    - ## Kubernetes Persistent Volume

        - PersistentVolumes are consumed by something called a PersistentVolumeClaim (PVC). A PVC is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources. Pods can request specific levels of resources (CPU and Memory). PVCs can request specific size and access modes (e.g. read-write or read-only).

    - ## Readiness and Liveness



    - ## kubernetes size 

      - The kibibyte was designed to replace the kilobyte in those computer science contexts in which the term kilobyte is used to mean 1024 bytes. The interpretation of kilobyte to denote 1024 bytes, conflicting with the SI definition of the prefix kilo (1000), used to be common.

      - So, as you can see, 5G means 5 Gigabytes while 5Gi means 5 Gibibytes. They amount to:

      - 5 G = 5000000 KB / 5000 MB
      - 5 Gi = 5368709.12 KB / 5368.70 MB

      - Exactly, one of them (G) is power of ten, while the other one (Gi) is power of two. So,

      - 10^3 is power of ten. the result is 1000, or 1G
      - 2^10 is power of two. the result is 1024, or 1Gi



 ![alt text](https://github.com/Tikam02/DevOps-Guide/blob/master/img/kuber-objects.jpeg)


- [Kubernetes Essentials: The basic components, pods, services, and more](https://www.padok.fr/en/blog/kubernetes-essentials-components-pods-services)
-  [Kubernetes 101: Pods, Nodes, Containers, and Clusters](https://medium.com/google-cloud/kubernetes-101-pods-nodes-containers-and-clusters-c1509e409e16)

*******************

## Kubernetes Architecture

 - To understand how Kubernetes is able to provide these capabilities, it is helpful to get a sense of how it is designed and organized at a high level. Kubernetes can be visualized as a system built in layers, with each higher layer abstracting the complexity found in the lower levels.

 - At its base, Kubernetes brings together individual physical or virtual machines into a cluster using a shared network to communicate between each server. This cluster is the physical platform where all Kubernetes components, capabilities, and workloads are configured.

 - The machines in the cluster are each given a role within the Kubernetes ecosystem. One server (or a small group in highly available deployments) functions as the master server. This server acts as a gateway and brain for the cluster by exposing an API for users and clients, health checking other servers, deciding how best to split up and assign work (known as “scheduling”), and orchestrating communication between other components. The master server acts as the primary point of contact with the cluster and is responsible for most of the centralized logic Kubernetes provides.

 - The other machines in the cluster are designated as nodes: servers responsible for accepting and running workloads using local and external resources. To help with isolation, management, and flexibility, Kubernetes runs applications and services in containers, so each node needs to be equipped with a container runtime (like Docker or rkt). The node receives work instructions from the master server and creates or destroys containers accordingly, adjusting networking rules to route and forward traffic appropriately.

 - As mentioned above, the applications and services themselves are run on the cluster within containers. The underlying components make sure that the desired state of the applications matches the actual state of the cluster. Users interact with the cluster by communicating with the main API server either directly or with clients and libraries. To start up an application or service, a declarative plan is submitted in JSON or YAML defining what to create and how it should be managed. The master server then takes the plan and figures out how to run it on the infrastructure by examining the requirements and the current state of the system. This group of user-defined applications running according to a specified plan represents Kubernetes’ final layer.

![architecture](https://github.com/Tikam02/DevOps-Guide/blob/master/img/architecture-kuber.jpeg)


****************************

- ## Tutorial Resources  

- ### The Official Kubernetes.io Tutorials
      
    - [The Basics](https://kubernetes.io/docs/tutorials/#basics)
    - [Configuring Kubernetes](https://kubernetes.io/docs/tutorials/#configuration)
    - [Stateless Applications](https://kubernetes.io/docs/tutorials/#stateless-applications)
    - [Stateful Applications](https://kubernetes.io/docs/tutorials/#stateful-applications)
    - [CI/CD Pipeline](https://kubernetes.io/docs/tutorials/#ci-cd-pipeline)
    - [Managing Kubernetes Clusters](https://kubernetes.io/docs/tutorials/#clusters)
    - [Services](https://kubernetes.io/docs/tutorials/#services)

- ### DigitalOcean Tutorials

    - It is a collection of articles that are nicely written and well organized. They are sometimes focused on Running Kubernetes on top of DigitalOcean however. But you are still going to learn a lot of Kubernetes basics that are applicable to any other infrastructure. Some of the notable topics are:

        - [An Introduction to Kubernetes](https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes)
        - [An introduction to Kubernetes DNS Services](https://www.digitalocean.com/community/tutorials/an-introduction-to-the-kubernetes-dns-service)
        - [An introduction to Helm, the package manager for Kubernetes](https://www.digitalocean.com/community/tutorials/an-introduction-to-helm-the-package-manager-for-kubernetes)
        - [Modernizing Applications for Kubernetes](https://www.digitalocean.com/community/tutorials/modernizing-applications-for-kubernetes)
        - [Building Optimized Containers for Kubernetes](https://www.digitalocean.com/community/tutorials/building-optimized-containers-for-kubernetes)
        - [Kubernetes Networking Under the Hood](https://www.digitalocean.com/community/tutorials/kubernetes-networking-under-the-hood)
        - [Architecting Applications for Kubernetes](https://www.digitalocean.com/community/tutorials/architecting-applications-for-kubernetes)
        - [Building Blocks for Doing CI/CD with Kubernetes](https://www.digitalocean.com/community/tutorials/webinar-series-building-blocks-for-doing-ci-cd-with-kubernetes)
        - [How to Back up and restore a Kubernetes Cluster on DigitalOcean using Heptio Ark](https://www.digitalocean.com/community/tutorials/how-to-back-up-and-restore-a-kubernetes-cluster-on-digitalocean-using-heptio-ark)
        - [How to Setup a Nginix Ingress with Cert-Manager on DigitalOcean Kubernetes](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-with-cert-manager-on-digitalocean-kubernetes)
        - [How to Inspect Kubernetes Networking](https://www.digitalocean.com/community/tutorials/how-to-inspect-kubernetes-networking)





************ 

### References

- [Kubernetes in three diagrams](https://medium.com/@tsuyoshiushio/kubernetes-in-three-diagrams-6aba8432541c)
- [The Best Kubernetes Tutorials](https://www.magalix.com/blog/the-best-kubernetes-tutorials)