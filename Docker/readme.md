## Docker Tutorial
**********
### Table of Contents:
1. [Basic Concept of Images and Containers](https://github.com/Tikam02/DevOps-Guide/blob/master/Docker/docker-concepts.md)
2. [Docker Setup](#2.-setting-up-docker)
3. [Developing Fullstack WebApp in python Flask](3)
4. Writing Dockerfile
5. Composing Docker-compose
6. Testing Docker images
7. Push to Docker-hub


*****************

## 1. Basic concepts of docker - Conatainers and Images 

- Detailed Docker concepts and notes from here - [Docker Concepts](https://github.com/Tikam02/DevOps-Guide/blob/master/Docker/docker-concepts.md)

- Introduction to Docker:

	- Docker is a computer program that performs operating-system-level virtualization, also known as "containerization".
	- Containers could be as low as 50MB.
	- Docker is a tool which helps to containerization of an application.

	- Basic Design:

		Hardware --> Operating System --> Container Engine --> Bins/Libs --> App1
														   --> Bins/Libs --> App2
														   --> Bins/Libs --> App3



## 2. Setting up Docker


- Installation on ubuntu:

```bash

sudo apt-get update
		
sudo apt-get install docker.io 
 
 ```


- Docker container lifecycle:
  - Processes: pull and image from Docker hub into a system where docker engine is installed.
			whatever we downloaded from Docker hub is an image of a container.
			Run the image. (The moment we run the image it becomes container)
			Can run,stop,delete 
      

  
  ## 3. Flask Web App

