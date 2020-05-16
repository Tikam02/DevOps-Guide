# Prometheus Concepts

# What is Prometheus?
Prometheus is an open-source systems monitoring and alerting toolkit originally built at SoundCloud.Prometheus does one thing and it does it well. It has a simple yet powerful data model and a query language that lets you analyse how your applications and infrastructure are performing. It does not try to solve problems outside of the metrics space, leaving those to other more appropriate tools.Prometheus is primarily written in Go and licensed under the Apache 2.0 license.

# Architecture
A typical monitoring platform with Prometheus is composed of multiple tools
-> Multiple exporters that typically run on the monitored host to export local metrics.
-> Prometheus -to centralize and store the metrics.
-> Alertmanager - to trigger alerts based on those metrics.
-> Grafana -to produce dashboards.
->PromQL- is the query language used to create dashboards and alerts.

# Components
The Prometheus ecosystem consists of multiple components, many of which are optional:
-> the main Prometheus server which scrapes and stores time series data
-> client libraries for instrumenting application code
-> a push gateway for supporting short-lived jobs
-> special-purpose exporters for services like HAProxy, StatsD, Graphite, etc.
-> an alertmanager to handle alerts.
-> various support tools.

# What Prometheus Is Not 
As a metrics-based system, Prometheus is not suitable for storing event logs or individual events. Nor is it the best choice for high cardinality data, such as email addresses or usernames.
Prometheus is designed for operational monitoring, where small inaccuracies and race conditions due to factors like kernel scheduling and failed scrapes are a fact of life. Prometheus makes tradeoffs and prefers giving you data that is 99.9% correct over your monitoring breaking while waiting for perfect data. Thus in applications involving money or billing, Prometheus should be used with caution.
