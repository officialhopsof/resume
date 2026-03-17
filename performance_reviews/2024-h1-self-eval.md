Strong (3)
Comment: CAPM Roll Out
• Led (https://indeed.atlassian.net/browse/SMBMSG-1027) the efforts to determine target users in the M/L/XL segment for pilot study.
• Coordinated the dogfooding for ATS and prompted the engineer to present findings.
• Deferred the ramp-up of CAMP M1 for a couple of weeks to address team concerns about
monitoring, workload, and exhaustion, which were raised during team discussions. Implemented a
plan to improve monitoring and hosted a CAPM observability knowledge share session, which
helped the team feel ready to proceed with the ramp-up.
• Decomposed the testing of PNO accounts into smaller tasks. An opportunity for Brandon was to
ensure a more thorough testing during the verification phase. An oversight on the common
scenario due lacking appropriate permissions led to ramping up the test, which had to be
immediately paused.

Guided the Resolution of EVNT-5796 (https://indeed.atlassian.net/browse/EVNT-5796)
• Along with the PM, prepared and sent out incident updates (https://docs.google.com/document/d/18UcmC_fPIHlIop_jdM5XKYQBLbSemte8VwrQvyss6dk/edit) to executives on a regular cadence
until the issue was fully resolved.
• Along with the TF3, ensured the retro was filled out and action items were identified.
• Ensured corrective actions not get lost in the latest team shuffle evidenced by MSGFLOW-193
• Streamlined stabilizing EVNT and onboarding new team members by pulling new team members
to contribute to end-to-end tests.
• During the clean up phase, effectively explained technical concepts to Legal to come up with a well-
informed mitigation plan.
• Kept team members focused on and engaged with highest priorities
• Filed tickets to ensure legal requests were fulfilled
• Transferred next steps of Legal meetings to JIRA tickets (https://indeed.atlassian.net/issues/?jql=issuekey%20IN%20%28MSGFLOW-177%2C%20MSGFLOW-175%2C%20MSGFLOW-174%2C%20MSGFLOW-173%29)
Horizon M2: Delivered Basic Messaging and AI Messaging:
• Identified a staffing shortage that may impact the achievement of the Horizon M2 goal. Influenced
other TDMs to loan frontend engineers to deliver Basic Messaging.
• Identified a SWE3 for AI Messaging within the Messaging group and influenced the staff decision
to deliver AI Messaging.
• Guided SWE2 to resolve identified bugs in Horizon M2.

Generic Bounce Back Email
• Guided a senior SWE to design the solution (https://docs.google.com/document/d/1O5i8NhT_fiKWZTGuxZkEw8iWxajTxAw0DEnTqTu2MUI/edit#heading=h.qolojiutyw1q) and provided feedbacks on the design (https://docs.google.com/document/d/1O5i8NhT_fiKWZTGuxZkEw8iWxajTxAw0DEnTqTu2MUI/edit?disco=AAABS5XOchI)
• Decomposed tasks and kicked off the project

Technical Enablement
• Called knowledge sharing sessions to equip engineers with sufficient knowledge to perform work
items.
• Designated experts so that the team could begin building knowledge even if some didn’t have
active development planned.
IMS Migration for Asynchronous Consumer - SMBMSG-1257
• Identified the scope of work and delegated to others. This work was needed to prepare for full
decoupling between IMS and DREMR.
CORGI
• Advocated for pausing Navi service until the readiness of CRS. Deferring the efforts prevented
from building a short-term solutions. And Navi service is not fully decommissioned.
• Attempted to deprecate 2 complex DREMR indexes by asking client applications to migrate to
other equivalent sources. The attempt was unsuccessful due to unanticipated EVNT and the
challenges to users who manually query DREMR data. Pivoted engineers to focus on Pig index
migration.

Coaching & Growth
• Coached 9 SWEs. Managerial Behavior Score: 100% / DEIB Score: 100%
• People reporting to Brandon highlighted that he is a people-servant management style, evidenced
by giving team members autonomy in project assignments.
• His reports also appreciated the efforts to keep the team focused and foster a transparent work
environment.
• Boosted the team’s morale: (1) Prior to the reorg, addressed low-quality external contributions that
were affecting code coverage and product stability, successfully staffed and delivered the project
via influencing a peer TDM.
• Promoted Yuanyuan to SWE3

From Self Eval:
• April: Was able to get Yuanyuan promoted with 0 questions at panel.
• April-July: Successfully led team of 9 through major reorg and product shift. Utilized members of
the team and external team resources to be able to get clarity on initiatives fairly quickly given the
ambiguity, complexity, and newness of the product area to all of the team.
• April-May: Completed Horizon M2 Basic Messaging and AI Messaging Initiatives (with borrowed
engineers). Handed off ongoing Horizon work to ARC.
• May-July: Negotiated and worked on hand offs for product shifts. EMP messaging, JS FE,
GEODES Ramp, DREMR...etc. Successfully ramped the team onto these new products and
offloaded the old ones. Designated experts so we could begin building knowledge even if we had
no active development plans.
• July: Led effort to successfully decommission Navi. Additional Context: I had previously had the
foresight to pause this effort knowing that if we waited for the IMS migration to get further along we
could avoid parts of the Navi migration altogether and save us a lot of work. By waiting until we
were close to the deadline to make the migration, we not only ended Navi with less than a week of
work, but also the Reminder Email, which was another bit of tech that we were previously
supporting.
• July-Sept: Devised plan to decommission Dremr Indexes. Unfortunately the EVNT ate up our
buffer time, and I initiated the switch to migrating the indexes. The flexibility of my plan allowed the
seamless pivot.
• Aug-Sept: Led team through an 8 week long EVNT-5796. Ensuring we had sufficient coverage,
communication, mitigation, and legal involvement. Worked with legal on follow up and will wrap
that effort up and ensure all items have an assigned owner and due date.
• Sept: Led team to ramp GEODES 1.3 S to India at 1% (had to ramp down)
• Involved coordinating, planning, and communicating the rollout as well as prioritizing and
reviewing the work needed to have an understanding of the challenges of the market.
• Sept: Led team to ramp GEODES 1.3 S to 100% excluding Japan and India
• Involved coordinating, planning, and communicating the rollout, including ensuring the team
was both operationally ready and knowledgeable enough to comfortably take on the additional
volume.
The list I provided above is not comprehensiveand is at a high level.
Overall I think I did the best I possibly could to keep my team focused and on task given the high rate of
change and ambiguity we faced these past 6 months. Not only have we had 2 reorgs, but also the
products we owned changed mid-way through as well. This coupled with the EVNT that took up nearly
2 months of engineer time for the whole team to get data for legal purposes hampered our ability to
deliver at the same rate that we have historically been able to. Even despite that, I am quite proud of
the things we have accomplished. For my part in this, I was a key driving force in keeping the team
focused as well as handling most of the change management for them so they didn’t need to. I was the
one who kept the team's morale fairly high throughout all of this by shielding them from the worst of it
as well offering support when overwhelm did occur. One example was that there was quite a lot of
anxiety on the team about owning the JS FE because it could be a lot of operational overhead. This
never manifested into a sizable amount of work, but the times there were issues with it, I was there to
jump in and quickly triage s

