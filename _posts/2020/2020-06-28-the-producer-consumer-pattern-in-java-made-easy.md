---
layout: post
title:  The Producer-Consumer Pattern in Java Made Easy
subtitle: An example using the BlockingQueue Java interface
tags: programming
keywords: Java, producer/consumer, design patterns
description: The BlockingQueue data structure can be used to implement Producer-Consumer pattern. In this guide I explain how.
published: true
image: ../img/posts/2020/java_design_patterns_cover.jpg
share-img: ../img/posts/2020/java_design_patterns_cover.jpg
show-avatar: false
toc: true
author: cesarsotovalero
date: 2020/6/28
---

I see the usage of a recurring handy pattern for doing data collection and analysis in software engineering: [the producer-consumer pattern](https://en.wikipedia.org/wiki/Producer%E2%80%93consumer_problem). This pattern simplifies the data acquisition (handled by the Producer), and the data post-processing (handled by the Consumer). The Producer collects the data items one at the time and places the items into a queue for processing later. The Consumer then takes one item at the time from the queue, process it, and saves the data for further analysis. This decoupled design makes easy to parallelize the whole process as desired. For example, depending on the processing time and resources, one can have several *independent* Consumers running in parallel.

<aside class="quote">
    <em>A BlockingQueue is a queue that additionally supports operations that wait for the queue to become non-empty when retrieving an element, and wait for space to become available in the queue when storing an element.</em>
</aside>

We have used this the Producer-Consumer pattern successfully to collect million of artifacts from Maven Central and storing them in a graph database. We have published our research tool, [maven-miner](https://github.com/diverse-project/maven-miner), and the collected data in a [research paper](https://ieeexplore.ieee.org/document/8816814). For this paper, we used [RabbitMQ](https://www.rabbitmq.com/) for message querying. In this post, I'll explain a more straightforward way to implement this pattern in Java using the [`BlockingQueue`](https://docs.oracle.com/javase/8/docs/api/?java/util/concurrent/BlockingQueue.html) data structure. The example is inspired by the excellent *Advanced Java Development* course by Ken Kousen. 
 
# The Item 

Let us start with POJO called `Item`, which represent the object that we want to collect and process. Items are going to be produced and consumed by the `Producer` and `Consumer` classes, respectively.

{% highlight java linenos %}
public final class Item {
    private final int id;

    public Item(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
}
{% endhighlight %}

# The Producer

The `Producer` class will be executed in its own thread by implementing `Runnable`. This class uses a `BlockingQueue` to hold the `Item` objects. The `run` method will instantiate 100 items and put them into the queue. This phase can involve complex queries to databases or REST APIs, depending on the application. At the end of the items' production, the Producer will put an item with id equals to -1, to indicate the last item was added to the queue.

{% highlight java linenos %}
public class Producer implements Runnable {
    private int id;
    private BlockingQueue<Item> queue;
    Random random = new Random();

    public Producer(int id, BlockingQueue<Item> queue) {
        this.id = id;
        this.queue = queue;
    }

    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            Item item = new Item(i);
            try {
                System.out.printf("Producer %d produced %d%n",
                 id, msg.getId());
                queue.put(item);
                Thread.sleep(random.nextInt(100));
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }

        try {
            queue.put(new Item(-1));
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
{% endhighlight %}

# The Consumer

The `Consumer` class also implements `Runnable`. The `run` method gets one item at the time by invoking the `take` function in the `BlockingQueue` until an `Item` with `id = -1` is retrieved.

{% highlight java linenos %}
public class Consumer implements Runnable {
    private int id;
    private BlockingQueue<Item> queue;
    Random random = new Random();

    public Consumer(int id, BlockingQueue<Item> queue) {
        this.id = id;
        this.queue = queue;
    }

    @Override
    public void run() {
        Item item;
        try {
            while ((msg = queue.take()).getId() != -1) {
                System.out.printf("Consumer %d consumed %d%n",
                 id, msg.getId());

                Thread.sleep(random.nextInt(100));
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
{% endhighlight %}

# The Client

The `Client` class instantiates two `Producer`, two `Consumer`, and a `LinkedBlockingQueue` object. It makes a` FixedThreadPool`, which uses the `availableProcessors()` utility to use exactly the available processors in the system. Finally, the producers and consumers are executed. 


{% highlight java linenos %}
public class ProducerConsumerDemo {
    public static void main(String[] args) {
        BlockingQueue<Item> queue = new LinkedBlockingQueue<>();
        Producer p1 = new Producer(1, queue);
        Producer p2 = new Producer(2, queue);
        Consumer c1 = new Consumer(1, queue);
        Consumer c2 = new Consumer(2, queue);

        ExecutorService service = Executors.newFixedThreadPool(
                Runtime.getRuntime().availableProcessors());
        service.execute(p1);
        service.execute(p2);
        service.execute(c1);
        service.execute(c2);
        service.shutdown();
    }
}
{% endhighlight %}

Here's an except of the output: 

{% highlight text %}
Producer 2 produced 0
Producer 1 produced 0
Consumer 1 consumed 0
Consumer 2 consumed 0
Producer 1 produced 1
Producer 1 produced 2
Consumer 1 consumed 1
Consumer 2 consumed 2
Producer 2 produced 1
Consumer 2 consumed 1
Producer 1 produced 3
Consumer 2 consumed 3
Producer 1 produced 4
Consumer 1 consumed 4
Producer 2 produced 2
Consumer 2 consumed 2
...
{% endhighlight %}

# Summary

The Producer-Consumer pattern is a recurrent design strategy for collecting and processing data from multiple sources. The `BlockingQueue` Java interface allows us to implement this pattern and solve this problem without the need for manually handling multi-process synchronization.