# Docker
*****************


*****************


- Why DOCKER?

    - An application is working fine on developer console but not in testing or in production.

    - In Dev there can be a software which is updated but in testing and production an older version is being used.

    - Docker is a computer program/tool that makes it easier to deploy and run applications using a concept known as “containerization”.

    - Imagine as a developer your application is packaged up with all of the parts it needs, such as libraries and other dependencies, and it is shipped out as one package

    - Docker in other words is a light weight virtualization tool and containerizing platform where you can run and deploy applications and its dependencies which can be run in a Linux environment.



- Microservice Architecture : 

    - The idea behind microservice is some application is easier to build and maintain where broken down to smaller parts.
    - Each component is developed seperately and done....

    - Example : Online Shopping Service : 
	
								Account Service
								Product Catalog
								Cart Server
								Order Server

- Advantages of microservice architecture : 

	- Building and maintainence is easy as broken down to smaller parts.
	- If we need some new features or update in a module,
		 it is easier because dependencies will be less compared to the application as a whole.
	- If any component go down, application will be largely unaffected.

- What is the problem to adopting microservices :

    - Before DOCKER : For microservice architecture we have a host machine and there are several virtual machines 
				each virtual machine is for a microservice. So problem is that lots of resource waste.
				As we use more and more VMs for bigger application lots of disc space, RAM are unused.

- How Docker solve this problem :

	- We can run several microservices in one virtual machine by running various docker
	- containers for each microservice.
	- Docker do not need any RAM,DISK requirments initially.

- How Docker solves the problem "not having consistent computing environment throughout the process of delivery (developement, testing, production)" :

	- Docker containers are developed by the developers.
	- Docker provides a consistent computing environment throughout the whole SDLC (Software Developement Life Cycle).

- What is an Image?
  - Docker image is the basis of containers. It’s a collection of layers stacked on top of each other. Each Docker image references a list of read-only layers that represent filesystem differences. Think of it like the jar file for java applications, you create one jar file but you can deploy it anywhere a java run time is enabled.
  - A docker image is an archive containing all the files that go in a container.
  - You can create many docker containers from the same docker image.
  - The image can then be deployed to any Docker environment and executable as a container.
  - A Docker image is containing everything needed to run an application as a container. This includes:

    - code
    - runtime
    - libraries
    - environment variables
    - configuration files
    
    ![docker image](https://github.com/Tikam02/DevOps-Guide/blob/master/img/container-layers.jpg)

		
- What is a container?

	- A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

	- A docker container image is s lightweight, standalone, executable package of software that includes everything needed to run an application: code, libraries, settings etc.

	- Container images become containers at runtime and in the case of docker containers images become containers when they run on docker engine.

	- Containers share the machine's OS system kernel and therefore do not require an OS per application.

	- Applications are safer in containers and Docker provides the strongest default isolation capabilities in the industry.

    - Docker container is the actual running piece created from a docker image. The only difference between a docker image and a docker container is a top writable layer. When you create a new container, you add a new, thin, writable layer on top of the underlying stack. This layer is often called the “container layer”. All changes made to the running container — such as writing new files, modifying existing files, and deleting files — are written to this thin writable container layer. But once you delete the container, this top layer will be deleted as well. So it’s not persistent. The best thing with docker is that you can create a docker image using the current docker container with a commit. Hence, enabling us to capture system information and make it immutable so its reproducible anywhere. This solves many of the server related problems we encounter these days.
    
    ![Docker container](https://github.com/Tikam02/DevOps-Guide/blob/master/img/docker-image.png)  
    
  

- Containers Vs VM

    - When talking about containerization it is very often compared to virtual machines. Let’s take a look at the following image to see the main difference :
  
    - The Docker container platform is always running on top of the host operating system. Containers are containing the binaries, libraries, and the application itself. Containers do not contain a guest operating system which ensures that containers are lightweight.
  
    -In contrast virtual machines are running on a hypervisor (responsible for running virtual machines) and include it’s own guest operating system. This increased the size of the virtual machines significantly, makes setting up virtual machines more complex and requires more resources to run each virtual machine.

    ![container vs VM]()

- Dockerfile

    - Blueprint of a docker image (a text document) is known as Dockerfile. This file contains all the commands you would run in order to build the docker image you want. Docker can build images reading this file, which is one of the key advantages of docker.

    ```bash
    # Super simple example of a Dockerfile
    FROM ubuntu:latest
    MAINTAINER Tikam Alma 

    RUN apt-get update
    RUN apt-get install -y python python-pip wget
    RUN pip install Flask

    ADD hello.py /home/hello.py

    WORKDIR /home
    ```

    - We first write a Dockerfile which is like the definition of the image. Using the Dockerfile we create a docker image. We then push this image to Docker Hub and provide a unique tag that can be used to identify our image. Using this tag and image name, we can pull the docker image and deploy on another computer as a docker container.