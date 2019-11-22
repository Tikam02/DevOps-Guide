# Terraform

***************************
## Table Of Contents: 
  - [Introduction](#introdution)
  - [Tutorial Resources](#tutorial-resources)
  - [References](#reference)


*****************

## Introdution
 - What is Terraform?

    - Terraform is an open source tool that allows you to define infrastructure for a variety of providers (e.g. AWS, Azure, Google Cloud, DigitalOcean, DataDog, VMWare, GitHub, etc) using a simple, declarative programming language and to deploy and manage that infrastructure using a few CLI commands.
    
- Terraform Cloud is an application that helps teams use Terraform together. It manages Terraform runs in a consistent and reliable environment, and includes easy access to shared state and secret data, access controls for approving changes to infrastructure, a private registry for sharing Terraform modules, detailed policy controls for governing the contents of Terraform configurations, and more.

Terraform Cloud is available as a hosted service at https://app.terraform.io. We offer free accounts for small teams, and paid plans with additional feature sets for medium-sized businesses.

Large enterprises can purchase Terraform Enterprise, our self-hosted distribution of Terraform Cloud. It offers enterprises a private instance of the Terraform Cloud application, with no resource limits and with additional enterprise-grade architectural features like audit logging and SAML single sign-on.
    
    
## Why Terraform?

- Terraform is an "orchestration" tool, not an "automation tool:" Automation is a task completed without human intervention, while Orchestration means, taking a task and creating a workflow, or running several automated tasks called as processes. For example, orchestration is a way of combining multiple automation tasks to create IP or creating a security group

- Terraform is "Declarative" not "Procedural/Imperative:" These are contrasting programming patterns. Declarative programming does not control the flow of the program, you just say what you want and not say how to do it. Procedural programming, on the other hand, you define the whole process and provide the steps how to do it.

- Terraform follows Client Only Architecture, not Client/Server Architecture: Chef, Ansible all follow client/server architecture. You issue commands on a client system and it executes your commands and stores the state of your system. The server talks to agents, which must installed on every instance you want to configure. With this architecture, moving parts coming as a perk and may cause new failure modes. While Terraform uses the cloud provider API's to configure your infrastructure.
    
- Terraform has Multi-Provider Support: Terraform provides convenience to switch between different cloud providers like Google, AWS, Open Stack, Azure. Terraform allows you to write code specific to each provider.
    
- Terraform gives Immutable Infrastructure: This means once you instantiate your server, you do not change it. Instances are redeployed, instead of restoring from previous versions. Components are replaced rather than being updated with newer versions. This reduces the potential of Configuration Drift and uptime is improved.

## Installation
- Install Through curl

```bash
$ curl -O https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip 

$ sudo unzip terraform_0.11.10_linux_amd64.zip -d /usr/local/bin/

$ rm terraform_0.11.10_linux_amd64.zip

```

Second method to install Through tfenv, a Terraform Version Manager

Download the tfenv binary and put it in your PATH.

```bash 
$ git clone https://github.com/Zordrak/tfenv.git ~/.tfenv

$ echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> $HOME/bashrc
```


Then, you can install the desired version of Terraform:

``` $ tfenv install 0.11.10 ```



## Usage
 - Terraform Workflow

    1. Scope - Confirm what resources need to be created for a given project.
    2. Author - Create the configuration file in Terraform template files based on the scoped parameters
    3. Initialize - Run `terraform init` in the project directory with the configuration files. This will download the correct provider plug-ins for the project.
    4. Plan & Apply - Run `terraform plan` to verify creation process and then `terraform apply` to create real resources as well as state file that compares future changes in your configuration files to what actually exists in your deployment environment.

****************************

## Tutorial Resources  
 - [Hashicorp Learn](https://learn.hashicorp.com/terraform)

************ 

## References
 - [Getting started with Terraform](https://learn.hashicorp.com/terraform/getting-started/intro)
 - [An Introduction to Terraform](https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180)
 - [Terraform Official site](https://www.terraform.io/docs)
