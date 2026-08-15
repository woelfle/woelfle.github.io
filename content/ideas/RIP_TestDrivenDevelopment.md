---
rdf:type:
  - article
title: RIP Test Driven Development
iso27001:classification: public
---

Test driven development is dead. Sorry for that Kent Beck, but it is. Writing Tests before writing the code is nuts. How should I know what to test before I have implemented it. How should I know what to measure before I have observed it ... You can't expect that programmers write Tests before they implement the 'real code' ;) This is what I have heard from so many developers. And they are right! And they miss the point. That's why we should bury TDD. It leads them into the wrong direction. It is not about the test at all. It is about expectations. What is the expectation that my code should fulfill? And here comes the sad part. Thinking about expectations is hard. It is not as much fun as coding. We all love to open up our IDEs and start coding. That is fun. But thinking about expectations. Thinking about structure ... that is not fun ... So no wonder that TDD has such a hard stand. As with all XP practices (double check this from XP) it is not easy and requires discipline. But in the end this is what makes the difference. Are you a programmer or an engineer? So what do do instead? Talk about 'Expectation Driven Development'. Make that a first principle in your engineering teams. If they master that skill then they will have mastered one of the core competences in our new AI driven software development times.

"Expectation Driven Development" is more or less the "Scientific Method" of Software Engineering:

 1. **Observation:** Scientists begin by observing a phenomenon they want to understand -> A requirement formulated by a PO or the like. E.g. as a UserStory enters our consciousness
 2. **Question:** Based on their observations, scientists formulate a question about the phenomenon -> Asking questions to the domain/business/subject matter expert
 3. **Hypothesis:** A tentative explanation or prediction about the phenomenon is proposed as a hypothesis -> Here we write a Test to express our Hypothesis. True sentences about what the answers to the questions have revealed to us. We build up a mental model of the 'phenomenon'
 4. **Experiment:** The hypothesis is tested through experiments designed to gather data -> Now we implement the code
 5. **Data Analysis:** The data collected during the experiment is analyzed to determine if it supports or refutes the hypothesis -> We gather feedback from the domain/business/subject matter expert
 6. **Conclusion:** Based on the analysis of the data, scientists draw conclusions about the hypothesis and the phenomenon being studied.  -> If the Feedback is positive we are done. Otherwise we have to go back to point 3, adjust our Hypothesis and do it again
 7. **Communication:** Scientists communicate their findings to others, often through publications or presentations. -> This is now an implicit step since our 'well written' tests are our communication channel that describe what we have observed and what hypothesis have been proven to be correct.

 Looking for a tool to express expectations? Have a look at Gherkin with its 'GIVEN WHEN THEN' syntax and extend it with the most important but missing part: 'BECAUSE'. Formulate your expectations using that formula 'GIVEN WHEN THEN BECAUSE'. That is a scheme you can use to communicate with your domain experts. That is a language they understand. If you are good this will end up in test code the domain experts can read as if they have written it themselfes. As if it was their Hypothesis ;)
