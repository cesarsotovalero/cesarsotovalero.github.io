---
layout: post
title: The Not-So-Strange Case of Cargo Cult in Computer Science Research
subtitle: Are we mimicking scientific progress without true innovation?
tags: science
description: |
  Arguably, computers and communications have changed the world more than any other science or technology. Yet there are a lot of failures, some prominent, many minor, and a widening gap between aspirations and reality - with environmental consequences. Borrowing Richard Feynman's criticism of cargo cult science, I discuss some ways we all are doing cargo cult computer science. To paraphrase Feynman: everywhere we have computers that look like they are doing the right things, but they don't work. After pointing out the widespread problems, the emphasis on the seminar will turn to our own behaviour: the evidence of poor science in research computing, and what we can positively do about it.
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
published: false
---

Everywhere, we have computer scientists that look like they are working on the right thing. 
They spent a long time doing the thing, running it, and collecting results.
Then, they _publish_ the thing.
However, many times "the thing" is either worthless or just doesn't work as claimed.
In fact, according to a study made in 2014: more than 75% of the results published in _prestigious_ computer science journals are [not reproducible at all](https://www.semanticscholar.org/paper/Measuring-Reproducibility-in-Computer-Systems-Collberg/075d12c8c9e295cc3227d12ecff7f5c16d8a8613).
This is a huge problem for science.
The fact that lot of human, and non-human time (and resources) are spent into computer science research that doesn't produce any value is something to look at with microscopic lens.
Unfortunately, this problem is nothing new.
In 1974, the American physicist [Richard Feynman](https://en.wikipedia.org/wiki/Richard_Feynman) coined the term "cargo cult science" referring to this exact same phenomenon.
Now, I want to revisit his ideas, 50 years later, from the lens of someone who has gone through the hustle of producing science "the modern way."
After reading this article, you will understand the many traps leading to cargo cult science and good techniques to stay away from it. 
Let's dive in!

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/2024/2024-07-13/vortice-art.webp alt: "Picture of a dark vortices ring" %}
  <figcaption class="stroke"> 
   &#169; Cargo cult rituals trap scientists in an endless vicious cycle of unproductivity. Picture taken at the <a href="https://en.wikipedia.org/wiki/Odenplan_station">metro station of Odenplan</a>, in Stockholm city.
  </figcaption>
</figure>

# Cargo Cult Science: Origins

{% badge /img/badges/cargo-cult-science.png 140 http://calteches.library.caltech.edu/51/2/CargoCult.pdf %}
 
The term "cargo cult science" was coined by American physicist [Richard Feynman](https://en.wikipedia.org/wiki/Richard_Feynman) in 1974 in his commencement speech at Caltech university. It's one of the greatest speeches about science of all time.

Cargo cult science refers to practices that seem scientific but don't truly follow the scientific method.[^3]
Feynman [highlighted](https://en.wikipedia.org/wiki/Surely_You%27re_Joking,_Mr._Feynman!) this concept by comparing it to the cargo cult rituals of Melanesian and Micronesian societies, where natives imitated the behaviors of World War II soldiers, hoping to bring back the material wealth they had seen during the war. 

> “In the South Seas there is a cargo cult of people. During the war they saw airplanes land with lots of good materials, and they want the same thing to happen now. So they’ve arranged to make things like runways, to put fires along the sides of the runways, to make a wooden hut for a man to sit in, with two wooden pieces on his head like headphones and bars of bamboo sticking out like antennas—he’s the controller—and they wait for the airplanes to land. They’re doing everything right. The form is perfect. It looks exactly the way it looked before. But it doesn’t work. No airplanes land. So I call these things cargo cult science, because they follow all the apparent precepts and forms of scientific investigation, but they’re missing something essential, because the planes don’t land.”

This metaphor underscores the need for genuine understanding and honesty in science, rather than merely following procedures without critical thinking.
In today's world, this message is particularly relevant as the fear of being wrong and the spread of misinformation continue to grow.

Similarly, Feynman states that researchers should not ignore the principle of integrity in order to avoid following cargo cult science because it is important to make scientific conclusions while providing all the information on the research, including possible faults and unexpected results.
According to Feynman, scientific integrity is “" principle of scientific thought that corresponds to a kind of utter honesty."

> "I think the educational and psychological studies I mentioned are examples of what I would like to call Cargo Cult Science. […] So I call these things Cargo Cult Science, because they follow all the apparent precepts and forms of scientific investigation, but they’re missing something essential, because the planes don’t land."

Thus, a scientist should not miss any important things while concluding his findings in order not to fool oneself and provide complete information related to scientific research. 
It is important to inform about all the points and results, "not just the information that leads to judgment in one particular direction or another."
The focus on avoiding the results which cannot support the experiment is typical for cargo cult scientists who do not report on things that can contribute to eliminating the received results. 
That is why the main purpose of the author’s article is to persuade the researchers to follow the principles of real science supported by the idea of integrity.


## Poor Science

Feynman determines a range of characteristics that can be used to define poor science, pseudoscience, or cargo cult science. 
The first characteristic mentioned by the author in the presence of the scientific form and scientific investigation, but the absence of the essential feature which prevents the idea from working.
The most important characteristic to discuss pseudoscientific researches is the absence of scientific integrity as “a kind of leaning over backward” (Feynman par. 14).

In order to state the scientific nature of the research, it is necessary to discuss its details and results from all the perspectives, while paying much attention to faults, biases, and wrong assumptions. The next important feature is the ignorance of repeating the experiment by oneself. Those researchers who choose to use the results received by the other investigators ignore the opportunity to make their own research more credible while supporting or rejecting the known findings.

Feynman states that pseudoscientists can be very “anxious for new results” because these results are contradictory in relation to their predictions, and they can destroy “the value of the experiments themselves” (Feynman par. 29). It is characteristic for cargo cult scientists to ignore the results which do not support their experiments and focus on those ones which sound appropriately.

## Reproducibility Crisis

The findings of the experiment can be discussed as valid if they are supported by the results of the other following experiments. That is why the experiment should be repeated in order to state the credibility of the results and the integrity of the overall investigation. Feynman notes, “other experimenters will repeat your experiment and find out whether you were wrong or right” (Feynman par. 16). Thus, an experiment is repeatable, if its results are supported by the other researchers who conduct it independently. From this point, Feynman claims that a real valid experiment should be repeatable because of the necessity to demonstrate whether the results are right or wrong.

Cargo cult scientists choose to ignore repeating experiments because of the lack of time, resources, and because of the possibility not to support certain assumptions. Feynman notes that para-psychologists or other cargo cult scientists look for experiments that can be repeated because they need to receive the same effect (Feynman par. 35). However, these scientists look for repeated results, not for the repeatable experiments because if the experiment is repeatable, its results can be different, and they do not always satisfy the expectations of cargo cult scientists. The rejection of the repeatable experiment is considered as characteristic for those scientists who intend to ignore the idea of integrity, and such behavior cannot be discussed as acceptable in the scientific world.

##  Academic Traps

Feynman laments that the kind of integrity he talks about isn’t baked into the science education system — which hardly comes as a surprise, given it’s largely a system premised on certitude at all costs and not on the very admission of ignorance that fuels science:

> This long history of learning how not to fool ourselves — of having utter scientific integrity — is, I’m sorry to say, something that we haven’t specifically included in any particular course that I know of. We just hope you’ve caught on by osmosis.
>> The first principle is that you must not fool yourself — and you are the easiest person to fool. So you have to be very careful about that. After you’ve not fooled yourself, it’s easy not to fool other scientists. You just have to be honest in a conventional way after that.

In computer science, a field driven by rapid innovation and fierce competition for funding and publication, the temptation to fall into Cargo Cult behaviors is significant. This can manifest in several ways:

1. **Chasing Trends Over Substance**: Often, researchers might feel pressured to work on "hot topics" not because they are convinced of their importance, but because they attract attention, citations, and funding.
2. **P-hacking and Selective Reporting**: In the quest for significant results, there’s a risk of manipulating data or selectively reporting results that support the hypothesis, rather than presenting the full picture of the research findings.
3. **Reinventing the Wheel**: Sometimes, due to a lack of thorough literature review or out of a desire to claim novelty, researchers might end up replicating existing studies without adding real value or new insights.
4. **Overreliance on Tools and Frameworks**: It’s not uncommon to see studies where advanced tools or algorithms are used without a proper understanding of their underlying principles or limitations, simply because they are popular or well-regarded.

# My Personal Insights

Having navigated the rocky terrains of a PhD and post-doctoral studies, I’ve experienced firsthand the challenges that push even the well-intentioned scientist towards these pitfalls. 
The pressure to publish frequently and the fierce competition for grants can sometimes blur the lines between rigorous investigation and the rush to produce publishable results.

Moreover, the lack of work-life balance, the anxiety of job security in academia, and the often solitary nature of deep research can exacerbate these issues. 
These challenges not only affect the mental health and well-being of researchers but can also compromise the integrity of the research itself.

I think more people should be more careful when they wade into arguments. It is easy to convince a member of the public that you are being scientific when you are not, and it is our moral duty to at least try to apply scrutiny to our own arguments before putting them ‘out there’. We should all strive to collect data on what we believe in and to react to it as objectively as possible, not censoring or ignoring that which we disagree with, or firing people who disagree with our beliefs.

## The Seek of True

So, how do we combat these tendencies? The answer lies in fostering a culture of integrity and transparency in research:

1. **Education and Awareness**: Early career researchers especially need guidance on the ethical dimensions of scientific research, including the importance of rigorous, unbiased experimental design and the pitfalls of Cargo Cult Science.
2. **Encouraging Reproducibility**: Journals and conferences should promote and reward the replication of studies and the sharing of negative results to counteract the bias towards only publishing positive findings.
3. **Institutional Support**: Universities and funding bodies need to recognize the pressures that lead to these practices and offer support systems that encourage quality over quantity, such as tenure and promotion criteria that value the impact of research over mere publication metrics.
4. **Community and Collaboration**: Fostering a more collaborative rather than competitive environment can help researchers share methods, findings, and validations more openly, reducing the isolation that can lead to ethical shortcuts.

## The Finding of Hope



# Conclusion

So, the takeaway is very simple. Get your fundamentals very clear. Don’t aim for fast results with superficial learning. Have skin in the game. Hypothesise, experiment, explore, and remember to follow the scientific method.

In our quest for knowledge, especially in a field as impactful as computer science, let's remember Feynman's words and commit to being scientists who not only look like scientists but think and act like them too. 
This is how we can truly make a difference, advancing our field with integrity and insight.

In his speech titled “Cargo Cult Science,” Richard Feynman describes the features of pseudoscience, and he persuades the audience belonging to the scientific world not to fool oneself while focusing on the expected results of experiments and ignoring faults and biases. The author states that a real scientist, not a cargo cult scientist, should follow the principle of integrity and report all the negative and positive results of his research in order not to mislead the scientific community and laymen.

> I have just one wish for you — the good luck to be somewhere where you are free to maintain the kind of integrity I have described, and where you do not feel forced by a need to maintain your position in the organization, or financial support, or so on, to lose your integrity. May you have that freedom.


# External Resources

- [:earth_americas: Cargo Cult Science](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/38CA581FFAB42704E5F667AA4A2D6D79/S1062798713000124a.pdf/cargo-cult-science.pdf) 
- [:earth_americas: Cargo Cult AI: Is the ability to think scientifically the defining essence of intelligence?](https://queue.acm.org/detail.cfm?id=3595860). _ACM Queue_
- [:earth_americas: More on the crisis in research: Feynman on ‘cargo cult science’](https://www.latimes.com/business/hiltzik/la-fi-mh-feynman-20131028-story.html). _Los Angeles Times_

# Footnotes

[^1]: Feynman, Richard P. (June 1974). [**"Cargo Cult Science"**](http://calteches.library.caltech.edu/51/2/CargoCult.pdf).

[^2]: Feynman, Richard (1997). [**"Surely You're Joking, Mr. Feynman!"**](https://en.wikipedia.org/wiki/Surely_You%27re_Joking,_Mr._Feynman!).

[^3]: There is also [cargo cult programming](https://en.wikipedia.org/wiki/Cargo_cult_programming), the ritual inclusion of code or program structures that serve no real purpose.
