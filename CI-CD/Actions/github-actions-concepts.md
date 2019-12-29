# GitHub Actions Concepts

## What is GitHub Actions?
GitHub Actions automates the software development life cycle workflows to build, test and deploy your projects on GitHub. GitHub Actions are made up of actions, individual tasks that you can configure, which you can combine with other tasks to build a workflow. These workflows are automated processes within the repository that can build, test, package and deploy your project on GitHub.

With GitHub Actions, you can build a full end-to-end continuous integration (CI) and continuous deployment (CD) pipeline directly within the repository on GitHub.


## Workflows
A workflow is a configurable automated process that consists of one or more jobs. In order to execute a workflow, the project must contain the corresponding YAML file that defines the workflow configuration. With these workflows, you can trigger a job whenever a code has been pushed to a certain branch or pull requests. Once the workflow is running, you can configure the workflow to perform any specific commands and save the artifacts, such as reports or generated files, whenever the job is complete. GitHub Actions will provide real-time logs as well as a status check to alert whether the workflow has passed or failed.


## Example
```yaml
# Name of workflow
name: PR workflow for shell scripts

# Trigger workflow on pull requests only
on: pull_request

# Configure the jobs that the workflow must complete
jobs:
  execute-script:
    runs-on: ubuntu-latest
    steps:
    - name: Execute shell script
      run: ./test_script.sh
```


## GitHub Action Features
- Build, test and publish project on Linux, macOS, Windows, ARM or containers
- Save time with matrix builds
- Support for various languages in Node.js, Python, Java, Ruby, PHP, Go, RUST, .NET, and more
- Observe real-time logs for all the workflows
- Built-in secret management
- Multi-container testing