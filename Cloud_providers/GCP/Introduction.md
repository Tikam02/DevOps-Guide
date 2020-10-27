# Introduction

Google Cloud Platform (GCP), offered by Google, is a suite of cloud computing services that runs on the same infrastructure that Google uses internally for its end-user products, such as Google Search, Gmail, file storage, and YouTube.Alongside a set of management tools, it provides a series of modular cloud services including computing, data storage, data analytics and machine learning. Registration requires a credit card or bank account details.

Google Cloud Platform provides infrastructure as a service, platform as a service, and serverless computing environments.

In April 2008, Google announced App Engine, a platform for developing and hosting web applications in Google-managed data centers, which was the first cloud computing service from the company. The service became generally available in November 2011. Since the announcement of the App Engine, Google added multiple cloud services to the platform.

Google Cloud Platform is a part of Google Cloud, which includes the Google Cloud Platform public cloud infrastructure, as well as Google Workspace (formerly G Suite[5]), enterprise versions of Android and Chrome OS, and application programming interfaces (APIs) for machine learning and enterprise mapp

## Accessing the Cloud Console
1. Go to this link to open cloud console [link](https://accounts.google.com/AddSession/signinchooser?service=accountsettings&continue=https%3A%2F%2Fconsole.cloud.google.com%2Fhome%2Fdashboard%3Fproject%3Dqwiklabs-gcp-00-f55253468191&flowName=GlifWebSignIn&flowEntry=AddSession)
2. This will open the Google Cloud sign in page
 ![Google Login Page](https://cdn.qwiklabs.com/zET9RtU1aN7f3FhNhhUNe7%2BPbBtgwz4fTUO3E86m8m0%3D)
3. Your page should now resemble the following:
![GCP Explaination Image](https://cdn.qwiklabs.com/vPsOw690IZhUlPPxZk3asDaXQBRVZRiyr%2B6nBXCqEf4%3D)
## Projects in Google Cloud Console
A Google Cloud Project is an organizing entity for your Google Cloud resources. It often times contains resources and services—for example, it may hold a pool of virtual machines, a set of databases, and a network that connects them with one another. Projects also contain settings and permissions, which specify security rules and who has access to what resources.
If you look in the top-left side of the console, you will see a panel called Project info which should resemble the following:

![GCP Explaination Image](https://cdn.qwiklabs.com/kaHKc2t7OyP7YUPOj4Eqw0nuUXQvt0iUypsuaeqkzKw%3D)

As you see, your project has a name, ID, and number. These identifiers are frequently used when interacting with Google Cloud services. You are working out of one project so you can get practice with a specific service or feature of Google Cloud.
It's not uncommon for large enterprises or experienced users of Google Cloud to have dozens to thousands of Google Cloud projects. Organizations use Google Cloud in different ways, so projects are a good way to separate cloud-computing services (by team or product for example.
## Navigation Menu and Services
* In the top-left corner, you will notice a three-line icon that resembles the following:
![GCP Explaination Image](https://cdn.qwiklabs.com/jNaEVX1xXeOOasukmY%2B9mcktmn9gjkwgNAJEkBlIYbI%3D)
* Clicking on this will reveal (or hide) a Navigation menu that points to Google Cloud's core services. If the menu isn't exposed, click on the icon now and scroll through to see the types of services offered:
![GCP Explaination Image](https://cdn.qwiklabs.com/gk6CVCz3LGXvViYQ%2FZUp%2Bu1VqI0DBrDAZh7kToRN20Q%3D)

The Navigation menu is an important component of the Cloud Console—it offers quick access to the platform's services and also outlines its offerings. If you scroll through the menu, you will see that there are seven categories of Google Cloud services:

* Compute: houses a variety of machine types that support any type of workload. The different computing options let you decide how involved you want to be with operational details and infrastructure amongst other things.
* Storage: data storage and database options for structured or unstructured, relational or non relational data.
Networking: services that balance application traffic and provision security rules amongst other things.
* Cloud Operations: a suite of cross-cloud logging, monitoring, trace, and other service reliability tools.
* Tools: services for developers managing deployments and application build pipelines.
* Big Data: services that allow you to process and analyze large datasets.
* Artificial Intelligence: a suite of APIs that run specific artificial intelligence and machine learning tasks on Google Cloud.
This link will take you to documentation that covers each of these categories in more depth if you are interested.
## Roles and Permissions
Earlier we mentioned that besides cloud computing services, Google Cloud also houses a collection of permissions and roles that define who has access to what resources. We can use the Cloud Identity and Access Management (Cloud IAM) service to inspect and modify such roles and permissions.

![GCP Explaination Image](https://cdn.qwiklabs.com/v5er%2BfG4yURAeD9YUOKNuDgtD9KdMi9Sg2Ph9XThkZA%3D)

If closed, open up the navigation menu. Then near the top click IAM & admin. This will take you to a page that contains a list of users, which specifies permissions and roles granted to certain accounts. Try to sift through these and find the "@qwiklabs" username you signed in with:


You should find something similar:

![GCP Explaination Image](https://cdn.qwiklabs.com/2DMzLfj5mYLyzliG6TBp9A0PoW1PHzDXVffA%2FwbL%2BiQ%3D)

You will see that the Role field is set to "Editor", which is one of three primitive roles offered by Google Cloud. Primitive roles set project-level permissions and unless otherwise specified, they control access and management to all Google Cloud services.
The following table pulls definitions from the roles documentation, which gives a brief overview of viewer, editor, and owner role permissions:

Role Name | Permissions
--------- | -----------
roles/viewer | Permissions for read-only actions that do not affect state, such as viewing (but not modifying) existing resources or data.
roles/editor | All viewer permissions, plus permissions for actions that modify state, such as changing existing resources.
roles/owner | All editor permissions and permissions for the following actions: Manage roles and permissions for a project and all resources within the project; Set up billing for a project.

So as an editor you will be able to create, modify, and delete Google Cloud resources. However, you won't be able to add or delete members from Google Cloud projects.

## APIs and Services
Google Cloud APIs are a key part of Google Cloud. Like services, the 200+ APIs in areas that range from business administration to machine learning all easily integrate with Google Cloud projects and applications.

Most Cloud APIs provide you with detailed information on your project’s usage of that API, including traffic levels, error rates, and even latencies, helping you to quickly triage problems with applications that use Google services. You can view this information by opening the navigation menu and clicking on APIs & Services > Library:

![GCP Explaination Image](https://cdn.qwiklabs.com/IhN1xAfMsp0KrMIwX50LGtlzcsup%2BfK45UA1wseaaa4%3D)

If you take a look at the left-hand menu with the header "CATEGORY", you will see all the different type of categories offered. In the API search bar, type in Dialogflow and select the Dialogflow API. You should now be on the following page:

![GCP Explaination Image](https://cdn.qwiklabs.com/TJxda7OL7Z8mAPtAWRFkf16dH2KSGWP%2FS0cEvzofT%2Fw%3D)

The Dialogflow API allows you to build rich conversational applications (e.g. for Google Assistant) without having to worry about the underlying machine learning and natural language understanding schema.

Now click Enable. This will take you to a new page, hit the back button in your browser and you will see that the API is now enabled:

![GCP Explaination Image](https://cdn.qwiklabs.com/eTgnbsNvLaqrex7qumvUuzQEc114GwncM%2FV8xL4j594%3D)

Now click on Try this API. This will open a new tab that will reveal the documentation for the Dialogflow API and will specify the methods available to you. Examine some of these and close the tab when you're finished.

Open the Navigation menu and click Home to go back to main page of the Cloud Console.

## Cloud Shell
Now that you understand the key features of Google Cloud and the Cloud Console, you will get hands-on practice with Cloud Shell. Cloud Shell is an in-browser command prompt execution environment that allows you to enter commands at a terminal prompt to manage resources and services in your Google Cloud project.

Cloud Shell lets you run all of your shell commands without leaving the console and comes with pre-installed command line tools.

In the top-right corner of the console, click on the Activate Cloud Shell button and then click Start Cloud Shell if prompted:

![GCP Explaination Image](https://cdn.qwiklabs.com/RuUJsmCzDpq4kWuMpt4yXLfoj6kH3MGYNcI0DE3ipB0%3D)

A new, black window should appear at the bottom of the console with messages and prompts that resemble the following:


Welcome to Cloud Shell! Type "help" to get started.
Your Cloud Platform project in this session is set to qwiklabs-gcp-76ad0f1342e20013.
Use "gcloud config set project [PROJECT_ID]" to change to a different project.
gcpstaging23396_student@cloudshell:~ (qwiklabs-gcp-76ad0f1342e20013)$



You now have a Cloud Shell session up and running. Type in the following command:


gcloud auth list



You will get an output similar to this:


Credentialed Accounts
ACTIVE  ACCOUNT
\*       gcpstaging23396_student@qwiklabs.net
To set the active account, run:
    $ gcloud config set account \`ACCOUNT\`
    
    
    
As mentioned earlier, Cloud Shell comes preinstalled with specific command line tools. The main Google Cloud toolkit is gcloud, which is used for many tasks on the platform, like resource management and user authentication.

You just ran a gcloud command—auth list—which lists the credentialed account(s) in your Google Cloud project. 

Besides pre-installed toolkits, Cloud Shell also comes with the standard unix command line interface (CLI) tools and text editors like nano. We can use these to create and edit files right inside Cloud Shell.

Run the following touch command to create a file called test.txt:


touch test.txt



touch won't generate any output. Run the unix command ls to list the files in our current directory:


ls



You should receive the following output:


README-cloudshell.txt  test.txt



We see our new test.txt file added to our working directory. Let's make some edits to it using the nano text editor that we referenced earlier. To edit a file, type in nano followed by the filename you want to edit in Cloud Shell:


README-cloudshell.txt  test.txt



This will open the blank file with the Nano text editor:


![GCP Explaination Image](https://cdn.qwiklabs.com/xvq7XWdjSMm7k8g3pdSchB70h3IKQtgT4frc3fBWkzU%3D)


Go ahead and type in a message, like the following:


Google Cloud is the best!



Once you have that written in, hold the CNTRL+X keys. Then type in Y followed by the Enter key to save the file with the new message.

Another helpful command is cat, which will output the contents of a file. Run the following command to make sure that our file was updated correctly:


cat test.txt



You should see the following output in your Cloud Shell session:


Google Cloud is the best!



And just like that, you were able to create, edit, and output the contents of a file all in Cloud Shell (all without having to leave your browser.)

### So this ends your brief intro to the GCP
