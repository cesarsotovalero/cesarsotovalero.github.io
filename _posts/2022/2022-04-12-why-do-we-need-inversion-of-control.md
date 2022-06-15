---
layout: post
title: Why Do We Need Inversion of Control (IoC) in Java?
subtitle: Understanding IoC
tags: programming
description: TODO
keywords:
  - Spring Boot,
  - Java programming,
  - Design patterns,
  - TODO,
  - TODO 
image: ../img/posts/2022/TODO.jpg
share-img: ../img/posts/2022/TODO.jpg
show-avatar: false
toc: true
date: 2022/04/12
author: cesarsotovalero
published: false
---

Let's say that we have a meeting in a hotel.
We have invited many people, so we have left out many jugs of water and many plastic cups.
When somebody wants to drink, he/she fills a cup, drinks the water and throws the cup on the floor.
After an hour or so we have a floor covered with plastic cups and water.
Let's try that after inverting the control:
Imagine the same meeting in the same place, but instead of plastic cups we now have a waiter with just one glass cup (Singleton)
When somebody wants to drink, the waiter gets one for them. 
They drink it and return it to the waiter.
Leaving aside the question of the hygiene, the use of a waiter (process control) is much more effective and economic.
And this is exactly what Spring (another IoC container, for example: Guice) does. 
Instead of letting the application create what it needs using the new keyword (i.e. 
taking a plastic cup), Spring IoC offers the application the same cup/ instance (singleton) of the needed object (glass of water).
Think of yourself as an organizer of such a meeting:

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/TODO.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; TODO. Photo taken at <a href="TODO">TODO</a>.
  </figcaption>
</figure>


The Inversion-of-Control (IoC) pattern, is about providing any kind of callback (which controls reaction), instead of acting ourself directly (in other words, inversion and/or redirecting control to external handler/controller). The Dependency-Injection (DI) pattern is a more specific version of IoC pattern, and is all about removing dependencies from your code.

> Every DI implementation can be considered IoC, but one should not call it IoC, because implementing Dependency-Injection is harder than callback (Don't lower your product's worth by using general term "IoC" instead).
 
For DI example, say your application has a text-editor component, and you want to provide spell checking. Your standard code would look something like this:

```java
public class TextEditor {

    private SpellChecker checker;

    public TextEditor() {
        this.checker = new SpellChecker();
    }
}
```
What we've done here creates a dependency between the TextEditor and the SpellChecker. In an IoC scenario we would instead do something like this:


```java
public class TextEditor {

    private IocSpellChecker checker;

    public TextEditor(IocSpellChecker checker) {
        this.checker = checker;
    }
}
```

In the first code example we are instantiating SpellChecker (this.checker = new SpellChecker();), which means the TextEditor class directly depends on the SpellChecker class.

In the second code example we are creating an abstraction by having the SpellChecker dependency class in TextEditor's constructor signature (not initializing dependency in class). This allows us to call the dependency then pass it to the TextEditor class like so:

```java
SpellChecker sc = new SpellChecker(); // dependency
TextEditor textEditor = new TextEditor(sc);
```

Now the client creating the TextEditor class has control over which SpellChecker implementation to use because we're injecting the dependency into the TextEditor signature.

# Example


Examples:
- Event Handling. Event Handlers (what-to-do part) -- Raising Events (when-to-do part)
- Dependency Injection. Code that constructs a dependency (what-to-do part) -- instantiating and injecting that dependency for the clients when needed, which is usually taken care of by the DI tools such as Dagger (when-to-do-part).
- Interfaces. Component client (when-to-do part) -- Component Interface implementation (what-to-do part)
- xUnit fixture. Setup and TearDown (what-to-do part) -- xUnit frameworks calls to Setup at the beginning and TearDown at the end (when-to-do part)
- Template method design pattern. template method when-to-do part -- primitive subclass implementation what-to-do part
- DLL container methods in COM. DllMain, DllCanUnload, etc (what-to-do part) -- COM/OS (when-to-do part)


# Spring Framework

Spring at the end of the day, is a dependency injection framework.
At the end of the day, it is meant to help you wire up your objects. 
And you could wire up your objects, but as we'll see in a moment, it's nice to have that wiring separate from your business logic, right?
A lot of those of us who came from backgrounds like myself with C and C++, had to deal with the RAII pattern, R-A-I-I, Resource Acquisition Is Initialization.
It's the idea that when you get a resource, you initialize it.
When you wanna use it, you initialize it in place, right? 
And this is good because you wanna keep the life of the object, the memory assigned to an object, as small as possible. 
So, if it's in scope and you create it, then you can remember to un-allocate it, to collect the memory assigned to it.
This is useful in a language like C++, where you have to do the memory management.
But it means that you have lots of code with lots of object creation and lots of initialization routines, right next to the place where you're using it.
In a server side application, you're typically gonna have a few objects that get created but once, and that live for the life of the application, first of all, so you don't really want to muddy the works with all that initialization logic. 
And second of all, where things come from, might change based on the environment you're working in. 
So if you're testing your code, then you might have a bunch of mock objects that don't actually represent pointers to data sources or web services or whatever, versus what you have in production, which is actually live fire objects that are actually connected to real things, which in turn might be different in some way, if only through the configuration, that is to say the hosts and the ports and so on that are specified for those web services and data sources and so on. 
They might be different in some way compared to, for example, in the development environment.
So, having the ability to swap out how these things are initialized is very useful.
So not only do we not wanna muddy up our code with redundant initialization logic, but if we do have initialization logic, we want it to be in a single place, particularly as so many of these objects are expensive and we don't wanna have to recreate them each time we use them, because that would make our code more convoluted.
So, dependency injection is a natural fit here. 
And the idea is that you write your code in such a way that you depend on types, but you don't know or care how that instance, that reference was initialized, right?
You write business logic, ignorant of the initialization of the types on which you're working. 
And at some point, that wiring is done for you automatically. 

[//]: # (explain example witouth initialization)
Now, you could do that wiring yourself, to some extent, right? 
So let's say I wasn't using Spring or Spring Boot. 
Let's say I got rid of this, and I got rid of that, and I just have my own code here. 
So I'm gonna create a customer service.
And I want this customer service to have the ability to read data from a database and the database will have a field called an ID and another one called a name. 
So I'm gonna use a Java 17 record here. 
Obviously 20 years ago, when the first lines of Spring were being written, you would have done this with a long, very verbose beloaded type of class that had getters and setters and two string and equals and hash code, dozens of lines of code, just to express what I've just done here in two, okay. 
So I could create a service that gives me a collection of all the customers.
So get customers. 
And I need to actually read that data from a database, right.?
So, how would I implement that?
Well, I could inject my data source here, right.
And that needs a constructor, right? Good. 
And I wanna then use that.
I can actually then, use that data source to open a connection.
I can say get connection, var connection.
And then of course we have the issues surrounding successfully opening up a connection, right? 
I wanna do that, I wanna get the connection.
I want to create a statement.
I want to prepare the statement, right?
So, and I wanna execute a SQL statements.
So I wanna say select all from customers.
What is this var ps? This is the, ps execute. 

And what does this give me? This gives me, did it execute correctly?
Great. 
And then I wanna close it, right. 
So I wanna do try finally.
So I say try, okay. 
So there's that now that's a little bit better and I'm gonna execute the statement therein.
If something goes wrong, of course, I need to have an exception handler. 
So exception e and I need to have logic associated with undoing whatever I've done if I'm modifying service head state.
And I've only executed the statement, I now need to work on or iterate through the results, right? 
So, I get the results set, var rs. 
And I can say rs dot, I can say, while rs.next. 
Then I wanna accumulate the results, so I can create a collection var customers equals new array list, and that's gonna be an array list of customer. 
And while it's got a value, I'm gonna say customers.add new Customer, and that'll be rs.getInt id, rs.get the String name. 
And so I'm just creating the customers as they go along, to do error handling and rollback of transactions, okay. 
And then I wanna return the collection, assuming it's worked in this, I wanna return customers. 
Okay. 
So there's my basic logic there to read the data. 
And I haven't done anything particularly dangerous here. 
I'm just reading data.
And I'm not trying to update multiple tables. 
I'm not doing an update at all actually, there's no statement parameters or anything, and you can see it gets very, very verbose. 
And I've also got this logic of where does this data source come from? Right. 
The old way, before dependency injection, might have been that you initialized it in the code, right, in the site where it's being used. 
So you might say, I'm gonna do a set type equals embedded database H2.build. 
And then you just, you don't have it there, but now you've got this thing that's gonna be created each time there's a new instance of the customer service. 
And then how do you use the customer service? Well, in a public static void main application, obviously you just use it once or a new customer service, and that's fine.
And I can say give me the customers and that'll be okay. 
And of course, I've got that IO logic that I need to worry about. 
So that's probably getting in and leaking all over the place here. 
And it's okay. 
I mean, it works, but now, what about the web server? 
Now I need to start up a web server, and I need to configure all the filter and security and all that kind of stuff. 
That gets tedious. 
And could I do something to make this logic a little bit easier? Surely, right? So, this is where the value of a framework comes in. 
A framework allows you to think about the things that are important, and it does a lot of the boring stuff. 
So, one thing that Spring does is it provides types that you can use to make your life a little bit easier, and to also hide the wiring for you, right. 
So, like I said, you might write this with the initialization in the code upfront, and then you tease it out into a separate variable. 
So here, you might have var ds equals that. 
And it's called ds, and that's a little bit better now. 
You know, this code doesn't care if this is a mock data source, or if it's an Oracle data source or Postgres or whatever, you can swap that out, and the code is basically the same. 
But I wanna make this a little bit better.
Instead of using the data source API directly, and worrying about threads and transactions and rollback and resource acquisition and utilization, I'm gonna use the JDBC template. 
So, I'll say new jdbcTemplate, right. 
jdbcTemplate, and that'll take the data source. 
And then this gives me some very convenient APIs that I'll then take advantage of in my customer service. 
So jdbcTemplate, okay. 
(keyboard clicking) jdbcTemplate equals this dot blah, okay. 
So now I can rewrite all of this code, keeping only the bits that really matter here. 
So what I want is new customer. 
I care about this bit right here. 
Right? So, good. 
And this one right here. 
And so these two bits I care about, right. 
Everything else I don't really care about. 
So I'll use the JDBC template. 
I'll say this.jdbcTemplate.query. 
So, select all from customer, that's this bit here. 
And I want to map the rows as they come back into instances of customer. 
So I'll have a callback here, and that callback will use this. 
Okay. 
(keyboard clicking) Good. 
There is this, and the results set in this case is rs, very good. 
And that gives me customers, okay. 
Now, obviously, this could be a Lambda, right? There you go, that's a lot better. 
So that's my rewritten code. 
And it's the same thing, right? It's much easier to understand. 
I'm not worrying about creating the connection, I'm not worried about connection pools. 
I didn't even worry about that in the first prototype of this code. 
I didn't worry about any of that because that's a lot more work and I have to think to do that, right? I'd much rather just have the framework do this boring stuff for me. 
All right. 
Now, what about transactions? In this case, I'm just reading data, so that's not a big deal. 
But suppose I were doing more than one thing in the same block. 
I would want that to be atomic. 
I would want things to be committed, all or nothing, right? Well, here I can introduce the transaction template, right? So I can say var tt equals new transaction template. 
(keyboard clicking) Right. 
And this transaction template needs a transaction manager. 
So I'll say dstm. 
So new data source transaction manager, and that's gonna take a pointer to the data source. 
So, move that up here. 
ds, and, now, I want to use that transaction manager in the transaction template, and I'll use the transaction template in my customer service. 
I'll say tt, and I'll modify the constructor to accept a pointer to the transaction template as well. 
So here we are, private final transaction template. 
This. 
equals tt. 
Okay. 
So now, I can wrap this logic. 
I can say, okay, what I wanna do is I wanna say this.transactionTemplate.execute, and I wanna execute that inside of a transaction. 
I want it to start and stop inside of a transaction. 
Okay. 
So I'll return all this. 
(keyboard clicking) Okay. 
So this callback, when it runs, it's gonna start up a transaction. 
Before it then invokes your do in transaction method, it's gonna create a transaction, and then it'll commit the transaction after it's invoked your do in transaction method. 
And so the result is still the same. 
I can still return my customers, right. 
I wanna return a default value transaction callback with results. 
Yeah. 
I'm gonna do a transaction callback. 
So the transaction callback takes a T, and a return to T. 
So the T in this case is a collection of customer. 
Sorry, it doesn't take a T, just return to the T. 
So, now I'm basically where I was before. 
I'm wrapping my transactional logic with the JDBC template inside of a transaction, and yeah, this is doing more than I was doing by hand before. 
And so, this is nice, but what if I had some way to just wrap? What if I could just automatically have all the methods that were in my service, enveloped inside of a transaction? Well, this would be some sort of advice, some sort of cross-cutting way to intercept method invocations, and then automatically apply certain behaviors to them. 
Well, that's the premise of aspect oriented programming. 
And so what I wanna do there, is somehow change the customer service, right? Dynamically override these methods. 
And instead of me manually taking care of things like transaction, demarcation, and so on, what if I could just have something done, something in a generic place, something in a single place that did that for me? Right. 
So this is where we talk about aspect oriented programming in Spring. 
And you don't really use aspect oriented programming a lot directly these days, but it's just useful to know that it's there. 
So let's go back to a simpler version of the code. 
And what I wanna do is I wanna take my customer service, and I want to introduce transactional behavior, okay. 
One way I could do this is to use Spring's basic Proxy Factory Beans. 
So pfb, new ProxyFactoryBean, okay. 
And I wanna add advice. 
And the new advice will be a interceptor, right? What I'm gonna do is I'm gonna use the transaction template to execute something within the context of the transactions, a new transaction callback. 
And I'll say return methodInvocation.proceed inside of this transaction, right. 
So I don't need the return null. 
And this is a callback. 
So I'm basically, I'm adding generic advice, I'm creating an object, right? I'm gonna say pfb.setProxy. 
Target class is true, great. 
Pfb.setTarget, and the target of course, is our original customer service. 
And then pfb.getObject, and then proxiedCS, okay. 
So I can say that'll be equal to customer service, and then that I can use instead of the original. 
So now what's gonna happen is if I invoke methods on customer service, each time I do that, it's going to automatically start a transaction, and then execute the behavior within the context of that transaction, right. 
So I have to actually care about try catch there, I have to care about rolling it back. 
I didn't do any of that by the way here, I should. 
Right? I should. 
If there's an exception, I need to say method invocation dot, sorry, I have to say tt dot ... 
No, if there's an exception, I need to throw that exception. 
So I say, throw new RuntimeException, and then the transaction template will see the exception and it'll roll back the transaction automatically for us. 



So, this is pretty good.
But, wouldn't it be nice if this kind of thing was just done for me automatically for common cases like this, like transaction, demarcation and logging and that kind of thing? 
And indeed that's the case, right. 
So, we can use Springs out of the box support using annotations.
Now annotations are a way for us and our code to ask for certain things, ask for certain help, and tell Spring how we want certain things done.
So I want my application code to be transactional. 
So I can say @Transactional, and that makes every method in here, that's public, transactional.
I can also put it on the method level, on the individual method level. 
The problem is that all this time we've been wiring up all of our objects by ourselves.
And we're responsible for the whole recipe for the objects, right? So here I created the proxy and I did all that myself, but there's no need, right? Spring can wire this stuff up for us. 
And so, we can actually create configuration classes where we teach it about how these things wire up. 
So let's create a my service, a customer service configuration. 
Okay. 
And we're gonna create a data source, new EmbeddedDatabaseBuilder, setType, and then build. 
So it's a configuration class, and it's going to, we're gonna have a jdbcTemplate, that'll depend on the data source. 
We're going to have a transaction manager, (keyboard clicking) platform transaction manager, (keyboard clicking) new DataSourceTransactionManager passing in the data source, (keyboard clicking) and what else do we have up there? We've got the transaction template, but we don't need that because we're gonna be using annotations. 
So that can drop from this. 
Good. 
So now, we've got the data source done, data source transaction manager done, jdbc template done. 
So now we wanna use Spring to do the wiring. 
And what we've done is we've created these methods, that return types, and they in turn depend on other types, so we express those dependencies as parameters, typed parameters in the parameter methods of these factory methods, these provider methods. 
So, this provider method is named a transaction manager. 
It returns the type of platform transaction manager that depends upon a reference to something called a data source. 
We're injecting, if you will, the data source, into the data source transaction manager. 
And we wanna then wire up our customer service to use all of that. 
So, @Bean CustomerService, (keyboard clicking) return new customerService, and this in turn, depends on the JDBC template. 
Okay. 
So now we've got the customer service, and now I wanna use that Spring wiring, I wanna just reuse that recipe. 
So, let's create an application context, ApplicationContext ac, new AnnotationConfigApplicationContext, CustomerServiceConfiguration.class, ac.refresh, ac dot, well actually, let's see. 
Var ac, ac.refresh. 
Actually, I'm not even sure if we need refresh. 
That might be enough. 
So we can then say, I want a pointer to the Bean CustomerService.class, var cs. 
And that's it, that's the same as before, but now we're letting Spring figure out how these things get wired together. 
We've expressed declaratively what we want. 
We've got this thing that depends on that, but how that definition comes is up to the Spring configuration. 
And here, we're using a data source that is an embedded SQL database, that's just fine. 
Oops, customers, we don't have a customer's table, right. 
We're using an embedded data source, and so there's no database because we didn't initialize it. 
Well, now I need to do something where I can actually start up the data source and initialize it. 
I could do all that logic myself, but again, we're using Spring. 
So let's let the framework do that kind of stuff for us. 
So, I can go to source main resources, and I can create a file called schema.sql, create table customers ID serial primary key, name varchar 255, not null. 
So that'll get automatically run when the application restarts. 
So now I've got my customer service, I've got my data source, I've got the wiring, I'm not worrying about how these things find each other, right? I've got a data source here, tomorrow I might have a different data source, but it doesn't matter. 
My code was written to accept a JDBC template. 
The JDBC template is in turn written to accept a data source. 
And I don't care how that data source gets sourced. 
20 years ago, it would be very useful to get the data source bound to a JNDI context, right, my application server. 
As more and more people started to move to Tomcat, Apache Tomcat, there was no JNDI. 
It was just something you initialized in your Spring application context, and that became very useful. 
And nowadays, you don't even deploy to Tomcat, you just run the application directly like public static void main. 
You're not deploying your application into another application, you're running everything in your public static void main. 
So, this is a very simple example, but we haven't even looked at how to build a web server. 
We haven't looked at any of that stuff, right? We've got a very simple example of application configuration and wiring. 
I've got a customer service here and I'm explicitly wiring it up. 
And that's cool, I like this flexibility. 
I like the idea that I can use Bean methods to tell Spring about the objects that are in play in my application and the relationships. 
That said, do I have to tell it about every single one that I create as well? Couldn't it just figure that out for me? And this is where stereotype annotations come into play. 
You can tell Spring to enable component scanning. 
You can tell Spring to enable component scanning with @Componentscan, and then it'll look in the current package and below, and find any types annotated with a stereotype annotation in the UML sense of stereotype, like the role of the object in the architecture. 
So, the base stereotype annotation is @Component, but in this case, we're actually building a service, aren't we? So, we might use @Service, which is itself also a component. 
There are other stereotype annotations, you'll see me use @Controller a lot, right. 
Repository is very common, @RiskController is itself a controller plus response body. 
So, those controller, those components are the stereotype annotations that are useful. 
They're all the same thing, they all result in your object being picked up when it scans the current package. 
And they all result in objects being managed by the framework. 
But the benefit is that now, you can tell Spring about your class just by adding the annotation. 
You don't also have to go to the configuration class and add another entry. 
There's no need to do that same work twice. 
You've got the component here and you've got it registered over there, why? This annotation gets rid of that. 
So for objects that you don't have the ability to annotate, like the platform transaction manager and your data source's driver and all that stuff, just use Java Config, explicit Java Config. 
But for your own components, you can use the stereotype annotations. 
Now, clearly there's a lot here, we haven't even begun to address. 
Things like the web server, like observability and so on. 
And so in the next section, we're gonna look at Spring Boot, and see how that takes what we've looked at, and simplifies things even further.

    Support


## Spring Without IoC:

```java


```


## Spring With IoC:

```java
@SpringBootApplication
public class DemoApplication {
  public static void main(String[] args) throws SQLException {
    SpringApplication.run(DemoApplication.class, args);
  }
}

@Controller
@ResponseBody
class CustomerRestController {

  private final CustomerService customerService;

  CustomerRestController(CustomerService customerService) {
    this.customerService = customerService;
  }

  @GetMapping("/customers")
  Collection<Customer> get() {
    return this.customerService.getCustomers();
  }
}

record Customer(Integer id, String name) {}

@Service
@Transactional
class CustomerService {

  private final JdbcTemplate jdbcTemplate;

  public CustomerService(JdbcTemplate jdbcTemplate) {
    this.jdbcTemplate = jdbcTemplate;
  }

  Collection<Customer> getCustomers() {
    return this.jdbcTemplate.query("select * from customers",
        (rs, rowNum) -> new Customer(rs.getInt("id"), rs.getString("name")));
  }
}

```

# HEADING

# HEADING

# Conclusion

# References

- TODO
- TODO
- TODO


