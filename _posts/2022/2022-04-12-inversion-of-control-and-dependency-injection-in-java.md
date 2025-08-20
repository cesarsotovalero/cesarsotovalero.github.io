---
layout: post
title: Inversion of Control and Dependency Injection in Java
subtitle: The holy grails of modern enterprise Java frameworks
tags: java
description: This blog post explains Inversion of Control and Dependency Injection in Java. These concepts are the backbone of modern enterprise Java frameworks.
keywords:
  - Spring java framework,
  - Java programming,
  - Design patterns,
  - Inversion of control
image: ../img/posts/2022/universitetet_cover.png
share-img: ../img/posts/2022/universitetet_cover.png
show-avatar: false
toc: true
date: 2022/04/12
author: cesarsotovalero
published: true
---

Inversion of Control (IoC) is a programming principle.
The idea of IoC is delegating the control of parts of our application to a framework that initializes some specific task for us.
Dependency injection (DI) is a popular [design pattern](https://martinfowler.com/articles/injection) that applies the IoC principle.
This pattern was made popular by web frameworks, and today it is widely adopted in enterprise Java applications.
The DI pattern initializes and wires components from different application layers automatically.
The first time I saw this pattern was in the Spring Framework.
It seemed to work like ~~obscure~~ magic to me.
To shed light on this matter, I write this blog post to explain how IoC and DI work.
These concepts are the backbone of modern enterprise Java frameworks.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/universitetet_small.jpg alt:"TODO" %}
  <figcaption class="stroke">
    &#169; Creation is all about assembling and initializing existing knowledge. Photo taken at <a href="https://goo.gl/maps/jUmq4jTTe2P4go4g6">Universitetet</a>.
  </figcaption>
</figure>

# Inversion of Control (IoC)

The IoC principle is all about delegating actions instead of acting ourselves directly.
In other words, the idea is to invert or redirect the control to an external handler or controller.
This allows us to avoid dealing with the data directly through **explicit object initialization**.
Instead, we deal with object composition.

The following analogy explains the concept:

> “Let's say that we have a meeting in a hotel.
We have invited many people, so we have left out many jugs of water and many plastic cups.
When somebody wants to drink, she fills a cup, drinks the water and throws the cup on the floor.
After an hour or so we have a floor covered with plastic cups and water.
Let's try that after inverting the control.
Imagine the same meeting in the same place, but instead of plastic cups we now have a waiter with just one glass cup.
When somebody wants to drink, the waiter gets one glass for them.
They drink it and return it to the waiter.
Leaving aside the question of the hygiene, the use of a waiter (process control) is much more effective and economic.
And this is exactly what IoC does.
Instead of letting the application create what it needs using the `new` keyword (i.e., taking a plastic cup), IoC offers the application the same cup/instance of the needed object (i.e., glass of water).” -- <cite>Brilliant answer from [Stack Overflow](https://stackoverflow.com/questions/3058/what-is-inversion-of-control?page=1&tab=modifieddesc#tab-top)</cite>

For example, imagine that an application has a text editor component for which we want to provide spell checking capabilities.
The following code shows the ~~imperative~~ standard way of doing it:

{% highlight java linenos %}
SpellChecker sc = new SpellChecker();
TextEditor te = new TextEditor();
sc.checkSpelling(te.getText());
{% endhighlight %}

In the previous code, we retrieve the text from `TextEditor`, and then we check the spelling via the `SpellChecker` object:

In contrast, another way is to use the IoC principle.
In this case, we initialize the `TextEditor` object with the desired `SpellChecker`.
Thus, the `checkSpelling` task is delegated to the `TextEditor` object, which uses the `SpellChecker` object within the `getText()` method.

{% highlight java linenos %}
SpellChecker sc = new SpellChecker();
TextEditor te = new TextEditor(sc);
te.getText();
{% endhighlight %}

A more elegant way would be to use [object composition](https://en.wikipedia.org/wiki/Object_composition) to retrieve the text.
Below is an example:

{% highlight java linenos %}
new SpellCheckedText(
  new TextEditor(
    new SpellChecker()
  )
);
{% endhighlight %}

# Dependency Injection (DI)

The Dependency Injection (DI) pattern is a more specific implementation of IoC principle.
It is all about removing dependencies from your code.

> “Every DI implementation can be considered IoC, but one should not call it IoC, because implementing Dependency Injection is harder than delegating actions and setting callbacks.”

For example, here is a `TextEditor` class that uses a `SpellChecker` object:

{% highlight java linenos %}
public class TextEditor {
    private SpellChecker sc;
    public TextEditor() {
        this.sc = new SpellChecker();
    }
}
{% endhighlight %}

The previous code creates a dependency between the `TextEditor` and the `SpellChecker`.
In a DI scenario, we would instead use constructor injection.
The code looks like this:

{% highlight java linenos %}
public class TextEditor {
    private SpellChecker sc;
    public TextEditor(SpellChecker sc) {
      // Verify the dependency before allowing construction.
      if (sc == null) {
        throw new InvalidParameterException("Spell checker must not be null.");
      }
        this.sc = sc;
    }
}
{% endhighlight %}

In the first code example, we are instantiating `SpellChecker` in the constructor, which means the `TextEditor` class directly depends on the `SpellChecker` class.
In the second code example, we create an abstraction by having the `IocSpellChecker` dependency class in `TextEditor`'s constructor signature.
The `TextEditor` doesn't know which `SpellChecker` object it should use. It just depends on the `SpellChecker` dependency.
This way, we do not initialize the dependency in the class.
This allows us to create the dependency and then pass it to the `TextEditor` class.
For example, we can pass a `SpanishSpellSpellChecker` object instead as such:

{% highlight java linenos %}
SpellChecker esc = new SpanishSpellChecker(); // dependency
TextEditor te = new TextEditor(esc); // DI
{% endhighlight %}

The programmer creating the `TextEditor` class now has control over which `SpellChecker` implementation to use.
This is possible because we are **injecting the dependency** into the `TextEditor` signature at runtime.

# Dependency Injection Containers (DIC)

Dependency Injection Containers (DIC) provide the ability to inject dependencies into classes at runtime.
[Google Guice](https://github.com/google/guice) is a popular DIC.
In this case, we annotate the constructor with `@Inject` and then we pass the dependency to the constructor.
Below is an example:

{% highlight java linenos %}
import javax.inject.Inject;
public class TextEditor {
    private SpellChecker sc;
    @Inject
    public TextEditor(SpellChecker sc) {
        this.sc = sc;
    }
}
{% endhighlight %}

Then, we need to configure the container[^1] somewhere to inject the dependency at runtime when the application is started:

{% highlight java linenos %}
Injector inj = Guice.createInjector(
  new AbstractModule() {
    @Override
    public void configure() {
      this.bind(SpellChecker.class).toInstance(
        new SpanishSpellChecker()
      );
    }
  }
);
{% endhighlight %}

As you can see, we do not need to use the `new` operator to instantiate `TextEditor` like we did before.
Instead, we should use the injector we just created.
Here is an example of the application:

{% highlight java linenos %}
public class App {
  public static void main(String... args) {
    Injection inj = // as we just did in the previous snippet
    TextEditor te = injector.getInstance(TextEditor.class);
    System.out.println("The text is: " + te.getText());
  }
}
{% endhighlight %}

Google Guice automatically finds out that to instantiate a `TextEditor` it has to provide an argument for its constructor.
For this, it uses an instance of class `SpanishSpellChecker`, which we instantiated in the injector.
The goal of Guice is alleviating the need for factories and the use of `new` in your Java code.

# DIC in Action: The Spring Framework

[Spring](https://spring.io) is currently the most popular Java web framework.
It heavily relies on the DI  pattern to wire up objects.
The main advantage of using Spring is separating the object initialization and data wiring from the application business logic.
In other words, Spring  “injects” objects into other objects or “dependencies.”
This allows for loose coupling of components and moves the responsibility of managing components onto the container.

> Those who came from languages such as C and C++ had to deal with the RAII pattern (RAII stands for Resource Acquisition Is Initialization).
It's the idea that when you get a resource, you initialize it.
When you want to use it, you initialize it in place, right?
And this is good because you want to keep the life of the object, the memory assigned to an object, as small as possible.
So, if it's in scope, and you create it, then you can remember to un-allocate it to collect the memory assigned to it.
This is useful in a language like C++, where you have to do memory management manually.
But it means that you end up with lots of object creation code and lots of initialization routines right next to the place where you're using it.

In a server-side application, objects are typically created at once.
These objects live for as long as the application is running.
Spring allows avoiding the work of setting up all that initialization logic.
Moreover, certain configurations might change based on the environment (e.g., development vs. production environments).
For example, when testing code, you might have mock objects that don't actually represent pointers to real data sources or web services.
Thus, the object initialization might be different in some way compared to, for example, the development environment.
Spring allows to swap out how these different components are initialized.

These functionalities are provided in Spring through DI.
We can have all the initialization logic in a single place.[^2]
The idea is that you write your code in such a way that you depend on types, but you don't know (or care) how they are initialized.
Developers write business logic without bothering about the initialization of the types they use.
That wiring is done for you automatically.

Suppose you want to create a REST API that returns a list of customers from a database.
Each customer has an `id` and a `name`.
The Java Bean looks as follows:

{% highlight java linenos %}
record Customer(Integer id, String name) {}
{% endhighlight %}

We can use Spring out-of-the-box DI support via annotations.
To do so, we write a `CustomerRestController` class annotated with `@Controller` that has a `CustomerService` dependency.
The method `getCustomers`, implemented in the `CustomerService` class,  returns the list of customers:

{% highlight java linenos %}
@Controller
@ResponseBody
class CustomerRestController {
  private final CustomerService cs;
  CustomerRestController(CustomerService cs) {
    this.cs = cs;
  }
  @GetMapping("/customers")
  Collection<Customer> get() {
    return this.cs.getCustomers();
  }
}
{% endhighlight %}

Now let's create the `CustomerService` class.
We start bar annotating the class with `@Service` and `@Transactional`. This makes every public method transactional.
Moreover, the class can be created with a `JdbcTemplate` object.
The method `getCustomers` executes a SQL query on the database to return the list of customers:

{% highlight java linenos %}
@Service
@Transactional
class CustomerService {
  private final JdbcTemplate jdbct;
  public CustomerService(JdbcTemplate jdbct) {
    this.jdbct = jdbct;
  }
  Collection<Customer> getCustomers() {
    return this.jdbct.query("select * from customers",
        (rs, rowNum) -> new Customer(rs.getInt("id"), rs.getString("name")));
  }
}
{% endhighlight %}

Now, we can use the `CustomerRestController` class to test our application.
The `@SpringBootApplication` annotation tells Spring to create a Spring Boot application:

{% highlight java linenos %}
@SpringBootApplication
public class DemoApplication {
  public static void main(String[] args) throws SQLException {
    SpringApplication.run(DemoApplication.class, args);
  }
}
{% endhighlight %}

# Conclusions

The IoC principle and the DI pattern are the backbones of modern enterprise Java frameworks.
They separate the object creation and data wiring from the business logic.
This prevents developers from writing repetitive code initialization routines while configuring the application at runtime.

The Spring framework illustrates the usefulness of DI in Java.
Spring uses DI to initialize web servers, Java beans, and service objects and wire them together via configuration files (e.g., `.properties` files).
This makes it easier for developers to kickstart a project and swap the scope and functionality of different components at runtime.

# References

- [Inversion of Control Containers and the Dependency Injection Pattern](https://martinfowler.com/articles/injection)
- [How Does Inversion of Control Really Work?](https://www.yegor256.com/2017/05/10/inversion-of-control)
- [Intro to Inversion of Control and Dependency Injection with Spring](https://www.baeldung.com/inversion-control-and-dependency-injection-in-spring)

# Footnotes

[^1]: Some frameworks even allow us to configure the injector in an XML file.

[^2]: Object creation is expensive, so we don't want to have to instantiate objects each time we use them because that would make our code more convoluted.
