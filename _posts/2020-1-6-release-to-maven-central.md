---
layout: post
title: Releasing to Maven Central
subtitle: A three-steps guide
published: true
image: ../img/posts/maven-central.png
date: 2020/2/14
---

## Introduction

Maven Central is the de-facto repository of software artifacts that compile to the JVM. In this post, I'll describe the process of releasing a new artifact there. 

## 1. Create a JIRA ticket in Sonatype

First, you need to have a JIRA account and submit a ticket requesting for a project namespace (Group Id):

1.  [Create a JIRA account](https://issues.sonatype.org/secure/Signup!default.jspa)
2.  [Create a New Project ticket](https://issues.sonatype.org/secure/CreateIssue.jspa?issuetype=21&pid=10134)

Below is an example of ticket submitted to creat a repository for the namespace `se.kth.castor`

![](../img/posts/sonatype_screeshot.png)

The ticked review is a manual process, it normally takes less than 2 business days.

## 2. Configuring the POM

After the the approval of the ticket, you need to add additional information to the POM of the Maven project/module to be released:

1. Choose correct coordinates:

    ```xml
    <groupId>com.example.applications</groupId>
    <artifactId>example-application</artifactId>
    <version>1.4.7</version>
    ```
 
2.  Add project name, description and URL:

    ```xml
    <name>Example Application</name>
    <description>A application used as an example on how to set up pushing its components to the Central Repository</description>
    <url>http://www.example.com/example-application</url>
    ```
3. Add licence information:

    ```xml
    <licenses>
      <license>
        <name>The Apache License, Version 2.0</name>
        <url>http://www.apache.org/licenses/LICENSE-2.0.txt</url>
      </license>
    </licenses>
    ```
4. Add developer/s information:

    ```xml
     <developers>
        <developer>
          <name>Manfred Moser</name>
          <email>manfred@sonatype.com</email>
          <organization>Sonatype</organization>
          <organizationUrl>http://www.sonatype.com</organizationUrl>
        </developer>
      </developers>
    ```

5. Add SCM information:

    ```xml
    <scm>
      <connection>scm:git:git://github.com/simpligility/ossrh-demo.git</connection>
      <developerConnection>scm:git:ssh://github.com:simpligility/ossrh-demo.git</developerConnection>
      <url>http://github.com/simpligility/ossrh-demo/tree/master</url>
    </scm>
    ```
    
6. Add distribution management and authentication via the `nexus-staging-maven-plugin`:

    ```xml
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
    ```
    
 7. Add javadoc and sources attachments:
 
    ```xml
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
    ```
    
 8. Add GPG signed components:
 
     ```xml
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
    ```

9. Follow [this instructions](https://central.sonatype.org/pages/working-with-pgp-signatures.html) to encrypt your artifact with [gpg2](https://linux.die.net/man/1/gpg2) and distribute your public key to a key server (e.g., [http://keys.gnupg.net](http://keys.gnupg.net)). Choose a passphrase to to protect your secret key. Then add your gpg credentials with your passphrase to your Maven`settings.xml` file:

     ```xml
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
    ```
    
10. Add `nexus-staging-maven-plugin` with the following configurations:

    ```xml
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
    ```

## 3. Release to Maven Central

Run a deployment to OSSRH and an automated release to the Central Repository with the following command:

```bash
  mvn clean deploy
```

After this, Central sync will be activated for your namespace. After you successfully release, your component will be published to Maven Central, typically within 10 minutes, though updates to [search.maven.org](https://search.maven.org) can take up to two hours.


## References

- [Apache Maven Instructions](https://maven.apache.org/repository/guide-central-repository-upload.html)
- [OSSRH Guide](https://central.sonatype.org/pages/ossrh-guide.html)
- [Tutorial on YouTube](https://www.youtube.com/watch?v=bxP9IuJbcDQ)