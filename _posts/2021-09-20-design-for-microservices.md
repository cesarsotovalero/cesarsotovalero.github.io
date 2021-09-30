---
layout: post
title: Design for microservices!
subtitle: An easy way to boost the popularity of your open-source projects
tags: programming
description: The microservices architecture has gained significant momentum in the last years. Modularity, scalability, and elasticity are some of its essential characteristics. If you have an open-source project, you should consider designing it microservices friendly. The market will eventually reward you for that.
keywords:
  - microservices architecture,
  - open source software,
  - software architect,
  - software design,
  - architectural characteristics,
image: img/posts/clouds_cover.png
share-img: img/posts/clouds_cover.png
show-avatar: false
date: 2021/09/20
published: true
---

The microservice architecture style consists of small and independently deployable services that run all together around a business domain.
These small services are like living cells in an organism, each one providing important functionalities that keep the whole system healthy.
Microservices have transitioned from a mere buzzword ten years ago to become the standard software architecture that today dominates the market.
The main reason behind its popularity is the massive adoption of on-demand cloud computing services, empowered by technologies such as [Docker](https://www.docker.com/) and [Kubernetes](https://kubernetes.io/), which enable high modularity, scalability, and elasticity in the systems.
Understanding how to build and connect software components for microservices is a fundamental skill for developers.
If you build any software artifact, you might consider facilitating its integration with other microservices components.
For example, you can provide entry points to your artifact's APIs and containerize its main logic to work as a RESTful web service.
Following this approach has helped me easily integrate some of my open-source projects with frontend technologies for visualization purposes, positively boosting their popularity and reaching more clients.
Lets me explain this approach.

<figure class="jb_picture">
  {% responsive_image path: img/posts/clouds.png alt: "The cloud: a bunch of Linux servers where microservices coexist." %}
  <figcaption class="stroke">
    &#169; The cloud: a bunch of Linux servers where microservices coexist. 
    </figcaption>
</figure>

# Microservices

The term "microservices" became popular after the publication of a [famous blog post](https://martinfowler.com/articles/microservices.html) by James Lewis and Martin Fowler in 2014.
The authors describe the fundamental characteristics of microservices and contrasts their vision to the traditional [monolithic architecture](https://en.wikipedia.org/wiki/Monolithic_application).
According to them, the microservice architecture is a cloud-native architecture that aims to build software systems as packages of small services that can run on their own process while communicating through lightweight mechanisms such as [RESTful](https://restfulapi.net/) or [RPC](https://en.wikipedia.org/wiki/Remote_procedure_call) APIs.

> APIs have become ubiquitous components of software infrastructures. In short, an API defines how a client can load data from a server.

There is still no clear definition for the microservice architecture, as the most notable authors defend different points of view regarding its main characteristics.
In this blog post, I consider microservices as small, **independently deployable** software services that run all together around a specific **business domain**.
Notice that each service is independently deployable on a potentially different platform and technological stack.
In practice, each service is a business capability that can utilize various programming languages and databases, and is developed by a small team of developers.

Microservices are inspired by [Domain-Driven Design](https://en.wikipedia.org/wiki/Domain-driven_design) (DDD) principles.
DDD is about decoupling business services and package them as independent software artifacts, which provides several benefits for developers and organizations.
For example, as owned by a small team of developers, the artifacts are more maintainable and testable.
Thanks to the current DevOps revolution, these loosely coupled artifacts are independently build and deployed.
In addition, hiding implementation details allows developers to focus on business domain (the actual problem that needs to be solved), instead of spending time and resources in solving technical problems.

Figure 1 shows an example of the typical microservices' architecture style. 
The architecture is organized in three layers: Client, API, and Service layers.
The API layer works as a bridge that communicates the Client layer with the Service Layer.
The data flows back and forward from the Client to Service and vice versa (typically through HTTP requests or REST service providers).
Notice that each module in the Service Layer can operate independently, as each include its own database and all the necessary logic can run as an independent process.

<figure class="jb_picture">
    <img src = "/img/posts/microservices_topology.drawio.svg" alt="Topology of a typical microservices architecture with three logical layers: Client, API, and Service."
    longdesc="#c13e1390"/>
    <figcaption class="stroke">
    Figure 1. Topology of a typical microservice architecture with three logical layers: Client, API, and Service.
    </figcaption>
</figure>

It is noteworthy that, although this architecture offers many benefits (e.g., enforced heterogeneity, elasticity and scalability), it may also increase the complexity of the system, and also induce a significant performance overhead.
To mitigate these issues, some technologies such as Kubernetes provide service orchestration, which increases resilience (if one service fail the system can automatically recover from the fault) and optimizes the use of computational resources.

# The component is the opportunity

We can view each component in the Service layer as a standalone ~~small~~ application that talks to other applications through some communication channel.
Each service has a state, manages data (either in memory or persistent on its own database), and makes computations to deliver some results to the client.
Note that the microservices are loosely coupled components; there is only data being transferred.
Therefore, it doesn't matter what technology is used to build the components.
This architectural decision favors software diversity, allowing the implementation of polyglot systems.

Similar to software packages in traditional programming languages (such as pip for Python or Maven for Java), components are standalone pieces of software designed for reuse.
The key difference is that microservice components are augmented with the ability to manipulate data differently.
They are allowed to become part of the system, processing, storing, or transforming the data according to the business needs.

From the system's perspective, each component acts as a **dependency**.
The system now becomes the **package manager** for such components.
This principle works great thanks to the use of Docker containers.
Like software libraries, components dependencies need to be released, updated, and maintained.
This situation opens the door to several opportunities for open-source projects.
Putting a component in production was never easier.

# Example

[DepClean](https://github.com/castor-software/depclean) is a tool that we developed to detect and remove bloated dependencies in Java projects built with Maven.
As a result of its analysis, DepClean produces an XML file, the `pom-debloated.xml`, which is a clean version of the original `pom.xml` without bloated dependencies.
DepClean is originally a command-line tool for Maven.
It gets the work done, but it is not very user-friendly for the unfamiliar user who wants to understand the complex mechanism that governs handling Java dependencies.

As part of our research outreach, we want to facilitate the adoption of DepClean by the community so that the tool could get impact (i.e., gaining more users).
An easy way is by visually showing the positive impact of using DepClean to report bloated dependencies in open-source projects on GitHub.
With this objective in mind, we designed [depclean-web](https://github.com/castor-software/depclean-web), an interactive website that allows the user to input the URL of a Java project and receive the analysis output of DepClean visually.

Figure 2 shows how we modify DepClean to be used in a RESTful Web Service.
We plugged DepClean as an open-source component in a microservice architecture.
We build on top of the Spring Boot framework, while the frontend is based on React components.
The backend executes DepClean based on the URL of an open-source project hosted on GitHub. It transforms the metadata of the project's dependency tree in a JSON file to be visualized by the frontend.
The user can see how the process is being analyzed and visualize the project's dependency tree in an interactive website.

<figure class="jb_picture">
    <img src = "/img/posts/depclean-web_component.svg" alt="DepClean modified to be used as a service component for a microservice architecture"
    longdesc="#c13e1390"/>
    <figcaption class="stroke">
    Figure 2. DepClean modified to be used as a service component for a microservice architecture.
    </figcaption>
</figure>


The `ProjectController` class is the main responsible for handling the DepClean component (see the code snippet below). 
The class is annotated with the `@RestController` Spring annotation, which marks the class as a controller, meaning that every method returns a domain object instead of a view.
The `@GetMapping` annotation ensures that HTTP GET requests to `/project/{user}/{repo}` are mapped to the `all()` method.
The method `processRepo()` leverages the main logic of the service, i.e. executing DepClean and letting a `depclean-results.json` file in the server with the results of the analysis.
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

It is worth mentioning that it is important for the components to be careful with the data being exposed to avoid security issues.
This is more notable in the case of handling HTTP requests like `POST`, `PUT`, or `DELETE`.
Good API documentation is crucial for the clients.
On the other hand, once the software architect starts piping the component into their system its is more difficult to make changes in the components without affecting its clients.

# Conclusions

The microservice architecture will stay with us for a while.
This architecture is particularly suited to design systems that are based on loosely coupled components.
Organizations that rely on microservices can benefit from open-source solutions to save development time and money.
Developers should provide API endpoints in their software projects to facilitate reuse in a microservice environment.
This is a critical ingredient of project marketing, which may significantly impact its popularity and future adoption.
We have experienced the benefits of designing for microservices when promoting the usage of DepClean to the broad public.
According to our experience, designing for microservices is one of the best decisions one can take to foster the rapid adoption of modern software components.



# References

- [https://microservices.io](https://microservices.io/)
- [https://restfulapi.net](https://restfulapi.net/)
- [Microservices](https://ieeexplore.ieee.org/document/8354423), IEEE Software
- [Microservices Architecture Enables DevOps: Migration to a Cloud-Native Architecture](https://ieeexplore.ieee.org/document/7436659), IEEE Software

[comment]: <> (- [The Monolith Strikes Back: Why Istio Migrated From Microservices to a Monolithic Architecture]&#40;https://ieeexplore.ieee.org/document/9520758&#41;, IEEE Software)

[comment]: <> (- [Challenges of Domain-Driven Microservice Design: A Model-Driven Perspective]&#40;https://ieeexplore.ieee.org/document/8354426&#41;, IEEE Software)


