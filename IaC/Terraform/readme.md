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
