---
layout: post
title: The software supply chain
subtitle: A quick look at the modern software production landscape
tags: security
description: 
keywords:
  - software development,
  - continuous integration,
  - continuous delivery,
  - software design,
  - software architecture
image: https://www.cesarsotovalero.net/img/posts/crane_cover.png
share-img: https://www.cesarsotovalero.net/img/posts/crane_cover.png
show-avatar: false
date: 2021/10/04
published: true
---

The software supply chain comprises all the technology involved in shipping a piece of code from development to its deployment in a production environment.
Several actors and technologies participate in this complex process, e.g., developers, IDEs, compilers, package managers, a so on.
Thus, the success or failure of a software product depends largely on many external components that are not controlled by the organizations in charge of delivering software products to their clients.
This situation poses several security and maintenance risks for both software suppliers and customers.
Thereby, maintaining a secure and efficient software supply chain is critical today, where open-source has become ubiquitous in the software production landscape.
In this post, I take a close look at this phenomenon from a software engineering standpoint.
Lets me dive into it!

<figure class="jb_picture">
  {% responsive_image path: img/posts/crane.png alt: "The crane is a symbol of the construction and transportation of physical objects on a large scale." %}
  <figcaption class="stroke">
    &#169; The crane is a symbol of the construction and transportation of physical objects on a large scale. 
    </figcaption>
</figure>

# Supply chains

According to Wikipedia, a [supply chain](https://en.wikipedia.org/wiki/Supply_chain) is a system of organizations, people, activities, information, and resources involved in moving a product or service from supplier to consumer.
Supply chains have proven to mitigate the risks associated with producing and distributing goods and services, making this process more efficient.
On the other hand, software is a very special type of product that lives in the digital space.
As it is not a physical product, there are no transportation issues, lack of warehousing space, or international regulations to follow when delivering.
Therefore, the expectations from the clients regarding shipping speed and availability are much higher in the case of software.

Shipping features and services efficiently, from developers to clients, is challenging.
In this context, the software supply chain shares many difficulties associated with the traditional supply chain of physical products.
It is a complex process in which several independent pieces of technology need to be integrated into it.
The software product needs to be delivered and maintained as quickly as possible, which can only be achieved through automation.

Figure 1 depicts a typical software supply chain pipeline.
Developers rely on VCS, IDEs, mailing lists, and other tools to write code and organize their codebase.
The goal of the first step in any software product is to produce source code and other configuration scripts.
Then, a build engine compiles, tests, and assesses the quality of the code.
These two steps are bound together and are known as [Continuous Integration](https://en.wikipedia.org/wiki/Continuous_integration) (CI).
Once all the assessment is done, the build engine then ships binary files to the deployment platform, which is in charge (among other things) of the release, orchestration, and versioning of the software product.
Once deployed, the software runs in a production environment, where clients start interacting with it.
The process of automatically shipping software from a deployment platform to a production environment is called [Continuous Delivery](https://en.wikipedia.org/wiki/Continuous_delivery) (CD).
Clients interact with the software product at this stage, and typically, bugs and performance issues start to show up.
These issues need to be addressed by developers who maintain the product, and the whole cycle fires up once again.


<figure class="jb_picture">
    <img src = "/img/posts/supply_chain_fig.svg" alt="Development workflow in a typical software supply chain."
    longdesc="#c13e1390"/>
    <figcaption class="stroke">
    Figure 1. Development workflow in a typical software supply chain.
    </figcaption>
</figure>

As you can see, the CI/CD pipeline is an infinite loop, where digital resources and information pass through different stages, coming back and forth from developers to clients and vice versa. 
Software has already [eaten the world](https://www.wsj.com/articles/SB10001424053111903480904576512250915629460), which means that most large-scale software is already developed, and it is currently running in production.
Therefore, the primary objective of the software supply chain is to maintain such existing systems.

<figure class="jb_picture">
    <img src = "/img/posts/cicd.svg" alt="The CI/CD is and infinite process." width="350px"
    longdesc="#c13e1390"/>
    <figcaption class="stroke">
    Figure 2. The CI/CD is and infinite process.
    </figcaption>
</figure>

Notice that at all stages of the CI/CD pipeline, third-party software is reused to satisfy the market's pressure, i.e., delivering faster and improving quality.
This means that a large range of closed and open-source solutions are involved: IDEs, package managers, CI services, cloud providers, performance monitoring applications, etc.
Most large-scale software providers heavily rely on third-party software as the basis for developing their features and products.
This means that these sources need to be managed and maintained along the product itself.
So, part of the sourcing link in the software supply chain is devoted to analyzing the quality and security of the third-party components for your product.
This includes handling and updating dependencies, documentation, licenses, and performing regular security audits.


# Risks

Today it is almost impossible to ship a large software solution fast without relying on third-party dependencies.
For almost every software company, relying on software that is not made in-house poses several risks.
[Software supply chain attacks](https://en.wikipedia.org/wiki/Supply_chain_attack) occur when a malicious actor penetrates the CI/CD chain to insert malicious code. 
If a single component in the supply chain gets compromised, then the whole infrastructure may be at the mercy of the attacker.
Supply chain attacks are very difficult to detect because the product changes at each stage: from source code, to binaries, to an application that is running and interacting with clients.
Although attackers may target all the layers of the supply chain, from malicious plugins in IDEs to corrupted compilers, they often focus on the less secure elements in the supply chain and rely on the trust that make code reuse possible.
This type of attacks are expected to become more prominent over the next few years.

> "Projects often incorporate code and libraries from many sources with unknown provenance..." -- <cite>[Hamed Okhravi](http://web.mit.edu/ha22286/www/)</cite>

Package managers are particularly susceptible to supply chain attacks (e.g., [typosquatting](https://news.ycombinator.com/item?id=11862217), [cryptojacking](https://www.kaspersky.com/resource-center/definitions/what-is-cryptojacking), and malicious contributors).
This is due to the lack of efficient mechanisms for checking malicious code injections in packages uploaded to most package repositories.
For example, there is no security audit performed on the packages submitted `npm`, the largest repository of JavaScript libraries.
Significant research effort has been devoted in classifying [supply-chain compromises](https://github.com/IQTLabs/software-supply-chain-compromises/blob/master/software_supply_chain_attacks.csv) and developing tools for hardening the supply chain infrastructure.
We have seen the rise of tools to mitigating the risks (e.g., [Snik](https://snyk.io/, [Sonarqube](https://www.sonarqube.org/), and [Chaos Monkey](https://netflix.github.io/chaosmonkey/))) through app behaviour monitoring, dependency scanning, and code quality assessment.
However, the adoption of such solutions is still at an early stage in most organizations.

> "We don't know what we are installing, and even the people who sell it to us have no clear idea." -- <cite>[Fabio Massacci](http://disi.unitn.it/~massacci/)</cite>

The [SolarWinds](https://ieeexplore.ieee.org/document/9382367) incident in 2020 is a typical example of the fragility that permeates modern software supply chains.
In this case, a malicious actor gained access to the Orion monitoring and management system operated by the U.S. company SolarWinds and inserted malicious code into the deployment infrastructure.
Interestingly, changes were done at the source code level, which means that code was tested, signed, and released through the SolarWinds platform, and none in the company noticed any change.
The code was dormant for two weeks.
After that, it mimicked another known protocol to exfiltrate users' credentials, which were used to craft security tokens, allowing attackers to access confidential data.
Attacks at this scale make evidence of the lack of awareness related to this issue and the lack of control of companies and the government regarding the software products and services deployed to their clients.

> "Governments have been somewhat ineffectual in handling supply-chain issues." -- <cite>[James Bret Michael](http://faculty.nps.edu/bmichael/)</cite>


Global innovation is also at risk if governments enforce more restrictive security gates to prevent incidents such as the SolarWinds.
Technology based solutions need to be developed in order to cope with the challenge of maintaining healthy the software supply chain.

# Hardening the chain

Supply chain-related attacks are perceived as very dangerous and hard to detect.
Securing the software supply chain requires continuous assessment of components, vendors, and the operational environment and orchestration and analysis of relevant data sources.
[Reproducible builds](https://reproducible-builds.org/docs/) are a set of software development practices that create an independently verifiable path from source to binary code.
A build is reproducible if given the same source code, build environment and build instructions; any party can recreate bit-by-bit identical copies of all specified artifacts.
This allows verifying that no vulnerabilities or backdoors have been introduced during this compilation process.

To do so, the build system needs to be made entirely deterministic: transforming a given source must always create the same result.
For example, the current date and time must not be recorded and output always has to be written in the same order.
Second, the set of tools used to perform the build and, more generally, the building environment should either be recorded or pre-defined.
Third, users should have a way to recreate a close enough build environment, perform the build process, and validate that the output matches the original build.

Software products, including security tools, should be designed with failure in mind (i.e., they must fail gracefully).
They should monitor for new third-party software releases used, watch published vulnerability announcements, and distribute updates.
Including the [security tools themselves](https://googleprojectzero.blogspot.com/2016/06/how-to-compromise-enterprise-endpoint.html).

In general, the development and adoption of supply chain hardening tools should be guided by the following three objectives:

1. Increase the data collection and analysis to facilitate identifying attacks, especially those involved in third-party software.
2. Adopt existing tools and processes designed to prevent supply chain attacks.
3. Set up mechanisms to quickly recover in case of a supply chain attack that compromises the released software.


# Conclusion

Large-scale software development is a complex process in which both people and technological infrastructure are involved.
Due to the market pressure, this process is very dependent on third-party software.
This situation triggers several risks: from the dependencies, from external service suppliers, and not to forget the hardware infrastructure as well.
Hardening the whole software supply chain is critical for organizations and their users.
Today, a large amount of research effort is drive in this direction.
I hope events such as the SolarWinds incident become less frequent in the near future.

# References

- [https://reproducible-builds.org/docs](https://reproducible-builds.org/docs)
- [https://survey.opensourceunchained.eu/](https://survey.opensourceunchained.eu/)
- [SolarWinds attack explained: And why it was so hard to detect](https://www.csoonline.com/article/3601508/solarwinds-supply-chain-attack-explained-why-organizations-were-not-prepared.html)


