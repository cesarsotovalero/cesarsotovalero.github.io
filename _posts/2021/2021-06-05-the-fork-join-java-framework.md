---
layout: post
title:  The Fork/Join Java framework
subtitle: Boosting performance through parallelization 
tags: java
description: |
  The Fork/Join framework in Java simplifies parallel programming by allowing developers to leverage multiple processor cores without manually managing threads. This post introduces the key concepts of this framework, including task splitting (fork) and result combining (join). I also provide practical examples using RecursiveAction and RecursiveTask for parallelizing tasks. By utilizing this framework, developers can boost application performance and streamline the implementation of parallel algorithms.
keywords: recursion, Java, parallel, fork, join
image: ../img/posts/2021/night_tree_cover.jpg
share-img: ../img/posts/2021/night_tree_cover.jpg
toc: true
show-avatar: false
author: cesarsotovalero
date: 2021/6/5
published: true
---

The [Fork/Join](https://docs.oracle.com/javase/tutorial/essential/concurrency/forkjoin.html) framework makes it easy for Java developers to take advantage of the parallel execution supported by multicore processors. This API was added to the `java.util.concurrent` package since JDK 7, and it has been improved in subsequent versions of the JDK. It allows the developer to forget about the heavy-duty tasks associated with the manual handling of threads. This way, threads are created and managed automatically while taking advantage of the computational power or multiple processors to boost performance. This post introduces the key aspects of this framework from a practical perspective.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2021/night_tree.jpg alt: "A decorated tree illuminating the night in Stockholm (not a tree of threads)"%}
  <figcaption class="stroke">
    &#169; A decorated tree illuminating the night in Stockholm (isn't a tree of threads)
  </figcaption>
</figure>

# Concurrency vs. Parallelism

First, let's clarify the difference between concurrent and parallel executions in the context of a Java application. 

- **Concurrent execution:** All the threads run on the same CPU. This means that the application does not make progress on more than one task at the same time, i.e., the tasks are executed in interleave fashion, sharing CPU processing time during execution.
- **Parallel execution:** Each thread run in a separate CPU core. Therefore, tasks make progress independently. This allows the execution to make progress on more than one task simultaneously.

To achieve parallelism, the Java application must have more than one thread running, and each thread must run on separate CPU, CPU cores, GPUs, or similar.

# The Fork/Join Framework

The Fork/Join framework provides APIs that facilitate Java developers to solve a parallelizable task in a recursive manner efficiently.
This method is actually a parallel version of the "divide and conquer" algorithm. 
With this approach, the problem is split into smaller independent parts, which in turn, the small part is split further until each part can be solved directly (this is called **fork**). 
Then, all parts are executed and solved in parallel. 
Once completed, all the results are **joined** together to produce the final result.
The following pseudocode describes the process:

{% highlight text linenos %}
if (my portion of the work is small enough)
  solve the problem directly (sequential algorithm)
else
  split the problem into independent parts
  fork new sub-tasks to solve each part
  join all sub-tasks
  compose the result from sub-results
{% endhighlight %}

You need to know about four classes to use the framework:

- `ForkJoinPool`: An executor dedicated to run instances implementing `ForkJoinTask<V>`. Implements the _Work Stealing Algorithm_ to balance the load among threads: if a worker thread runs out of things to do, it can steal tasks from other threads that are still busy.
- `ForkJoinTask<V>`: An abstract class that defines a task that runs within a `ForkJoinPool`.
- `RecursiveAction`:  A `ForkJoinTask` subclass for tasks that don’t return values.
- `RecursiveTask<V>`: A `ForkJoinTask` subclass for tasks that return values.

In practice, all you need to do is create a subclass of `RecursiveAction` or `RecursiveTask<V>`, and override the abstract method `compute()`. Then,  submit the task to be executed by the `ForkJoinPool`, which handles everything from threads management to utilization of multicore processor. Note that `RecursiveAction` do not return anything, while the `RecursiveTask<V>` can return an object of a specified type.

If you are curious, here is the class diagram for this architecture.
As you observe, the `ForkJoinPool` class is an implementation of the `AbstractExecutorService` class which implements `ExecutorService`, while the `ForkJoinTask<V>` abstract class implements the `Future<V>` interface.

{% responsive_image width: "100%" border: "1px solid #808080" path: img/posts/2021/fork_join_classes.png alt: "Fork/Join Class Diagram"%}

# Examples

Let's see two examples that illustrate how you can use the Fork/Join framework.  

## RecursiveAction

**Task:** You want to replace the value of all the entries of a particular element in an array of integers.
There may be more than one entry of the same element in the array.

This task is suitable for implementing in parallel because the array can be split to replace the element in each part independently. 
The following `ForkJoinReplaceAction` class extends the `RecursiveAction` class to solve this problem. 
The `void` method `compute()` in charge of the performing the tasks in parallel.
It calls the `process()` method that replaces the element in the array when the split part is smaller than the specified `THRESHOLD`. 
Otherwise, it calls the static `invokeAll` method in the `ForkJoinTask` class with a list of instances of the `ForkJoinReplaceAction` in which the array is divided in half.

{% highlight java linenos %}
public class ForkJoinReplaceAction extends RecursiveAction {
  private final int element;
  private final int[] array;
  private final int THRESHOLD;
  private final int ini;
  private final int end;

  // AllArgs Constructor

  @Override
  protected void compute() {
    if (end - ini <= THRESHOLD) {
      process(element, array, ini, end);
    } else {
      ForkJoinTask.invokeAll(createSubTasks());
    }
  }

  private List<ForkJoinReplaceAction> createSubTasks() {
    List<ForkJoinReplaceAction> taskList = new ArrayList<>();
    taskList.add(
        new ForkJoinReplaceAction(element, array, THRESHOLD, ini, (ini + end) / 2)
    );
    taskList.add(
        new ForkJoinReplaceAction(element, array, THRESHOLD, (ini + end) / 2, end)
    );
    return taskList;
  }
  
  private void process(int element, int[] array, int ini, int end) {
    for (int i = ini; i < end; i++) {
      if (array[i] == element) {
        array[i] = -1;
      }
    }
  }
}
{% endhighlight %}

To execute the `ForkJoinReplaceAction`, create an instance of `ForkJoinPool` and use the `invoke()` method. 
By using its default constructor, you configure the pool to use all the processors available to the JVM (i.e., the value returned by `Runtime.availableProcessors`).
The following code prints `1 2 -1 -1 -1 4 5 6 6 7`, because each entry of the value `3` is replaced by `-1` in the array:

{% highlight java linenos %}
ForkJoinPool pool = new ForkJoinPool();
int[] arr = new int[]{1, 2, 3, 3, 3, 4, 5, 6, 6, 7};
pool.invoke(new ForkJoinReplaceAction(3, arr, 2, 0, arr.length));
Arrays.stream(arr).forEach(value -> System.out.print(value + " "));
{% endhighlight %}


## RecursiveTask<V>

**Task:** You want to count all the entries of a particular element in an array of integers.

As in the previous examples, this task is suitable for implementing in parallel.
The class `ForkJoinCountTask` extends the `RecursiveTask<Integer>` class to solve this problem.
The `compute()` return the solution.
If the split part is smaller than the specified `THRESHOLD`, it calls the `process()` method that counts the number of times the element is present in the smaller array (the array is divided in a half each time).
Otherwise, it calls the static `invokeAll` method in the `ForkJoinTask` class with a list of instances of the `ForkJoinCountTask`, obtained from the `createSubTasks()` method. 
Note that the result joined together and summed using the Java Stream API. 

{% highlight java linenos %}
public class ForkJoinCountTask extends RecursiveTask<Integer> {
  private final int element;
  private final int[] array;
  private final int THRESHOLD;
  private final int ini;
  private final int end;

  // AllArgs Constructor
  
  @Override
  protected Integer compute() {
    if (end - ini <= THRESHOLD) {
      return process(element, array, ini, end);
    } else {
    return ForkJoinTask.invokeAll(createSubTasks())
      .stream()
      .mapToInt(ForkJoinTask::join)
      .sum();
    }
  }
  
  private List<ForkJoinCountTask> createSubTasks() {
    List<ForkJoinCountTask> taskList = new ArrayList<>();
    taskList.add(new ForkJoinCountTask(element, array, THRESHOLD, ini, (ini + end) / 2));
    taskList.add(new ForkJoinCountTask(element, array, THRESHOLD, (ini + end) / 2, end));
    return taskList;
  }
  
  private Integer process(int element, int[] array, int ini, int end) {
    int count = 0;
    for (int i = ini; i < end; i++) {
      if (array[i] == element) {
        count++;
      }
    }
    return count;
  }
}
{% endhighlight %}

As in the previous example, to execute the `ForkJoinCountTask`, create an instance of `ForkJoinPool` and use the `invoke()` method. The following code prints `3`, because there are three entries of this element in the array:

{% highlight java linenos %}
var pool = new ForkJoinPool();
int[] arr = new int[]{1, 2, 3, 3, 3, 4, 5, 6, 6, 7};
System.out.println(pool.invoke(new ForkJoinCountTask(3, arr, 2, 0, arr.length)));
{% endhighlight %}

# Conclusion

The Fork/Join framework simplifies parallel programming for Java developers. The `ForkJoinPool` allows executing `ForkJoinTask`s threads running on a separate processing core, where threads that finish early can steal tasks from other threads that are still busy. It’s worth mentioning that debugging parallel implementations can be tricky. You never take for granted that a computation using the Fork/Join framework is faster than a sequential variant. For this reason, you should always measure and compare the performance empirically. Furthermore, it would be best to experimentally choose the threshold used to split the task into smaller subtasks.

# References

- [ForkJoinPool](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ForkJoinPool.html)
- [ForkJoinTask](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ForkJoinTask.html)
- [RecursiveAction](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/RecursiveAction.html)
- [RecursiveTask](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/RecursiveTask.html)



















