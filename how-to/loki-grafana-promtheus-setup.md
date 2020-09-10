

### How to Setup Loki Grafana and Prometheus 

- Install helm 
- [Install helm link ](https://helm.sh/docs/intro/install/)


- Install Prometheus Operator

```bash
helm install  prom-op stable/prometheus-operator --namespace monitoring \
--set prometheus.service.type=NodePort \
--set grafana.service.type=NodePort \
--set commonLabels.prometheus=prom-op \
--set prometheus.prometheusSpec.serviceMonitorSelector.matchLabels.prometheus=prom-op
```

- Expose
    - If using minikube ``` minikube service loki  --url --namespace=monitoring ```
    - If using local ``` kubectl  port-forward --namespace=monitoring  svc/loki-grafana 3000:80```

- Get username and password 

``` kubectl get secret --namespace monitoring  prom-op-grafana  -o yaml```

- Install Loki

```
helm repo add loki https://grafana.github.io/loki/charts
helm repo update
helm install loki/loki --name loki --namespace monitoring
 ```

 To have persistent disk space, add the option --set loki.persistence.enabled=true:

```$ helm upgrade --install loki loki/loki-stack \
               --namespace monitoring \
               --set loki.persistence.enabled=true
```
- Loki stack 

```$ helm upgrade --install loki loki/loki-stack --namespace monitoring

To have persistent disk space, add the option --set loki.persistence.enabled=true:

$ helm upgrade --install loki loki/loki-stack \
               --namespace monitoring \
               --set loki.persistence.enabled=true
```
 - Get logs in grafana

 - Install Fluentd
    - add s3 services to push logs to s3 

### Logging - Fluentd

- [Fluentd Docs](https://docs.fluentd.org/)

- The configuration file consists of the following directives

1. source directives determine the input sources.
2. match directives determine the output destinations.
3. filter directives determine the event processing pipelines.
4. system directives set system wide configuration.
5. label directives group the output and filter for internal
routing
6. @include directives include other files.
