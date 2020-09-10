# Persistent Volume 

> Phase

- A volume will be in one of the following phases:

    - Available -- a free resource that is not yet bound to a claim
    - Bound -- the volume is bound to a claim
    - Released -- the claim has been deleted, but the resource is not yet reclaimed by the cluster
    - Failed -- the volume has failed its automatic reclamation


- Persistent Volume ON NFS

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-name
spec:
  capacity:
    storage: 5Gi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Recycle
  storageClassName: slow
  mountOptions:
    - hard
    - nfsvers=4.0
  nfs:
    path: /dir/path/on/nfs/server
    server: nfs-server-ip-address
```

- Persistent Volume on Google Cloud

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: test-volume
  labels:
    failure-domain.beta.kuberentes.io/zone: us-central1-a__us_central1-b
spec:
  capacity:
    storage: 400Gi
  accessModes:
  - ReadWriteOnce
  gcePersistentDisk:
    pdName: my-data-disk
    fsType: ext4
```

- Depending on storage type, spec attributes differ  


##### Persistent Volume claim

- Application has to claim the Persistent volume

```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata: 
  name: pvc-name
spec:
  storageClassName: manual
  volumeMode: Filesystem
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
``` 

- Use that PVC in Pods configuration
  
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:    ## Where to mount volume in the container
    - name: myfrontend
      image: nginx
      volumeMounts: 
      - mountPath: "/var/www/html"
      name: mypd
  volume:   ## What volume to provide
    - name: mypd
      persistentVolumeClaim:
        claimName: pvc-name
```

### Refrences

- [ Kubernetes Volume Basics: emptyDir and PersistentVolume ](https://www.alibabacloud.com/blog/kubernetes-volume-basics-emptydir-and-persistentvolume_594834)

- [Kubernetes: Persistent Volume For Beginners:](https://medium.com/@muneeburrehman2610/kubernetes-persistent-volume-for-beginners-a13cbe5bdeea)

- [ Persistent Volume Claim for StatefulSet](https://medium.com/@zhimin.wen/persistent-volume-claim-for-statefulset-8050e396cc51)

- [Kubernetes Storage 101](https://www.magalix.com/blog/kubernetes-storage-101)

- [ Configuring Persistent Storage](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.4/html/installation_and_configuration/configuring-persistent-storage)