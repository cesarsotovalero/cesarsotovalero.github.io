---
layout: post
title: The Not-So-Strange Case of Cargo Cult in Computer Science Research
subtitle: Are we mimicking scientific progress without true innovation?
tags: science
description: |
  Arguably, computers and communications have changed the world more than any other science or technology. Yet there are a lot of failures, some prominent, many minor, and a widening gap between aspirations and reality. Borrowing Richard Feynman's criticism of cargo cult science, this article discusses the problem of cargo cult in computer science. To paraphrase Feynman: everywhere I see computer scientists that look like they are working on the right thing, but the thing actually doesn't work. I hope this article could make you reflect the problem of having poor science in computer science research, and what we can positively do about it.
keywords:
  - computer science research
  - science reproducibility crisis
  - academic crisis
  - fake science
  - lack of research trust
image: ../img/posts/2024/2024-07-13/vortice-art_cover.webp
share-img: ../img/posts/2024/2024-07-13/vortice-art_cover.webp
show-avatar: false
toc: true
mathjax: false
date: 2024/07/13
author: cesarsotovalero
published: true
---

Everywhere, I see computer scientists that look like they are working on the right thing. 
They spent a long time doing the thing, writing code to run it (in the best cases), and collecting results.
Then, they _publish_ the thing.
However, many times "the thing" is either worthless or just doesn't work as claimed.
In fact, according to [a study made in 2014](https://www.semanticscholar.org/paper/Measuring-Reproducibility-in-Computer-Systems-Collberg/075d12c8c9e295cc3227d12ecff7f5c16d8a8613): more than 75% of the results published in _prestigious_ computer science journals are not reproducible at all!
This is a huge problem for science.
The fact that a lot of human and non-human time (and resources) are spent on computer science research that doesn't produce any value is something to look at with microscopic lens.
Unfortunately, this problem is nothing new.
Back in 1974, the American physicist [Richard Feynman](https://en.wikipedia.org/wiki/Richard_Feynman) coined the term "cargo cult science" referring to this exact same phenomenon.
Now, I want to revisit his ideas, 50 years later, from the lens of someone who has gone through the hustle of producing science "the modern way."
In this article, I'll cover the many traps leading to cargo cult science, and provide good techniques to stay away from it. 
Let's dive in!

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/2024/2024-07-13/vortice-art.webp alt: "Picture of a dark vortices ring" %}
  <figcaption class="stroke"> 
   &#169; Cargo cult rituals trap scientists in an endless vicious cycle of unproductivity. Picture taken at the <a href="https://en.wikipedia.org/wiki/Odenplan_station">metro station of Odenplan</a>, in Stockholm city.
  </figcaption>
</figure>

# The Origins of Cargo Cult Science

{% badge /img/badges/cargo-cult-science.png 140 http://calteches.library.caltech.edu/51/2/CargoCult.pdf %}
 
The term "cargo cult science" was coined by the American physicist [Richard Feynman](https://en.wikipedia.org/wiki/Richard_Feynman) in 1974 in his commencement speech at Caltech university.
It's one of the greatest speeches about science of all time.

Cargo cult science refers to practices that seem scientific but don't truly follow the scientific method.[^2]
Feynman highlighted this concept by comparing it to the cargo cult rituals of Melanesian and Micronesian societies.
There, the natives imitated the behaviors of World War II soldiers, hoping to bring back the material wealth they had seen during the war. 

> "In the South Seas, there is a cargo cult of people. During the war, they saw airplanes land with lots of good materials, and they want the same thing to happen now. So they’ve arranged to make things like runways, to put fires along the sides of the runways, to make a wooden hut for a man to sit in, with two wooden pieces on his head like headphones and bars of bamboo sticking out like antennas (he's the controller) and they wait for the airplanes to land. They’re doing everything right. The form is perfect. It looks exactly the way it looked before. But it doesn't work. No airplanes land."
> —  <cite>Richard Feynman</cite>

This metaphor shows the need for genuine understanding and accountability in science.
It's a comical example of how far things can go wrong when we try to follow procedures without critical thinking.
In today's world, this message is particularly relevant as the fear of being wrong and the spread of non-so-ethical practices continues to grow.

The temptation to follow the easy path of doing poor science never stops knocking on researchers' doors.

Feynman states that researchers should not ignore the principle of scientific integrity to avoid falling into the abyss of cargo cult science.
He mentions that it is important to make scientific conclusions while providing all the information on the research, including possible faults and unexpected results.
According to Feynman, scientific integrity is a principle of scientific thought that corresponds to a kind of utter honesty.

> "I think the educational and psychological studies I mentioned are examples of what I would like to call Cargo Cult Science. […] So I call these things Cargo Cult Science, because they follow all the apparent precepts and forms of scientific investigation, but they’re missing something essential, because the planes don’t land."
> —  <cite>Richard Feynman</cite>

Scientists should put extra effort to not miss any important things while concluding their findings.
This allows not fooling oneself and provide complete information to other scientists. 

It is important to inform about all the points and results, not just the information that leads to judgment in one particular direction or another.
The focus on avoiding the results which cannot support the experiment is typical for cargo cult scientists who do not report on things that can contribute to eliminating the received results.

> "You must not fool yourself (and you are the easiest person to fool). So you have to be very careful about that. After you’ve not fooled yourself, it’s easy not to fool other scientists. You just have to be honest in a conventional way after that."
> —  <cite>Richard Feynman</cite>

In other words, if there is no a sound "Threats to Validity" section in a paper, it could indicate a case of cargo cult science.

## Poor Science

{% badge /img/badges/you-are-joking-mr-feynman.png 140 https://en.wikipedia.org/wiki/Surely_You%27re_Joking,_Mr._Feynman! %}

Feynman determines a range of characteristics that can be used to define poor science, pseudoscience, or cargo cult science. 

First, he mentions the existence of a seemingly scientific way of presenting investigations, which attempts to hide the existence of one essential feature that prevents the idea from working.
The most important characteristic to discuss pseudo-scientific researches is the lack of scientific integrity as a kind of leaning over backward.
To avoid it, it is necessary to discuss the research details and results from all the perspectives, while paying much attention to faults, biases, and wrong assumptions.

**Example:** In 1989, two electrochemists, Martin Fleischmann and Stanley Pons, [announced](https://cen.acs.org/articles/94/i44/Cold-fusion-died-25-years.html) they had achieved "[cold fusion](https://en.wikipedia.org/wiki/Cold_fusion)," a process of nuclear fusion occurring at room temperature. Fusion, typically requiring extremely high temperatures, could potentially provide a virtually limitless source of clean energy. The announcement created a sensation because if true, it would have revolutionized energy production.

Second, it is the ignorance of repeating the experiment by oneself. 
Those researchers who choose to use the results received by the other investigators ignore the opportunity to make their own research more credible while supporting or rejecting the known findings.

**Example:** In the early days of deep learning, many researchers and companies [made bold claims](https://doi-org.focus.lib.kth.se/10.1016/j.caeai.2023.100143) that AI models could "self-teach" or autonomously learn complex tasks without needing extensive human intervention. These claims were often based on specific experiments that showed impressive results, such as a neural network learning to recognize objects in images after being exposed to vast amounts of unlabeled data. They often integrated these models into their projects without independently replicating the original experiments, leading to disappointing results when the models failed to generalize as promised. Over time, it became clear that these AI models were not as autonomous or generalizable as initially claimed. When others attempted to use these "self-taught" models in different domains or with less curated data, the models often failed to perform as expected. It turned out that much of the success in the original experiments was due to the specific data used or additional, often unacknowledged, human intervention during the training process.

Last but not less, Feynman states that pseudoscientists can be very anxious for new results because these results are contradictory in relation to their predictions, and they can destroy the value of the experiments themselves.
It is characteristic for cargo cult scientists to ignore the results which do not support their experiments and focus on those which sound appropriate.

**Example:** In 2011, the OPERA experiment in Italy [reported results](https://en.wikipedia.org/wiki/2011_OPERA_faster-than-light_neutrino_anomaly) suggesting that neutrinos might be traveling faster than the speed of light, which would contradict Einstein's theory of relativity. Some researchers and media outlets were eager to embrace these results because of their sensational nature, which could have upended established physics. However, this eagerness led to a dangerous tendency to overlook potential errors or alternative explanations that might invalidate the findings. There was significant pressure to confirm the extraordinary results, leading to a focus on the data that seemed to support the faster-than-light claim while neglecting inconsistencies or mundane explanations. Further investigation revealed that the results were due to a faulty connection in the GPS system used to measure the neutrinos' travel time. Once corrected, the faster-than-light result disappeared, and the experiment confirmed that neutrinos do not travel faster than light.
 
Sometimes focusing on sensational results, while ignoring contradictory evidence, can lead to the premature and incorrect validation of scientific claims.
In particular, the eagerness to confirm groundbreaking results can sometimes overshadow the need for rigorous scrutiny and can lead to the neglect of critical evidence that contradicts the desired outcomes.

## The Reproducibility Crisis

A defining characteristic of [the scientific method](https://en.wikipedia.org/wiki/Scientific_method), distinguishing it from belief or faith, is the requirement that others must be able to independently replicate the results of an experiment.

<aside class="quote">
    <em>“Other experimenters will repeat your experiment and find out whether you were wrong or right.”</em> 
</aside>

The findings of an experiment can be accepted as valid _only if_ they are supported by the results of other researchers who conduct it independently.
That is why experiments should be repeated in order to state the credibility of the results and the integrity of the overall investigation.
Cargo cult scientists usually ignore repeating experiments arguing lack of time, resources, or just because they don't want to support certain assumptions.

An ethical scientist should feel the need to demonstrate that a valid experiment is reproducible.

Feynman notes that para-psychologists or other cargo cult scientists look for experiments that can be repeated because they need to receive the same effect.
However, these scientists look for _repeated results_, not for the repeatable experiments.
This is because if an experiment is repeatable, its results can be different, and they do not always satisfy the expectations of cargo cult scientists. 
The rejection of the repeatable experiment is considered as characteristic for those scientists who intend to ignore the idea of integrity.
Such behavior cannot be discussed as acceptable in the scientific world.

In computing science, [it's clear](http://reproducibility.cs.arizona.edu/tr.pdf) that we do not take reproducibility seriously enough.

It is mind-blowing that today most papers do not release their experimental data or even the software artifacts presented as part of their contributions.
Open-sourcing tools and datasets should be a prerequisite for publishing any kind of research paper.[^1]
In fact, some researchers will laugh and admit that published results might just be the outcome of a graduate student finally getting their code to run once and getting some data to produce a graph that makes sense.

But don't get me wrong: achieving true reproducibility is a tough problem in computer science research. 

A true obstacle to achieving reproducible results in computer science is the rapid pace at which the field evolves. 
Even finding a computer with similar hardware to the one used just five years ago to generate a result is not easy. 
Running the software with the exact same configurations, memory, operating system, and CPU is even more challenging. 

It's unlikely that conferences will require researchers to submit their hardware along with their software anytime soon.
However, as scientists, we can take reproducibility as one of the key deciding factors when [peer-reviewing research papers](../blog/how-i-peer-review-research-papers.html).
The more we value reproducibility when deciding if accepting or rejecting a paper, the more we will see a change in the way research is conducted.

##  The Academic Trap

The [pressure to publish](../blog/the-last-paper-myth.html), combined with rapid progress of the computer science field, has distorted priorities, leading to publications at any cost.

This has given rise to widespread academic misconduct, including paper mills, where existing research is haphazardly combined to create seemingly new results that might get published somewhere, even if not in top-tier journals.
In fields like medicine, this pressure has become so severe that entire bodies of research have been retracted after being exposed as based on faulty or fraudulent data.

Feynman laments that the kind of integrity he talks about isn't baked into the science education system.
This hardly comes as a surprise, given it's largely a system premised on certitude at all costs.

It's not the admission of ignorance that fuels science:

> This long history of learning how not to fool ourselves (of having utter scientific integrity) is, I’m sorry to say, something that we haven’t specifically included in any particular course that I know of. We just hope you’ve caught on by osmosis.
> —  <cite>Richard Feynman</cite>

In computer science, a field driven by rapid innovation and fierce competition for funding and publication, the temptation to fall into cargo cult behaviors manifests in several ways:

- **Chasing trends over substance**: Often, researchers might feel pressured to work on "hot topics" not because they are convinced of their importance, but because they attract attention, citations, and funding. An example is [the increasing interest](https://rdcu.be/dRprN) in Generative AI research that we are seeing right now.
- **P-hacking and selective reporting**: In the quest for significant results, there’s a risk of manipulating data or selectively reporting results that support the hypothesis, rather than presenting the full picture of the research findings. An example is when ignoring the effect of some variables to get a [sense of causation from what it is mere correlation](https://en.wikipedia.org/wiki/Correlation_does_not_imply_causation).
- **Reinventing the wheel**: Sometimes, due to a lack of thorough literature review or out of a desire to claim novelty, researchers might end up replicating existing studies without adding real value or new insights. This has happened many times, for example, the concept of `MapReduce` is credited to Google, but the concepts behind where published [decades before](https://doi.org/10.1145/129888.129894) by researchers from the fields of parallel databases and functional programming.
- **Over-reliance on tools and frameworks**: It’s not uncommon to see studies where advanced tools or algorithms are used without a proper understanding of their underlying principles or limitations, simply because they are popular or well-regarded. Think about deep learning and the fact that [we don't really know ](https://en.wikipedia.org/wiki/Explainable_artificial_intelligence) how these black-boxed complex neural networks actually operate to deliver their results.

Having navigated t[he rocky terrains](../blog/my-phd-as-a-comic.html) of doing a PhD, I’ve experienced firsthand the challenges that push even the well-intentioned scientist towards these pitfalls. 
The pressure to "publish or perish" and the fierce competition for grants can sometimes blur the lines between rigorous investigation and the rush to produce novel results.

Moreover, the lack of a good work-life balance, the anxiety of job (in)security in academia, and the often solitary nature of deep research can exacerbate these issues. 
These challenges not only affect the mental health and well-being of researchers but can also compromise the integrity of the research itself.

Nevertheless, there are ways to make good research while staying away from cargo cult behaviors. 

## The Seek of Rigor

As a rule of thumb: if the results presented in a paper seem too good to be true, they probably aren't true.

Researchers must be cautious when presenting technical arguments. 
It's surprisingly easy to convince the public that your approach is scientific, even when it isn’t.
Therefore, it is our moral duty to rigorously scrutinize our own arguments before sharing them. 
We should all strive to gather data that challenges our beliefs and respond to it as objectively as possible. 
This includes refraining from censoring or ignoring opposing views, and from penalizing those who disagree with our perspectives.

So, how do we combat these tendencies?

The answer lies in fostering a culture of integrity and transparency in research. 
Here are some key points:

- **Education and awareness**: Early career researchers especially need guidance on the ethical dimensions of scientific research, including the importance of rigorous, unbiased experimental design and the pitfalls of cargo cult science.
- **Encouraging reproducibility**: As I mentioned before, journals and conferences should promote and reward the replication of studies and the sharing of negative results to counteract the bias towards only publishing positive findings. For example, by increasing acceptance rates or creating especial [artifact and data showcase tracks](https://2024.msrconf.org/track/msr-2024-data-and-tool-showcase-track) in conferences (e.g., as in the _International Conference of Mining Software Repositories_).
- **Institutional support**: Universities and funding bodies must recognize the pressures leading to these practices and offer support systems to encourage quality over quantity. For example, having a tenure and promotion criteria [that value the impact of research](../blog/how-phd-profiles-are-evaluated.html) over mere publication metrics.
- **Community and collaboration**: Fostering a more collaborative rather than competitive environment helps researchers share methods, findings, and validations more openly, reducing the isolation that allure taking unethical shortcuts.

So, it ultimately comes down to establishing mechanisms or systems that promote rigorous science by adhering to well-established principles, such as careful experimentation, critical analysis, reproducibility, and transparency.

## The Finding of Hope

<aside class="quote">
    <em>“A real scientist, not a cargo cult scientist, should follow the principle of integrity.”</em> 
</aside>

As from the Feynman speech, the three takeaways are straightforward:

1. Get your fundamentals very clear.
2. Don't aim for fast results with superficial learning. 
3. Have skin in the game: hypothesize, experiment, explore, and remember to follow the scientific method.

I'll end this article quoting one the Feynman's last takeaways:

> "I have just one wish for you: the good luck to be somewhere where you are free to maintain the kind of integrity I have described, and where you do not feel forced by a need to maintain your position in the organization, or financial support, or so on, to lose your integrity. May you have that freedom."
> —  <cite>Richard Feynman</cite>

"... May you have that freedom." Isn't such a sublime sentence?

# External Resources

- Feynman, Richard P. (June 1974). ["Cargo Cult Science"](http://calteches.library.caltech.edu/51/2/CargoCult.pdf). 
- Feynman, Richard (1997). [:earth_americas: "Surely You're Joking, Mr. Feynman!"](https://en.wikipedia.org/wiki/Surely_You%27re_Joking,_Mr._Feynman!).
- [:earth_americas: Repeat, Reproduce, Replicate](https://queue.acm.org/detail.cfm?id=3674499). _ACM Queue_
- [:earth_americas: More on the crisis in research: Feynman on ‘cargo cult science’](https://www.latimes.com/business/hiltzik/la-fi-mh-feynman-20131028-story.html). _Los Angeles Times_
- [:earth_americas: Cargo Cult AI: Is the ability to think scientifically the defining essence of intelligence?](https://queue.acm.org/detail.cfm?id=3595860). _ACM Queue_

# Footnotes

[^1]: The Association of Computing Machinery (ACM) has introduced a [badging system](https://www.acm.org/publications/policies/artifact-review-and-badging-current) for software artifacts since 2020. I still find it difficult to distinguish the difference between a "repeatable," "reproducible," and "replicable" experiment or tool. 

[^2]: There is also [cargo cult programming](https://en.wikipedia.org/wiki/Cargo_cult_programming): the ritual inclusion of code or program structures that serve no real purpose.
