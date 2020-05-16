# Infrastructure as Code


Infrastruce as code - Infrastructure as code (IaC) is the process of managing and provisioning computer data centers through machine-readable definition files, rather than physical hardware configuration or interactive configuration tools.[1] The IT infrastructure managed by this comprises both physical equipment such as bare-metal servers as well as virtual machines and associated configuration resources. The definitions may be in a version control system. It can use either scripts or declarative definitions, rather than manual processes, but the term is more often used to promote declarative approaches. 

Simply code your infrastructure configuration files with combination of different cloud providers.


- What is Terraform?
  - With Terraform, you describe your complete infrastructure as code, even as it spans multiple service providers. Your servers may come from AWS, your DNS may come from CloudFlare, and your database may come from Heroku. Terraform will build all these resources across all these providers in parallel.

  - Terraform was developed by Hashicorp, the company behind Vagrant, Consul, Vault, Nomad and other tools from HashiStack. This is a configuration orchestration tool that is incredible for provisioning, adjusting and destroying the virtual server environments. It is available both as a DevOps-as-a-Service enterprise-grade offer from Hashicorp and as an open-source solution able to work with a variety of Cloud Service Providers to create multi-cloud ecosystems.


  - Infrastructure as Code: Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.

  - Execution Plans: Terraform has a "planning" step where it generates an execution plan. The execution plan shows what Terraform will do when you call apply. This lets you avoid any surprises when Terraform manipulates infrastructure.

  - Resource Graph: Terraform builds a graph of all your resources, and parallelizes the creation and modification of any non-dependent resources. Because of this, Terraform builds infrastructure as efficiently as possible, and operators get insight into dependencies in their infrastructure.


- What is Ansible?
  - Ansible is an IT automation tool. It can configure systems, deploy software, and orchestrate more advanced IT tasks such as continuous deployments or zero downtime rolling updates. Ansible’s goals are foremost those of simplicity and maximum ease of use.

- Puppet Labs
  - Puppet is an automated administrative engine for your Linux, Unix, and Windows systems and performs administrative tasks (such as adding users, installing packages, and updating server configurations) based on a centralized specification.
  
- Chef 
  - Chef enables you to manage and scale cloud infrastructure with no downtime or interruptions. Freely move applications and configurations from one cloud to another. Chef is integrated with all major cloud providers including Amazon EC2, VMWare, IBM Smartcloud, Rackspace, OpenStack, Windows Azure, HP Cloud, Google Compute Engine, Joyent Cloud and others.
  
- AWS CloudFormation
  - You can use AWS CloudFormation’s sample templates or create your own templates to describe the AWS resources, and any associated dependencies or runtime parameters, required to run your application. You don’t need to figure out the order in which AWS services need to be provisioned or the subtleties of how to make those dependencies work.
