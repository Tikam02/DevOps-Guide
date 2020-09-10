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



### Explain a resource

``` kubectl explain hpa ```


```kubectl explain svc```

### Get nodes region and zone

### kubectl get nodes
```--label-columns failure-domain.beta.kubernetes.io/region,failure-domain.beta.kubernetes.io/zone```

### Get Arch, OS, Instance type and node type if kops

```kubectl get nodes -o wide -L beta.kubernetes.io/arch -L beta.kubernetes.io/os -L beta.kubernetes.io/instance-type -L  kops.k8s.io/instancegroupkubectl get nodes -L beta.kubernetes.io/arch -L beta.kubernetes.io/os -L beta.kubernetes.io/instance-type -L  kops.k8s.io/instancegroup```

### Get node version and name only

```kubectl get nodes -o custom-columns=NAME:.metadata.name,VER:.status.nodeInfo.kubeletVersion```

### Get scheduleable nodes

```kubectl get nodes --output 'jsonpath={range $.items[*]}{.metadata.name} {.spec.taints[*].effect}{"\n"}{end}' | awk '!/NoSchedule/{print $1}'```

### Get all deployments nameonly

```kubectl get deployment -o=jsonpath={.items[*].metadata.name}```

### Get one deployment only (first one)

```kubectl get deployment -o=jsonpath={.items[0].metadata.name}```

### Get all pods statuses only

```kubectl get pods -o=jsonpath=‘{.items[*].status.phase}’ --all-namespaces```

### Get pods qos

```kubectl get pods --all-namespaces -o custom-columns=NAME:.metadata.name,NAMESPACE:.metadata.namespace,QOS-CLASS:.status.qosClass```

### Get images running

```kubectl get pod -o=jsonpath='{.spec.containers[*].image}' --all-namespaces```

```kubectl get pod -o=custom-columns=NAME:.metadata.name,IMAGE:.spec.containers[*].image --all-namespaces```

### Where is my pod running

```kubectl get pods -n sock-shop -l name=carts -o wide```

### Check node/pod usage memory and cpu

```kubectl top nodes```
```kubectl top pods```

### Check health of etcd

```kubectl get --raw=/healthz/etcd```

### Check status of node autoscaler

```kubectl describe configmap cluster-autoscaler-status -n kube-system```

### Get where pods are running from nodenames

```kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --all-namespaceskubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name --all-namespaces```

### Example sorting pods by nodeName:

```kubectl get pods -o wide --sort-by="{.spec.nodeName}"```

### Example of getting pods on nodes using label filter:

```bash
for n in $(kubectl get nodes -l your_label_key=your_label_value --no-headers | cut -d " " -f1); do 
        kubectl get pods --all-namespaces  --no-headers --field-selector spec.nodeName=${n} 
  done
```

- or by number of restarts

```kubectl get pods --sort-by="{.status.containerStatuses[:1].restartCount}"```


### get containers name inside pod

```kubectl get pods prometheus-prometheus-operator-prometheus-0 -o jsonpath='{.spec.containers[*].name}'```

### get disk space 
```kubectl exec -i -t prometheus-prometheus-operator-prometheus-0 -c thanos-sidecar -n monitoring -- df -h```

### Example filtering by nodeName using — template flag:

```bash
$ kubectl get nodes  NAME                         STATUS                     AGE
  ip-254-0-90-30.ec2.internal   Ready                      2d
  ip-254-0-90-35.ec2.internal   Ready                      2d
  ip-254-0-90-50.ec2.internal   Ready,SchedulingDisabled   2d
  ip-254-0-91-60.ec2.internal   Ready                      2d
  ip-254-0-91-65.ec2.internal   Ready                      2d
  $ kubectl get pods --template '{{range .items}}{{if eq .spec.nodeName "ip-254-0-90-30.ec2.internal"}}{{.metadata.name}}{{"\n"}}{{end}}}{{end}}'  filebeat-000
  app-0000
  node-exporter-0000
  prometheus-000
```

### Check pods which are not Runnning

```kubectl get pods --field-selector=status.phase!=Running --all-namespaces```

### Sort Nodes by Role, Age and kubelet version

```kubectl get nodes --sort-by={.metadata.labels."kubernetes\.io\/role"}kubectl get node --sort-by={.status.nodeInfo.kubeletVersion}watch kubectl get node --sort-by={.status.nodeInfo.kubeletVersion}   watch "kubectl get nodes --sort-by={.metadata.labels.\"kubernetes\.io\/role\"}"kubectl get nodes --sort-by=".status.conditions[?(@.reason == 'KubeletReady' )].lastTransitionTime"```

### Query apiservers

```kubectl get --raw=/apis```
```kubectl get --raw=/logs/kube-apiserver.log```

### Setup a deployment with limits and requests

```kubectl run ken-test --image=kenichishibata/docker-curl -i --tty --limits='cpu=50m,memory=128Mi' --requests='cpu=50m,memory=128Mi'```
```kubectl delete deployment ken-test```

### Get events for an individual resource

```kubectl get event --field-selector=involvedObject.name =foo -w```

### Get apiresources

#### Check for an api resources available, this should show your crd api endpoints as well
    
```kubectl api-resources```
```kubectl api-versions```
    
#### Check apiservices added (registered)
    
```kubectl get apiservices.apiregistration.k8s.io```
```kubectl get apiservices.apiregistration.k8s.io v1beta1.metrics.k8s.io -o yaml```

### Check hpa (maybe because you have custom metrics enabled in prometheus)?
```kubectl get hpa```
```kubectl get hpa --all-namespaces kubectl get --raw /apis/metrics.k8s.io```

### Kube Diff

```kubectl alpha diff -h```



### Run pod shell

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: testing
  namespace: monitoring
spec:
  serviceAccountName: build-robot
  automountServiceAccountToken: false
  containers:
  - image: alpine:3.2
    command:
      - /bin/sh
      - "-c"
      - "sleep 60m"
    imagePullPolicy: IfNotPresent
    name: alpine
  restartPolicy: Always
```

> kubectl apply -f testing.yaml --namespace=monitoring 

> kubectl exec -ti testing --namespace=monitoring  -- sh

or

> kubectl run -it testing --image testing --namespace monitoring /bin/sh
****************************************************

### MANAGE RESOURCES
* Create one or more resources from your file or folder.


 ```kubectl create -f FILE ```

* Applies a configuration change to a resource from your file.


 ```kubectl apply -f FILE  ```


*  Deletes one or more Kubernetes resources from a configuration file or directly from resource names.
*  e.g. Kubectl delete my_pod (destroy the pod on the cluster named my_pod) 


  ```kubectl delete (-f FILE | TYPE [PREFIX_NAME | NAME]) ```


 -  Lets you expose a local port to the port of a POD that is running on the Kubernetes cluster. Useful to debug.
    -  e.g. Kubectl port-forward my_pod 80:3000 (exposes the port 3000 of the pod my_pod on our local port 80)

  ```kubectl port-forward POD [LOCAL_PORT:]REMOTE_PORT ```

-  Run a resource in the Kubernetes cluster.
    - e.g.kKubectl run -i --tty busybox --image=busybox -- sh
    - -> Run a pod as an interactive shell
 

  ```kubectl run NAME --image=image [--env=”key=value”] [--port=port] [--replicas=replicas] ```


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

 

  ```kubectl logs [-f] POD [-c CONTAINER] ```

This command displays the logs of your POD. We can add the -c container option when we want to display the logs of a multi-container pod. The -f command displays the output of the logs continuously (stream).

Example: Kubectl logs -f my_pod -c my_app

-> Stream the logs of the container my_app on the my_pod pod.

 

  ```kubectl top pod POD_NAME --containers ```

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

