# Performance in Software Engineering

## The Sports analogy

> [!abstract]
> How to measure the performance of software engineers has been a hard question ever since. How to evaluate the performance of an individual that is expected to work within a team. What can we learn from sports here? How is the performance of players been measured in Football, Soccer or Basketball? Can the learnings from there be transferred to Software Engineering? Lets think through this

It's a great lens, because sports faced exactly this problem earlier and more publicly than software did, and spent decades failing at it in instructive ways. Let me walk through what each sport actually learned, then pull out what transfers and where the analogy snaps.

### The shared starting mistake: counting stats

Every sport began by counting the visible, terminal events. Basketball counted points. Soccer counted goals. And every sport eventually discovered those numbers are actively misleading. A basketball player who scores 25 points on 30 shot attempts is _hurting_ his team — he's consuming possessions inefficiently — but the box score makes him look like a star. This is the first and most important lesson, and software's equivalents are lines of code, commits, or tickets closed. High output volume can mean someone is doing a lot of low-value or even negative-value work, and the raw count can't tell the difference.

### Basketball: the invisible-contribution problem

Basketball's big insight was _plus-minus_ — instead of measuring what a player does, measure what happens to the score margin while he's on the court. This captures contributions that never appear in any stat line: setting screens, defensive positioning, spacing the floor so teammates get better shots ("gravity"). The catch is that raw plus-minus is incredibly noisy, because your number is contaminated by your teammates. It took regularized, adjusted versions (RAPM) and huge sample sizes to isolate one player's marginal effect.

The transfer is direct and important: the most valuable engineers often contribute in ways invisible to any individual metric — unblocking others in code review, mentoring, writing the design doc that prevented three months of rework, the architectural choice that stopped a class of bugs from ever existing. The right question isn't "what did this person output" but "what happens to the team's output when this person is on the floor."

### Soccer: process over outcome

Soccer is the hardest sport to measure individually — low-scoring, fluid, continuous — and its breakthrough was _expected goals (xG)_. Instead of crediting the goal (a rare, luck-laden terminal event), you value the _quality of the chances created and the decisions made along the way_. A striker who consistently gets into high-probability positions is good even during a cold streak where the shots aren't dropping. Possession-value models take this further: they assign value to every pass and movement by how much it raises the probability of eventually scoring.

For software this is the argument for evaluating the _quality of decisions_ rather than the _outcome that happened to result_. An engineer can make excellent calls that get sunk by a market shift or a reprioritization, and a mediocre engineer can look great riding a project that was going to succeed regardless. Judging purely on shipped outcomes rewards luck and being assigned to the right project.

### American football: some roles you just can't measure with numbers

Football is hyper-specialized, and it made peace with the fact that offensive linemen are essentially impossible to evaluate statistically. Nobody counts a lineman's stats — they grade the film. Meanwhile quarterbacks get heavily context-adjusted metrics (EPA per play, DVOA) that account for down, distance, and opponent strength. Two lessons here: you cannot compare across roles with one number (a platform engineer vs. a feature developer is a goalkeeper vs. a striker), and for some roles expert review of the actual work is the _only_ valid method.

### What transfers

Pulling these together, a few principles survive the jump:

Value process over raw output, and contribution over terminal outcome. Measure a person's marginal effect on the _team's_ results, not just their personal stat line. Availability and consistency are themselves a skill — "the best ability is availability" is a sports cliché that maps neatly onto the reliable engineer who steadily ships versus the brilliant one who's unpredictable. Use several complementary measures and let none become the sole target. Adjust for context and role. And lean on expert review of the actual work — code review, design docs, and peer feedback are software's "game film," and they're arguably more trustworthy than any metric.

It's worth noting the field has already converged here. DORA metrics (deployment frequency, lead time, change-failure rate, recovery time) are deliberately _team_ metrics — they're the equivalent of moving past the box score, and their authors explicitly warn against using them to rank individuals. The SPACE framework was written more or less to make one argument: no single dimension captures developer productivity. That's the same conclusion advanced sports analytics reached — the number is a starting point for a conversation, never the verdict.

### Where the analogy breaks

I'd be careful not to over-borrow, because sports have structural advantages software doesn't. Sport has a clear, shared, agreed win condition and thousands of roughly comparable, observable "plays" per season generating dense data. A software engineer does a handful of large, _non-repeating_, non-comparable projects a year — a statistically thin, messy sample. Sport's feedback is immediate (the goal counts now); software's value is often delayed by months or years and shows up as the tech debt you didn't incur or the incident that didn't happen. Sport is largely zero-sum competition against an opponent; engineering is positive-sum collaboration, where the "opponent" is complexity and entropy. And crucially, public individual ranking works fine in sport but can quietly poison the collaboration that makes an engineering team effective — the moment people optimize their personal stats, the screens stop getting set.

So the deepest lesson from sports might be the cautionary one: even with clean objectives, dense data, and enormous financial incentive to get it right, sports _still_ can't reduce a player to a single number and rely on it. They use metrics to inform judgment, not replace it. Software, with far messier data and a fuzzier win condition, should be even more humble — measure the team's outcomes seriously, use individual signals as inputs to human judgment, and treat any single "engineer productivity score" the way a smart GM treats points-per-game: a clue, not an answer.

What's prompting the question — are you trying to design an actual evaluation system, or thinking about it more conceptually?

## The Orchestra analogy

> [!abstract]
> How to measure the performance of software engineers has been a hard question ever since. How to evaluate the performance of an individual that is expected to work within a team. What can we learn from professional orchestra here? How is the performance of players in an orchestra been measured? Can the learnings from there be transferred to Software Engineering? Lets think through this

It's a rich analogy, and I think it rewards being pushed on hard, because the orchestra comparison is seductive but breaks in some revealing places. Let me work through it.

### How orchestras actually evaluate players

The first thing worth noticing is that an orchestra separates evaluation into two very different phases, and conflates them almost never.

Getting _into_ the orchestra is done through the audition, which is famously ruthless and individual. You play excerpts, increasingly behind a screen, and the screen matters enormously. After orchestras adopted blind auditions in the 1970s and 80s, the share of women hired rose substantially—the classic Goldin and Rouse study found blind auditions explained a meaningful part of that shift. The lesson there is that they deliberately engineered the evaluation to strip away everything except the signal they cared about, because they knew human judgment was contaminated by bias.

But once you're _in_, ongoing evaluation looks nothing like the audition. There is no per-concert scoring of individual players. The concertmaster and section principals give feedback, tenure committees exist, and in extreme cases a player can be dismissed, but day-to-day there's no metric. Performance is judged mostly by peers and section leaders, by ear, in context, and it is overwhelmingly about _fit within the section_ rather than individual brilliance. A second violinist who plays technically perfectly but doesn't blend, doesn't watch, doesn't match bowing and phrasing with the rest of the section, is a worse orchestral player than someone slightly less skilled who locks in. That's a real and measurable-in-principle thing that no individual metric captures.

### What actually transfers

A few things map over cleanly.

The blind-audition insight transfers directly to _hiring_: separate the assessment of the raw skill from the noise of who the person is, and you get better signal. Work-sample tests in engineering interviews are the analog, and the evidence that structured, sample-based evaluation beats unstructured impression is about as strong here as it is in music.

The distinction between _entry evaluation_ and _ongoing evaluation_ also transfers, and I think it's underappreciated. Orchestras invest heavily in a hard, standardized gate, and then trust musicians and evaluate them loosely and contextually thereafter. A lot of dysfunction in engineering orgs comes from trying to run a continuous, quantified audition on people who are already employed—counting commits, lines, story points, PR throughput—which is roughly like scoring a violinist on notes-per-minute during the actual symphony.

The primacy of _fit and contribution to the collective sound_ transfers too. In both fields the thing you actually care about is the output of the ensemble, and individuals contribute to that in ways that don't sum linearly. The engineer who unblocks three others, reviews carefully, and writes the boring reliable code is the violinist who blends. Neither shows up in a solo metric.

### Where the analogy breaks—and this is the interesting part

I'd resist transferring too much, because software engineering differs from orchestral playing in ways that matter for measurement.

An orchestra plays a _fixed score_. The composer already solved the hardest problem—what should be played—and the player's job is faithful, expressive execution of a known target. Enormous skill, but bounded and specified. Most software engineering is the opposite: the largest part of the value is deciding what to build and how to structure it, and there is no score. This is closer to _composition_ or _jazz improvisation_ than to orchestral execution. That's why "measuring performance" is genuinely harder in engineering than in an orchestra: in the orchestra, correctness is largely observable against the score; in engineering, the score is what the engineer is partly inventing.

Second, orchestral performance is _synchronous and observable_. Everyone plays at once, in the same room, and errors are immediately audible to trained ears. Engineering work is asynchronous, distributed across time, and much of its quality only reveals itself months later—the design that ages well, the abstraction that didn't rot, the bug that never happened. The feedback loop in music is seconds; in engineering it can be years. Any measurement system has to reckon with the fact that the most important quality signals are heavily lagged.

Third, and maybe most important: in an orchestra the _evaluators are expert practitioners of the same instrument_, listening directly to the work. The concertmaster can hear a section. Much engineering evaluation, by contrast, is done by managers who don't read the actual code, using proxy metrics precisely because they've lost direct access to the work product. The orchestra's real secret isn't a clever metric—it's that judgment stays in the hands of people who can perceive quality directly. The transferable prescription is therefore uncomfortable: if you want good evaluation, you need evaluators who can actually read the work, i.e. senior engineers doing real technical assessment, not dashboards.

**So what would an "orchestra-inspired" approach to engineers look like?**

Roughly: a hard, structured, bias-controlled gate at entry; trust and contextual, peer-and-principal-based judgment thereafter; explicit valuing of blend and contribution to the collective rather than solo output; evaluation performed by people who can perceive the work directly rather than by counting proxies; and an honest acknowledgment that because there's no fixed score, you're evaluating something closer to a composer-performer than a pure executant, so judgment—not measurement—is doing most of the work, and that's a feature, not a failure.

The deepest lesson from the orchestra might be that they never fooled themselves into thinking the good stuff was quantifiable. They built strong institutions of expert judgment instead. The engineering industry's recurring mistake is hoping a metric will let it avoid building that judgment.

One caveat worth naming: orchestras optimize for a stable, repeatable product under a conductor's unified vision, which suits their strong-gate-then-trust model. A startup pivoting weekly is a different animal, and might legitimately need more continuous feedback than a symphony does. The analogy illuminates; it doesn't dictate.

Want me to push on any one of these threads—say, what a concrete "blind audition" for engineers could actually look like, or why proxy metrics like commits and story points fail in ways that are predictable from this framing?

## General thoughts about other areas

> [!abstract]
> Good move to widen the search, because no single domain shares _all_ of software's traits—but different fields each nail one of them, and you learn the most by matching a specific characteristic to the field that has already solved for it. Let me first name the traits that made engineering hard to measure, then find who else lives with each.

The traits worth tracking are: there's no fixed score, so you're partly inventing the target; quality signals are heavily lagged, sometimes by years; individual contributions to team output don't sum linearly; the work product is only legible to expert peers; and the output is a cumulative artifact that can quietly rot. Different fields have each of these in concentrated form.

### Surgery and medicine — lagged outcomes and the team-vs-individual problem

A surgical team is probably the closest match on interdependence plus consequential, delayed outcomes. Like engineering, the visible act (the operation) is a small part of the value; judgment about _whether and how_ to operate is the real skill, and there's no score telling you the right call. What medicine has painfully worked out is _risk-adjusted_ outcome measurement: you can't just count deaths, because the surgeon who takes the hardest cases will look worst. So they normalize for case difficulty. The direct engineering lesson is that raw output metrics punish people who take on the gnarly, high-uncertainty work, and any honest system has to adjust for difficulty—which is exactly what commit-counting fails to do. Medicine also relies heavily on morbidity-and-mortality conferences: structured, blameless peer review of what went wrong, by people who can actually judge the work. That's a strong model.

### Trial law and other advisory professions — no fixed score, adversarial uncertainty

A litigator, like an engineer, faces a problem with no known correct answer, an outcome that depends on forces they don't control, and quality that's only legible to other experts. The interesting lesson here is that good firms explicitly _don't_ evaluate lawyers on win/loss records, because outcome is too contaminated by case facts. They evaluate process quality and judgment—was the strategy sound given what was knowable at the time? This is the antidote to outcome bias, and it's directly transferable: judge the engineer's decisions against what was reasonable to know then, not against how it happened to turn out.

### Firefighting, aviation, emergency response — high interdependence, invisible good outcomes

These share engineering's cruel property that _the best outcome is often that nothing happens_. A pilot's or firefighter's best shift produces no dramatic event, which is impossible to reward with an activity metric. Aviation's response is the most sophisticated safety culture humans have built: near-miss reporting, no-blame incident analysis, checklists, and crew resource management that explicitly trains juniors to challenge seniors. For engineering the lesson is the whole _blameless postmortem_ practice, which the industry has in fact borrowed from aviation directly, and the recognition that prevented incidents are real value that no throughput metric will ever show.

### Scientific research — inventing the target, extreme lag, non-summable contributions

Research may be the single best match for "there is no score." A scientist decides what's worth investigating with no guarantee anything works, results validate over years or decades, and value is wildly non-linear (most papers matter little, a few change everything). Science's evaluation instrument is peer review plus long-horizon reputation, and its cautionary tale is instructive: the moment it adopted quantified proxies—publication counts, h-index, citations—people optimized the proxy and the science suffered (salami-slicing papers, citation rings). That's Goodhart's Law in a field structurally identical to engineering, and it's the strongest empirical warning against metric-driven evaluation of creative technical work.

### Writing, architecture, design — cumulative artifacts that rot, taste as the real skill

Building architecture is a lovely analog because the artifact is durable, must satisfy constraints (physics, budget, code) _and_ be good in ways only judgment perceives, and mistakes are expensive and slow to surface—much like a codebase. Editing and writing share the trait that revision, deletion, and restraint are where the value often is, which no line-counting metric respects; the writer who cuts 5,000 words has done real work. Architecture's model of the studio critique, and the master-apprentice progression, points at how taste gets transmitted and assessed when it can't be quantified.

### Team sports — the non-linear-contribution problem, but with better data

Sport is worth including precisely because it's a _partial_ match that got very good at the interdependence problem. Basketball's "plus-minus" and its refinements try to measure a player's effect on team outcome while they're on the floor, rather than their individual box-score stats—an attempt to capture the blend-and-unblock contribution that solo metrics miss. The important caveat is that sports could only do this because outcomes are frequent, immediate, and unambiguous (the ball goes in or it doesn't). Engineering lacks that fast, clean signal, which is exactly why you can't naively import sports analytics into it—but the _conceptual_ target (measure contribution to collective outcome, not individual activity) is the right one.

### Chefs in a professional kitchen — synchronous execution plus creative design

A kitchen is interesting because it splits into the two modes engineering blends: the line cook executing a known dish under time pressure (execution, immediately judgable, like ops or on-call) and the chef designing the menu (creative, no score, judged by taste and reputation). It's a reminder that "software engineering" isn't one thing—maintenance and firefighting are more like the line, greenfield design more like the menu, and they probably shouldn't be evaluated the same way.

### The thread that ties them together

Look across these and a pattern emerges: every field that faces engineering's hard traits—no score, lagged and probabilistic outcomes, expert-only legibility—has converged on roughly the same answer. They lean on _expert peer judgment_ rather than metrics; they evaluate _decision quality against what was knowable_, not outcomes; they use _structured blameless review_ of failures; and they _risk-adjust_ so the hard cases aren't penalized. The fields that tried to shortcut this with quantified proxies (science with citations, and arguably parts of medicine with crude scorecards) got Goodharted for their trouble.

The one genuinely encouraging counter-case is sport, which shows that _if_ you have a fast, clean, frequent outcome signal, you really can build good quantitative measures of individual contribution to a team. That tells you the real obstacle in engineering isn't philosophy—it's the absence of that clean signal, and effort is better spent shortening feedback loops (so quality becomes observable sooner) than inventing more elaborate proxies for the slow signal you have.

## Last output of the AI

If you want, I could take any one of these and go deeper—for instance, how medicine actually does risk-adjustment and whether an equivalent is constructible for engineering work, or the specific mechanics of aviation's crew resource management and what it implies for how juniors and seniors should interact on a team.

Good move to widen the search, because no single domain shares _all_ of software's traits—but different fields each nail one of them, and you learn the most by matching a specific characteristic to the field that has already solved for it. Let me first name the traits that made engineering hard to measure, then find who else lives with each.

The traits worth tracking are: there's no fixed score, so you're partly inventing the target; quality signals are heavily lagged, sometimes by years; individual contributions to team output don't sum linearly; the work product is only legible to expert peers; and the output is a cumulative artifact that can quietly rot. Different fields have each of these in concentrated form.

## Thoughts

> [!idea]
> What if we do some kind of 'blind evaluation' as it is done in orchestras, where we anonymize the work of a developer and then let others rate it?
