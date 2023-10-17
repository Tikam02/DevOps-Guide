# 1. Microsoft Azure Concepts

Microsoft Azure is a comprehensive cloud computing platform provided by Microsoft. Here are some fundamental concepts to understand when working with Azure:

## 1. **Azure Regions and Availability Zones**
- **Region:** Azure has multiple datacenter regions globally, each consisting of one or more datacenters. Regions allow you to deploy resources in specific geographic locations, taking into account data residency and latency requirements.
- **Availability Zone:** Availability Zones are unique physical locations within an Azure region. They provide high availability by hosting resources in separate datacenters with independent power, cooling, and networking.

## 2. **Virtual Machines (VMs)**
- **Virtual Machine (VM):** Azure VMs are scalable and fully configurable virtualized computing instances. You can choose from a variety of VM sizes and operating systems to meet your application requirements.
- **Azure Marketplace:** The Azure Marketplace offers pre-configured VM images and templates for various applications and services.

## 3. **Azure Storage**
- **Azure Storage:** Azure provides scalable and highly available cloud storage services, including Blob Storage (for unstructured data), File Storage (for file shares), Table Storage (NoSQL), and Queue Storage (messaging).
- **Azure Blob:** Blob Storage is used for storing binary and text data, such as images, videos, and backups.

## 4. **Azure Active Directory (Azure AD)**
- **Azure Active Directory (Azure AD):** Azure AD is Microsoft's cloud-based identity and access management service. It allows you to manage user identities and enable single sign-on (SSO) to various Azure and third-party applications.
- **Azure AD Tenant:** Each Azure AD instance is known as a tenant and represents an organization's identity store in Azure.

## 5. **Azure Resource Manager (ARM)**
- **Azure Resource Manager (ARM):** ARM is the deployment and management service for Azure. It allows you to create, update, and manage Azure resources using templates and declarative definitions.
- **ARM Templates:** ARM templates are JSON files that define the resources and their configurations in an Azure deployment.

## 6. **Azure Functions**
- **Azure Functions:** Azure Functions is a serverless compute service that allows you to run event-driven code without managing infrastructure. You can trigger functions in response to various events.
- **Triggers:** Functions can be triggered by events such as HTTP requests, Azure Storage changes, or message queue messages.

## 7. **Azure Load Balancer**
- **Azure Load Balancer:** Azure Load Balancer distributes incoming network traffic across multiple VM instances to ensure high availability and reliability for applications.
- **Frontend IP Configuration:** Load Balancer has frontend and backend IP configurations to route traffic to the appropriate VMs.

## 8. **Azure SQL Database**
- **Azure SQL Database:** Azure SQL Database is a managed relational database service based on Microsoft SQL Server. It offers high availability, scalability, and automatic backups.
- **Elastic Pools:** Elastic Pools allow you to manage and scale multiple databases together for cost optimization.

## 9. **Azure Virtual Network (VNet)**
- **Azure Virtual Network (VNet):** VNet is a network isolation and segmentation service that allows you to create private, isolated network environments for your Azure resources.
- **Subnet:** Subnets within a VNet help organize resources and define network security rules.

## 10. **Azure DevOps**
- **Azure DevOps:** Azure DevOps provides a set of tools for software development, including version control, continuous integration, and continuous delivery (CI/CD).
- **Azure DevOps Services:** Azure DevOps Services offers cloud-based tools for collaboration and DevOps practices.
## 11. Azure Kubernetes Service (AKS)

- **Azure Kubernetes Service (AKS):** AKS is a managed Kubernetes container orchestration service. It simplifies the deployment, management, and scaling of containerized applications using Kubernetes.

- **Node Pools:** AKS allows you to create and manage node pools with different configurations to accommodate varying workloads.

## 12. Azure Functions Premium Plan

- **Azure Functions Premium Plan:** In addition to the Consumption and Dedicated (App Service) plans, Azure Functions offers a Premium Plan that provides more advanced features, including VNET integration, longer execution timeout, and enhanced performance.

## 13. Azure Logic Apps

- **Azure Logic Apps:** Azure Logic Apps is a serverless workflow automation service that allows you to create workflows and integrate with various Azure and external services. It's used for orchestrating complex business processes.

- **Connectors:** Logic Apps use connectors to interact with external services and systems, making it easy to create automated workflows.

## 14. Azure Key Vault

- **Azure Key Vault:** Azure Key Vault is a secure, centralized service for managing and safeguarding cryptographic keys, secrets, and certificates used by cloud applications and services. It helps protect sensitive information.

- **Managed HSM:** Azure Key Vault offers Hardware Security Module (HSM)-backed keys for enhanced security.

## 15. Azure Synapse Analytics (formerly SQL Data Warehouse)

- **Azure Synapse Analytics:** Azure Synapse Analytics is an analytics service that combines enterprise data warehousing and big data analytics into one unified platform. It allows you to analyze large volumes of data and perform data transformations.

- **Data Integration:** Synapse Analytics provides data integration capabilities to ingest and prepare data from various sources for analysis.

## 16. Azure DevTest Labs

- **Azure DevTest Labs:** DevTest Labs is a service that enables developers and testers to create and manage environments for development, testing, and training. You can control costs and resources through policies.

- **Artifacts:** DevTest Labs allows you to define and share artifacts (like pre-configured VM images) for quick environment setup.

## 17. Azure Firewall

- **Azure Firewall:** Azure Firewall is a managed network security service that provides high availability, scalability, and advanced security features to protect your Azure Virtual Network resources.

- **Application Rules:** Azure Firewall supports application rules to allow or deny outbound traffic to specific FQDNs (Fully Qualified Domain Names).

## 18. Azure Databricks

- **Azure Databricks:** Azure Databricks is an Apache Spark-based analytics platform optimized for Azure. It provides a collaborative environment for data scientists, engineers, and analysts to work with big data and machine learning.

- **Integration:** Databricks integrates with various Azure services like Azure Data Lake Storage, Azure SQL Data Warehouse, and Azure Machine Learning.

## 19. Azure Cosmos DB

- **Azure Cosmos DB:** Cosmos DB is a globally distributed, multi-model database service designed for high availability and low-latency access. It supports various data models, including document, key-value, graph, and column-family.

- **Multi-Model API:** Cosmos DB allows you to choose from different APIs (e.g., SQL, MongoDB, Cassandra) to interact with your data.

## 20. Azure Sentinel

- **Azure Sentinel:** Azure Sentinel is a cloud-native Security Information and Event Management (SIEM) service that provides intelligent security analytics for threat detection and response across your organization's resources.

- **Security Connectors:** Sentinel integrates with a wide range of Microsoft and third-party security solutions to collect and analyze security data.

# 2. Basic Commands
These are only basic commands for more you can consider https://learn.microsoft.com/en-us/azure/?product=popular

### 1. Login to Azure Account:
```az login```

### 2. List Subscriptions:
```az account list```

### 3. Set Active Subscription:
```az account set --subscription "Subscription Name or ID"```

### 4. List Resource Groups:
```az group list```

### 5. Create a Resource Group:
```az group create --name "ResourceGroupName" --location "East US"```

### 6. Deploy a Virtual Machine:
```az vm create --resource-group "ResourceGroupName" --name "VMName" --image "UbuntuLTS" --admin-username "azureuser" --admin-password "Password123"```

### 7. Start/Stop/Restart a Virtual Machine:
```az vm start --resource-group ResourceGroupName" --name "VMName" az vm stop --resource-group "ResourceGroupName" --name "VMName" az vm restart --resource-group "ResourceGroupName" --name "VMName"```

### 8. List Virtual Machines:
```az vm list --resource-group "ResourceGroupName"```

### 9. Delete a Virtual Machine:
```az vm delete --resource-group "ResourceGroupName" --name "VMName" --yes --no-wait```

### 10. Create a Storage Account:
```az storage account create --name "storageaccountname" --resource-group "ResourceGroupName" --location "East US" --sku "Standard_LRS"```

### 11. List Storage Accounts:
```az storage account list --resource-group "ResourceGroupName"```

### 12. Create a Blob Container:
```az storage container create --name "containername" --account-name "storageaccountname" --account-key "accountkey"```

### 13. List Blob Containers:
```az storage container list --account-name "storageaccountname" --account-key "accountkey"```

### 14. Deploy Azure Web App:
```az webapp create --resource-group "ResourceGroupName" --plan "AppServicePlanName" --name "WebAppName" --runtime "DOTNET|10.0" --deployment-local-git```

### 15. List Azure Web Apps:
```az webapp list --resource-group "ResourceGroupName"```

For more can check out : https://learn.microsoft.com/en-us/azure/?product=popular

Happy Learning ! 

