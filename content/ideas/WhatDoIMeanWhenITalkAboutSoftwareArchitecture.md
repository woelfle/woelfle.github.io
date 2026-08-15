---
date: 2017-11-17
rdf:type: article
intended-audience:
  - Software Architects
  - Software Engineers
  - Engineering Managers
  - Project Managers
iso27001:classification: public
---

# What do I mean, when I talk about Software Architecture

{{< alert >}}
> Give em some structure
> Tell them the result at the beginning and don't let them wait. Look at [[The pyramid principle]] and [[SortingAndLabeling]]
{{< /alert >}}

{{< alert >}}
> Who is the audience?
> Clarify who the intended audience for the article is. Is this article for software architects, engineering managers, developers?
{{< /alert >}}

## Introduction

Time and again I am involved in discussions about software architecture. We are talking about different architectural styles and patterns. And time and again I am observing the strange situation where we are talking without having a shared understanding about what we mean when we are talking about software architecture. So I decided to put together my thoughts on what I mean when I talk about software architecture.

In this article I'll come up with my understanding of software architecture as it has evolved for me over two decades being a professional software developer, architect and team lead. It is a definition that, at least for me, is sound. And it is a valuable tool in my daily business which helps me to guide my structuring and decision making process.

## Spoiler

For those of you who are inpatient and don't want to read the whole article to figure out what my definition of software architecture is here comes a spoiler:

To me, software architecture is the act of willingly structuring a software system so it adheres to some (not-functional) requirements and exposes some expected properties.

## What is a software system

[[202207311425_socio_economic_system]]

In order to define software architecture it is necessary to define some other terminology first. So when talking about software architecture I mean the architecture of a software system. And by that I have to explain what I mean when I say "a software system":
A software system is a complex socio economic system that contains software. So every software system has a social aspect, an economic aspect and a software aspect. In addition to that it is a [[Complexity|complex system]]. You cannot talk about software architecture without taking the socio and the economic part into consideration as well as the characteristics of complex systems. Well, you can, but it might fire back.

### What is a system

[[202207311453-every_system_has_a_structure]]

The term _system_ comes from the [Latin](https://en.wikipedia.org/wiki/Latin "Latin") word _systēma_, in turn from [Greek](https://en.wikipedia.org/wiki/Greek_language "Greek language") σύστημα _systēma_ which means "a whole concept made of several parts or members"  [^1]

> [!todo] Refer to [[SimonHerbert|Herbert A. Simons]] article [[TheArchitectureOfComplexity|Architecture of Complexity]]
>

So this means that whenever we talk about a system we are talking about some "whole" that can be decomposed into parts.

Examples of systems might be a flower, a table, a company or even an atom. They all are systems that consist of parts. A table consists of the table top, its legs and probably additional parts that mount the top to the legs.

And since a system consists of parts these parts somehow relate to each other. The relation between the parts is what defines the structure of the system.

So every system has a structure. This is implicitly given by the fact that it consists of parts. It is this structure from which the functional and not-functional properties of the system emerge from. For a table it is expected that the table top is related on top of the legs. Otherwise it would not offer the functional property usually expected of a table. Depending on where the legs are mounted below the top different not-functional properties of the table will emerge. Regarding its stability, its look and the like.

So to sum it up:

* a system is a whole made of parts
* the relation of the parts between each other defines the structure of the system
* it is the structure of a system from which its functional and not-functional properties arise

### So what does this 'social' part mean

[[202211181639-a-software-system-has-a-social-part]]

A software system consists not only of software. There are people that interact with these systems. There are users, administrators, developers, support people and many more. They are part of the system too.

When modeling a software system we must not ignore this aspect as it has an impact on the design and architecture of the system.

We know from Conway's law that there is a relation between the communication structure of an organization producing a software system and the structure of the system created. This can play to our favor or against us depending on whether the organizational structure and the system structure are aligned or not.

Suppose you have a monolithic application without a clear modular structure. And now suppose you have 10 teams working on that monolith. I'd bet there will be a lot of conflict and friction between these teams as they work on the same code base. Changes of one team will break changes of other teams and the like.

Or think about a situation where you have a customer that has to use the software system on premises without any cloud or containerization technology. If your system  consists of 100 different services, then you have put a high burden to your customer to operate that system. It that case a modular monolith would perhaps have been a much better solution.

> [!summary] Architectural decisions have to fit the social context of the software system
>

### What does the 'economic' part mean

> [!todo] Extract into separate note

Software systems don't exist in isolation. A software system has to be built and maintained, which requires time and workforce that usually wants to be paid for. It has to be operated, which again, requires time and workforce. And it has to provide 'economic' value for its users. Otherwise they probably won't use the software system at all (which makes building and operating it uneconomical)

So when building a software system we have to take these factors into account. Development costs as well as operational costs are influenced by our architectural decisions. As well as the usability of a software system, which has an impact on the 'value' it has for its users.

Building the best software system ever with the most elaborate architecture is meaningless when the company that pays your loan runs out of money before customer are paying for the software system. Even if it is an internal system that is not sold the same constrains apply. The architecture of a software system has to be adequate to the economic constraints within which it exists.

Examples of 'architectural decisions' that have an economic aspect might be:

* cloud vs. on premises
* COTS vs 'open source' vs 'custom development'
* ...

> [!summary] Architectural decisions have to fit the economic context of the software system

## What is architecture

So given these definitions what is software architecture? As we have seen every system has some structure. So how does architecture differ from the structure of a system? The one important difference for me is that the architecture of a system is not something that happens accidentally. It involves some conscious act. It requires decision making.

To me software architecture is to willingly structure a software system. The important part is "**willingly**". According to this definition a flower does not have an architecture. It emerged as part of an evolutionary process. A table on the other hand is the result of someone that has created its structure **with an end in mind**. It has an architecture.

Does every software system have an architecture? Hard to say. All of them have a structure. And for many of them some part of the structure will be the result of architectural decisions. But that does not mean that everything in a software system is part of an architecture. Some things simply emerge. Otherwise we wouldn't have the term "big ball of mud", wouldn't we.

So if the act of architecting a software system is to willingly structure the system the question comes up what this "will" wants to achieve. This touches a sensitive part of the work of software architects.

Software architecture is a means and not a goal. There is no value in having an event based architecture except it is helping to solve a problem and not introducing more problems than it solved. Taking this into mind we always have to state the problem first before we can talk about architectural patterns and styles.

And then it is the work of software architects to figure out what architectural patterns and styles are most appropriate to address the problems a software system is facing. This is not a one off. The architecture of a software system has to evolve over time as the system evolves and its requirements change. So as architects we have to evaluate the subject systems over and over again and decide what changes in the structure are necessary for the future. We have to architect for change.

To sum it up: To me the work of software architects is to willingly structure a software system to address existing or upcoming problems. Architectural patterns and styles are a means and not a goal. They always have to serve some purpose.

## How do I differentiate it from design

I've been talking a lot about software architecture by now. But there is some other terminology that somehow relates to it: Software Design

What is the difference between these two? Is there a difference at all?

To me there is a difference. Or at least I'd like to make a difference because again it helps me in my daily work. When I look at architectural patterns and styles I perceive them mostly as means to address [[NotFunctionalRequirements|not-functional requirements]]. Microservices or hexagonal architectures do not focus on what a system is doing. Whereas when I look at design patterns then they are fare more in the area of functional requirements. They help when it comes to structure a system to realize some functional aspects. Don't know whether it was intended but it was named "domain driven design" and not "domain driven architecture".

This is not an either or consideration. There are shades of gray where we transition from architecture to design. And there is some area in the midst of them where we cannot say whether that belongs to the architecture or to the design.

So why bother about these two? Where is the value in differentiating?

* functional -> domain experts
* not-functional -> other experts, e.g. network or database experts, ...

To me there is some value in differentiating as it allows me to separate different concerns.

People involved in design sessions are probably not the same that are involved in architectural discussions. Imagine you are developing some fund management system. Would you want to discuss whether to go for microservices with a domain expert, a fund manager? Or would you want to discuss the domain of asset management with a network engineering expert? Perhaps not. You would pick the right people for the respective task.
I.e. if you organize teams around business capabilities or subdomains then they will be responsible for the functional part they own. That is why it is effective to have some domain experts in that team. Some product owner that can participate in the design process.
**

> That kind of intellectual activity which creates a useful whole from its diverse parts may be called the design of a system
> — Melvin E. Conway

{{< alert >}}
> [!todo] Where to find architecture work in the above mentioned team topology
> When aligning teams to domains what does this mean for architectural work? Who does that work in case every team should be autonomous? I have to write a bit more about that question.
{{< /alert >}}

So my conclusion is that

* software architecture is to willingly structure a software system to address not-functional requirements
* software design is to willingly structure a software system to address functional requirements (see article [[HowDoCommitteesInvent|How Do Committees Invent]] by [[ConwayMelvin|Melvin E. Conway]])

{{< alert >}}
> [!question]
> Why do I think that I can define the terminology "software architecture" only within the context of a socio economic system that contains software? Why doesn't it make sense to define it without considering the social and economic part of a software system?
{{< /alert >}}

{{< alert >}}
> [!missing] Narrow the scope
> I have to narrow the scope. I am talking about software systems that are more or less defined as business applications. I am not talking about things like embedded systems as I don't know whether this definition applies to them too.
{{< /alert >}}

{{< alert >}}
> [!missing] Explain why 'not-functional requirements' can be replaced by 'architectural properties/requirements'
> This is a nonsense term. Things should be defined positively and not by what they not are. Have a look at the ISO 25001 Architecture spec and the like. What we call 'not-functional' requirements are all the other 'ilities' beside the 'functionalities' of a system. Like the 'operations' related 'ilities' or the 'development' related 'ilities' (maintainability, habitability, portability, ...).
> [[HohpeGregor|Gregor Hophe]] calls them 'hidden requirements' because they exist, no one explicitly states them and everybody expects them. I'd like to call them 'architectural properties/requirementJ' according to my definition of 'software architecture'
{{< /alert >}}

{{< alert >}}
> [!question] How does this relate to software entropy
> Elaborate on how software architecture helps to address the problems with software entropy that we face
{{< /alert >}}

## Nuggets to take away

Here are some key arguments to take away

{{< alert >}}
> [!info] Every System has a structure
> While there is certainly a structure in every system (that can be derived from the definition of the term "system") not every system has an architecture
{{< /alert >}}

{{< alert >}}
> [!info] Software Architecture is a means
> The architecture of a software system should not be defined because of technolgoical coolness or the like. There must always be a business reason to which architectural decission can be traced back. Here come things like [[ADR|Architecture Decision Records]] into play as they provide a mechanism to connect architecture work with requirements and reasoning
{{< /alert >}}

{{< alert >}}
> [!summary] Architectural decisions have to fit the economic context of the software system
{{< /alert >}}

{{< alert >}}
> [!summary] Architectural decisions have to fit the social context of the software system
{{< /alert >}}

## References

Articles and books referenced in this article

[^1]  <https://en.wikipedia.org/wiki/System>
[^2] [[TheArchitectureOfComplexity|Architecture of Complexity]] by [[SimonHerbert|Herbert A. Simon]]
[^3] <https://renegadeotter.com/2023/09/10/death-by-a-thousand-microservices.html>
