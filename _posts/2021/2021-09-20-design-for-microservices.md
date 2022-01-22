---
layout: post
title: Design For Microservices!
subtitle: An Easy Way to Boost the Popularity of Your Open-source Projects
tags: programming
description: The microservices architecture has gained significant momentum in the last years. Modularity, scalability, and elasticity are some of its essential characteristics. If you have an open-source project, you should consider designing it to be microservices friendly. The market will eventually reward you for that.
keywords:
  - microservices architecture,
  - open-source software,
  - software architect,
  - software design,
  - architectural characteristics,
image: ../img/posts/2021/clouds_cover.png
share-img: ../img/posts/2021/clouds_cover.png
show-avatar: false
date: 2021/09/20
author: cesarsotovalero
published: true
---

The microservice architecture style consists of small and independently deployable services that run all together around a business domain.
These small services act like living cells in an organism, each providing unique functionalities to protect the health of the whole system.
Microservices have transitioned from a mere buzzword ten years ago to become the standard software architecture that dominates the market today.
The main reason behind its popularity is the massive adoption of on-demand cloud computing services, empowered by technologies such as [Docker](https://www.docker.com/) and [Kubernetes](https://kubernetes.io/), which allow building systems that achieve high modularity, scalability, and elasticity.
Understanding how to build and connect software components specially designed for microservices is a fundamental skill for modern developers.
As such, if you build any software artifact, you should consider providing the proper mechanisms to facilitate its integration with microservices components.
For example, you can provide entry points to your artifact's API, and also containerize its main logic to be easily reused by a RESTful web service.
This strategy has helped me to integrate some of my open-source projects with frontend technologies for visualization purposes, with a positive impact terms of popularity and adoption.
Lets me explain this approach.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2021/clouds.png alt: "The cloud: a bunch of Linux servers where microservices coexist." %}
  <figcaption class="stroke">
    &#169; The cloud: a bunch of Linux servers where microservices coexist. 
    </figcaption>
</figure>

# Microservices

The term "microservices" became popular after the publication of a [famous blog post](https://martinfowler.com/articles/microservices.html) by James Lewis and Martin Fowler in 2014.
The authors describe the fundamental characteristics of microservices and contrast them with the traditional [monolithic architecture](https://en.wikipedia.org/wiki/Monolithic_application).
They define microservices as a cloud-native architecture that aims to build software systems as packages of small services that can run on their own process while communicating through lightweight mechanisms such as [RESTful](https://restfulapi.net/) or [RPC](https://en.wikipedia.org/wiki/Remote_procedure_call) APIs.

> "APIs have become ubiquitous components of software infrastructures. In short, an API defines how a client can load data from a server"  -- <cite>[Andrew Goss](https://andrewrgoss.com)</cite>

There is still no clear definition for the microservice architecture, as the most notable authors defend different points of view regarding some of its characteristics.
In this blog post, I consider microservices as small, **independently deployable** software services that run all together around a specific **business domain**.
Notice that each service can be independently deployed on a potentially different platform and technological stack.
In practice, each service represents a business capability that can utilize various programming languages and databases, and is usually developed by a small team of developers (1 to 5 people).

Microservices are inspired by [Domain-Driven Design (DDD)](https://en.wikipedia.org/wiki/Domain-driven_design) principles.
DDD is about decoupling business services and package them as independent software artifacts.
This approach provides several benefits for developers and organizations.
For example, as owned by a small team of developers, the codebase tends to be smaller, and the artifacts are easier to test and maintain.
Thanks to the ideas and tools pushed by the current DevOps movement, these loosely coupled artifacts can be independently built and deployed in what is known as "software supply chains".
In addition, hiding implementation details allows developers to focus better on the business domain (the actual problem that needs to be solved) instead of spending time and resources fixing technical issues.

Figure 1 shows an example of a typical microservices' architecture style.
This architecture is organized around three main layers: Client, API, and Service.
The API layer serves as a bridge that communicates the Client layer with the Service Layer.
The data flows back and forward from the client's devices to the service servers and vice versa (typically through HTTP requests or RESTful service providers).
Notice that each module in the Service layer can operate independently, as each includes its own database and all its main runs as an independent process in the server computers.

<figure class="jb_picture">
    <img src = "/img/posts/2021/microservices_topology.drawio.svg" alt="Topology of a typical microservices architecture with three logical layers: Client, API, and Service."
    longdesc="#c13e1390"/>
    <figcaption class="stroke">
    Figure 1. Topology of a typical microservice architecture with three logical layers: Client, API, and Service.
    </figcaption>
</figure>

This architecture provides several key benefits, for example :

- maintainability
- heterogeneity
- scalability
- elasticity

However, it is worth mentioning that adopting microservices may (in some cases) increase the complexity of the system, and also induce a significant performance overhead.
To mitigate this situation, some technologies such as Kubernetes provide service orchestration, which increases resilience and optimizes computational resources.
For example, when microservice components are handled by Kubernetes, in case that one service fails then the system can automatically recover from the fault without losing any critical resources.


# The Component Is the Opportunity

Simplistically, one can consider each component in the Service layer of microservices as a standalone ~~small~~ application that talks to other applications through some tech communication channel.
Each service has a state, manages data (either in memory or persisted on its own database), and makes computations to finally deliver some results to the client.
Note that these are loosely coupled components: only data is transferred, not programming logic.
Therefore, it doesn't matter what technology is used to build the components as long as they retrieve the expected data in a reasonable amount of time.
Obviously, this architectural decision favors software diversity, allowing the implementation of polyglot systems.

Similar to software packages in traditional programming languages (such as [pip](https://pypi.org/project/pip/) for Python or [Maven](https://maven.apache.org/) for Java), microservice components are standalone pieces of software designed with the finality of favoring reuse.
The only key difference is that microservice components are augmented with the ability to manipulate data more restrictively.
They become independent parts of the system, processing, storing, or transforming the data according to the business needs.

From the system's perspective, each component is a particular type of **dependency**.
Like in software libraries, these dependencies need to be released, updated, and maintained.
In this context, the system becomes the **package manager** for such dependencies.
It decides what components are necessary to depend on, when to update, and what is the best way to keep the system up and running (this mechanism works great using Docker containers).
The situation opens the door to several opportunities for open-source projects, as putting a component in production is easier than ever, thanks to microservices.

# Example

[DepClean](https://github.com/castor-software/depclean) is a tool that I developed to detect and remove bloated dependencies in Java projects that build with Maven.
As a result of its analysis, DepClean produces an XML file, called the `pom-debloated.xml`, which is a clean version of the original project's `pom.xml` but without bloated dependencies.
DepClean was originally designed as a command-line tool for Maven.
It gets the work done, but it is not very user-friendly for the unfamiliar user who doesn't need to understand the complex mechanism that governs the way of how Java dependencies are handled.

A goal of our research outreach is facilitating the adoption of DepClean by the community so that the tool could gain significant impact (i.e., reaching more users).
An easy way to leverage enthusiasm is by visually showing the positive impact of using DepClean on a Java project. 
Therefore, we focus on providing visual insights regarding the presence of bloated dependencies in open-source projects on GitHub.
With this objective in mind, we designed [depclean-web](https://github.com/castor-software/depclean-web), an interactive website that allows the user to receive the analysis and output of DepClean visually for any Java project on GitHub.

Figure 2 shows how I modified DepClean to be used in a RESTful web service.
I modify DepClean to be easy to plug in as an open-source component in a microservice architecture.
The backend of depclean-web is built on top of the Spring Boot framework, and the frontend is based on React components.
The backend clones and executes DepClean based on the URL of an open-source project hosted on GitHub.
The metadata obtained from the project's dependency tree is delivered as a JSON file which is painted in the frontend.
The user can observe how the project is being analyzed and visually engage with the project's dependency tree in an interactive website.

<figure class="jb_picture">
    <img src = "/img/posts/2021/depclean-web_component.svg" alt="DepClean modified to be used as a service component for a microservice architecture"
    longdesc="#c13e1390"/>
    <figcaption class="stroke">
    Figure 2. DepClean modified to be used as a service component for a microservice architecture.
    </figcaption>
</figure>

Looking at the component in detail, the [`ProjectController`](https://github.com/castor-software/depclean-web/blob/main/src/main/java/se/kth/castor/depclean/web/controller/ProjectController.java) class is the main responsible for handling the DepClean logic (see the code snippet below).
This class is annotated with the `@RestController` Spring annotation, which marks the class as a controller, meaning that every method returns a domain object instead of a view.
The `@GetMapping` annotation ensures that HTTP GET requests to `/project/{user}/{repo}` are mapped to the `all()` method.
The method `processRepo()` executes the main logic of the service, i.e. running DepClean and outputting a `depclean-results.json` file from the server with the results of the analysis.
This file is then read, stored, and returned to the variable `listModel`, meaning that it is now available to the user through the REST API.

[comment]: <> (Source code)
{% highlight java linenos %}
@Slf4j
@RestController
public class ProjectController {

  @CrossOrigin
  @GetMapping("/project/{user}/{repo}")
  Project all(@PathVariable String user, @PathVariable String repo) throws IOException {
    String repoName = user + "/" + repo;
    log.info("Processing repo: " + user + repo);
    Logic logic = new Logic();
    logic.processRepo(repoName);
    log.info("Getting JSON file");
    ObjectMapper objectMapper = new ObjectMapper();
    String localPathToRepo = "src/main/resources/templates/tmp/" + repo;
    String content = Files.readString(Paths.get(localPathToRepo + "/depclean-results.json"));
    Project listModel = objectMapper.readValue(content, new TypeReference<>() {});
    return listModel;
  }

}
{% endhighlight %}

The backend of the DepClean component is packaged with Docker.
The [`DOCKERFILE`](https://github.com/castor-software/depclean-web/blob/main/Dockerfile) is shown below.
It basically fetches a Docker official image with Maven from DockerHub (line 1), and installs DepClean as a Maven plugin (line 3).
Then, the backed is built as a JAR file and exposed as a REST entry point to be used by the frontend.

{% highlight docker linenos %}
FROM maven:3.6.3-jdk-11
RUN apt-get install -y git
RUN git clone https://github.com/castor-software/depclean.git;cd depclean;mvn clean install
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
{% endhighlight %}

It is worth mentioning that the components must be careful with the data being exposed to avoid security issues.
This situation is more notable in the case of handling HTTP requests like `POST`, `PUT`, or `DELETE`.
In any case, good API documentation is crucial for the clients.
Once the software architects start piping external components into their own systems, it is more challenging to make changes without affecting other parts of the architecture.

# Conclusions

The microservice architecture will stay with us for a while.
It is particularly suited to design systems that are based on loosely coupled components.
Organizations that rely on microservices can benefit from open-source solutions to save development time and money.
Meanwhile, developers should provide API endpoints in their software projects to facilitate reuse in a microservice environment.
This is a critical ingredient of project marketing, which may significantly impact its popularity and future adoption.
I have experienced the benefits of designing for microservices when promoting the usage of DepClean to the broad public.
According to our results, designing for microservices is one of the best decisions one can take to foster the rapid adoption of modern software components.

# References

- [https://microservices.io](https://microservices.io/)
- [https://restfulapi.net](https://restfulapi.net/)
- [Microservices](https://ieeexplore.ieee.org/document/8354423), IEEE Software
- [Microservices Architecture Enables DevOps: Migration to a Cloud-Native Architecture](https://ieeexplore.ieee.org/document/7436659), IEEE Software
