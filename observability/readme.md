# Monitoring & Observability

## What is monitoring?


## What is Observabilty?

- In control theory,observabity is a measure of how well internal state of a system can be inferred from knowledge of its external outputs.

- These are the three main concept of observabilty.
  - Structured Logging
  - Metrics
  - Traces



## Observabilty

> Observabilty stack

```yaml
    Monitoring     -    Metrics     - Prometheus 
    Monitoring     -    Dashboard   - Grafana
    Logging        -    Logs        - Loki
    Logging        -    Log Shipping    - Fluentd 
    Monitoring     -    Metrics Shipping - Thanos
    Monitoring     -    Grafana Backup   - Wizzy
```