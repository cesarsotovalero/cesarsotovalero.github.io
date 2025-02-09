---
layout: post
title: Building GenAI Applications Today
subtitle: What seems to work, what doesn't, and possibly why
tags: ai
description: |
   Generative AI has taken the world by storm, offering endless opportunities for innovation. But as with any new technology, there are plenty of pitfalls to avoid. In this post, I dive into the current state of AI startups, shedding light on what works, what doesn't, and why. If you're looking to build something with AI, let’s step back and reflect on where it makes sense to innovate and where it doesn't. From avoiding overhyped general-purpose chatbots to understanding the limitations of AI in niche markets, this post offers practical insights to help you navigate the AI hype more effectively.
keywords:
  - AI future
  - Generative Artificial Intelligence
  - product market fit
  - sales pitch
  - GenAI capabilities
  - AI common pitfalls
  - AI misuse
image: ../img/posts/2024/2024-11-17/twisted-revolver_cover.jpg
share-img: ../img/posts/2024/2024-11-17/twisted-revolver_cover.jpg
show-avatar: false
toc: true
mathjax: false
date: 2024/11/17
author: cesarsotovalero
published: true
---

{% badge /img/badges/Svenskar_i_Amerika._Guldvaskare_vid_Black_Foots_River,_Montana.jpg 140 https://commons.wikimedia.org/wiki/File:NMA.0039209_Emigration._Svenskar_i_Amerika._Guldvaskare_vid_Black_Foots_River,_Montana.jpg %}

The AI fever has been around for a while now (4 years as I can count). 
It reminds me of the [gold rush](https://en.wikipedia.org/wiki/Gold_rush) and subsequent [Californian Dream](https://en.wikipedia.org/wiki/California_Dream) from the 19th century. 
The new "happy idea" is that today any single individual could get rich almost instantly by leveraging the novel AI's-based capabilities the right way.
The potential opportunities to apply Generative AI (GenAI) for profit span almost all areas of development, from pure arts to fundamental science, from medical diagnosis to engineering, and so on.
[AI agents](https://en.wikipedia.org/wiki/Intelligent_agent) can now [generate](https://www.sciencedirect.com/science/article/pii/S2352847823001557) new scientific hypotheses.
Yet, as history seems to repeat itself, every time OpenAI releases a new model offering more powerful capabilities, many solo entrepreneurs and small startups flounder and fade.
For instance, I've attended many hackathons where teams have tried to build AI-powered solutions for problems that could be solved with a simple rule-based system.
There are many many reasons why GenAI projects fail, and less clear reasons (to me) of why some succeed.
So, if you're a developer or entrepreneur itching to dive into the GenAI space for fun or profit, this post is my step back to reflect on what (I believe) are good fits for this technology and what _shouldn't_ be built with it.
Let's dive in!

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/2024/2024-11-17/twisted-revolver.jpg alt: "Time to stop shutting flies with AI powered bullets" %}
  <figcaption class="stroke"> 
   &#169; Stop shutting flies with AI-powered bullets, sometimes just use flyswatter instead. Picture of a sculpture located in <a href="https://maps.app.goo.gl/9tWekqJTscsLmkgd9">Hötorgshallen 50</a>, in Stockholm city.
  </figcaption>
</figure>

# What Seems to Work

I'm not an entrepreneur myself (yet), but I'm overall an enthusiast of the startup ecosystem. I've listened to the [Indie Hackers Podcasts](https://www.indiehackers.com/podcasts), read [TechCrunch](https://techcrunch.com/), and still check cool launches on [Gumroad](https://gumroad.com) from time to time. Over the years, I've seen many startups succeed and fail along the way for diverse reasons. Some of them failed due to overhyped tech, unrealistic business models, or poor timing (e.g., Pets.com, Theranos, or Rdio). 

Obviously, whenever there is a new technology, there is a wave of startups trying to profit from it. 
Do you remember the blockchain hype 10 years ago?
I can't forget about the many crypto millionaires that emerged from it.

I'm now convinced that GenAI is a powerful tech (much more broad than blockchain) that can [transform whole industries](https://www.cesarsotovalero.net/blog/surviving-the-ai-revolution-as-a-software-engineer.html) and create new new ones.
GenAI will first optimize existing processes and then transform them.
First, everything related to handling paperwork and repetitive tasks is going to be completely automated (and that's actually good because these boring tasks were not meant for humans in the first place anyway).
Second, GenAI creates new opportunities for everyone, including artists and creators, to express themselves in ways that were not possible before.
Third, GenAI helps us understand the world better by analyzing data in an unprecedented manner, generating new hypotheses, and planning new experiments, thus propelling the scientific discoveries that ultimately transform our lives for the better.

## Success Factors

The success of any GenAI project is extremelly hard to predict. 
However, the ones that succeed share some common traits that set them apart from the noise.
Below are factors to keep in mind when evaluating whether an AI idea is worth your time and resources.

**Clear Value Proposition.**
Before jumping into the development of any AI system, ask yourself: Does this app solve a real-world problem?
And is it doing so in a way that’s better, faster, or cheaper than existing solutions?
The best AI ideas are those that tackle well-defined issues, making people’s lives easier or helping businesses streamline operations.
Without a compelling value proposition, even the most advanced AI will struggle to gain traction.

**Scalability.**
While niche markets can be tempting, they are often not the best starting point for an AI system unless you have a very clear, long-term vision.
Aim for ideas that can scale, reaching wider audiences or applying across various industries.
Scalability isn’t just about expanding your user base.
It’s about adapting the technology to different use cases, which will increase the likelihood of long-term success.

**Ethical Design.**
Every AI system comes with a responsibility: to design it with ethics in mind. Consider the potential negative uses of your AI. While technologies like deepfake generators show immense creative potential, they also pose significant risks for misuse. It's essential to build safeguards and establish ethical boundaries to prevent your AI from being used for harmful purposes.

## Examples

Below are three applications of GenAI today that I would like to see more of:

1. Personalized Financial Advisors
- Apps that analyze spending habits, investment opportunities, and financial health using AI are gold. These tools cater to the rising demand for financial literacy and can scale personalized advice to millions.
- Example: [Wealthfront](https://www.wealthfront.com/)’s AI-driven financial planning features are transforming personal finance management.
- Why it works: High demand and tangible ROI for users.

2. Content Creation Tools
- GenAI is a boon for creators. Platforms that assist with scriptwriting, graphic design, or even video editing are gaining more and more traction.
- Example: [Adobe’s Firefly](https://www.adobe.com/products/firefly.html) enhances creativity by automating repetitive tasks.
- Why it works: It saves time, amplifies human creativity, and has clear market demand.

3. AI in Healthcare
- Tools like AI-powered symptom checkers or personalized fitness coaches empower users to manage their health better.
- Example: [MyFitnessPal](https://www.myfitnesspal.com/) leverages AI for smarter diet recommendations.
- Why it works: There’s a growing emphasis on preventive health solutions that are scalable and cost-effective.

While we are still in the early days of GenAI, it seems to me that what works the best is still to focus on solving real world problems in a scalable way.
If you've worked on a GenAI product, then you don't need to be remembered that no matter the tech, is _the product_ what matters the most.

# What to Avoid

Most GenAI ideas are not worth pursuing.
Numerous AI-driven apps fail due to over-saturation and lack of resources to compete against the tech giants that already have customer trust and a large user base.
Other fail due to technical glitches, poor product pivots, or simply because they don't solve a real problem.
There is another set that fail because of premature obsolescense (e.g., a friend built a now dead startup 4 years ago about simplifying email through summarization).
Failure is hard to predict when one truly believes in a proyect. 

## Lessons from AI Failures

Building a successful AI system isn’t just about using the best foundational models and feeding them with data.
It’s about learning from the mistakes of others.
A few notable failures provide crucial insights into what can go wrong, and what to avoid in the development process.
Below is a small compilation.

**Bias Is The Biggest Enemy.**
One of the most dangerous pitfalls in AI is [bias](https://en.wikipedia.org/wiki/Algorithmic_bias), which can unintentionally emerge through data or algorithmic design.
GenAI systems that perpetuate bias can quickly damage a company’s reputation, especially in sensitive industries.
A classic example of this is [Microsoft’s Tay chatbot](https://en.wikipedia.org/wiki/Tay_(chatbot)), which was launched in 2016 to interact with users on Twitter.
Unfortunately, it was quickly hijacked by biased and offensive content due to insufficient safeguards.
Current AI systems must be designed with bias mitigation in mind, ensuring that they are fair and ethical.

**Privacy Is Non-Negotiable.**
When it comes to AI, privacy is not a feature, it’s a fundamental requirement.
Especially in sectors like healthcare and finance, mishandling sensitive user data can lead to significant regulatory penalties and, perhaps worse, the loss of customer trust.
Companies must prioritize data protection, making sure that systems are secure and that users’ privacy is never compromised.
This includes adhering to global privacy standards like [GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation) or [CCPA](https://oag.ca.gov/privacy/ccpa/regs), and being transparent about how user data is collected and used.

**Overpromising.**
While the potential of AI can be captivating, it’s essential to remain grounded and transparent about the technology’s current capabilities.
Many companies have fallen into the trap of hyping up their AI solutions, only to disappoint users with results that fall short of expectations.
For example, [Forward Health](https://www.businessinsider.com/healthcare-startup-forward-shutdown-carepod-adrian-aoun-2024-11) promised a futuristic healthcare experience with its CarePods but failed to deliver on its ambitious vision.
To avoid overpromising, companies should set realistic goals, communicate openly with users, and focus on incremental improvements rather than grandiose claims.

In addition to the primary lessons above, there are a few more pitfalls that commonly arise in AI development. 
These may not always be immediately obvious but are equally critical in creating a successful AI application.

**Use GenAI When You Don’t Need It.**
GenAI is incredibly powerful, but it’s not a one-size-fits-all solution. As the saying goes, “Not everything is a nail.” Sometimes, simpler solutions like linear programming or basic algorithms can solve the problem more efficiently and cost-effectively. For example, optimizing energy consumption with a basic schedule based on electricity prices is far more effective and cheaper than running the same data through a complex language model (as noted by AI expert Chip Huyen). Before opting for GenAI, carefully consider if it’s the best approach.

**Confusing Bad Product with Bad AI.**
A common misconception is that poor user experiences or ineffective AI solutions are the result of faulty algorithms. In reality, many issues arise from poor product design or a lack of attention to the user interface (UI).
For example, a chatbot might function perfectly but fail to engage users simply because they don’t know how to interact with it.
A well-designed UX can transform even a mediocre AI into something genuinely useful.
[Intuit’s chatbot](https://www.intuit.com/intuitassist/), for instance, was able to enhance the overall experience through smart design choices, demonstrating that good design can elevate AI performance.

**Lack of Model Customization.**
While pre-trained open-source models offer a quick and easy starting point, relying on them without tailoring them to your specific use case is a mistake.
Using these models without fine-tuning them is akin to trying to run a marathon in flip-flops.
It might work to some extent, but you’re not going to achieve optimal results.
Customizing and fine-tuning models allows them to meet the specific needs of your application, making the difference between an average app and one that delivers real value to users.

## Examples

Here are four GenAI development directions that I would advise against pursuing:

1. Overhyped General-Purpose Chatbots
- Why they fail: Chatbots are ubiquitous, and most fail to differentiate themselves. Unless your bot is solving a specific problem better than existing solutions, it’s just another chatbot.
- Example: Microsoft’s Tay chatbot famously spiraled out of control due to poor moderation and biased training data ([Analytics Vidhya](https://www.analyticsvidhya.com/blog/2023/01/top-5-failures-of-ai-till-date-reasons-solution/)).

2. Poorly Thought-Out Healthcare Applications
- Why they fail: While healthcare is promising, it’s also highly regulated. Products that don’t comply with data protection laws or fail to address ethical concerns will face backlash.
- Example: Forward Health’s CarePods failed due to technical glitches and poor location choices ([Business Insider](https://www.businessinsider.com/healthcare-startup-forward-shutdown-carepod-adrian-aoun-2024-11)).

3. Tools Targeting Hyper-Niche Markets
- Why they fail: Niche markets often lack the scale needed to make an app profitable. AI tools for ultra-specific tasks, like “AI for knitting pattern generation,” may not justify the investment.
- Example: Tally’s credit management platform collapsed due to limited scalability and poor product pivots ([Selldone](https://selldone.com/blog/major-startup-failures-2024-824)).

In summary, avoid building AI apps that don’t solve a real problem, are overhyped, or target markets that are too small to scale.

# Final Thoughts

The AI gold rush is far from over. Many GenAI startups are rushing headfirst into this space, hoping to strike gold, but failing to dig deep enough to find the right nuggets. In the future, the winners will be those who embrace simplicity, scale, and ethics, while staying grounded in real-world needs. To make AI a lasting success, focus on creating products that truly solve problems for the user, rather than just jumping on the bandwagon. Who knows? Maybe your next AI project will end up as the one everyone’s talking about. Or maybe it will be yet another “failed startup” story. 

You will never know until you try.

# External Resources

- 🌐[Analytics Vidhya: Top 5 AI Failures](https://www.analyticsvidhya.com/blog/2023/01/top-5-failures-of-ai-till-date-reasons-solution/)
- 🌐[Business Insider: Inside Forward’s Failure](https://www.businessinsider.com/healthcare-startup-forward-shutdown-carepod-adrian-aoun-2024-11)
- 🌐[Selldone: Major Startup Failures 2024](https://selldone.com/blog/major-startup-failures-2024-824)
- 🌐[Chip Huyen: Common pitfalls when building generative AI applications](https://huyenchip.com/2025/01/16/ai-engineering-pitfalls.html)
