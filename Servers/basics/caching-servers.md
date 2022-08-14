# Caching Server

**What is Caching ?**

Caching is the process of storing copies of files in multiple temporary locations to help users access access the data faster. This process speeds up the process of accessing web content over the Internet. A Cache server by default allows all outgoing requests and monitors all incoming requets. 

![Cache Server](https://github.com/Tikam02/DevOps-Guide/blob/master/img/Cache.png)

A proxy server handles the flow of requests on the server. The Cache server is initially set to handle the incoming request from the client, if the response is not readily available, the cache server reaches the parent host to retrieve the data, stores a copy of the data and transmits the data to the client. The next time when the same request comes in the Cache server serves the data from its local cache. The local data stored on the cache is set to expire and the updated data will be fetched again on a new incoming request after expiration. 

**Example** Imagine if a company sell their products via the offical website for customers globally, having their server in one physical location might take have long waiting times for the requests and responses to flow through. In this situation to bring the website up to speed, the company will spin up multiple servers spread across multiple geographic locations. Each of these servers would display the same contents. This setup is made easily available with the help of Caching servers. 

## Advantages
 - Better user experience
 - Reduced Bandwidth cost
 - Reliable content delivery
 - Fast access 

## Types of Cache
 
 - Content Delivery Network (CDN) Cache
 - Database cache 
 - General Cache 
