# CircleCI Configuration File

The following example calls an Orb named hello-build that exists in the certified circleci namespace.
```
version: 2.1
orbs:
    hello: circleci/hello-build@0.0.5
workflows:
    "Hello Workflow":
        jobs:
          - hello/hello-build
```

# CircleCI Commands

The CircleCI CLI is a command line interface that leverages many of CircleCI’s advanced and powerful tools from the comfort of your terminal. 

# CircleCI Local CLI

Below are few things you can do with the CircleCI CLI :

Debug and validate your CI config
Run jobs locally
Query CircleCI’s API
Create, publish, view and manage Orbs
Managing contexts



