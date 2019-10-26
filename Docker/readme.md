## Docker Tutorial
**********
### Table of Contents:
1. [Basic Concept of Images and Containers](https://github.com/Tikam02/DevOps-Guide/blob/master/Docker/docker-concepts.md)
2. [Docker Setup](#2-setting-up-docker)
3. [Developing Fullstack WebApp With Node-js](#3-flask-web-app)
4. [Writing Dockerfile](#4-writing-dockerfile)
5. [Running Docker Image](#5-runnig-up-the-docker-image)
6. [Push to Docker-hub](#6-pushing-image-to-dockerhub)


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

 - Check for installed version

 ``` $ docker version ```


- Docker container lifecycle:
  - Processes: pull and image from Docker hub into a system where docker engine is installed.
			whatever we downloaded from Docker hub is an image of a container.
			Run the image. (The moment we run the image it becomes container)
			Can run,stop,delete 
      

  
## 3. Node Web App


  - Let's not waste our precious time building node.js web app just see the node app folder and run into your local system:

  - we will be use this Node.js+Express.js web app for docker containerisation tutorial ->> [Node Js web App](https://github.com/Tikam02/DevOps-Guide/tree/master/Docker/node)

  ``` cd node```

  ``` npm insall ```

  ```node app.js```

  - Go to http://localhost:8080

  
  
## 4. Writing Dockerfile

- Your Dockerfile specifies what will be included in your application container when it is executed. Using a Dockerfile allows you to define your container environment and avoid discrepancies with dependencies or runtime versions.

- Following these guidelines on building optimized containers, we will make our image as efficient as possible by minimizing the number of image layers and restricting the image’s function to a single purpose — recreating our application files and static content.

- In your project’s root directory, create the Dockerfile:

``` nano dockerfile ```

			or 
``` touch dockerfile```

- Docker images are created using a succession of layered images that build on one another. Our first step will be to add the base image for our application that will form the starting point of the application build.

- Let’s use the node:10-alpine image, since at the time of writing this is the recommended LTS version of Node.js. The alpine image is derived from the Alpine Linux project, and will help us keep our image size down. For more information about whether or not the alpine image is the right choice for your project, please see the full discussion under the Image Variants section of the Docker Hub Node image page.

- Add the following FROM instruction to set the application’s base image:

``` FROM node:10-alpine```
- This image includes Node.js and npm. Each Dockerfile must begin with a FROM instruction.

- By default, the Docker Node image includes a non-root node user that you can use to avoid running your application container as root. It is a recommended security practice to avoid running containers as root and to restrict capabilities within the container to only those required to run its processes. We will therefore use the node user’s home directory as the working directory for our application and set them as our user inside the container. For more information about best practices when working with the Docker Node image, see this best practices guide.

- To fine-tune the permissions on our application code in the container, let’s create the node_modules subdirectory in /home/node along with the app directory. Creating these directories will ensure that they have the permissions we want, which will be important when we create local node modules in the container with npm install. In addition to creating these directories, we will set ownership on them to our node user:-

``` RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app ```

- For more information on the utility of consolidating RUN instructions, see this discussion of how to manage container layers.

- Next, set the working directory of the application to /home/node/app:

``` WORKDIR /home/node/app ```
- If a WORKDIR isn’t set, Docker will create one by default, so it’s a good idea to set it explicitly.

- Next, copy the package.json and package-lock.json (for npm 5+) files:

 ``` COPY package*.json ./ ```

- Adding this COPY instruction before running npm install or copying the application code allows us to take advantage of Docker’s caching mechanism. At each stage in the build, Docker will check to see if it has a layer cached for that particular instruction. If we change package.json, this layer will be rebuilt, but if we don’t, this instruction will allow Docker to use the existing image layer and skip reinstalling our node modules.

- To ensure that all of the application files are owned by the non-root node user, including the contents of the node_modules directory, switch the user to node before running npm install:

``` USER node ```

- After copying the project dependencies and switching our user, we can run npm install:

``` RUN npm install```
- Next, copy your application code with the appropriate permissions to the application directory on the container:

``` COPY --chown=node:node . . ```

- This will ensure that the application files are owned by the non-root node user.

- Finally, expose port 8080 on the container and start the application:

	```bash
		EXPOSE 8080
		CMD [ "node", "app.js" ]
	```

- EXPOSE does not publish the port, but instead functions as a way of documenting which ports on the container will be published at runtime. CMD runs the command to start the application — in this case, node app.js. Note that there should only be one CMD instruction in each Dockerfile. If you include more than one, only the last will take effect.

- There are many things you can do with the Dockerfile. For a complete list of instructions, please refer to Docker’s Dockerfile reference documentation.

- The complete Dockerfile looks like this:

	```bash
		FROM node:10-alpine

		RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

		WORKDIR /home/node/app

		COPY package*.json ./

		USER node

		RUN npm install

		COPY --chown=node:node . .

		EXPOSE 8080

		CMD [ "node", "app.js" ]
	```
  


## 5. Runnig Up the docker image

  - You are now ready to build the application image using the docker build command. Using the -t flag with docker build will allow you to tag the image with a memorable name. Because we are going to push the image to Docker Hub, let’s include our Docker Hub username in the tag. We will tag the image as nodejs-image-demo, but feel free to replace this with a name of your own choosing. Remember to also replace your_dockerhub_username with your own Docker Hub username:

  ``` $ docker build -t your_dockerhub_username/nodejs-image-demo . ```

  - The . specifies that the build context is the current directory.

- It will take a minute or two to build the image. Once it is complete, check your images:

 ``` $ docker images ```

 - It is now possible to create a container with this image using docker run. We will include three flags with this command:

    -p: This publishes the port on the container and maps it to a port on our host. We will use port 80 on the host, but you should feel free to modify this as necessary if you have another process running on that port. For more information about how this works, see this discussion in the Docker docs on port binding.
    -d: This runs the container in the background.
    --name: This allows us to give the container a memorable name.

- Run the following command to build the container:

  ``` $ docker run --name nodejs-image-demo -p 80:8080 -d your_dockerhub_username/nodejs-image-demo  ```

- Once your container is up and running, you can inspect a list of your running containers with docker ps:

   ``` $ docker ps ```


 

- With your container running, you can now visit your application by navigating your browser to http://your_server_ip. You will see your application landing page once again:



  
## 6 Pushing Image To Dockerhub

- By pushing your application image to a registry like Docker Hub, you make it available for subsequent use as you build and scale your containers. We will demonstrate how this works by pushing the application image to a repository and then using the image to recreate our container.

- The first step to pushing the image is to log in to the Docker Hub account you created in the prerequisites:

 ``` $ docker login -u your_dockerhub_username  ```

 - When prompted, enter your Docker Hub account password. Logging in this way will create a ~/.docker/config.json file in your user’s home directory with your Docker Hub credentials.

 - You can now push the application image to Docker Hub using the tag you created earlier, your_dockerhub_username/nodejs-image-demo:

 ``` $ docker push your_dockerhub_username/nodejs-image-demo```

- Let’s test the utility of the image registry by destroying our current application container and image and rebuilding them with the image in our repository.

- First, list your running containers:

  ``` $ docker ps ```

- Using the CONTAINER ID listed in your output, stop the running application container. Be sure to replace the highlighted ID below with your own CONTAINER ID for example:

``` $ docker stop e50ad27074a7 ```

- List your all of your images with the -a flag:

``` $ docker images -a ```

- You will see the following output with the name of your image, your_dockerhub_username/nodejs-image-demo, along with the node image and the other images from your build.

- Remove the stopped container and all of the images, including unused or dangling images, with the following command:

``` $ docker system prune -a ```

- You have now removed both the container running your application image and the image itself. For more information on removing Docker containers, images, and volumes, please see How To Remove Docker Images, Containers, and Volumes.

- With all of your images and containers deleted, you can now pull the application image from Docker Hub: 

``` $ docker pull your_dockerhub_username/nodejs-image-demo```

- List your images once again:

``` $ docker images ```

- Now run the pulled image from your dockerhub repo:

``` $ docker run --name nodejs-image-demo -p 80:8080 -d your_dockerhub_username/nodejs-image-demo ```



