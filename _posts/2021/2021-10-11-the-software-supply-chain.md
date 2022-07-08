---
layout: post
title: The Software Supply Chain
subtitle: A quick look at the modern software production landscape
tags: security
description: Hardening the software supply chain is a critical challenge for modern software companies.
keywords:
  - reproducible builds,
  - continuous integration,
  - continuous delivery,
  - software design,
  - cybersecurity,
image: ../img/posts/2021/crane_cover.png
share-img: ../img/posts/2021/crane_cover.png
show-avatar: false
toc: true
date: 2021/10/11
author: cesarsotovalero
published: true
---

The software supply chain comprises all the technology involved in shipping a piece of code from development to its deployment in a production environment.
Several actors and different technologies participate in this complex process, e.g., developers, IDEs, compilers, package managers, a so on.
The success or failure of a software product depends largely on many external components which are not directly controlled by the organizations in charge of delivering software products to their clients.
This situation poses several security and maintenance risks for both software suppliers and customers.
Thereby, maintaining a secure and efficient software supply chain is critical today, where open-source has become ubiquitous in the software production landscape.
In this post, I take a close look at this phenomenon from a software engineering perspective.
Lets me dive into it!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2021/crane.png alt: "The crane is a symbol of the construction and transportation of physical objects on a large scale." %}
  <figcaption class="stroke">
    &#169; The crane is a symbol of the construction and transportation of physical objects on a large scale. 
    </figcaption>
</figure>

# Supply Chains

According to Wikipedia, a [supply chain](https://en.wikipedia.org/wiki/Supply_chain) is a system of organizations, people, activities, information, and resources involved in moving a product or service from supplier to consumer.
Supply chains have proven to mitigate the risks associated with producing and distributing goods and services, making this process more efficient.
Software is a very special type of product. 
It lives in the digital space, governed by mathematical structures and human protocols.
As it is not a physical product, there are no transportation issues, lack of warehousing space, or international regulations to follow when delivering software applications.
Therefore, clients' expectations regarding shipping speed and availability are much higher.

Shipping features and services efficiently, from developers to clients, is challenging.
In this context, the software supply chain shares many of the difficulties that exists in the traditional supply chain of physical products.
This happens because software production is a complex process in which several independent pieces of technology need to be orchestrated.
Software needs to be delivered and maintained as quickly as possible, which can only be achieved through automation.

Figure 1 depicts a typical software supply chain pipeline.
Once the requirements are specified, developers rely on VCS, IDEs, mailing lists, and other tools to write code and communicate with other members of the team.
The goal of the first step in any software product is to deliver source code and other configuration scripts.
Then, a build engine compiles, tests, and assesses its quality.
These two steps are bound together and are known as [Continuous Integration](https://en.wikipedia.org/wiki/Continuous_integration) (CI).
Once all the code assessments are done and the code passes the scrutiny, the build engine then ships binary files to the deployment platform.
This is in charge (among other things) of the release, resource orchestration, and versioning of the software product.
Once deployed, the software runs in a production environment, where clients can interact with it.
The process of automatically shipping software from a deployment platform to a production environment is called [Continuous Delivery](https://en.wikipedia.org/wiki/Continuous_delivery) (CD).
As a result of the interaction of clients with the software product, bugs and performance issues start to show up.
These issues then need to be addressed by the developers who maintain the product, and the whole cycle kicks in once more.

<figure class="jb_picture">
    <img src = "/img/posts/2021/supply_chain_fig.svg" alt="Development workflow in a typical software supply chain."
    longdesc="#c13e1390"/>
    <figcaption class="stroke">
    Figure 1. Development workflow in a typical software supply chain.
    </figcaption>
</figure>

The CI/CD pipeline is an infinite loop, where digital resources and information pass through different stages, coming back and forth from developers to clients and vice versa. 
As software has already [eaten the world](https://www.wsj.com/articles/SB10001424053111903480904576512250915629460), most large-scale software is already developed, and it is currently running in production.
Therefore, the primary objective of the software supply chain is to ensure the stability of such existing systems through effective maintenance.

<figure class="jb_picture">
    <img src = "/img/posts/2021/cicd.svg" alt="The CI/CD is and infinite process." width="350px"
    longdesc="#c13e1390"/>
    <figcaption class="stroke">
    Figure 2. The CI/CD is and infinite process.
    </figcaption>
</figure>

Notice that at all stages of the CI/CD pipeline, third-party software is reused.
This type of reuse is a necessary evil, as it is the best way to satisfy the market's pressure, i.e., delivering software faster and with reasonable quality.
A large range of closed and open-source solutions are involved: IDEs, package managers, CI services, cloud providers, performance monitoring applications, etc.
Thus, most large-scale software providers heavily rely on third-party software as the basis for developing their products.
This means that these sources need to be managed and maintained along the development of the product itself.
So, part of the development effort in the software supply chain is devoted to analyzing the quality and security of the third-party players participating in the supply chain.
This includes handling and updating dependencies, documentation, licenses, and performing regular security audits.

# Risks

Today it is almost impossible to ship any large software solution fast without the help of third-party dependencies.
For almost every software company, relying on software that is not made in-house poses several risks.
[Software supply chain attacks](https://en.wikipedia.org/wiki/Supply_chain_attack) occur when a malicious actor penetrates the CI/CD chain to insert malicious code. 
If a single component in the supply chain gets compromised, then the whole infrastructure may be at the mercy of the attacker.
Supply chain attacks are very difficult to detect because the product continuously changes at each stage: from source code, to binaries, to an application that runs somewhere in the cloud and is interacting with clients.
Attackers could target all the layers of the supply chain, from malicious plugins in IDEs to corrupted compilers.
However, they often focus on the less secure elements in the supply chain and heavily rely on the trust that make code reuse possible.
Attacks targeting third-party components are expected to become more prominent over the next few years.

> "Projects often incorporate code and libraries from many sources with unknown provenance..." -- <cite>[Hamed Okhravi](http://web.mit.edu/ha22286/www/)</cite>

Package managers are particularly susceptible to supply chain attacks (e.g., [typosquatting](https://news.ycombinator.com/item?id=11862217), [cryptojacking](https://www.kaspersky.com/resource-center/definitions/what-is-cryptojacking), and malicious contributors).
This is due to the lack of efficient mechanisms for detecting malicious code injected into packages uploaded to popular package repositories.
For example, there is no security audit performed on the packages submitted `npm`, the largest repository of JavaScript libraries.
Significant research effort has been devoted in classifying [supply-chain compromises](https://github.com/IQTLabs/software-supply-chain-compromises/blob/master/software_supply_chain_attacks.csv) and developing tools for hardening the supply chain infrastructure is a trending and marketable business.
We have seen the rise of tools to mitigating the risks (e.g., [Snik](https://snyk.io/, [Sonarqube](https://www.sonarqube.org/), and [Chaos Monkey](https://netflix.github.io/chaosmonkey/))). 
Existing tools are mostly focused on monitoring applications' behavior, scanning dependencies, and assessing code quality.
However, the adoption of such tools is still at an early stage in most organizations.

> "We don't know what we are installing, and even the people who sell it to us have no clear idea." -- <cite>[Fabio Massacci](http://disi.unitn.it/~massacci/)</cite>

The [SolarWinds](https://ieeexplore.ieee.org/document/9382367) incident in 2020 is a typical example of the fragility that permeates modern software supply chains.
A malicious actor gained access to the Orion monitoring and management system operated by the U.S. company SolarWinds and inserted malicious code into the deployment infrastructure.
Interestingly, changes were done at the source code level, which means that code was tested, signed, and released through the SolarWinds platform, and nobody in the company noticed the change.
The malicious code stayed dormant for two weeks.
After that, it mimicked another known protocol to exfiltrate users' credentials, which were used to craft security tokens, allowing attackers to access confidential data.
Incidents at this scale are evidence of the lack of awareness related to this issue and the lack of control of companies and the government regarding the software products and services deployed to their clients.

> "Governments have been somewhat ineffectual in handling supply-chain issues." -- <cite>[James Bret Michael](http://faculty.nps.edu/bmichael/)</cite>

Mass-scale software development and future global innovation are at risk if governments enforce more restrictive security gates to prevent incidents such as the SolarWinds.
Technology-based solutions need to be developed in order to cope with the challenge of securing the software supply chain.

<div class="container-youtube">
  <iframe width="560" height="349" src="https://www.youtube.com/embed/mp_jSfUACrs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

# Hardening the Chain

Overall, supply chain-related attacks are perceived as very dangerous and hard to detect.
Securing the software supply chain requires a continuous assessment of the components, vendors, and the whole operational environment.
This can only be achieved through the gathering and analysis of relevant and verifiable data sources.
[Reproducible builds](https://reproducible-builds.org/docs/) are a set of software development practices that create an independently verifiable path from source to binary code.
A build is reproducible if given the same source code, build environment and build instructions, any party can recreate bit-by-bit identical copies of all specified artifacts.
This build methodology allows verifying that no vulnerabilities or backdoors have been introduced in the supply chain.

Notice that to achieve reproducible builds, the CI/CD system needs to be made entirely deterministic: modifying a given source must always create the same result.
For example, the current date and time must not be recorded and outputs always have to be written in the same order.
Furthermore, the set of tools used to perform the build and, more generally, the building environment should either be recorded or pre-defined.
Developers should have a way to recreate a close enough build environment, perform the build process, and validate that the output matches the original build.

In the supply chain, software products, including security tools, should be designed with failure in mind (i.e., they must fail gracefully).
The system should closely monitor any third-party software releases used, watch published vulnerability announcements, and distribute updates.
Notice that the [security tools themselves](https://googleprojectzero.blogspot.com/2016/06/how-to-compromise-enterprise-endpoint.html) are not exempt.

In general, the hardening of the software supply chain should be guided by the following three objectives:

1. Increase the data collection and analysis to identify attacks, especially those involved in third-party software.
2. Adopt existing tools and processes designed to prevent these attacks.
3. Set up mechanisms to quickly recover in case of attacks that compromise the released software.

# Conclusion

Large-scale software development is a complex process in which both people and technological infrastructure are involved.
Due to the market pressure, this process is very dependent on third-party software components.
This situation triggers several risks coming from distinct angles: from the dependencies, from external service suppliers, and not to forget the hardware infrastructure as well.
Hardening the whole software supply chain is critical for organizations and their users.
Today, a large amount of research effort is drive in this direction.
I hope events such as the SolarWinds incident become less frequent in the near future.

# References

- [Securing the World's Software](https://arxiv.org/ftp/arxiv/papers/2110/2110.10246.pdf)
- [https://reproducible-builds.org/docs](https://reproducible-builds.org/docs)
- [https://survey.opensourceunchained.eu/](https://survey.opensourceunchained.eu/)
- [SolarWinds attack explained: And why it was so hard to detect](https://www.csoonline.com/article/3601508/solarwinds-supply-chain-attack-explained-why-organizations-were-not-prepared.html)
