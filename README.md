# DevOps_Cheatsheet
![GitHub last commit](https://img.shields.io/github/last-commit/Tikam02/DevOps_Cheatsheet?style=for-the-badge)
*******
- Docker
- Kubernetes
*******************
- [Docker Cheatsheet](https://cheatsheet.dennyzhang.com/cheatsheet-docker-a4)
- [Kubernetes Cheatsheet](https://cheatsheet.dennyzhang.com/cheatsheet-kubernetes-A4)
- [Kubernets YAML Templates](https://cheatsheet.dennyzhang.com/kubernetes-yaml-templates)
- [Development Tools Cheatsheet](https://cheatsheet.dennyzhang.com/category/tools)
- [Linux Cheatsheet](https://cheatsheet.dennyzhang.com/category/linux)


*************************
- [Kubectl get nodes error!](https://jessicadeen.com/kubectl-get-nodes-error-unable-to-connect-to-the-server-dial-tcp-i-o-timeout/)
- [Troubleshoot kubectl connection refused](https://medium.com/@texasdave2/troubleshoot-kubectl-connection-refused-6f5445a396ed)
- [Kubernetes Monitoring-sysdig](https://sysdig.com/blog/kubernetes-monitoring-prometheus/)
- [Kubernetes Monitoring with helm- Digitalocean](https://www.digitalocean.com/community/tutorials/how-to-set-up-digitalocean-kubernetes-cluster-monitoring-with-helm-and-prometheus-operator)
- [Getting into DevOps - Reddit](https://www.reddit.com/r/devops/comments/dbusbr/monthly_getting_into_devops_thread_201910/)

**************************
### Docker 

- Create image using this directory’s Dockerfile

``` docker build -t image-name . ```

- Run “image-name” mapping port 8080 to 80

``` docker run -p 8080:80 image-name ```

- Run “image-name” mapping port 8080 to 80, but in detached mode

``` docker run -d -p 8080:80 image-name ```

- See a list of all running containers

``` docker ps ```

- Gracefully stop the specified container

``` docker stop <hash> ```

- See a list of all containers, even the ones not running

``` docker ps -a ```

- Force shutdown of the specified container

``` docker kill <hash> ```

- Remove the specified container from this machine

 ``` docker rm <hash> ```

- Remove all containers from this machine

``` docker rm $(docker ps -a -q) ```

- Show all images on this machine

``` docker images -a ```

- LEGACY: Remove the specified image from this machine

``` docker rmi <imagename> ```

- LEGACY:Remove all images from this machine

``` docker rmi $(docker images -q) ```

- LEGACY: Remove all images with dependencies

``` docker images -q | xargs docker rmi –f ```

- Log in this CLI session using your Docker credentials

``` docker login ```

- Tag <image> for upload to registry

``` docker tag <image> username/repository:tag ```

- Upload tagged image to registry

``` docker push username/repository:tag ```

- Run image from a registry

``` docker run username/repository:tag ```

- List Docker volume

``` docker volume ls ```

- List Docker Network

``` docker network ls ```

### Docker Compose

- Build Docker Images using Docker Compose file

``` docker-compose build ```

- Run Docker Containers

``` docker-compose up ```

- Run Docker Containers in background Mode

``` docker-compose up -d ```

- Build Images before starting Containers

``` docker-compose up --build ```

- Recreate Containers from existing images

``` docker-compose up --force-recreate ```

- Stop and Remove Containers, Volumes, Networks, and Images

``` docker-compose down ```

- List Containers

``` docker-compose ps -a ```

- Display Log output

``` docker-compose logs ```

### Docker Swarm

- Initialize

``` docker swarm init ```

- Join Docker Cluster

```` docker swarm join --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx <manager/worker>:2377 ```

- List Docker Nodes in Swarm Cluster

``` docker node ls ```

- List all running applications on this Docker host

``` docker stack ls ```

- Run the specified Compose file

``` docker stack deploy -c <composefile> <STACK_NAME> ```

- List the services associated with an app

``` docker stack services <appname> ```

- List the running containers associated with an app

``` docker stack ps <appname> ```

- Tear down an application

``` docker stack rm <STACK_NAME>alias dstr='docker stack rm' ```

- Docker Swarm Service list

``` docker service ls ```
``` alias dsls='docker service ls' ```

- List the tasks of one or more services

``` docker service ps <service_name>  ```
``` alias dsp='docker service ps' ```

- Docker Swarm Service logs

``` alias dsl='docker service logs' ```

- Remove specific docker swarm service

``` alias dsr='docker service rm' ```

- Remove unused Containers, Images, Network, etc.

``` alias sprune='docker system prune' ```

- Remove unused Volumes

``` alias vprune='docker volume prune' ```

- Create Secret

``` docker secret create <SECRET_NAME> <SECRET_PATH> ```

- Create Config

``` docker config create <CONFIG_NAME> <CONFIG_FILE_PATH> ```


******************************
## Kubernetes 

### CLIENT CONFIGURATION


- Setup autocomplete in bash; bash-completion package should be installed first
``` source <(kubectl completion bash) ```

- View Kubernetes config
``` kubectl config view```

- View specific config items by json path
``` kubectl config view -o jsonpath='{.users[?(@.name == "k8s")].user.password}' ```

- Set credentials for foo.kuberntes.com
``` kubectl config set-credentials kubeuser/foo.kubernetes.com --username=kubeuser --password=kubepassword ```


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


### MANAGE RESOURCES


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
``` kubectl delete -f ./my-manifest.yaml ``


### MONITORING & LOGGING


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


