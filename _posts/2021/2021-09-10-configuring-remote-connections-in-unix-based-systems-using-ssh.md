---
layout: post
title: Configuring Remote Connections in Unix-Based Systems Using SSH
subtitle: A noob's guide
tags: devops
description: This practical guide will show you how to configure a remote connection in Unix-based systems. You will learn how to create RSA keys and use SSH to configure the connection from the terminal. 
keywords:
  - ssh remote connection,
  - public key authentication,
  - rsa key,
  - open-ssh tutorial,
  - terminal remote access
image: ../img/posts/2021/metro_station_cover.jpg
share-img: ../img/posts/2021/metro_station_cover.jpg
show-avatar: false
toc: true
date: 2021/09/10
author: cesarsotovalero
published: true
---

When working as a software engineer, you will need to connect to a remote computer hosted on a remote server.[^1]
This is a common task for developers, sysadmins, and researchers.
This post will show you how to configure a remote connection in Unix-based systems.
You will learn how to create RSA keys and use SSH to configure the connection from the terminal.
This is a practical guide, so I will not try to explain everything in detail.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2021/metro_station.jpg alt:"Setting up working connections, a necessity from immemorial times." %}
  <figcaption class="stroke"> 
    &#169; Setting up working connections, a necessity from immemorial times. Photo of the metro station in <a href="https://goo.gl/maps/nVMLPbE9KRcmD3NL7">Gärdet</a>.
  </figcaption>
</figure>

# Creating Public and Private Keys

First, make sure you have an OpenSSH client installed in your system.[^2] 
If not, you can install it with Homebrew on macOS:

{% highlight bash linenos %}
brew install openssh
{% endhighlight %}

The SSH protocol uses industry-standard robust encryption algorithms, like AES, to secure communication between the involved parties.
In addition, the protocol uses hashing algorithms, such as SHA-2, to ensure the integrity of the data transmitted.
You can read more about encryption and hashing in [this article](./blog/2021/encoding-encryption-hashing-and-obfuscation-in-java.html).

> “OpenSSH is the premier connectivity tool for remote login with the SSH protocol. It encrypts all traffic to eliminate eavesdropping, connection hijacking, and other attacks. In addition, OpenSSH provides a large suite of secure tunneling capabilities, several authentication methods, and sophisticated configuration options.”

An SSH key consists of a pair of text files.
One is the **private key**, which should never be shared with anyone.
The other is the **public key**, which you can share with other services.
With the public key, the service uses a secure authentication protocol to log into the containers and VMs you provision.

The [`ssh-keygen`](https://man.openbsd.org/ssh-keygen) generates ssh keys.
When you generate the keys, you will store them in a safe location.
Thus, you can bypass the login prompt when connecting to your instances.

To generate the keys, run the following command:

{% highlight bash linenos %}
ssh-keygen -t rsa
{% endhighlight %}

This starts the key generation process.
When you execute this command, the `ssh-keygen` utility prompts you to indicate where to store the key.
Press the ENTER key to accept the default location.
The `ssh-keygen` utility prompts you for a passphrase.
Type in a passphrase or hit the ENTER key to accept the default (no passphrase).
However, this is not recommended (you will need to enter the passphrase a second time to continue).
After you confirm the passphrase, the system generates the key pair.

Here is an example of the output:

{% highlight text %}
Your identification has been saved in /Users/cesar/.ssh/id_rsa.
Your public key has been saved in /Users/cesar/.ssh/id_rsa.pub.
The key fingerprint is:
ae:89:72:0b:85:da:5a:f4:7c:1f:c2:43:fd:c6:44:38 myname@mymac.local
The key's randomart image is:
+--[ RSA 2048]----+
|                 |
|         .       |
|        E .      |
|   .   . o       |
|  o . . S .      |
| + + o . +       |
|. + o = o +      |
| o...o * o       |
|.  oo.o .        |
+-----------------+
{% endhighlight %}

Now, you have a public and private key pair.
The next step is to connect to a remote server through SSH.

# Using SSH

[SSH](https://en.wikipedia.org/wiki/Secure_Shell) (a.k.a, Secure Socket Shell or Secure Shell) is a secure network protocol that allows access to remote devices securely.
It encompasses a cryptographic network protocol and the suite of utilities that implement it.
SSH encrypts the communication with a remote system by utilizing a pair of SSH keys which are cryptographic and made up of public and private key pairs.
The keys work collaboratively to provide authentication between the client and the remote system.
It can be used for logging or executing commands on a remote server.

SSH keys can and should be used in any situation where there is an unsecured network.
Aside from providing strong encryption and secure remote connections, SSH encrypts the data during file transfers or while securely managing network infrastructure components.
In addition, it can be configured to allow port forwarding by mapping the default SSH port to an available port number on the destination.

SSH leverages a client-server model to connect a client application (where the session is displayed) with a server (where the session runs).

This connection model has three layers:

1. **Transport Layer:** Establishes secure communication between the client and the SSH server.
2. **Authentication Layer:** Sends the supported authentication methods to the client.
3. **Connection Layer:** Manages the connection between the client and the server after successful authentication.

The client needs to initiate a request with an SSH server to establish a connection with an SSH server.
Once the server receives the connection request, encryption negotiation begins.
The server sends a public cryptography key to the client, and the key is used to verify the identity of the SSH server.
Afterward, the server negotiates parameters and creates a secure channel for the client. Finally, the client logs into the server.

To connect to a remote server, you need to know the IP address or the domain name of the server.
In addition, you need to know the username of the account you want to use and the path to the private key.

Here is an example of the command:

{% highlight bash linenos %}
ssh -i <PATH_TO_PRIVATE_KEY> <USERNAME>@<IP_ADDRESS> -p <PORT_NUMBER>
{% endhighlight %}

# Using the SSH Config File

OpenSSH allows you to set up a per-user configuration file where you can store different SSH options for each remote machine you connect to.
OpenSSH client-side configuration file is named `config`, and it is stored by default in the `~/.ssh/` directory.
This directory is automatically created when the user runs the ssh command for the first time.
If it doesn't exist on your system, create it using the command below:

{% highlight bash linenos %}
mkdir -p ~/.ssh && chmod 700 ~/.ssh
{% endhighlight %}

By default, the SSH configuration file may not exist, so you may need to create it using the `touch` command:

{% highlight bash linenos %}
touch ~/.ssh/config
{% endhighlight %}

This file must be readable and writable only by the user and not accessible by others:

{% highlight bash linenos %}
chmod 600 ~/.ssh/config
{% endhighlight %}

Here is an example of an [SSH config file](https://www.ssh.com/academy/ssh/config) with a simple structure:

{% highlight bash linenos %}
Host zeus
    HostName <value>
    User <value>
    Port <value>
    IdentityFile <value>

Host hercules
    SSH_OPTION value

Host aquiles
    SSH_OPTION value
{% endhighlight %}



Where:

- `HostName` is the name (or IP) of the host you want to connect to.
- `User` is the username of the account you want to use.
- `Port` is the port number of the SSH server.
- `IdentityFile` is the path to the private key in your local filesystem.

Now to connect with the server, you can simply type the following in your terminal:

{% highlight bash linenos %}
ssh zeus
{% endhighlight %}

The SSH client will read the configuration file and use the connection details that are specified for the `zeus` host.

# Further Reading

- [:earth_americas: Using the SSH Config File](https://linuxize.com/post/using-the-ssh-config-file/)
- [:earth_americas: Working with SSH key passphrases](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases)

# Footnotes

[^1]: Computers now like clouds, where they can cheer with [Lucy, in the sky, with diamonds](https://open.spotify.com/track/25yQPHgC35WNnnOUqFhgVR?si=1ec8395e238c4273).

[^2]: I'm assuming you're using MacOS in this post.

