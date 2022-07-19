---
layout: post
title: Inversion of Control and Dependency Injection in Java
subtitle: The holy grails of modern enterprise Java frameworks
tags: programming
description: This blog post explains Inversion of Control and Dependency Injection in Java. These concepts are the backbone of modern enterprise Java frameworks.
keywords:
  - Spring Java Framework,
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

Inversion of Control (IoC) is a programming principle based on delegating the program's control to a framework in initializes some specific task for us.
Dependency injection (DI) is a popular design pattern to apply the IoC principle.
This [design pattern](https://martinfowler.com/articles/injection.html) is widely used in enterprise Java applications.
This way, application's components are initialized and wired from different application layers automatically.
The first time I saw this pattern was in the Spring Framework.
It works like ~~obscure~~ magic to me.
This blog post explains how IoC and DI work.
These concepts are the backbone of modern enterprise Java frameworks.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/universitetet_small.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; Creation is all about assembling and initializing existing knowledge. Photo taken at <a href="https://goo.gl/maps/jUmq4jTTe2P4go4g6">Universitetet</a>.
  </figcaption>
</figure>

# Inversion of Control (IoC)

The IoC pattern is about delegating actions instead of acting ourselves directly.
In other words, the idea is to invert and/or redirect the control to an external handler/controller.
This allows to avoid dealing with the data directly, and instead we deal with the object composition.

The following analogy explains the concept:

> “Let's say that we have a meeting in a hotel.
We have invited many people, so we have left out many jugs of water and many plastic cups.
When somebody wants to drink, he/she fills a cup, drinks the water and throws the cup on the floor.
After an hour or so we have a floor covered with plastic cups and water.
Let's try that after inverting the control:
Imagine the same meeting in the same place, but instead of plastic cups we now have a waiter with just one glass cup (Singleton)
When somebody wants to drink, the waiter gets one for them.
They drink it and return it to the waiter.
Leaving aside the question of the hygiene, the use of a waiter (process control) is much more effective and economic.
And this is exactly what Spring (another IoC container, for example: Guice) does.
Instead of letting the application create what it needs using the new keyword (i.e., taking a plastic cup), Spring IoC offers the application the same cup/instance (singleton) of the needed object (i.e., glass of water).” -- <cite>Brilliant answer from [Stack Overflow](https://stackoverflow.com/questions/3058/what-is-inversion-of-control?page=1&tab=modifieddesc#tab-top)</cite>

For example, image that an application has a text-editor component for which we want to provide spell checking. 
The following code shows the imperative way of doing it:

{% highlight java linenos %}
SpellChecker sc = new SpellChecker();
TextEditor textEditor = new TextEditor();
sc.checkSpelling(textEditor.getText());
{% endhighlight %}

In the previos code, we retrieve the text from `TextEditor` and then we check the spelling via `SpellChecker` object:

In contrast, the other way is to use the IoC pattern.
In this case, we initialize the `TextEditor` object with the desired `SpellChecker`.
Thus, the `checkSpelling` task is delegated to the `TextEditor` object, which uses the `SpellChecker` object within the `getText()` method.

{% highlight java linenos %}
SpellChecker sc = new SpellChecker();
TextEditor textEditor = new TextEditor(sc);
textEditor.getText();
{% endhighlight %}

A more elegant way would be to use [object composition](https://en.wikipedia.org/wiki/Object_composition) to retrieve the text:

{% highlight java linenos %}
new SpellCheckedText(
  new TextEditor(
    new SpellChecker()
  ) 
);
{% endhighlight %}

# Dependency Injection (DI)

The Dependency Injection (DI) pattern is a more specific version of IoC pattern.
It is all about removing dependencies from your code.

> “Every DI implementation can be considered IoC, but one should not call it IoC, because implementing Dependency Injection is harder than delegating actions and setting callbacks.”
 
For example, here is a `TextEditor` class that uses a `SpellChecker` object:

{% highlight java linenos %}
public class TextEditor {
    private SpellChecker checker;
    public TextEditor() {
        this.checker = new SpellChecker();
    }
}
{% endhighlight %}

What we've done here creates a dependency between the `TextEditor` and the `SpellChecker`.
In an DI scenario we would instead use constructor injection do something like this:

{% highlight java linenos %}
public class TextEditor {
    private SpellChecker checker;
    public TextEditor(SpellChecker checker) {
      // Verify the dependency before allowing construction.
      if (checker == null) {
        throw new InvalidParameterException("Spell checker must not be null.");
      }
        this.checker = checker;
    }
}
{% endhighlight %}

In the first code example we are instantiating `SpellChecker` in the constructor, which means the `TextEditor` class directly depends on the `SpellChecker` class.
In the second code example we are creating an abstraction by having the `IocSpellChecker` dependency class in `TextEditor`'s constructor signature.
The `TextEditor` doesn't know which `SpellChecker` object it should use, it just depends on the `SpellChecker` dependency.
This way, we do not initialize the dependency in the class.
This allows us to create the dependency then pass it to the `TextEditor` class.
For example, we can pass an `SpanishSpellSpellChecker` object instead as such:

{% highlight java linenos %}
SpellChecker esc = new SpanishSpellSpellChecker(); // dependency
TextEditor textEditor = new TextEditor(esc); // DI
{% endhighlight %}

Now the programmer creating the `TextEditor` class now has control over which `SpellChecker` implementation to use.
This is possible because we are **injecting the dependency** into the `TextEditor` signature at runtime.

# Dependency Injection Containers (DIC)

Dependency Injection Containers (DIC) are containers that provide the ability to inject dependencies into classes at runtime.
[Google Guice](https://github.com/google/guice) is a popular DI container.
We annotate the constructor with `@Inject` and then we pass the dependency to the constructor:

{% highlight java linenos %}
import javax.inject.Inject;
public class TextEditor {
    private SpellChecker checker;
    @Inject
    public TextEditor(SpellChecker checker) {
        this.checker = checker;
    }
}
{% endhighlight %}

Then, we need to configure the container[^1] to inject the dependency at runtime when the application is started:

{% highlight java linenos %}
Injector injector = Guice.createInjector(
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

Thus, we are not allowed to instantiate `TextEditor` through the `new` operator, like we did before. 
Instead, we should use the injector we just created:

{% highlight java linenos %}
public class App {
  public static void main(String... args) {
    Injection injector = // as we just did in the previous snippet
    TextEditor textEditor = injector.getInstance(TextEditor.class);
    System.out.println("The text is: " + textEditor.getText());
  }
}
{% endhighlight %}

Guice automatically finds out that in order to instantiate a `TextEditor` it has to provide an argument for its constructor. 
It will use an instance of class `SpanishSpellChecker`, which we instantiated in the injector.
This alleviates the need for factories and the use of `new` in your Java code.

# DI in Action: The Spring Framework

[Spring](https://spring.io/) is the most popular Java web framework.
It heavily relies on DI to wire up objects, separating the objects' initialization and wiring from the application business logic.
In other words, the Spring container “injects” objects into other objects or “dependencies.”
This allows for loose coupling of components and moves the responsibility of managing components onto the container.

> Those who came from languages such as C and C++ had to deal with the RAII pattern (RAII stands for Resource Acquisition Is Initialization).
It's the idea that when you get a resource, you initialize it.
When you want to use it, you initialize it in place, right?
And this is good because you want to keep the life of the object, the memory assigned to an object, as small as possible.
So, if it's in scope, and you create it, then you can remember to un-allocate it to collect the memory assigned to it.
This is useful in a language like C++, where you have to do memory management manually.
But it means that you end up with lots of object creation code and lots of initialization routines right next to the place where you're using it.

In a server side application there are typically objects that need ob e created at once.
These objects live for as long as the application is running.
Spring allows to avoid the work of setting up all that initialization logic. 
Moreover, certain configurations might change based on the environment (e.g., development vs. production environments). 
For example, when testing code, you might have mock objects that don't actually represent pointers to real data sources or web services.
Thus, the object initialization might be different in some way compared to, for example, in the development environment.
Spring allows to swap out how these different components are initialized.

These functionalities are provided in Spring through DI.
We can have all the initialization logic in a single place.[^2]
The idea is that you write your code in such a way that you depend on types, but you don't know (or care) how they are initialized.
Developers write business logic without bothering about the initialization of the types they use. 
That wiring is done for you automatically. 

Suppose you want to create a REST API that returns a list of customers.
Each customer has an `id` and a `name`:

{% highlight java linenos %}
record Customer(Integer id, String name) {}
{% endhighlight %}

We can use Springs out of the box support using annotations.
You need to write a `CustomerRestController` class annotated with `@Controller` that has a `CustomerService` dependency.
The method `getCustomers`, implemented in the `CustomerService` class,  returns the list of customers:

{% highlight java linenos %}
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
{% endhighlight %}


Now let's create the `CustomerService` class.
We start bar annotating the class with `@Service` and `@Transactional`, and that makes every method in here, that's public, transactional.
This class can be created with a `JdbcTemplate` object.
The method `getCustomers` executes a SQL query on the database to return the list of customers:

{% highlight java linenos %}
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

IoC and DI are the backbones of modern enterprise Java frameworks.
They separate the object creation and wiring from the business logic.
This prevents developers from writing many repetitive code initialization routines while making the application configurable at runtime.

The Spring framework illustrates the usefulness of DI.
Spring uses DI to initialize web servers, Java beans, and service objects and wire them together.
This makes it easier for developers to kickstart a project and swap the different components at runtime.

# References

- [Inversion of Control Containers and the Dependency Injection Pattern](https://martinfowler.com/articles/injection.html)
- [How Does Inversion of Control Really Work?](https://www.yegor256.com/2017/05/10/inversion-of-control.html)
- [Intro to Inversion of Control and Dependency Injection with Spring](https://www.baeldung.com/inversion-control-and-dependency-injection-in-spring)

# Footnotes

[^1]: Some frameworks even allow us to configure the injector in an XML file.

[^2]: Object creation is expensive, so we don't want to have to instantiate objects each time we use them because that would make our code more convoluted.