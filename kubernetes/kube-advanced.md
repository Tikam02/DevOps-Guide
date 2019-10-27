# How Kubernetes Works?

- What is Master or Master Components?
  - What are Kube-ApiServers
  - etcd
  - kube scheduler
  - kube controller manager
  - Cloud Controller manager

- What are Node Components?
  - kubelet
  - kube proxy

- And Addons
  - DNS
  - Web UI
  - Container Resources Monitoring


*********************

![alt text](https://github.com/Tikam02/DevOps-Guide/blob/master/img/etcd-master.png)


**************************

## Q) What is Master components?

- Master components provide the cluster’s control plane. Master components make global decisions about the cluster (for example, scheduling), and they detect and respond to cluster events (for example, starting up a new pod when a deployment’s replicas field is unsatisfied).

- Master components can be run on any machine in the cluster. However, for simplicity, set up scripts typically start all master components on the same machine, and do not run user containers on this machine.

- The Kubernetes master runs the Scheduler, Controller Manager, API Server and etcd components and is responsible for managing the Kubernetes cluster. Essentially, it’s the brain of the cluster! Now, let’s dive into each master component.

## kube-apiserver

- The API server is a component of the Kubernetes control plane that exposes the Kubernetes API. The API server is the front end for the Kubernetes control plane.

- The main implementation of a Kubernetes API server is kube-apiserver. kube-apiserver is designed to scale horizontally—that is, it scales by deploying more instances. You can run several instances of kube-apiserver and balance traffic between those instances.

- When you interact with your Kubernetes cluster using the kubectl command-line interface, you are actually communicating with the master API Server component.

- The API Server is the main management point of the entire cluster. In short, it processes REST operations, validates them, and updates the corresponding objects in etcd. The API Server serves up the Kubernetes API and is intended to be a relatively simple server, with most business logic implemented in separate components or in plugins.

- The API Server is also responsible for the authentication and authorization mechanism. All API clients should be authenticated in order to interact with the API Server.

- The API Server also implements a watch mechanism (similar to etcd) for clients to watch for changes. This allows components such as the Scheduler and Controller Manager to interact with the API Server in a loosely coupled manner.

## etcd

- Consistent and highly-available key value store used as Kubernetes’ backing store for all cluster data.

- If your Kubernetes cluster uses etcd as its backing store, make sure you have a back up plan for those data.

- When it comes to Kubernetes, etcd reliably stores the configuration data of the Kubernetes cluster, representing the state of the cluster (what nodes exist in the cluster, what pods should be running, which nodes they are running on, and a whole lot more) at any given point of time.

- Kubernetes uses etcd as its database.

- Etcd is written in Go and uses the Raft consensus algorithm to manage a highly-available replicated log. Raft is a consensus algorithm designed as an alternative to Paxos. The Consensus problem involves multiple servers agreeing on values; a common problem that arises in the context of replicated state machines. Raft defines three different roles (Leader, Follower, and Candidate) and achieves consensus via an elected leader. For further information, please read the Raft paper.
- [ The Raft Consensus Algorithm ](https://raft.github.io/)

- Etcdctl is the command-line interface tool written in Go that allows manipulating an etcd cluster. It can be used to perform a variety of actions, such as:

    - Set, update and remove keys.
    - Verify the cluster health.
    - Add or remove etcd nodes.
    - Generating database snapshots.

- You can play online with a 5-node etcd cluster at http://play.etcd.io.

- Etcd also implements a watch feature, which provides an event-based interface for asynchronously monitoring changes to keys. Once a key is changed, its “watchers” get notified. This is a crucial feature in the context of Kubernetes, as the API Server component heavily relies on this to get notified and call the appropriate business logic components to move the current state towards the desired state.


- etcd is a reliable system for cluster-wide coordination and state management. It is built on top of Raft.

- Raft gives etcd a total ordering of events across a system of distributed etcd nodes. This has many advantages and disadvantages:

- Advantages include:

    - any node may be treated like a master
    - minimal downtime (a client can try another node if one isn't responding)
    - avoids split-braining
    - a reliable way to build distributed locks for cluster-wide coordination
    - For example: You would use etcd to coordinate an automated election of a new Postgres master so that there remains only one master in the cluster.

- Disadvantages include:

    - for safety reasons, it requires a majority of the cluster to commit writes - usually to disk - before replying to a client
    - requires more network chatter than a single master system




## kube-controller-manager

- Component on the master that runs controllers .

- Logically, each controller is a separate process, but to reduce complexity, they are all compiled into a single binary and run in a single process.

- These controllers include:

    - Node Controller: Responsible for noticing and responding when nodes go down.
    - Replication Controller: Responsible for maintaining the correct number of pods for every replication controller object in the system.
    - Endpoints Controller: Populates the Endpoints object (that is, joins Services & Pods).
    - Service Account & Token Controllers: Create default accounts and API access tokens for new namespaces.

- Kube-controller-manager runs controllers, which are the background threads that handle routine tasks in the cluster. Logically, each controller is a separate process, but to reduce complexity, they are all compiled into a single binary and run in a single process.

- The Kubernetes Controller Manager is a daemon that embeds the core control loops (also known as “controllers”) shipped with Kubernetes. Basically, a controller watches the state of the cluster through the API Server watch feature and, when it gets notified, it makes the necessary changes attempting to move the current state towards the desired state. Some examples of controllers that ship with Kubernetes include the Replication Controller, Endpoints Controller, and Namespace Controller.

- Besides, the Controller Manager performs lifecycle functions such as namespace creation and lifecycle, event garbage collection, terminated-pod garbage collection, cascading-deletion garbage collection, node garbage collection, etc.


## kube-scheduler

- Component on the master that watches newly created pods that have no node assigned, and selects a node for them to run on.

- Factors taken into account for scheduling decisions include individual and collective resource requirements, hardware/software/policy constraints, affinity and anti-affinity specifications, data locality, inter-workload interference and deadlines.

- Kube-scheduler watches newly created pods that have no node assigned, and selects a node for them to run on.

- The Scheduler watches for unscheduled pods and binds them to nodes via the /binding pod subresource API, according to the availability of the requested resources, quality of service requirements, affinity and anti-affinity specifications, and other constraints. Once the pod has a node assigned, the regular behavior of the Kubelet is triggered and the pod and its containers are created

******************************


# Node Components

- Node components run on every node, maintaining running pods and providing the Kubernetes runtime environment.

## kubelet

- An agent that runs on each node in the cluster. It makes sure that containers are running in a pod.

- The kubelet takes a set of PodSpecs that are provided through various mechanisms and ensures that the containers described in those PodSpecs are running and healthy. The kubelet doesn’t manage containers which were not created by Kubernetes.

- Kubelet is the primary node agent. It watches for pods that have been assigned to its node (either by apiserver or via local configuration file) and:

    - Mounts the pod’s required volumes.
    - Downloads the pod’s secrets.
    - Runs the pod’s containers via docker (or, experimentally, rkt).
    - Periodically executes any requested container liveness probes.
    - Reports the status of the pod back to the rest of the system, by creating a mirror pod if necessary.
    - Reports the status of the node back to the rest of the system.



## kube-proxy

- kube-proxy is a network proxy that runs on each node in your cluster, implementing part of the Kubernetes Service concept.

- kube-proxy maintains network rules on nodes. These network rules allow network communication to your Pods from network sessions inside or outside of your cluster.

- kube-proxy uses the operating system packet filtering layer if there is one and it’s available. Otherwise, kube-proxy forwards the traffic itself.

## Container Runtime

- The container runtime is the software that is responsible for running containers












**********************

# References:

[Kubernetes Master Components: Etcd, API Server, Controller Manager, and Scheduler](https://medium.com/jorgeacetozi/kubernetes-master-components-etcd-api-server-controller-manager-and-scheduler-3a0179fc8186)

[Understanding Etcd Consensus and How to Recover from Failure](https://blog.containership.io/etcd/)

[ The Raft Consensus Algorithm ](https://raft.github.io/)
