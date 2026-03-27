# Q4 Nexus Permission Sets Design Review

**Source:** https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo

---

# Problem Space Review
# Post-Q4 Nexus/Smart Screening Permission Sets Design Review
Author: Ben Garrett
Author’s team: PAC
Status of this document: Draft
Design Review Date and Time: <<a href="https://indeed.atlassian.net/wiki/spaces/DESIGNREV/pages/128942089/Schedule+a+design+review">SCHEDULE A DESIGN REVIEW</a> AND INSERT THE DATE AND TIME HERE>
Design Review Recording: https://indeed.zoom.us/rec/share/K7H_J-kJQc4SXMalAtQKewhUY8V7yrMABY05CJaXXA5z_ZVGsCjspzvsZ6rKsmw3.cs1cKSdc9TEgm8iG
Design Review Ticket: <<a href="https://design-review-webapp.sandbox.indeed.net/">CREATE A DESIGN REVIEW TICKET</a> (DESIGNREV)>
Expected Project Longevity: Pick One...
# This template is maintained by the software design review guild. You can find us at design-guild@indeed.com or on Slack <a href="https://indeed-pte.slack.com/archives/C0224D8HXBQ">#software-design-review-guild</a>. Instructions for <a href="https://wiki.indeed.com/display/Guilds/Software+Design+Review+Guild">joining can be found here.</a> We also host biweekly office hours; find them on the Design Review calendar (or <a href="https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NGs3ZWkwaTNqaGQydGFldTBna20xcTN2bmtfMjAyNDAzMDVUMTkzMDAwWiBpbmRlZWQuY29tX2M4aWJwbWgwN245N3FqdGRmN2dta3YxcHZrQGc&tmsrc=indeed.com_c8ibpmh07n97qjtdf7gmkv1pvk%40group.calendar.google.com&scp=ALL">add to your own</a>)!
# Starting a new design review? Create the DESIGNREV ticket and a copy of this template in one go via https://design-review-webapp.sandbox.indeed.net/
# Before your review:
# · Click Share > Change General Access to Indeed > Change Role from Viewer to Commenter > Select “Can find in search results”
# · Remove the instructional text (everything with this dark gray text color) from each section
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#e3uvguegvqs5">An appendix is available with optional additional sections.</a> The appendix contains questions and references that are helpful for completing some design reviews but not all. Please review this section for relevant material to your design and move sections that pertain into the technical design section.
# Interested Parties
# This table is used to assign stakeholders to the five key roles in our design decision-making process. The author and non-authors should fill in the columns with the appropriate individual. The Recommend (R) role drives the design. The Agree (A) role is for stakeholders who have veto power over the design. The Input (I) role provides necessary data and context. The Decide (D) role is for the single person with the final authority to approve the design.The Perform (P) role is for the person or team that will execute the outcome.
If you are interested in this design review, please add your name to the Input column along with your team below so that we know which functions and teams have reviewed the doc. If your role is Agree or Decide, make sure to mark your decision after the design review meeting.
# Recommend,Agree ✅❌,Input,Decide✅❌,Perform
Person : Team,Person : Team, Paul Moncznik  : Talent Platform,Person : Team,Person : Team
# Desired Feedback
# List any open questions that you need answered in the design review. If you are not looking for the design review to help answer open questions, please share that the intent is to reach a consensus or provide general feedback.
Look for chili peppers “🌶️” as an indication of specific sections where we need feedback.
· [FILL OUT THIS SECTION]
# Problem Space Review
# The Problem Space Review is the first step in the design review process. This review is important because it ensures alignment with the problem being solved before diving into technical details. Alignment should be reached here before deep-diving into the Technical Design Review section below. Ideally, a product manager can help drive the initial section of this design review (up to but not including the “Technical Design Review”). At a minimum, a TDM or other senior engineer could be a valuable partner in vetting ideas. Product Managers should help explain the business value driving this design review.
# Context
# Provide information to reviewers to help them understand why this design review is happening. For this section, assume an average Indeed software engineer who is not familiar with the project at hand. List any assumptions reviewers would need to know for this design (e.g., third-party software requires a relational DB).
See <a href="https://docs.google.com/document/d/1xuoEyLE2SaYBNpFt-DCwsgrlqHjonjbP29aevIP3uis/edit?tab=t.0#heading=h.s4dra3d1njt5">PAC - Q4 Smart Screening PRD</a> for additional details on Nexus/Smart Screening product requirements
# Terminology
# If needed, define any terms or acronyms that may not be widely known.
· Nexus/Smart Screening/Advanced Screening: terms used interchangeably for a new product that uses AI to evaluate candidates.
· Resource: Abstraction representing any entity a user may need to interact with on Indeed
· Verb: An action a user may take on a resource, commonly this includes Create, Read, Update, and Delete (CRUD), though other verbs are useful
· Permission: Canonically, a permission is always the pair of a resource and verb describing what action a user is attempting to take on a resource.
· Permission Set: A collection of permissions that can be assigned to a user for a given advertiser or organizational unit. Prior to FGP, this was the only point at which permissions could be granted.
· Organizational Unit (OU): At present this is an abstraction that simply wraps an advertiser. Permissions granted to a user on an advertiser are assigned at the OU.
· Employer user: A user associated with at least one advertiser, and actively logged in under an advertiser
· <a href="http://indeed.com">Indeed.com</a> user: An informal way to indicate an employer user has access to the traditional <a href="http://indeed.com">Indeed.com</a> employer experience, not added specifically to access Nexus experiences
# Components Affected
# List which components could be affected by this Design Review. Be sure to reach out to the teams that own these projects to ensure they have someone attend the review.
· pie-service
· pac-authorization-service
· Nexus
· Employer Navigation
· Candidates
· Messaging
· Interviews
# Problem Statement
# Provide a short description of the business or operational problem that your solution addresses. Then, provide the goals and non-goals this design review takes with regards to the problem. Goals should explicitly list what we are trying to accomplish, without referencing a solution. Non goals should list things that are out of the scope of this design.
Our authorization platform is designed to answer questions of the form: "can this employer_user take this action on this resource?" Nexus product requirements imply that the answer to that question is contextual on the product experience. For example, an employer_user may be able to view candidates from one product experience, but not from another. Thus, they want to ask questions of the form: "can this employer_user take this action on this resource in this product context?" This is not a question we have the infrastructure to answer, nor do most of the thousands of permission enforcement points across the Indeed ecosystem have the required information to ask that question. Thus, the question becomes, is there a general way we can recast the Nexus permission requirements which are sensitive to product context into standard authorization questions.
# Goals
# You should consider a short description of how you know when the goal is met
· Domain isolation: a team implementing permission checks in their API should only need to understand the resources in their domain
· Flexible feature development: Nexus can implement new features that have appropriate authorization without major redesigns
# Non-Goals
# You may wish to identify which non-goals are in the short-term vs never expected to solve
· Specific resource recommendations: without a concrete list of APIs needed for Nexus, we cannot develop recommendations for specific resources/permissions
# General Description of the Potential Solutions
# Describe the possible solutions. This section should be brief and primarily factual to give context for the pros and cons listed in the next section.
# Nexus Gateway API
The Nexus UX is primarily built on top of APIs from traditional <a href="http://indeed.com">Indeed.com</a> domains. Permission enforcement is focused on the API layer – if the Nexus UX disagrees with domain APIs on which users should be authorized for a given request, the simplest solution from a permissions perspective is to have the Nexus UX call a dedicated Nexus API that maintains its own authorization logic using dedicated Nexus resources. Likely this Nexus API would be checking for new, Nexus specific resources. Such a dedicated Nexus API need not be responsible for directly fulfilling any request – after verifying auth, it would likely just act as a pass through to existing Ind<a href="http://indeed.com">eed.com do</a>mains using trusted service-to-service communications.
Reusing Domain APIs Dedicated Nexus API
<img alt="A system architecture diagram illustrating user interactions with Indeed.com and Nexus UX, which access Candidates, Interviews, and Automations APIs within the Indeed Privileged Network. Authentication is required for API access." src="https://indeed-be.glean.com/api/v1/images?key=eyJ0eXBlIjoiRE9DVU1FTlRfSU1BR0UiLCJpZCI6ImZiZjBmZDY3NmE0MDNmODZiMjMyZmYxMWUwZDhkNWNiMDVkNWVjYmMwNDIyOTY4Mjc0ODJiMzU5M2MzYjBmZjMiLCJkb2NpZCI6IkdEUklWRV8xYi1WanRBLWNVV2dENlk1cDZVVG81djc3SUdNUktCdENhU2FYNEpncExYbyIsImV4dCI6Ii5wbmcifQ=="/>

<img alt="A system architecture diagram illustrating user interactions with Indeed.com and Nexus UX, accessing various APIs within the Indeed Privileged Network, including Candidates, Interviews, Automations, and Nexus APIs, with authentication (Auth) as a key component." src="https://indeed-be.glean.com/api/v1/images?key=eyJ0eXBlIjoiRE9DVU1FTlRfSU1BR0UiLCJpZCI6IjQwM2YyOTczZWI4NGRlYzRmMDhiN2ZkMGYzYmIwMmZlMTU2Y2VlNzU3M2U4YjM0NGZlNzc2ZjAzOWM0ZjRlZmIiLCJkb2NpZCI6IkdEUklWRV8xYi1WanRBLWNVV2dENlk1cDZVVG81djc3SUdNUktCdENhU2FYNEpncExYbyIsImV4dCI6Ii5wbmcifQ=="/>

This also greatly increases the level of control over what Nexus-only users can see. For example, the candidates graph may expose many more fields than are needed for the Nexus UX. Most permissioning solutions that would give direct access to one field in the candidates graph for a user in the Nexus UX will implicitly give that user access to all other fields in the candidates graph. Even if those other fields are not queried by the Nexus UX, a determined user with Nexus access could access those fields directly via OneGraph. If instead the Nexus UX communicates only with a Nexus API, that API can choose to only mirror relevant fields from the candidates graph.
# Increase Resource Specificity for <a href="http://indeed.com">Indeed.com</a> domain APIs
One challenge that arose during Nexus CGA1 permissions is that some resources are reused across many different APIs. For example, the hosted_candidate resource is used in permission checks for candidates APIs, interview APIs, messaging APIs, and automation APIs. This means any permission set that grants a user access to one API will generally give them access to all of the APIs that reuse the same resource. If each API were to instead have its own resource, the current Ind<a href="http://indeed.com">eed.com ex</a>perience could be maintained by adding all of those resource permissions to the Candidates permission set. However, it would then be possible to create new permission sets that contained some different combination of resources.
Current Shared Resources
# Permission Set,Permissions,,API,Permission Check
Candidates,Hosted_Candidate:CRUD,,Candidates API,Hosted_Candidate:CRUD
Jobs,Hosted_Job:CRUD,,Messaging API,Hosted_Candidate:R
Interviews API,Hosted_Candidate:R
Jobs API,Hosted_Job:CRUD
API-Specific Resources
# Permission Set,Permissions,,API,Permission Check
Candidates,Hosted_Candidate:CRUD Conversation:CRUD Interview:CRUD,,Candidates API,Hosted_Candidate:CRUD
Jobs,Hosted_Job:CRUD,,Messaging API,Conversation:CRUD
Coordinator,Hosted_Job:R Hosted_Candidate:R Interview:CRUD,,Interviews API,Interview:CRUD
Jobs API,Hosted_Job:CRUD
However, while increasing the specificity of resources beyond current levels is likely beneficial for both our ability to construct new permission sets and clarity at permission enforcement points, there is not an obvious level of specificity we can apply ahead of time that will necessarily enable all Nexus use cases.
While at our current scale we can readily add more resources to pie-service, taking resource specificity to an extreme (e.g. every subgraph must have its own resource) would eventually add significant overhead (drmx-auth headers contain a compressed evaluation of every RBAC permission) while carrying little additional information. An explosion in the number of possible RBAC permissions would also add a significant burden to the current efforts to evaluate RBAC permissions via ReBAC infrastructure. As the number of resources grows, the conceptual overlap between resources also grows, making it more likely an engineer trying to determine what permission should gate an API makes a mistake. Absent a concrete rule, we would recommend domain leads to examine what resources they use and consider whether it actually makes sense for their domain. Permission checks that don't make semantic sense within their APIs is an auth code smell, but we cannot expect to eliminate all borderline cases.
While having more specific resources that more accurately reflect the APIs they are used in may make it easier to build new permission sets that combine resources in unique ways, this only helps when the new permission set requirements fall along existing domain boundaries. Nexus features sometimes cut across domains in ways that would not have necessarily been anticipated by a first pass at improving resource specificity. For example, migrating Messaging APIs from the hosted_candidate resource to a conversation or message resource seems like a clear improvement in permissions clarity. However, it's less obvious that drawing a resource boundary between Messaging API and the Messaging Automation API is worthwhile (after all, creating a messaging automation implicitly creates messages). The distinction between Messaging and Messaging Automation is, however, relevant to Nexus.
# Enforce Nexus Specific Permissions Outside of Nexus APIs
Instead of creating a new wrapper API for Nexus or many new resources for existing domains, it may seem simpler to just create one new resource for Nexus and check for it in existing domain APIs. If we had a list of every API needed for Nexus, and did not need to migrate any APIs to fine-grained permissions model, this likely would be the fastest way to achieve the desired effect. However, this violates domain isolation and inverts the relationship between roles and permissions.
Now the auth layer of dozens APIs cannot merely understand the resources that are part of its domain, but must understand the product requirements of Nexus. As Nexus product requirements grow and domain teams evolve their APIs, this becomes a continuous technical burden for the entire organization and increased risk for broken access control. What the Nexus permission set authorizes a user for would not be defined centrally, but instead would be implicit in the decentralized permissions checks of various APIs.
In this approach without a true centralized Nexus API, the Nexus specific permission does not accurately represent a resource, but is instead a pointer to the Nexus "role." This inverts the centralized model of RBAC in pie-service, where a role entitles you to a set of permissions, and APIs simply verify the user is authorized for a given action. Instead the API must now attempt to understand some roles.
# UX Only Enforcement
If access to underlying APIs is not a concern, one way to ensure interoperability with all of the desired APIs is to give Nexus-only users the same permissions that current <a href="http://indeed.com">Indeed.com</a> employer users have (for example, the Hosted_Job and Hosted_Candidate resources should cover current Nexus features), but set up additional resources that represent the traditional <a href="http://indeed.com">Indeed.com</a> product experiences. If e<a href="http://employers.indeed.com/jobs">mployers.indeed.com/jobs </a>was gated behind a new Jobs_UX resource, and e<a href="http://employers.indeed.com/candidates">mployers.indeed.com/candidates </a>was gated behind a new Candidates_UX resource, then we might have the following permissionsets:
# Permission Set,Permissions
Candidates,Hosted_Candidate:CRUD Candidate_Profile:R Candidates_UX:R
Jobs,Hosted_Job:CRUD Jobs_UX:R
Nexus_Update,Candidate_Profile:R Screening_Criteria:RU Hosted_Job:CRUD Hosted_Candidate:CRUD
The major concern here is that these are powerful permissions. If the point of Nexus having restricted access is so that admins feel more comfortable bringing large numbers of ATS users and agency users onto the platform, it would undermine our credibility if those users could message candidates, update candidacy, or delete jobs that weren't even Nexus enabled in the first place with a basic understanding of how to inspect a session and copy a query.
# Describe the pros and cons of the possible solutions. Deep technical detail is not required, high-level estimates are fine. This will help inform reviewers as they provide feedback on which option to pursue. It is fine for the author to be opinionated in this section and propose their preferred solution. It may be worth calling out dependencies on Legal or Procurement. If so, review what type of <a href="https://wiki.indeed.com/display/LegalKnowHow/What+Type+of+Issues+Should+Be+Submitted+to+LPR">issues should be submitted for a legal product review</a> and submit a ticket if appropriate. Add your own criteria that help explain your recommendation.
# Criteria,Nexus Gateway API,Increased Resource Specificity,Nexus Resource on existing APIs,UX Only Enforcement
Domain isolation for long term support,Yes,Yes,No,Yes
API auth layer needs to understand a role,No,No,Yes,No
Granularity of access control for Nexus users,Individual field level,Domain/API level,API/query level,Route
Breadth of permission changes,Nexus,Many Employer APIs,Many Employer APIs,OneHost routing
How to extend to new Nexus features,Develop wrapper for new features in Nexus Gateway API,"When new Nexus features align with existing boundaries between resource domains, simply update the Nexus permissionset -> permission mapping in piedb. Otherwise, requires creating new resources in piedb and implementing new access checks in affected Employer APIs",Change auth logic in each affected Employer API,Add additional permissions to Nexus permissionsets as needed.
Reusability,"Pattern can be reused, but each new experience would have to build its own gateway","High when new use cases align with resource boundaries, low otherwise",Poor,High
Automatically get exclusion of Nexus-only users from  Indeed.com  experiences,Yes,Not unless  Indeed.com  UXs are pre-emptively modeled as separate resources,Yes,Yes
Can easily reuse existing OneHost remote modules,No,"Yes, unless  Indeed.com  UXs are pre-emptively modeled as separate resources","Have to trace remote module API calls, and ensure any of their APIs accept Nexus Resource",Yes
Compatible with strict zero-trust policies,No,Yes,Yes,
Overall Recommendation,,,Not recommended,Not recommended
# Selected Solution
# Blank until the conclusion of the review meeting. Once an option has been selected, document it here and provide a brief explanation of the rationale behind the decision. This will help readers that were not able to attend the review to understand the final conclusion.
# Option Selected
[Replace this with the name of the selected option]
# Rationale
[Optionally summarize the rationale for selecting this option]
# Problem Space Review Notes
# Blank until the review meeting. Somebody in the room needs to capture relevant notes as the review progresses, for post-meeting use by the presenting engineer. These are informal and should include anything in the meeting that clarifies the design, calls out some additional data to gather, suggests next steps, etc.
# STOP
Having completed the Problem Space Review section, get alignment from stakeholders on the problem we are solving BEFORE moving on to filling out the Technical Design Review section (see the tabs on the left). To check if you are ready to move forward with the technical design section review, hold a Problem Space Review meeting and answer the questions listed here. (For a more detailed outline of the overall process see the following flow chart:https://link.indeed.tech/KPXZA8 .)
# Before the Problem Space Review Meeting:
· Has the problem been clearly defined and put in context?
· Has the problem already been solved at Indeed?
· Has the impact of solving the problem been estimated?
· Have success metrics been identified?
After getting alignment (whether through a meeting or async discussion), check if the expected benefits justify the anticipated costs. If they don’t, communicate to stakeholders and shelve the design for now. If they do, continue to check in with stakeholders as you complete the Technical Design Review section.
# After the Problem Space Review Meeting:
· Has a high-level solution (e.g. build vs buy) been identified?
· Is the solution clearly scoped?
· Are partner teams willing to proceed with the chosen solution?
· Has the cost of the solution been estimated?
· Does the estimated cost vs impact of the solution warrant moving forward?
The Technical Design Review is in a tab labeled “Technical Design Review”
# Technical Design Review
# Technical Design Review
Author: Person
Author’s team: <INSERT YOUR TEAM NAME HERE>
Status of this document: Draft
Design Review Date and Time: <<a href="https://indeed.atlassian.net/wiki/spaces/DESIGNREV/pages/128942089/Schedule+a+design+review">SCHEDULE A DESIGN REVIEW</a> AND INSERT THE DATE AND TIME HERE>
Design Review Recording: <Record your Zoom meeting(s) and insert the link(s) here for those who cannot attend in person>
# This tab should not be filled in at all until the Problem Space Review tab is first completed and all check boxes in the <a href="https://docs.google.com/document/d/1XagUnSZWlfPOYYycAT0uS6bbk45qSmDOgrOKb4fMWdA/edit?tab=t.0#bookmark=id.p9m4gofs33y">stop sign section</a> at the bottom of that tab have been checked.
# Sometimes one PSR may result in more than one technical design. For example when a phased approach is called for where each phase has design changes, or when more than one application component needs its design to be described. This tab should be duplicated for each phase or major component as needed to cleanly separate design detail as needed to enable clarity.
# <a href="https://docs.google.com/document/d/1XagUnSZWlfPOYYycAT0uS6bbk45qSmDOgrOKb4fMWdA/edit?tab=t.5xyj4h7smmnl#bookmark=kix.e93zzoh4nj8n">An appendix is available with optional additional sections</a><a href="https://docs.google.com/document/d/1XagUnSZWlfPOYYycAT0uS6bbk45qSmDOgrOKb4fMWdA/edit?tab=t.5xyj4h7smmnl#bookmark=kix.e93zzoh4nj8n">.</a> The appendix contains questions and references that are helpful for completing some design reviews but not all. Please review this section for relevant material to your design and move sections that pertain into the technical design section.
# Interested Parties
If you are interested in this design review, please add your name below so that we know which functions and teams have reviewed the doc. Please fill in the Reviewed On column after you have reviewed the doc and left any comments you want. Please also add yourself as a watcher on the design review ticket associated with the design.
# Name,"Role, Team",Reviewed On
Person,"SWE, TeamA","Oct 12, 2023"
Person,"Product, TeamA","Oct 17, 2023"
Person,SRE,Date
· Reach out to <a href="https://wiki.indeed.com/display/Guilds/Design+Review+SME+Points+of+Contact">SMEs</a> in the relevant area of your design review.
# Desired Feedback
# List any open questions that you need answered in the design review. If you are not looking for the design review to help answer open questions, please share that the intent is to reach a consensus or provide general feedback.
Look for chili peppers “🌶️” as an indication of specific sections where we need feedback.
· [FILL OUT THIS SECTION]
# Assumptions
# List out the assumptions that you have for this design review. This should help readers understand your design.
· [FILL OUT THIS SECTION]
# Implementation
# Provide a more detailed description of the solution. If there are several deliverable components, a few sentences or bullet points about each are useful. Sequence diagrams, swim lanes, or other supporting imagery can be added here.
[FILL OUT THIS SECTION]
If you are creating a new <a href="https://wiki.indeed.com/x/qVt4D">Criticality Tier</a> 0 or 1 service or this design impacts the architecture of an existing Criticality Tier 0 or 1 service, fill in operations information.
If you are adding a new datastore or making non-trivial modifications, include the <a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#pm3h644xp5rl">data stores section</a>.
If you're proposing the inclusion of <a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#sfdivose0gwu">any technologies</a> that are not well-known in the Indeed ecosystem, tell us what and why.
Does your design open possible avenues for bad actors to use for fraudulent behavior? If so, include T<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#v596w6rrg8bg">rust & Safety.</a>
# Cost Analysis
# Explicitly list your initial and ongoing $ and FTE cost assumptions. Consider <a href="https://indeed.atlassian.net/wiki/x/lOqGCw">cloud costs</a>, SAAS costs, third-party vendor costs(including licenses, storage, and support). How many engineers and other Indeed employees will need to support this on an ongoing basis?
# Testing
# The testing phase is a critical aspect of the design process as it ensures the reliability, functionality, and quality of the proposed solution. This section outlines the testing strategy and methods employed during the project's development. Describe or link to your test plan here (<a href="https://indeed.atlassian.net/wiki/x/1xOSDg">Samples</a>)
# Privacy/Security
# Review this wiki and seek a security review (request via Slack by typing “/security” in any channel) if appropriate. All designs should consider privacy and security. Please consider the following questions while completing the implementation section.
Security
If any of the questions below are answered with ‘Yes’ then a security assessment would be required by completing an intake form by typing /security in slack. Once you receive the JIRA number for the SECTM assessment, please add the JIRA ticket# below. You can perform a self-service threat model by using the Ap<a href="https://appsecportal.sandbox.indeed.net/threat-model/">pSec Portal. </a>This will give you the option to also create a SECTM ticket.
Security Assessment JIRA ticket#: SECTM-XXXX
Tines automation on the engineering design reviews:
1. Does this system process T<a href="https://indeed.atlassian.net/wiki/x/hIldF#Data-Classification-Tiers">ier 5 data?</a>
2. Are you planning to use any new or emerging technology or novel approach that hasn’t been used in the production environment before? Are you planning to use an alternative to the pa<a href="https://appsecportal.sandbox.indeed.net/resources/paved-paths">ved path? </a>Are you making any changes to the paved path?
3. Are you planning to integrate your system with a third-party vendor where jobseekers’ demographic data/highly sensitive data would be stored/processed, or are you planning to integrate with the vendor’s chat bot or Gen AI solution?
4. Are you introducing any new AI features or AI-based integrations that would process/store Tier5 data, significantly change Indeed’s critical systems, or involve external user interaction?
5. Are you planning to introduce a change that you believe may pose a significant risk to Indeed?
a. Please describe your concerns.
Privacy
# · Request access to your team’s designated DPbyDD (Data Protection by Design & Default) Assessment in <a href="https://indeed.atlassian.net/wiki/x/m5WxE">this wiki page</a> to fill out and update details of any newly proposed products, services, or activities. This is used to provide a privacy-related risk analysis and rating as well as capture any risk mitigation efforts and ownership.
# · Handling PII: Review the <a href="https://wiki.indeed.com/pages/viewpage.action?pageId=77291751">Data Protection/Privacy catalog</a>, and fill out the <a href="https://docs.google.com/forms/d/e/1FAIpQLSdusc4HVzVDd4ThYF1MajrktRGjdeNVtTRQPHgpCDgWRFDPnQ/viewform">Data Protection Service Form</a> for Privacy assistance.
# Accessibility (A11y)
# Please review the <a href="https://indeed.enterprise.slack.com/canvas/C4FE7HT7C">#a11y Canvas</a> and seek support from the Marketplace Accessibility Team in Slack by posting in <a href="https://indeed.enterprise.slack.com/archives/C4FE7HT7C">#a11y</a>. Any designs that incorporate an externally facing front-end UI must complete accessibility checks. This includes 3rd party contracted vendors or open source. A ticket for manual accessibility review must be filed (not completed) pre-launch for new external products.
# What do I need to do?
1. Use A<a href="https://www.figma.com/design/fCfkO8OlqVuuIuMHj1bYut/A11y-Annotation-Kit?m=auto&t=lFtIEea5CONy1JhK-1">11y Annotation Kit </a>for Figma Designs
a. Come to office hours or post in our support channel if you need additional design review support.
2. Ensure that A<a href="https://indeed.atlassian.net/wiki/x/hYqoI">11y Highlander is installed </a>and has unit tests for your UI. These run our accessibility automated tests.
3. Submit a r<a href="https://indeed.atlassian.net/l/cp/E0fk0cQp">equest for an accessibility review </a>(a11y QA test) before launch.
# Quick Resources
· Accessibility Office Hours
· <a href="https://indeed.enterprise.slack.com/archives/C4FE7HT7C">A11y in PDLC</a>
# Open Questions
# List any open questions that require further investigation by the authors.
· [FILL OUT THIS SECTION]
# References
# If any…
· [FILL OUT THIS SECTION]
# Technical Design Review Notes
# Blank until the review meeting. Somebody in the room needs to capture relevant notes as the review progresses, for post-meeting use by the presenting engineer. These are informal and should include anything in the meeting that clarifies the design, calls out some additional data to gather, suggests next steps, etc.
# What Next?
# Here are a few questions to review before moving on to implementation:
· Is the solution scope still consistent with a Problem Space Review? (If not, this may need to be revisited with stakeholders.)
· Is the solution effort reasonably consistent with estimates from the Problem Space Review (If not, this may need to be revisited with stakeholders.)
· Have all technical dependencies been identified and documented?
· Are all external parties (e.g. the Security Team) in general agreement with needed changes? (This may not apply to every DR.)
· Have any follow-on steps not in scope been identified and documented?
# Appendix
# Appendix
# Please review this section for relevant material to your design and move sections that pertain to the technical design section.
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_8u7g8uvw6ys">Data Stores</a>: Include if you are adding a new datastore or updating an existing one.
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_yuqpwnbs1e7t">New Technologies</a>: Include if you are proposing to leverage a new technology to Indeed.
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_s1084kri2ln4">Ownership</a>: Include if new components are being introduced to Indeed.
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_h597yfq455ut">On call support</a>: Include if SRE on-call support is required for new components.
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_pd69welenqyx">Product Analytics:</a> Include if analytics are needed to understand product success, user behavior, etc.
Operations: Include if you are proposing adding a new component that needs SLOs, Monitoring, or on-call support.
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_80gl6qvckmz5">SLO</a>: Include if you are introducing new components
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_h8kg8srirvu6">Sizing</a>: Include if this solution will result in an increase in traffic to a component or data stored.
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_bp7d3atg84f">Monitoring</a>: Include if you are introducing a new component or updating existing monitors.
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_7nagm4l8qrq2">Maintenance</a>: Include if you expect any ongoing manual maintenance.
<a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_gvojnn5mih4">Rollout / Rollback Plan</a>: Include if you are replacing existing functionality with new components.
# Implementation
# Interface
# List any new interface definitions or changes to existing interfaces. The following templates are provided to help you capture the key interface definitions of common API types.
# · <a href="https://docs.google.com/document/d/1Wh5kgfhLO3hzT0_IcAdRfaDyjpw26Zz9hQCI7gog3Fk/edit">Kafka</a>
# · <a href="https://docs.google.com/document/d/1AmEdUUy1XSXVHu0DGF4nYlAqSVsWsaJtBeLgp8-SnQk/edit#heading=h.aueutc7t598">Graph</a>QL
# Data Stores
# List the underlying data stores you'll be using (MySQL, Mongo, HDFS, artifacts, other) and a brief description of the content of each. Schemas/index definitions may be included if they're critical or unusual, but are not required. Include information about sizing and traffic expectations.
# If you are adding a new datastore or making significant changes to an existing one, reach out to #help-persistence for questions about the design review when using MySQL or Mongo. Their early involvement will help prevent delays come deployment time and ensure a better understanding of your application they will help support. If you are storing or processing Confidential or Confidential+ information, fill in the <a href="https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo#_mfumgddlz2b0">Privacy/Security</a> section.
[FILL OUT THIS SECTION]
# New Technologies
# If you are proposing the inclusion of any technologies that are new to the Indeed ecosystem, tell us what they are and why you are including them. Indeed cannot indefinitely sustain the influx of new technologies, so deliberate sunsetting of existing technologies when new ones are introduced is a best practice. Note this is REQUIRED for Prod Tech problem space reviews.
· [FILL OUT THIS SECTION]
# Trust & Safety
# All designs should consider Trust & Safety implications. Consider the following questions while completing the implementation section.
# · If this is a new customer facing feature, does this open up a new avenue for fraudsters or other bad actors to harm users of indeed or reduce the quality of user experience? Is there user generated content that could be reported for quality issues?
# · Are there moderation signals that can be helpful for determining & preventing misuse of Indeed products?
# · If you have any questions or concerns, reach out via Slack (#trust-and-safety-all). What level of operations support would be required for implementing Trust & Safety capabilities?
[FILL OUT THIS SECTION]
# Product Analytics
# Key Performance Indicators
# Define the list of <a href="https://en.wikipedia.org/wiki/Performance_indicator">Key Performance Indicators (KPIs)</a>, i.e., the specific measurable values used to track the performance of the project and its progress towards achieving its goals and ensuring its continued business value. Include details about how this design supports their production and collection. <a href="https://wiki.indeed.com/display/Guilds/Software+Design+Review+Template+Section+Examples">Examples</a>.
# Logging
# Add details about logging (e.g., Logrepo logging, RUM action logging, Mixpanel) needed to support product analytics for this design. List new IQL indexes/fields, RUM actions, etc. Describe questions that are important to answer through logs/IQL queries, and consider adding mock IQL queries to answer those questions.
# Operations
# Ownership
# Describe in detail what team is going to own the solution and what their support model will look like. Note this is REQUIRED for Prod Tech problem space reviews.
# Criticality Tier
<a href="https://indeed.atlassian.net/wiki/spaces/SRE/pages/196546901/Service+Criticality+Tiers">Service Criticality Tier</a>: CT1
<a href="https://indeed.atlassian.net/wiki/spaces/Resilience/pages/179929250/Features+in+Backstage+Feature+Criticality+Definitions">Feature Criticality Tier</a> (Optional): FT1
# On Call Support
# If your design proposes new systems that will require on-call support, you’ll need to review and comply with https://wiki.indeed.com/display/SRE/SRE+On-Call+Onboarding+Hub.
# Sizing
# What kind of traffic do you expect your solution to receive? Roughly how much storage do you need, in databases or in artifacts?
[FILL OUT THIS SECTION]
# Service Level Objectives
# A <a href="https://en.wikipedia.org/wiki/Service-level_objective">Service Level Objective (SLO)</a> is a metric that measures how well a product is serving end users, the business, or the employees responsible for supporting it. Most services consider SLOs over request latency, error rate, system throughput, and/or availability. See the <a href="https://wiki.indeed.com/pages/?pageId=78268763">SLO Resource Hub</a> for details and <a href="https://wiki.indeed.com/display/SRE/Getting+Started+Creating+SLOs+-+Drafting+Service+Level+Objectives">examples</a>.
[FILL OUT THIS SECTION]
# Monitoring & Alerting
# Are there any interesting monitors beyond the basics, such as failed transmissions being persisted to a local disk? Consider performing a <a href="https://wiki.indeed.com/display/eng/Failure+Modes+and+Effects+Analysis+%28FMEA%29+Overview">Failure Mode and Effects Analysis (FMEA) exercise</a> to understand what monitors may benefit the service. Consider any monitors that may prevent SLO violations.
[FILL OUT THIS SECTION]
# Maintenance
# What manual maintenance is expected? For example, do you require periodic database pruning or archival?
[FILL OUT THIS SECTION]
# Rollout/Rollback Plan
# List of the specific steps that will be taken to deploy the solution in production. Also include the various ways this plan can fail and how the system can recover. You can use <a href="https://wiki.indeed.com/x/nBIvIg">this</a> as a template.
[FILL OUT THIS SECTION]
# image1.png
# image2.png
Maybe define this too since not all readers will understand CIAM internals
Another good one to define, especially given the context of advertiser/OU above
As in just expanding the abbreviation of OU, or something deeper?
Suggest adding the definition of Organizational Unit for those unfamiliar with with this org.
Similar to the Employer User definition just added
I would question if this is the fastest way. APIs that were not FGP based would have to be converted to check for FGP permissions as well.
I think it would be worth adding a criteria for "re-use of the model". How well does this prepare us not just for more Nexus features, but for other products like Nexus.
With a lack of clear recommendation, would this be a good spot to mention that option 1 and 2 are not exclusive?
Wait, really? Wouldn't the permissions model prevent things they don't have access to from being available?
I'm a little ignorant of the domain here, would you be able to elaborate on why one permission being used in others would grant access to all of them? That seems odd
That's a fair point. In my head I was thinking most of the APIs that would need to be patched are already associated with candidates resources and thus already have some FGP integration, but if we need to enforce Nexus permissions on APIs that don't use that resource, it will be a significant uplift, and its conceivable that those APIs might not have the identifiers needed to evaluate fine grained Nexus permissions.
All I'm saying is that if APIs A, B, and C are all gated using the same permission X, then giving a user permission X grants them access to all of A, B, and C.
I guess the wording could be clearer that I don't mean literally all APIs, just all APIs reusing a shared resource.
Just curious, but could we put a number to this? How many permissions do we have now, how many subgraphs? and how many different domains do we model (e.g. messaging, jobs, coordinator...etc)?
The specificity of resources in existing permissions does not have the resolution to distinguish individual fields. We can increase the resolution, and probably should increase it to some degree (see next solution), but it's not likely we'll ever have enough resolution to selectively enable or disable any arbitrary field in any arbitrary query.
OH i see, yeah that makes sense now. Thanks. Yeah I found this section a little confusing.
Plus we likely would need a high level of collaboration with external teams to make this work (if its put together the way I am thinking), which would add a significant bottleneck to execution.
I personally would downvote this solution. We should have a very compelling reason to break domain boundaries like this IMO.
Yes, I included it to show we considered this option, but I hoped it was clear this is not at all a path we want to support.
I guess this would probably be the IDEAL solution, but how feasible is it within our timeline? I'd really like to see this fleshed out a bit more with some data on how big of a bite this is. Also, really, we only need to increase the specificity for the resources that touch NEXUS, right? So that should lower our pool of resources to modify. I guess knowing that last bit is dependent on my ticket https://indeed.atlassian.net/browse/PACMAN-12263
Sorry if this has already been discussed and been rejected (in which case, it would be helpful to have a list of rejected solutions somewhere): If the goal is to actually gate UI access (as suggested in the PRD), has Nexus considered using something outside of normal data/API oriented permissions for gating that access.
IIUC, Sourcing does something similar, maintaining a list of authorized accounts in its own service. In this case, the Nexus automated user-creation + auth flow could add the required PAC permissions (e.g. candidate:read) and also add them to a nexus_restricted_access list. Then a check could be added to Dradis surfaces to block access to users on this list (which could be done pretty easily in the employer-routes repo).
If the desire is to control the user experience (independent of resources) then it shouldn't be controlled by PAC permissions (which are focused on resources)
I think some increase in specificity relative to the current state is definitely good. I don't know what an ideal level of specificity would be. I don't know that there's a clear standard for specificity that could be applied which would entirely solve for the Nexus use case.
I do have some hesitation about applying this as a whole solution. This is specifically bypassing current permission checks, which is not something we want to promote everywhere.
This was not discussed nor rejected as far as I'm aware.
While gating UI access is a clear goal, I'm not sure if that is to the exclusion of gating API resources or in addition to it.
If it is not a goal to gate access to API resources, then I would definitely question how much this is even in PAC's domain. If they want to manage their own allow lists for employer routes, I don't see a direct problem with that.
One complication, however, is that as I understand the requirements, a user who comes in via the Nexus automated user-creation flow, but is granted additional Indeed.com permission sets by an admin later, is then expected to gain access to all the standard Indeed.com experiences.
I think this would imply some shared control over the state of the routes allow lists between Nexus onboarding mechanisms and the PAC-UI which I doubt we want to be responsible for.
I agree with this point, and such criteria should be prioritized higher to ensure we are designing a scalable solution.
> a user who comes in via the Nexus automated user-creation flow, but is granted additional Indeed.com permission sets by an admin later, is then expected to gain access to all the standard Indeed.com experiences.
In my reading of the PRD, it wasn't clear to me that it couldn't be required to explicitly remove the restriction. If this were presented as an option alongside permissions in a UI, how objectionable would a separate "Nexus-only access restriction" flag (that directly controlled the allow list, rather than going through PAC) be compared to treating that as a separate Nexus permission?
> I think this would imply some shared control over the state of the routes allow lists between Nexus onboarding mechanisms
That's definitely a reasonable concern, if disabling the Nexus-only restriction can't be made explicit when managing permissions (as discussed above)
The diagram was a little confusing because of the term "Nexus User". This is a user with 'only' a nexus permissionSet. Being compared with a user with some of our standard permissionSets (jobs, candidates, etc). This is independent of where the user came from (either created on indeed.com or synced from an ATSs).
Is there any concern about this violating zero trust principles and preventing platform teams from enforcing auth in their domain? Interviews is planning to implement zero trust auth requirements for our gRCP APIs in FY26, ensuring that all requests have actor information and that we perform auth checks for the actor. We reference this in our technical vision here: https://docs.google.com/document/d/1Y94Flc2j1A4BTkeyjjAJDlAeghmTVPxCpUlLlt7fkCM/edit?tab=t.u6p0869d7q3m#bookmark=id.l8h0c4yl2hhd
Is this still a challenge now that the Nexus CSP will be surfacing both Interviews and Messaging CTAs? Or does this possibly suggest that we have the right permissions relationship by gating all of these features based on candidate-level access?
We'll be launching the MVP interviews integration this quarter, here's the PRD: https://docs.google.com/document/d/1F66TzJ2C_wQG6aVx3pLAq0BPLCZj9w3Lc7ObyreLjx8/edit?tab=t.soiyhuvy5jfa#heading=h.8wt7ccygscje
Super valid concern, but the current OneGraph architecture violates zero trust principles.
In effect, trusted clients are allowed to spoof their identity (such that a trusted client can act as the admin of an arbitrary advertiser), and the domain api can't tell the difference.
The doc mentions gRPC -- were you planning on verifying credentials, or allowing a client to arbitrarily specify the actor?
> In effect, trusted clients are allowed to spoof their identity
True true - this is enabled by the `allow-pass-*` headers, right?
> were you planning on verifying credentials, or allowing a client to arbitrarily specify the actor?
For now we're planning on allowing the client to specify the actor, so I guess you could say we're moving to a 0.5 trust principle 😆 but you make a good point that we may want to reconsider this and require credentials or some other non-spoofable data. I don't know that we can require our gRPC clients to provide that information to us just yet. It's likely we might find ourselves pushing this dependency out through multiple layers of clients, which is challenging as a single platform team. If we had a combined stance there's a world where this could be a CORGI-level piece of work to ensure all APIs enforce non-spoofable auth.
> True true - this is enabled by the `allow-pass-*` headers, right?
Yep
Moving to a pure credentials based approach is difficult when there are many async workers and cronjobs in the environment that aren't directly triggered by an active user session. It also leads to a lot of redundant work when the credentials do not directly contain the information needed for authZ. I really don't love our current system, but I don't see an obviously good solution. If I had to vote, I'd probably say we should have true zero-trust for OG, and trusted for gRPC with teams tightly managing allow-lists on their trusted endpoints.
No, I don't think it suggests Interviews already had the right permissions because they want to deny this feature to some users who do have some level of candidates access.
are you aware of any documentation on the Sourcing mechanisms?
I'd also like to be able to adopt that philosophy, but because Interviews manages quite a bit of logic around access to interviews based on a combination of permissions:
- CandidateSubmission access
- Hiring Events access
- Interviewer-level access
And because we are not confident that all of our clients have fully adopted all permissions requirements in the ever-changing landscape (e.g. FGP permissions checks, new Nexus requirements being discussed here), we don't believe it makes sense to delegate our auth checks to gRPC clients.
I don't know how Sourcing seat subscriptions are done from a technical standpoint, but @dominik@indeed.com might.
Also, adding friction to Nexus to come up with new APIs just for permissions. If there is a new initiative X in the future, would we then have to ask them to do the same?
I'm not aware of Interviews wanting to deny any user with Candidate Read access the ability to access interviews features. candidate_profile access is not sufficient for interview scheduling/querying - is that what you're referring to or are there some other requirements you're thinking of?
They want some nexus only users to be able to schedule interviews, which currently requires hosted_candidate:read, but they don't want those nexus only users to have access to everything that hosted_candidate:read, thus my statement that I don't see this as evidence supporting the idea that Interviews was already gated on the correct permissions. (I mean, you could interpret that as Interviews being gated correctly and everything else being wrong, but still.)
++1
@bgarrett@indeed.com would this mean making "Nexus" the product a resource in itself?
cc: @tonyyu@indeed.com for visibility
Yes, not recommending this, but that's the idea
Speaking from the Notifications/Messaging side, what we’re observing is that a growing class of sends are triggered by actions that are performed on behalf of someone, rather than by a user who is actively logged in.
In those flows, we often cannot tell:
- who actually performed the action,
- whether the actor is a human, an automation, or a shared account,
- or whose preferences and expectations should apply.
Today that ambiguity surfaces as “too many emails,” but from our perspective the missing piece is a clear, first-class notion of an acting principal vs a represented entity. Without that distinction, notifications can only apply coarse heuristics (campaign silencing, send limits, deny lists), which don’t scale and frequently produce incorrect outcomes.
We’re not asking CIAM to solve notification behavior, but having a reliable way to understand who acted, under what authority, and on behalf of whom would let downstream systems like Notifications simply enforce policy instead of inferring intent.
Yeah, if I'm understanding you, this sounds like a consequence of the way OneGraph lets trusted clients effectively spoof identity and thus gain authZ.
I really don't like that solution, but it's also not obvious to me that a more principled model simplifies policy enforcement for something like Notifications.
Unfinished sentence here?
When uses cases don't align, it seems the solution comes down to reducing the scope of the resource boundaries. This in itself should be a repeatable and scalable process that is driven by the resource owners (perhaps largely around rewriting permission sets that refer to the resource). Basically, this seems like it could be an advantage for this solution, not a drawback.
As the owner of a domain API, I'm not a fan of this solution. It introduces a tight coupling between our services and one specific surface (and I could easily see this becoming a slippery slope where we end up adding more surface specific resources in the future), and it will also slow down the ability of Nexus to iterate, since they would have to coordinate changes with any number of individual service owners.
I think I agree with what you're saying, I'm just trying to point out that it's hard to identify those boundaries before the new use cases arise, so we will have to continuously have those discussions.
To clarify, are you saying here that: a determined user can access fields they were granted even if they were not queried via the UX; NOT that they can access fields they were not granted?
Wanted to clarify because in the candidates graph, a user with Candidate_Profile but not Hosted_Candidate, can only access the Candidate_Profile subset of candidates graph fields. They cannot gain "access to all other fields in the candidates graph".
Does an alternative approach where instead of the Nexus API hit the various apis through the backdoor, enter through the front?
The Nexus API surface would check Nexus specific authorization pieces, but for the specific candidates/interview/etc calls there would be the existing requirement to have the correct set of permissions (so actually granted, not bypassed)
> a determined user can access fields they were granted even if they were not queried via the UX
Yes, that's all I was saying
++2
Sorry, not sure I follow: is ++ a vote for this hypothetical?