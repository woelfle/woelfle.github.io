---
rdf:type:
- article
title: 'Buffets, Restaurants, and DevOps: A Tasty Guide to Platform Engineering'
slug: buffets-restaurants-and-devops-a-tasty-guide-to-platform-engineering
description: 'Platform engineering explored through the lens of how we eat: cooking from scratch, dining
  at a restaurant, or serving yourself at a buffet. Why a great platform is more than a collection
  of tools: it is a thoughtfully designed experience.'
date: 2025-05-19
lastmod: 2025-05-19
draft: false
tags:
- "Platform Engineering"
- "Software Engineering"
- "Internal Developer Platforms"
- "Developer Experience"
categories:
- "Software Architecture"
author: Thomas Wölfle
featureimage: buffets_and_platform_engineering.png
featureimagealt: A buffet as an analogy for platform engineering
iso27001:classification: public
---

## 🧑‍🍳 What do platform engineering and buffets have in common?

More than you might think.

In this article, I explore platform engineering through the lens of how we eat—cooking from scratch, dining at a restaurant, or serving yourself at a buffet. Each model reflects a different approach to enabling software teams.

Inspired in part by Gregor Hohpe’s “fruit salad vs. fruit basket” analogy, this piece dives into why a great platform is more than just a collection of tools—it’s a thoughtfully designed experience.

🍽️ Whether you're building platforms or just trying to improve developer experience, this metaphor might change how you think about enablement.

<!--more-->

## 🍽️ 1. The Universal Experience of Eating

Everyone eats. But how we eat varies—from cooking a meal from scratch, to dining at a restaurant, to helping ourselves at a buffet. Each approach comes with its own trade-offs: control versus convenience, customization versus speed, autonomy versus support.

Surprisingly, these same dynamics mirror how engineering teams interact with tools and infrastructure. Do they build everything themselves? Do they rely on a centralized team to serve them? Or do they use a self-service platform that offers the best of both worlds?

Let’s explore how platform engineering, like a good meal, is all about the right ingredients, preparation, and experience.  
**Because sometimes, understanding complex systems starts with something as simple as a meal.**

## 🧑‍🍳 2. The Three Models of Software Enablement

Before we dive in, it’s worth acknowledging a key insight from **Gregor Hohpe**, who introduced the **“fruit salad vs. fruit basket” analogy** to illustrate a subtle but important point:  
A platform is more than just a collection of tools—it’s about how those tools are integrated and experienced. Just as a **fruit salad** offers a cohesive, ready-to-eat experience compared to a **fruit basket** of loosely related ingredients, a well-designed platform delivers value through thoughtful composition, not just availability.

This article builds on that idea—extending the metaphor from fruit to full meals—to explore how different models of software enablement shape the developer experience.

### 🍳 Cook Your Own Meal → Full Autonomy

Engineering teams are like home chefs. They choose their ingredients, design their recipes, and cook everything from scratch—building their own CI/CD pipelines, managing infrastructure, and selecting observability tools.

{{< figure
  src="cook_your_own_meal.jpeg"
  alt="Home chefs cooking their own meal, as an analogy for engineering teams building everything from scratch"
  caption="Cooking your own meal: full autonomy, high effort."
  class="post-figure-img aspect-square object-cover"
>}}

**Pros**:

- Maximum flexibility and customization
- Deep understanding of the stack

**Cons**:

- High cognitive load and operational overhead
- Reinventing the wheel across teams
- Inconsistent quality and security practices

### 🍽️ Restaurant Service → Centralized IT/DevOps

Here, teams are customers at a restaurant. They place an order—open a ticket, submit a request—and wait for the service team to deliver. The experience is curated and controlled, but not always fast or flexible.

{{< figure
  src="restaurant_service.jpeg"
  alt="Dining at a restaurant, as an analogy for teams requesting services from a central IT team"
  caption="Restaurant service: curated and controlled, but slow."
  class="post-figure-img aspect-square object-cover"
>}}

**Pros**:

- Standardization and compliance
- Expert support and centralized governance

**Cons**:

- Bottlenecks and long lead times
- Frustration from lack of control
- Poor developer experience

---

### 🥗 Buffet → Platform Engineering

The buffet represents the platform engineering model. Teams serve themselves from a curated selection of tools, services, and workflows. No waiting, no reinventing the wheel.

{{< figure
  src="the_buffet.jpeg"
  alt="Serving yourself at a buffet, as an analogy for teams using a curated platform"
  caption="The buffet: self-service from a curated, opinionated selection."
  class="post-figure-img aspect-square object-cover"
>}}

But there’s a catch: **you don’t get everything you want**. Buffets are **opinionated**. They make deliberate choices about what to offer—and what not to. This constraint is not a flaw—it’s a feature. It’s what allows buffets to scale and serve hundreds efficiently.

Another powerful aspect is the **separation of preparation and consumption**. The kitchen staff specialize in different areas—yet to the diner, everything appears unified. Platforms work the same way: infrastructure, security, CI/CD, and observability may be managed by different teams, but the developer experiences a seamless interface.

> 🧠 _“A buffet is not just a layout of food—it’s a product.”_

A successful platform is a **software product**. It must be designed, maintained, and continuously improved. That means understanding your users, gathering feedback, and iterating based on real needs. If developers don’t find value—if the food doesn’t taste good—they’ll go back to cooking or waiting to be served.

**Pros**:

- Autonomy with guardrails
- Faster delivery and improved developer experience
- Reusability and consistency across teams
- Scalability through opinionated design and decoupled execution

**Cons**:

- Requires upfront investment and cultural change
- Less flexibility than bespoke or service-based models

## 🔍 3. The Buffet as a Platform: A Deeper Look

What makes a buffet great? It’s not just the variety—it’s the experience. The food is fresh, the layout is intuitive, and the options are tailored to the guests.

The same principles apply to platform engineering:

- **Variety**: Support for multiple languages, frameworks, and deployment models
- **Quality**: Secure, reliable, and well-documented services
- **Accessibility**: Intuitive interfaces, APIs, and developer portals
- **Replenishment**: Continuous improvement based on feedback and usage data

But there’s another layer to this: **a great buffet is organized.** You don’t find desserts next to raw meat or sauces in the drinks section. There’s a logic to the layout that reflects how people eat.

The same should be true for platforms. This is where **Domain-Driven Design (DDD)** becomes a powerful lens.

### 🧩 Platform Engineering as Domain-Driven Design for Infrastructure

In traditional software architecture, DDD helps teams model systems around business domains, creating clear boundaries and ownership. In platform engineering, we apply the same thinking to infrastructure and developer workflows.

- **Bounded contexts** become **platform domains**: CI/CD, observability, compute, networking, secrets management, etc
- Each domain is owned by a team that understands its users and evolves its services accordingly
- Interfaces between domains are explicit, well-documented, and stable—just like APIs in a well-architected system
- The platform as a whole becomes a **composed product**, not a monolith

This approach enables **modularity, scalability, and autonomy**—both for platform teams and for the developers they serve. It also aligns with the principle of **separation of concerns**: each team focuses on its domain, while the platform product team ensures a cohesive experience across them.

> 💡 _Think of it as designing a buffet where each station is run by a specialist chef, but the overall experience feels seamless to the diner._

By applying DDD principles to platform engineering, we move beyond infrastructure as a service and toward **infrastructure as a product**—designed with intent, structured around user needs, and built to evolve.

## ⚖️ 4. Trade-offs and Organizational Fit

Not every organization needs a buffet. Some teams thrive with full autonomy. Others benefit from centralized control. Platform engineering is not a one-size-fits-all solution—it’s a strategic choice.

Several factors influence whether and how to build an internal developer platform:

- **Size**: Larger organizations benefit more from standardization and reuse
- **Maturity**: Teams must be ready to adopt and contribute to shared platforms
- **Culture**: Autonomy and collaboration must be balanced with governance

And there is another factor that influences what to build: **where does your platform add unique value**

Think of it this way: the kitchen staff that offers a buffet doesn’t need to grow its own vegetables or bake its own bread from scratch. The public cloud is already full of high-quality ingredients and base products —compute, storage, CI/CD, observability, and more. If your internal platform simply replicates what the cloud already does well, you risk wasting time and resources. Instead, focus your efforts on the **“sweet spot”**: the intersection between what your teams commonly need and what isn’t easily or consistently solved by off-the-shelf cloud services.

In other words:

- Don’t compete with hyperscalers unless you have a **very good reason**
- Don’t build a platform for things that are **not common** across your teams
- Do invest in areas where **internal consistency, developer experience, and organizational context** matter most

A successful platform is not about building everything—it’s about building the **right things** that amplify your teams’ ability to deliver. Like a great buffet, it should be curated, not comprehensive—and it should make the most of what’s already available.

## 🧭 5. The Role of Engineering Leadership

Platform engineering is not just a technical initiative—it’s a **product discipline**. And like any successful product, it requires vision, investment, and continuous iteration.

Too often, organizations treat internal platforms as infrastructure projects or side efforts. But the most effective platforms are built like software products—with clear goals, user research, roadmaps, and feedback loops. That shift in mindset starts with engineering leadership.

### 🧠 Platform Engineering _Is_ Product Engineering

The same principles that drive great external products apply internally:

- **User-centric design**: Your developers are your customers. Understand their workflows, pain points, and goals
- **Iterative delivery**: Don’t try to build the “perfect” platform up front. Start small, deliver value early, and evolve based on usage and feedback
- **Opinionated architecture**: Just like product teams define constraints to reduce complexity, platform teams must make deliberate, scalable choices
- **Cross-functional collaboration**: Successful platforms require input from infrastructure, security, developer experience, and application teams—just like product teams rely on design, engineering, and marketing

### 🧩 Structure and Ownership Matter

Platform teams should be **dedicated, empowered, and accountable**. They need:

- **Clear product ownership**: A product manager or tech lead who owns the roadmap and prioritization
- **Autonomy with alignment**: The freedom to innovate, guided by organizational goals and standards
- **Embedded feedback loops**: Regular engagement with developers through interviews, surveys, and usage data

### 📏 Measure What Matters

Traditional infrastructure metrics (uptime, latency, cost) are important—but they’re not enough. Platform success should be measured by things like:

- **Developer satisfaction**
- **Adoption and usage rates**
- **Time-to-onboard and time-to-deploy**
- **Reduction in cognitive load for teams**

> 🧠 _“Great platforms aren’t built for control—they’re built for confidence.”_

Leadership’s role is to create the conditions where platform teams can thrive—not by enforcing standards, but by enabling excellence.

## ⚠️ 6. Common Pitfalls in Platform Engineering

Even with the best intentions, platform engineering efforts can go off track. Here are some common pitfalls to watch out for:

### 1. **Building Without Validating Demand**

Teams sometimes build platforms based on assumptions rather than actual developer needs. This leads to unused features and wasted effort.

> 💡 _Treat your platform like a product—validate demand before investing heavily._

### 2. **Over-Engineering Too Early**

Trying to solve every edge case or support every tool from day one can lead to complexity and slow delivery. Start small, deliver value quickly, and iterate.

### 3. **Ignoring Developer Experience**

A technically sound platform that’s hard to use will be abandoned. Developer experience (DX) is just as important as infrastructure quality.

### 4. **Lack of Clear Ownership**

Without clear roles and responsibilities, platforms become fragmented or neglected. Platform teams need dedicated ownership and accountability.

### 5. **Forgetting to Market the Platform**

Internal platforms need internal marketing. If developers don’t know what’s available or how to use it, adoption will suffer.

### 6. **Treating the Platform as a Side Project**

Successful platforms require full-time investment. Treating them as part-time initiatives leads to slow progress and poor quality.

## 🎯 7. Conclusion: Designing for Delight

The best buffets don’t just feed people—they delight them. They offer choice without chaos, structure without rigidity, and service without friction.

A great internal developer platform does the same. It empowers engineers to focus on what they do best: building great software.

So ask yourself:  
**Are your engineers cooking from scratch, waiting to be served, or enjoying a well-designed buffet?**
