## HELM And HELM Charts

### Introduction what is Helm and what are helm charts?

 - [Helm Documentation](https://helm.sh/docs/)

> Helm uses a packaging format called charts.A chart is a collection of files that describes a related set of kubernetes resources.
> A single chart might  be used to deploy something simple like a memchached pods, or something complex like a full web app stack with HTTP servers, databases,caches and so on.

## The Chart file structure 

A chart is organized as a collection of files inside of a directory.The directory name is the name of the chart.
## Chart Hooks 

 Helm provides a hook mechanism to allow chart developers to intervene at certain points in a release's life cycle. For example, you can use hooks to:

  -  Load a ConfigMap or Secret during install before any other charts are loaded.
  -  Execute a Job to back up a database before installing a new chart, and then execute a second job after the upgrade in order to restore data.
  - Run a Job before deleting a release to gracefully take a service out of rotation before removing it.

Hooks work like regular templates, but they have special annotations that cause Helm to utilize them differently. In this section, we cover the basic usage pattern for hooks.

The Available Hooks


> The following hooks are defined:
 Annotation Value	      |             Description
- pre-install	-> Executes after templates are rendered, but before any resources are created in Kubernetes
- post-install	-> Executes after all resources are loaded into Kubernetes
- pre-delete	-> Executes on a deletion request before any resources are deleted from Kubernetes
- post-delete	-> Executes on a deletion request after all of the release's resources have been deleted
- pre-upgrade	-> Executes on an upgrade request after templates are rendered, but before any resources are updated
- post-upgrade	-> Executes on an upgrade after all resources have been upgraded
- pre-rollback	-> Executes on a rollback request after templates are rendered, but before any resources are rolled back
- post-rollback	-> Executes on a rollback request after all resources have been modified
- test	        -> Executes when the Helm test subcommand is invoked ( view test docs)

## Chart tests

## Helm Architecture

## RBAC 