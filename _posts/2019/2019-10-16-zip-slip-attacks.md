---
layout: post
title: The Zip Slip Vulnerability Exploitation
subtitle: Zip slip attacks
published: true
tags: security
description: The Zip Slip vulnerability is exploited using a specially crafted archive that holds directory traversal filenames. I prepared and exploit and explain how it works.
keywords: software attack, vulnerability
image: ../img/posts/2019/zipper_cover.jpg
share-img: ../img/posts/2019/zipper_cover.jpg
show-avatar: false
toc: true
author: cesarsotovalero
date: 2019/10/16
---

In today's ever expanding-open source communities, developers rely heavily on third-party libraries and copy-pasted code from community websites like [StackOverflow](https://stackoverflow.com/) to accelerate productivity. Such code reuse tendency helps to decrease development time and effort, but also means that vulnerability in shared code (i.e., libraries) gets spread dramatically faster, as occurs in the case of the **Zip Slip vulnerability**.

<aside class="quote">
    <em>“Code is complicated, and developers are not security experts. Their focus is typically around delivering code on time and so can
        easily miss security flaws, even if the practice is known.”</em> ― Guy Podjarny
</aside>

This vulnerability is exploited using a specially crafted archive that holds directory traversal filenames (e.g., `../../evil.sh`). The two parts required to exploit this vulnerability are (1) a malicious archive and (2) extraction code that does not perform validation checking.

This post aims to to explain how it works, and includes the following additional resources:

- Installation scripts and instructions to deploy a target example: <https://github.com/cesarsotovalero/zip-slip-exploit-example>

# Overview

The following is a list of vulnerability identifiers:

- **Technical Description:** Zip Slip is a form of _directory
  traversal_ that can be exploited by extracting files from an
  archive. The premise of the directory traversal vulnerability is
  that an attacker can gain access to parts of the file system outside
  of the target folder in which they should reside.

- **Who Is Affected:** Applications and services using a library which
  contains the Zip Slip vulnerability, or projects that directly
  contain vulnerable code, which extracts files from an archive
  without the necessary directory traversal prevention. A list of
  vulnerable libraries is updated and maintained by [Snyk](https://snyk.io) in a
  public GitHub [repo](https://github.com/snyk/zip-slip-vulnerability).

- **Compromise Impact:** The attacker can overwrite executable files
  and either invoke them remotely or wait for the system or user to
  call them, thus achieving remote command execution on the victim's
  machine. The vulnerability can also cause damage by overwriting
  configuration files or other sensitive resources, and can be
  exploited on both client (user) machines and servers.

# Example

Zip Slip attacks are especially prevalent in Java. The principal reason is that Java does not provide any standard library offering high-level processing of archive files. Consequently, developers have to write their own routines or reuse third-party libraries as dependencies from external repositories.

The Java ecosystem had many more archive libraries than other ecosystems, many of which are known to be vulnerable to Zip Slip attacks. In particular, the Maven Central repository is Java ecosystem with thousands of libraries, and today it is well-known that developers do not update their dependencies frequently.

Let us create a new Maven project and add a new dependency towards the
vulnerable library `org.zeroturnaround:zt-zip:1.12` in the `pom.xml`
configuration file as is shown below.

{% highlight xml linenos %}
<dependency>
<groupId>org.zeroturnaround</groupId>
<artifactId>zt-zip</artifactId>
<version>1.12</version>
</dependency>
{% endhighlight %}

Now we can reuse the `ZipUtil.unpack()` public method provided in this library to unzip any kind of compressed file.

{% highlight java linenos %}
Enumeration<ZipEntry> entries = zip.getEntries();
while (entries.hasMoreElements()) {
   ZipEntry e = entries.nextElement();
   File f = new File(destinationDir, e.getName());
   InputStream input = zip.getInputStream(e);
   IOUtils.copy(input, write(f));
}
{% endhighlight %}

This code shows how the `unpack` method is implemented. We observe in line #4 that the concatenation of the destination directory and the ZipEntry path name can cause issues since there is no validation that the files stay within the destination directory. For example, an attacker can create a malicious zip file containing files with directory traversal characters in their embedded path and gain access to certain directories or folders in the file system outside the intended folder and can invoke scripts of overwrite specific files.

There are many tools freely available to create this type of zip exploit files. For instance, the [Evilarc](https://github.com/ptoomey3/evilarc) Python script can be used to zip an `evil.sh` batch executable with the following parameters: `python evilarc.py -d 10 -o unix evil.sh`. Once unpacked by the victim, the malicious `evil.sh` batch script with be copied 10 directories up in the file system were normal users do not have any access.

# Conclusion

As we observed, detecting a system with the Zip Slip vulnerability that was already exploited is very hard, as the result of the exploit consists of files on the system that can be located elsewhere. Besides, zip files could either be uploaded to the application or downloaded from within, so both traffic sources should be monitored. The best way to avoid this exploit is by preventing it from occurring, performing the proper unzip checking and keeping dependencies up to date.
