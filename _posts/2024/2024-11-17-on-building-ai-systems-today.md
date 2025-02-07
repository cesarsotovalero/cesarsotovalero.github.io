---
layout: post
title: On Building GenAI Systems Today
subtitle: What seems to works, what doesn't, and maybe why
tags: ai
description: |
   Generative AI has taken the world by storm, offering endless opportunities for innovation. But as with any new technology, there are plenty of pitfalls to avoid. In this post, I dive into the current state of AI startups, shedding light on what works, what doesn't, and why. If you're looking to build something with AI, let’s step back and reflect on where it makes sense to innovate and where it doesn't. From avoiding overhyped general-purpose chatbots to understanding the limitations of AI in niche markets, this post offers practical insights to help you navigate the AI hype more effectively.
keywords:
  - AI hackathons
  - Generative Artificial Intelligence
  - product market fit
  - sales pitch
  - GenAI
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
It reminds me of the [gold rush](https://en.wikipedia.org/wiki/Gold_rush) saga in the 19th century. 
The happy idea is that today any single individual could get rich almost instantly by leveraging AI's capabilities the right way.
The potential opportunities to apply AI for profit span almost all areas, from pure arts to fundamental science, from medical diagnosis to engineering, and so on.
[AI agents](https://en.wikipedia.org/wiki/Intelligent_agent) can now [generate](https://www.sciencedirect.com/science/article/pii/S2352847823001557) new scientific hypotheses.
Yet, as history seems to repeat itself, every time OpenAI releases a new model offering more powerful capabilities, many solo entrepreneurs and small startups flounder and fade.
I've attended many hackathons where teams have tried to build AI-powered solutions for problems that could be solved with a simple rule-based system.
So, if you're a developer or entrepreneur itching to dive into the GenAI space for fun or profit, this post is a step back to reflect on what (I believe) are good fits for Ai and what _shouldn't_ be built with it.
Let's dive in!

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/2024/2024-11-17/twisted-revolver.jpg alt: "Time to stop shutting flies with AI powered bullets" %}
  <figcaption class="stroke"> 
   &#169; Time to stop shutting flies with AI-powered big and expensive bullets. Picture of a sculpture located in <a href="https://maps.app.goo.gl/9tWekqJTscsLmkgd9">Hötorgshallen 50</a>, in Stockholm city.
  </figcaption>
</figure>

# What Seems to Work

I'm not an entrepreneur myself (yet), but I'm overall an enthusiast of the startup ecosystem.  
I've listened to the [Indie Hackers Podcasts](https://www.indiehackers.com/podcasts), read [TechCrunch](https://techcrunch.com/), and still check cool launches on [Gumroad](https://gumroad.com) from time to time.  
Over the years, I've seen many startups succeed and fail along the way for diverse reasons. 
Some of them failed due to overhyped tech, unrealistic business models, or poor timing (e.g., Pets.com, Theranos, or Rdio).  
Whenever there is a new technology, there is a wave of startups trying to profit from it.
Do you remember the blockchain hype 10 years ago?

<aside class="quote">
    <em>“AI is really useful, and it's here to stay..”</em> 
</aside>

I'm convinced that Generative AI (GenAI) is a powerful tech that can [transform whole industries](https://www.cesarsotovalero.net/blog/surviving-the-ai-revolution-as-a-software-engineer.html) and create new opportunities.  
GenAI will first optimize existing processes and then create new ones.  
First, everything related to handling paperwork and repetitive tasks will be eventually automated.  
But that's actually good because these boring tasks were not meant for humans in the first place anyway.  
Second, GenAI will create new opportunities for everyone, including artists and creators, to express themselves in ways that were not possible before.  
Third, GenAI will help us understand the world better by analyzing data and generating new hypotheses.
Thus propelling the scientific discoveries that ultimately transform our lives for the better.

Below are three _realistic_ applications of GenAI today that I would like to see more of:

1. **Personalized Financial Advisors**
- Apps that analyze spending habits, investment opportunities, and financial health using AI are gold. These tools cater to the rising demand for financial literacy and can scale personalized advice to millions.
- Example: [Wealthfront](https://www.wealthfront.com/)’s AI-driven financial planning features are transforming personal finance management.
- Why it works: High demand and tangible ROI for users.

2. **Content Creation Tools**
- Generative AI is a boon for creators. Platforms that assist with scriptwriting, graphic design, or even video editing are gaining more and more traction.
- Example: [Adobe’s Firefly](https://www.adobe.com/products/firefly.html) enhances creativity by automating repetitive tasks.
- Why it works: It saves time, amplifies human creativity, and has clear market demand.

3. **AI in Healthcare**
- Tools like AI-powered symptom checkers or personalized fitness coaches empower users to manage their health better.
- Example: [MyFitnessPal](https://www.myfitnesspal.com/) leverages AI for smarter diet recommendations.
- Why it works: There’s a growing emphasis on preventive health solutions that are scalable and cost-effective.

While we are still in the early days of GenAI, it seems to me that what works the best is still to focus on solving real world problems in a scalable way.
If you've worked on a GenAI product, then you don't need to be remembered that no matter the tech, is _the product_ what matters the most.

# What to Avoid

Numerous AI-driven photo apps fail due to over-saturation and lack of resources to compete against the tech giants that already have customer trust and a large user base.

1. **Overhyped General-Purpose Chatbots**
- Why they fail: Chatbots are ubiquitous, and most fail to differentiate themselves. Unless your bot is solving a specific problem better than existing solutions, it’s just another chatbot.
- Example: Microsoft’s Tay chatbot famously spiraled out of control due to poor moderation and biased training data ([Analytics Vidhya](https://www.analyticsvidhya.com/blog/2023/01/top-5-failures-of-ai-till-date-reasons-solution/)).

2. **AI for the Sake of AI**
- Why they fail: Building something just because “AI is hot” often leads to feature bloat and unclear user value. Many startups end up with flashy demos but no sustainable business model.
- Example: Numerous AI photo filter apps hit the market and quickly faded due to oversaturation.

3. **Poorly Thought-Out Healthcare Applications**
- Why they fail: While healthcare is promising, it’s also highly regulated. Products that don’t comply with data protection laws or fail to address ethical concerns will face backlash.
- Example: Forward Health’s CarePods failed due to technical glitches and poor location choices ([Business Insider](https://www.businessinsider.com/healthcare-startup-forward-shutdown-carepod-adrian-aoun-2024-11)).

4. **Tools Targeting Hyper-Niche Markets**
- Why they fail: Niche markets often lack the scale needed to make an app profitable. AI tools for ultra-specific tasks, like “AI for knitting pattern generation,” may not justify the investment.
- Example: Tally’s credit management platform collapsed due to limited scalability and poor product pivots ([Selldone](https://selldone.com/blog/major-startup-failures-2024-824)).

## Key Lessons from AI Failures

1. **Bias Is Your Biggest Enemy**  
   AI systems that perpetuate bias can quickly tarnish a company’s reputation. Microsoft’s Tay chatbot is a textbook case of how biased data leads to PR disasters.

2. **Privacy Is Non-Negotiable**  
   Apps that mishandle sensitive data, especially in healthcare and finance, risk regulatory penalties and losing user trust. Always prioritize data protection.

3. **Don’t Overpromise**  
   Many startups crumble because they promise the moon but deliver a rock. Be transparent about your AI’s capabilities and limitations.

# What Makes an AI Idea Worth Pursuing?

1. **Clear Value Proposition**
- Ask yourself: Does this app solve a real problem? And does it do so in a way that’s better than existing solutions?

2. **Scalability**
- Avoid hyper-niche markets unless you have a compelling reason to believe they’ll grow.

3. **Ethical Design**
- Consider potential misuse of your AI. Tools like deepfake generators have immense creative potential but can also be used maliciously.

## Additional Pitfalls to Watch Out For

From my research and recent discussions, there are a few more pitfalls to keep in mind when building AI applications:

1. **Use Generative AI When You Don’t Need It**  
   As the saying goes, “Not everything is a nail.” Generative AI should not be used for every problem. Many times, simpler solutions such as linear programming or basic algorithms can outperform AI in terms of cost and efficiency. For example, optimizing energy consumption via a basic schedule based on electricity prices is far more effective and cheaper than feeding the same data into a large language model (LLM) ([Chip Huyen, Jan 16, 2025](https://www.chiphuyen.com)).

2. **Confusing Bad Product with Bad AI**  
   Often, issues with AI products aren’t because of the AI itself, but because of the overall product design or poor user experience. A bot might be working perfectly fine, but users might not know how to interact with it. The right UX can transform a mediocre AI into something genuinely useful, as demonstrated by Intuit's chatbot design.

3. **Relying on Open-Source Models Without Customization**  
   Using pre-trained models without fine-tuning them for your specific use case is like trying to win a marathon in flip-flops. Fine-tuning can make the difference between an app that's just "okay" and one that delivers real-world value.

# Final Thoughts

The Gold Rush is Far From Over
AI won’t solve every problem, and when it is used, it must be applied carefully and thoughtfully.  
Many generative AI startups are rushing headfirst into this space, hoping to strike gold, but failing to dig deep enough to find the right nuggets.  
In the future, the winners will be those who embrace simplicity, scale, and ethics—while staying grounded in real-world needs.  
To make AI a lasting success, focus on creating products that truly solve problems for the user, rather than just jumping on the bandwagon.  
Who knows? Maybe your next AI project will end up as the one everyone’s talking about. Or maybe it will be yet another “failed startup” story. Time will tell, but remember, it’s all about **finding the right market fit**—not just building an app for the sake of it.

# External Resources

- [Analytics Vidhya: Top 5 AI Failures](https://www.analyticsvidhya.com/blog/2023/01/top-5-failures-of-ai-till-date-reasons-solution/)
- [Business Insider: Inside Forward’s Failure](https://www.businessinsider.com/healthcare-startup-forward-shutdown-carepod-adrian-aoun-2024-11)
- [Selldone: Major Startup Failures 2024](https://selldone.com/blog/major-startup-failures-2024-824)
- [Chip Huyen: Common pitfalls when building generative AI applications](https://huyenchip.com/2025/01/16/ai-engineering-pitfalls.html)
