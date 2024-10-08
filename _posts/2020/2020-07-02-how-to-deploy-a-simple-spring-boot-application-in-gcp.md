---
layout: post
title: How to Deploy a Simple Spring Boot Application in GCP
subtitle: Getting started with Google Cloud Platform
tags: cloud
keywords: 
    - Java,
    - Spring Boot,
    - Google Cloud,
    - Application Deployment,
    - Tutorial
description: |
  Deploying a Spring Boot application to Google Cloud Platform (GCP) offers a streamlined way to bring your Java app to life on the web. This post is a step-by-step guide to deploying your application using both Google App Engine and Compute Engine. Whether you're looking for simplicity with App Engine or more control using Compute Engine, this tutorial covers the essential steps to get your Spring Boot app running on GCP, with scalable infrastructure and cost-effective resources.
image: ../img/posts/2020/2020-07-02/heroes-cover.jpg
share-img: ../img/posts/2020/2020-07-02/heroes-cover.jpg
show-avatar: false
toc: true
author: cesarsotovalero
date: 2020/07/02
published: true
---

After having my Java Spring Boot web app ready, the next step is to show it to the world.
This means deploying it on the internet.[^1]
I landed on Google Cloud Platform (GCP) for this task.
Why?
Well, GCP in 2020 gives a nice starting credit of $100, and after that I only pay for what I use.
That's the beauty of PaS and similar cloud services.
I don't expect that my application will have a lot of traffic, so I don't need a Kubernetes cluster to deal with scalability issues.
I found the documentation for deploying a simple Spring Boot application on GCP a bit confusing.
So I decided to write this article as a step-by-step guide for the beginners.
Let's get started!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2020/2020-07-02/heroes.jpg alt:"Heroes in the cloud" %}
  <figcaption class="stroke"> 
    &#169; The cloud is the best place for our mystical <del>heroes</del> apps. Photo from a craft shop in <a href="https://goo.gl/maps/L6VH6HcfWr5ernk26">Gamla Stan</a>, 2020.
  </figcaption>
</figure>

# Advantages of GCP 

Choosing GCP for Java application development has several advantages:

- **Seamless Integration with GCP's SDK**. [GCP's SDK](https://cloud.google.com/sdk/) tools and client libraries are tailored for Java developers. After setting up my GCP account, I was immediately able to leverage `gcloud` commands, facilitating smooth deployment of my Spring Boot application to Google Cloud services such as [App Engine](https://cloud.google.com/appengine) or [Compute Engine](https://cloud.google.com/compute).

- **Vast Global Infrastructure**. GCP boasts an extensive, high-speed global network. Deploying on GCP ensures lower latency, as traffic gets dynamically routed through the nearest global location. This optimizes the application's [Time-To-First-Byte](https://en.wikipedia.org/wiki/Time_to_first_byte) (TTFB), enhancing end-user experience across different geographical locations.

- **Robust Security with Context-Aware Access**. One of GCP's prime offerings is its security model. By leveraging [Identity and Access Management](https://cloud.google.com/iam) (IAM), I could define granular access permissions for services. With context-aware access, I ensured adaptive access control based on dynamic conditions.

- **Comprehensive Tooling and Services**. Beyond mere hosting, GCP provides a plethora of services tailored for developers. I integrated my Spring Boot application with [Cloud SQL](https://cloud.google.com/sql) for relational database needs. For insights, [Stackdriver](https://cloud.google.com/products/operations?hl=en) provided monitoring, logging, and diagnostics. Additionally, [GCP's AI and machine learning APIs](https://cloud.google.com/products/ai) seamlessly integrated into the application to provide advanced functionalities.

- **Auto-scaling with Managed Instance Groups (MIGs)**. GCP's ability to handle auto-scaling is remarkable. Using [Managed Instance Groups](https://cloud.google.com/compute/docs/instance-groups), I set up my deployment to automatically manage the deployment's instances. The infrastructure responded elastically to the application's traffic patterns, ensuring high availability without manual intervention.

- **Cost-Effective and Transparent Billing**. GCP operates on a [sustained-use discount model](https://cloud.google.com/compute/docs/sustained-use-discounts). This means I could make efficient use of resources with the assurance of cost optimization. The platform's detailed billing reports also allowed for in-depth analysis of resource utilization, enabling further optimizations.

# Deploying to GCP

Deploying a Spring Boot application to GCP can be achieved through several services.
Here we will cover two of the most common ways: using App Engine and Compute Engine.

## Using App Engine

Perhaps the simplest way to deploy is via Google App Engine's Java 11 environment. 
Here are the steps and associated commands to get your Spring Boot application up and running on GCP using App Engine:

Pre-requisites:

- Ensure you have a GCP account and have created a project.
- Install the [Google Cloud SDK](https://cloud.google.com/sdk/docs/install).
- Your Spring Boot application should be packaged as a JAR (not WAR).

First, authenticate your command line tool with GCP:

```bash
gcloud auth login
```

Set the active project:

```bash
gcloud config set project YOUR_PROJECT_ID
```

Replace `YOUR_PROJECT_ID` with your GCP project's ID.

Inside the root of your Spring Boot project, create a file named `app.yaml`.
This file will contain the configuration for the App Engine deployment.

Here's an example:

```yaml
runtime: java11
instance_class: F2
entrypoint: 'java -jar YOUR_SPRING_BOOT_APP.jar'
```
Replace `YOUR_SPRING_BOOT_APP.jar` with the name of your Spring Boot JAR file.
Navigate to the root of your Spring Boot project (where your `app.yaml` is located) and run:

```bash
gcloud app deploy
```

Once the deployment completes, you'll be given a URL in the format:

```
https://YOUR_PROJECT_ID.ue.r.appspot.com
```

You can navigate to this URL in your web browser to access your Spring Boot application.
You can view logs and monitor the application's performance, errors, and other metrics through the GCP Console under "App Engine" and "Logging" sections.

## Using Compute Engine

Create a Compute Engine virtual machine instance named **vm-instance** with the following command:

```bash
gcloud compute instances create vm-instance \
--zone us-central1-f \
--scopes=https://www.googleapis.com/auth/cloud-platform \
--tags=http-server
```

Let's break down the command:

- `gcloud compute instances create [YOUR_INSTANCE_NAME]`: This is the basic command to create a new VM instance. You need to replace `[YOUR_INSTANCE_NAME]` with the actual name you want to use for your instance.

- `--zone us-central1-f`: This specifies the zone where you want your instance to be created.

- `--scopes=https://www.googleapis.com/auth/cloud-platform`: This flag allows full access to all Cloud APIs.

- `--tags=http-server`: This flag adds a network tag that you can use to apply firewall rules to your instance. In this case, `http-server` is a predefined tag that automatically allows HTTP traffic.

In the SSH session, to update the Debian package list, enter the following command:

```bash 
sudo apt-get update
```

Install Java 11:

```bash
sudo apt-get install -yq openjdk-11-jdk
```

Apply workaround for certificate issue in OpenJDK 11:

```bash
sudo sed -i 's/^\(keystore\.type\s*=\s*\).*$/\1jks/' /etc/java-11-openjdk/security/java.security; sudo rm /etc/ssl/certs/java/cacerts; sudo /usr/sbin/update-ca-certificates -f
```

Install Git, Maven, and configure configure IP tables:

```bash
sudo apt-get install git -y
sudo apt-get install -yq maven
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
```

Export the Project ID as an environment variable:

```bash
export GCLOUD_PROJECT="$(curl -H Metadata-Flavor:Google http://metadata/computeMetadata/v1/project/project-id)"
```

Clone the class repository:

```bash
git clone [REPOSITORY_URL]
```

To keep the navigation simple, create a soft link as a shortcut to the working directory:

```bash
ln -s ~/training-data-analyst/courses/developingapps/v1.3/java/devenv ~/devenv
```

Change to the directory that contains the sample files:

```bash
cd ~/devenv
```

Build and run the Spring Boot application:

```bash
mvn clean install
mvn spring-boot:run
```

Return to the Cloud Console VM instances list, and click on the External IP address for the **vm-instance**.

# Conclusion

That's it! 
These are the fundamental steps to get a Spring Boot application deployed up and running on GCP.
Depending on the complexity and specifics of your application, you might need to perform additional configuration or setup.

# Footnotes

[^1]: Production land is the best place in the world to be, as a developer.

