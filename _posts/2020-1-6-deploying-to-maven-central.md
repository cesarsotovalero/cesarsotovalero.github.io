---
layout: post
title: Deploying to Maven Central
subtitle: A three-steps guide
tags: software
published: true
image: ../img/posts/maven_journey.png
date: 2020/1/06
---

> "Containing over four million software artifacts, the Maven Central Repository is one of the world’s largest and oldest archives of software libraries" *― The Maven community*

## Introduction

Maven Central is the de-facto repository for hosting software artifacts that compile to the JVM. In this post, I'll describe the process of releasing a new artifact in Maven Central following an step-by-step approach. 

## Contents

* [1. Create a JIRA ticket in Sonatype](#1-create-a-jira-ticket-in-sonatype)
* [2. Configuring the POM](#2-configuring-the-pom)
* [3. Release to Maven Central](#3-release-to-maven-central)
* [References](#references)

## 1. Create a JIRA ticket in Sonatype

First, you need to create a JIRA account and submit a ticket there requesting for a project namespace in Sonatype (aka, GroupId):

1.  [Create a JIRA account](https://issues.sonatype.org/secure/Signup!default.jspa)
2.  [Create a New Project ticket](https://issues.sonatype.org/secure/CreateIssue.jspa?issuetype=21&pid=10134)

A staging repository is already configured for the requested GroupId, you need to find someone with a deployer role that comment on the ticket to verify your request. Below is an example of a ticket that I created requesting a repository for the namespace `se.kth.castor`

![](../img/posts/sonatype_screeshot.png)

The ticked review is a manual process, it normally takes less than 2 business days.

## 2. Configuring the POM

After the approval of the ticket, you need to add additional information to the POM of the Maven project or module to be deployed. Follow the steps below exactly as they are.

1. Choose appropriate coordinates as explained [here](https://central.sonatype.org/pages/choosing-your-coordinates.html):

{% highlight xml linenos %}
<groupId>com.example.applications</groupId>
<artifactId>example-application</artifactId>
<version>1.4.7</version>
{% endhighlight %}
 
2.  Add your project name, description, and URL:

{% highlight xml linenos %}
<name>Example Application</name>
<description>Describe your Application</description>
<url>http://www.example.com/example-application</url>
{% endhighlight %}

3. Add licence information:

{% highlight xml linenos %}
<licenses>
  <license>
     <name>The Apache License, Version 2.0</name>
    <url>http://www.apache.org/licenses/LICENSE-2.0.txt</url>
  </license>
</licenses>
{% endhighlight %}

4. Add information about developer/s :

{% highlight xml linenos %}
<developers>
  <developer>
    <name>Manfred Moser</name>
    <email>manfred@sonatype.com</email>
    <organization>Sonatype</organization>
    <organizationUrl>http://www.sonatype.com</organizationUrl>
  </developer>
</developers>
{% endhighlight %}

5. Add SCM information, the following example uses GitHub:

{% highlight xml linenos %}
<scm>
  <connection>scm:git:git://github.com/simpligility/ossrh-demo.git</connection>
  <developerConnection>scm:git:ssh://github.com:simpligility/ossrh-demo.git</developerConnection>
  <url>http://github.com/simpligility/ossrh-demo/tree/master</url>
</scm>
{% endhighlight %}
    
6. Add distribution management and authentication to Sonatype via the `nexus-staging-maven-plugin`:

{% highlight xml linenos %}
<distributionManagement>
  <snapshotRepository>
     <id>ossrh</id>
     <url>https://oss.sonatype.org/content/repositories/snapshots</url>
  </snapshotRepository>
</distributionManagement>
<build>
  <plugins>
     <plugin>
       <groupId>org.sonatype.plugins</groupId>
       <artifactId>nexus-staging-maven-plugin</artifactId>
       <version>1.6.7</version>
       <extensions>true</extensions>
       <configuration>
         <serverId>ossrh</serverId>
         <nexusUrl>https://oss.sonatype.org/</nexusUrl>
         <autoReleaseAfterClose>true</autoReleaseAfterClose>
       </configuration>
     </plugin>
     ...
  </plugins>
</build>
{% endhighlight %}
    
 7. Add javadoc and sources attachments using the `maven-javadoc-plugin` and  `maven-source-plugin` :
 
{% highlight xml linenos %}
<build>
  <plugins>
     <plugin>
        <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-source-plugin</artifactId>
          <version>2.2.1</version>
          <executions>
            <execution>
              <id>attach-sources</id>
              <goals>
                <goal>jar-no-fork</goal>
              </goals>
            </execution>
          </executions>
        </plugin>
        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-javadoc-plugin</artifactId>
          <version>2.9.1</version>
          <executions>
            <execution>
              <id>attach-javadocs</id>
              <goals>
                <goal>jar</goal>
              </goals>
            </execution>
          </executions>
     </plugin>
  </plugins>
</build>
{% endhighlight %}

 8. Add GPG signed components using the `maven-gpg-plugin`:
 
{% highlight xml linenos %}
<build>
  <plugins>
     <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-gpg-plugin</artifactId>
        <version>1.5</version>
        <executions>
           <execution>
              <id>sign-artifacts</id>
              <phase>verify</phase>
              <goals>
                <goal>sign</goal>
              </goals>
           </execution>
        </executions>
     </plugin>
  </plugins>
</build>
{% endhighlight %}

9. Follow [this instructions](https://central.sonatype.org/pages/working-with-pgp-signatures.html) to encrypt your artifact with [gpg2](https://linux.die.net/man/1/gpg2) and distribute your public key to a key server (e.g., [http://keys.gnupg.net](http://keys.gnupg.net)). Do not forget to choose a passphrase to protect your secret key. Then add your gpg credentials with your passphrase to your Maven`settings.xml` file locally:

{% highlight xml linenos %}
<settings>
  <profiles>
     <profile>
       <id>ossrh</id>
         <activation>
          <activeByDefault>true</activeByDefault>
          </activation>
          <properties>
            <gpg.executable>gpg2</gpg.executable>
            <gpg.passphrase>the_pass_phrase</gpg.passphrase>
          </properties>
        </profile>
      </profiles>
</settings>
{% endhighlight %}

10. Add `nexus-staging-maven-plugin` with the following configurations:

{% highlight xml linenos %}
<build>
  <plugins>
     <plugin>
        <groupId>org.sonatype.plugins</groupId>
        <artifactId>nexus-staging-maven-plugin</artifactId>
        <version>1.6.7</version>
        <extensions>true</extensions>
        <configuration>
           <serverId>ossrh</serverId>
           <nexusUrl>https://oss.sonatype.org/</nexusUrl>
           <autoReleaseAfterClose>true</autoReleaseAfterClose>
        </configuration>
     </plugin>
  </plugins>
</build>
{% endhighlight %}

## 3. Release to Maven Central

Finally, run a deployment to OSSRH and an automated release to the Central Repository with the following command:


{% highlight shell linenos %}
mvn clean deploy
{% endhighlight %}

After this, Central sync will be activated for your namespace. After you successfully deploy, your component will be published to Maven Central, typically within 10 minutes, though updates to [search.maven.org](https://search.maven.org) can take up to two hours.

If you have any issue, let me know in the comments below. Happy deploying  :smile:

## References

- [Apache Maven Official Instructions](https://maven.apache.org/repository/guide-central-repository-upload.html)
- [OSSRH Guide](https://central.sonatype.org/pages/ossrh-guide.html)
- [Tutorial on YouTube](https://www.youtube.com/watch?v=bxP9IuJbcDQ)