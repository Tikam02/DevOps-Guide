# Proxy server

A Proxy server is like an app or a software that makes a specific or pre-defined request on behalf a client or server. It can be configured to handle incoming or outgoing requests on behalf of a client or server before they are transmitted over the Internet. The Proxy server also hides the IP addresses before performing transmitting over the Internet. 

## Forward Proxy Server

The forward proxy server acts like an intermediate server and all the incoming requests from clients is configured to be handled by the Proxy server which inturn sends the request to the destination server. Similarly when the destination server gives the response, the proxy server receives the response and sends it back to the client. In this case client's information is completely hidden from the server as the proxy server masks the incoming requests and tansmits them over the Internet. 

![Forward Proxy Server](https://github.com/Tikam02/DevOps-Guide/blob/master/img/ForwardProxyServer.png)

For example - Imagine an organisation wants to prevent users from accessing Facebook, they have to get all the incoming requests from their employees and send it to their own proxy server where they have configured to block requests coming for Facebook urls and allow all other requests to reach their designated locations. 

**Advantages of a Proxy server**

 - Anonymity - Used to prevent exposure of the actual end user to the destination server.
 - Blocking Access - Used to block unwanted requests.
 - Caching - Can be used when multiple requests come for a huge file.
 - Logging - Used to keep track of all the activity 
 - Microservices - Deploying a custom proxy along with an application to translate incoming requests. 

## Reverse Proxy Server

Reverse proxy server is a type of server that requests network resources on behalf of a client from one or more destination servers. Here the client has no clue on which server is serving its request as the data from the server is configured to serve the response via the reverse proxy server. The Reverse proxy server also adds and extra layer of security to Internet facing services. 

![Reverse Proxy Server](https://github.com/Tikam02/DevOps-Guide/blob/master/img/ReverseProxy.jpeg)

For example - Imagine if an organisation wants to stream data to the outside world, they can configure the reverse proxy server to handle the requests from clients. 

**Advantages of a Reverse Proxy**
 - Caching - Can be used when multiple requests come for a same file.
 - Canary Deployments - Can be used when releasing data to a small subset of users.
 - Ingress - Filter all incoming requests and send them to appropriate destinations
 - Load Balancing - Used to controls the flow of requests to one particular server 
 - Microservices - Building a app that can translate all the outgoing requests.