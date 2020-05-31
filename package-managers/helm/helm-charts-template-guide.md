   # Helm Templates 
   

   ## Helm Charts built-in-objects
   
- Release: This object describes the release itself. It has several objects inside of it:
    - Release.Name: The release name
    - Release.Namespace: The namespace to be released into (if the manifest doesn’t override)
    - Release.IsUpgrade: This is set to true if the current operation is an upgrade or rollback.
    - Release.IsInstall: This is set to true if the current operation is an install.
    - Release.Revision: The revision number for this release. On install, this is 1, and it is incremented with each upgrade and rollback.
    - Release.Service: The service that is rendering the present template. On Helm, this is always Helm.
- Values: Values passed into the template from the values.yaml file and from user-supplied files. By default, Values is empty.
- Chart: The contents of the Chart.yaml file. Any data in Chart.yaml will be accessible here. For example {{ .Chart.Name }}-{{ .Chart.Version }} will print out the mychart-0.1.0.
        
- The available fields are listed in the Charts Guide

- Files: This provides access to all non-special files in a chart. While you cannot use it to access templates, you can use it to access other files in the chart. See the section Accessing Files for more.
    - Files.Get : is a function for getting a file by name (.Files.Get config.ini)
    - Files.GetBytes : is a function for getting the contents of a file as an array of bytes instead of as a string. This is useful for things like images.
    - Files.Glob : is a function that returns a list of files whose names match the given shell glob pattern.
    - Files.Lines : is a function that reads a file line-by-line. This is useful for iterating over each line in a file.
    - Files.AsSecrets :  is a function that returns the file bodies as Base 64 encoded strings.
    - Files.AsConfig : is a function that returns file bodies as a YAML map.
    
- Capabilities: This provides information about what capabilities the Kubernetes cluster supports.
    - Capabilities.APIVersions :  is a set of versions.
    - Capabilities.APIVersions.Has $version indicates whether a version (e.g., batch/v1) or resource (e.g., apps/v1/Deployment) is available on the cluster.
    - Capabilities.KubeVersion and Capabilities.KubeVersion.Version is the Kubernetes version.
    - Capabilities.KubeVersion.Major is the Kubernetes major version.
    - Capabilities.KubeVersion.Minor is the Kubernetes minor version.

- Template: Contains information about the current template that is being executed
    - Name: A namespaced file path to the current template (e.g. mychart/templates/mytemplate.yaml)
    - BasePath: The namespaced path to the templates directory of the current chart (e.g. mychart/templates).


## helm : lookup function
> The lookup function can be used to lookup resources in a running cluster

## helm : Qoute function

> When injecting strings from the .values,object into the template,we ought to quote these strings, we can do that by calling the quote function in the template directive.


## helm : Flow-Control

- Helm's template language provides the following control structures:
    
    - if/else for creating conditional blocks
    - with to specify a scope
    - range, which provides a "for each"-style loop

