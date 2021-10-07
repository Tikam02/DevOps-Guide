# What Is Continuous Integration (CI)? 
Continuous integration (CI) is a software development strategy that increases the speed of development while ensuring the quality of the code that teams deploy. Developers continually commit code in small increments (at least daily, or even several times a day), which is then automatically built and tested before it is merged with the shared repository.

# What is Circle CI ?
With CircleCI, you can automate your software’s build, test, and deployment and your engineers can get back to work building the features that your users care about the most.

# CircleCI Features:
Following are the most popular features CircleCI offers

* SSH into Builds
* Parallelism
* Resource Class
* Cache
* Workflows
* Monitoring
* Nomad Cluster
* APIs

# CircleCI Project:
A CircleCI project shares the name of the associated code repository in your VCS (GitHub or Bitbucket). Select Add Project from the CircleCI application to enter the Projects dashboard, from where you can set up and follow the projects you have access to.

# Orbs:
Orbs are packages of config that you either import by name or configure inline to simplify your config, share, and reuse config within and across projects. 

# Jobs:
Jobs are collections of steps. All of the steps in the job are executed in a single unit, either within a fresh container or VM.
Visit the [Orbs Registry](https://circleci.com/developer/orbs) to search for orbs to help simplify your config.

# Steps:
Steps are a collection of executable commands which are run during a job.

# Caching:
Caching persists data between the same job in different Workflow builds, allowing you to reuse the data from expensive fetch operations from previous jobs. 

# Workspace :
When a workspace is declared in a job, files and directories can be added to it. Each addition creates a new layer in the workspace filesystem.

# Artifacts :
Artifacts are used for longer-term storage of the outputs of your pipelines. Artifacts are stored for up to 30 days.

# CircleCI Config :
CircleCI believes in configuration as code. As a result, the entire delivery process from build to deploy is orchestrated through a single file called config.yml.
The config.yml file is located in a folder called .circleci at the top of your project. CircleCI uses the YAML syntax for config.

# Commands  :
A command definition defines a sequence of steps as a map to be executed in a job, enabling you to reuse a single command definition across multiple jobs.

# Executors   :
Executors define the environment in which the steps of a job will be run, allowing you to reuse a single executor definition across multiple jobs.

# Pipeline   : 
A CircleCI pipeline is the full set of processes you run when you trigger work on your projects. Pipelines encompass your workflows, which in turn coordinate your jobs. 


