## Kubernetes - Commands  ![kubernetes](https://img.shields.io/badge/kubernetes-Commands-blue?style=for-the-badge)
**************************
### Kubectl?

* "Kubectl is a command-line interface that lets you run commands on Kubernetes clusters." This is how we will be able to perform various operations on our cluster.

* Kubectl depends on a kubeconfig. This is a configuration file for access to one or more clusters, to know which cluster is configured our Kubectl command, we can use:


   ``` Kubectl config current-context ```

* Or if we want to change clusters in our config, we can use:

   ``` Kubectl config use-context ```


***************************
### CLIENT CONFIGURATION


- Setup autocomplete in bash; bash-completion package should be installed first

``` source <(kubectl completion bash) ```

- View Kubernetes config

``` kubectl config view```

- View specific config items by json path

``` kubectl config view -o jsonpath='{.users[?(@.name == "k8s")].user.password}' ```

- Set credentials for foo.kuberntes.com

``` kubectl config set-credentials kubeuser/foo.kubernetes.com --username=kubeuser --password=kubepassword ```

************************************

### VIEWING, FINDING RESOURCES


- List all services in the namespace

``` kubectl get services ```

- List all pods in all namespaces in wide format

``` kubectl get pods -o wide --all-namespaces ```

- List all pods in json (or yaml) format

``` kubectl get pods -o json ```

- Describe resource details (node, pod, svc)

``` kubectl describe nodes my-node ```

- List services sorted by name

``` kubectl get services --sort-by=.metadata.name ```

- List pods sorted by restart count

```kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'```

- Rolling update pods for frontend-v1

``` kubectl rolling-update frontend-v1 -f frontend-v2.json ```

- Scale a replicaset named 'foo' to 3

``` kubectl scale --replicas=3 rs/foo ```

- Scale a resource specified in "foo.yaml" to 3

``` kubectl scale --replicas=3 -f foo.yaml ```

- Execute a command in every pod / replica

``` for i in 0 1; do kubectl exec foo-$i -- sh -c 'echo $(hostname) > /usr/share/nginx/html/index.html'; done ```

****************************************************

### MANAGE RESOURCES
* Create one or more resources from your file or folder.


 ```   Kubectl create -f FILE ```

* Applies a configuration change to a resource from your file.


 ```   Kubectl apply -f FILE  ```


*  Deletes one or more Kubernetes resources from a configuration file or directly from resource names.
*  e.g. Kubectl delete my_pod (destroy the pod on the cluster named my_pod) 


  ```  Kubectl delete (-f FILE | TYPE [PREFIX_NAME | NAME]) ```


 -  Lets you expose a local port to the port of a POD that is running on the Kubernetes cluster. Useful to debug.
    -  e.g. Kubectl port-forward my_pod 80:3000 (exposes the port 3000 of the pod my_pod on our local port 80)

  ```  Kubectl port-forward POD [LOCAL_PORT:]REMOTE_PORT ```

-  Run a resource in the Kubernetes cluster.
    - e.g. Kubectl run -i --tty busybox --image=busybox -- sh
    - -> Run a pod as an interactive shell
 

  ```  Kubectl run NAME --image=image [--env=”key=value”] [--port=port] [--replicas=replicas] ```


- Get documentation for pod or service

``` kubectl explain pods,svc ```

- Create resource(s) like pods, services or daemonsets

``` kubectl create -f ./my-manifest.yaml ```

- Apply a configuration to a resource

``` kubectl apply -f ./my-manifest.yaml ```

- Start a single instance of Nginx

``` kubectl run nginx --image=nginx ```

- Create a secret with several keys
```yml
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
 name: mysecret
type: Opaque
data:
 password: $(echo "s33msi4" | base64)
 username: $(echo "jane"| base64)
EOF
```

- Delete a resource

``` kubectl delete -f ./my-manifest.yaml ```






********************************************************
### MONITORING & LOGGING


* Kubectl monitoring commands

  ```  Kubectl get pods ```

 This command lists pods on the Kubernetes cluster. This command works for all types of Kubernetes resources: pods, services, deployments, cronjobs, events, ingresses, etc. We can also add parameters:

* --all-namespaces: List all resources of all namespaces.

* -o wide: List all resources with more details.

 

  ```  Kubectl describe pod ```

The describe command gives a verbose display of the pod unlike the get and basic display. This allows having the events, useful when a pod does not start.

e.g. Kubectl describe pods my-pod.

 

  ```  Kubectl logs [-f] POD [-c CONTAINER] ```

This command displays the logs of your POD. We can add the -c container option when we want to display the logs of a multi-container pod. The -f command displays the output of the logs continuously (stream).

Example: Kubectl logs -f my_pod -c my_app

-> Stream the logs of the container my_app on the my_pod pod.

 

  ```  Kubectl top pod POD_NAME --containers ```

Displays the metrics for a given pod and its containers within a Kubernetes cluster.

- Deploy Heapster from Github repository

``` kubectl create -f deploy/kube-config/standalone/ ```

- Show metrics for nodes

``` kubectl top node ```

- Show metrics for pods

``` kubectl top pod ```

- Show metrics for a given pod and its containers

``` kubectl top pod pod_name --containers ```

- Dump pod logs (stdout)

``` kubectl logs pod_name ```

- Stream pod container logs (stdout, multi-container case)

``` kubectl logs -f pod_name -c my-container ```

