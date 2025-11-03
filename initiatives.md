# Brandon Murphy - Initiative History at Indeed

Complete list of initiatives from June 2022 - Present

---

## **2024 H2 (Jul-Dec)**

### GEODES & Compliance
- **TAKE/SAN Compliance** (PerPartyMetadata, IndeedPlus, Glassdoor) - SMBMSG-1319, EMRELP-1040, SMBMSG-1441
  - Implemented privacy compliance for 3 critical messaging workflows to enable data deletion and sanitization requests
  - Eliminated long-standing legal risks and GDPR/CCPA exposure across Indeed Apply, Glassdoor, and IndeedPlus integrations
  - Required close collaboration with multiple teams and user testing for Glassdoor workflow
- **DREMR Central GEODES compliance**
  - Met with Data Access and Governance team to ensure central messaging systems comply with data access policies
  - Established quarterly re-up process for access permissions
- **Conversation Central Needs for GEODeS**
  - Explored leveraging Litigation Hold work to power Conversation Aliased Messages display in Conversation Central
  - Enabled legal and support teams to access conversation data post-GEODES migration
  - Shared knowledge with Flow team for handoff
- **Missing Locale for DREMR Messages** - DRAGON-77
  - Drove data gathering and impact analysis to improve locale resolution from 89% to 94% (with 1% more in progress)
  - Championed fixing Indeed Plus Locale support due to user experience and legal impact
  - Worked directly with Legal to understand urgency and define precise requirements
  - Hosted cross-team syncs with CommsPlat and senior leadership to align on scope

### CORGI (Mandates)
- **PigIndex to Spark Migration** - DRAGON-73
  - Migrated legacy Pig-based data processing to modern Spark infrastructure
  - Set expectations to break work into manageable milestones that led to successful completion
  - Reviewed and refined deliverables with engineers throughout the project
- **64bit Account Id Migration** - SMBMSG-1446
  - Migrated messaging systems from 32-bit to 64-bit account IDs ahead of Indeed-wide mandate deadline
  - Proactively scoped work by collaborating with CORGI owners
  - Ensured system scalability for future growth
- **DREMR MongoDB Atlas migration to v6** - SMBMSG-1254
  - Upgraded 4 MongoDB Atlas clusters (dremr-metadata, dremr-messages, dremr-lookup-v2, dremr-relay) from v5.0 to v6.0 before EOL
  - Completed in QA first, then production with zero downtime
  - Maintained production stability while meeting compliance deadline
- **ELDARG Migration** - DRAGON-158
  - Migrated to updated Indeed infrastructure logging system
  - Prioritized and completed on schedule
- **HOBO to Docker-Compose** - DRAGON-80
  - Modernized local development environment from HOBO to Docker-Compose
  - Improved developer experience and onboarding time
- **Cross-region backup for all MongoDB Atlas Clusters** - SMBMSG-1549
  - Implemented disaster recovery capability across all messaging database clusters
  - Worked cross-functionally to enable X-region backup infrastructure
  - Reduced risk of data loss in regional outages
- **Unicode Support**
  - Enabled proper handling of international characters in messaging systems
  - Improved experience for non-English speaking users globally

### Operations
- **EVNT-6187** (Thanksgiving incident)
  - Primary POC for initial stages over Thanksgiving holiday
  - Sent communications, coordinated restoration efforts, and tracked action items
  - Prioritized and resolved post-retro follow-up items to prevent recurrence
- **Manual message delete post de-couple**
  - Addressed process gap after IMS/DREMR decoupling
  - Met with IT to discuss automation opportunities

### Handoffs
- **CAPM, DockedMessaging, DeleteOrphanAttachmentsTool, Push Notifications hand offs**
  - Successfully transitioned ownership of 4 major systems to other teams during reorg
  - Ensured knowledge transfer and operational continuity
  - Enabled team to focus on core DREMR and compliance work

---

## **2024 H1 (Jan-Jun)**

### Major Projects
- **CAPM (Conversation Alias) Roll Out** - SMBMSG-1027
  - Led efforts to determine target users in M/L/XL segment for pilot study
  - Coordinated dogfooding for ATS and prompted engineer presentations of findings
  - Deferred ramp-up by weeks to address team concerns about monitoring, workload, and exhaustion
  - Implemented improved monitoring and hosted CAPM observability knowledge share session
  - Successfully ramped to 100% in most markets (excluding Japan and India initially)
- **EVNT-5796** (8-week critical incident, 24M users affected)
  - Led 8-week critical incident response with zero data loss and mitigated €20M+ fine exposure
  - Prepared and sent regular executive updates to VP and CTO level
  - Ensured retro completion and action item identification with TF3
  - Streamlined stabilization by pulling new team members to contribute to end-to-end tests
  - Explained technical concepts to Legal team for well-informed mitigation plan
  - Transferred Legal meeting outcomes to tracked JIRA tickets
  - Improved future incident response time by 80%
- **Horizon M2: Basic Messaging and AI Messaging**
  - Identified staffing shortage threatening Horizon M2 goals
  - Influenced other TDMs to loan frontend engineers to deliver Basic Messaging
  - Identified and staffed SWE3 for AI Messaging within Messaging group
  - Guided SWE2s to resolve identified bugs in Horizon M2
  - Delivered on aggressive timeline through strategic cross-team collaboration
- **Generic Bounce Back Email** - Design and implementation
  - Guided senior SWE to design bounce-back solution for invalid email addresses
  - Provided design feedback and decomposed tasks to kick off project
  - Improved sender experience by providing clear feedback on delivery failures
- **IMS Migration for Asynchronous Consumer** - SMBMSG-1257
  - Identified scope of work needed to prepare for full IMS/DREMR decoupling
  - Delegated to team and ensured completion
  - Critical dependency for long-term architecture evolution

### CORGI
- **Navi Service Decommissioning** - Saved 4 months, completed in <1 week
  - Advocated for pausing Navi service migration months earlier, waiting for IMS migration progress
  - Strategic patience enabled decommissioning Navi AND Reminder Email in <1 week vs 4+ months originally estimated
  - Demonstrated foresight in identifying architectural dependencies
  - Avoided building short-term solutions that would need to be rebuilt
- **Dremr Indexes Deprecation** - Attempted, pivoted to Pig index migration
  - Attempted to deprecate 2 complex DREMR indexes by migrating clients to equivalent sources
  - Unsuccessful due to unanticipated EVNT and challenges for users manually querying DREMR data
  - Successfully pivoted engineers to focus on Pig index migration instead
  - Demonstrated flexibility when original plan wasn't viable

### Team Growth
- **Promoted Yuanyuan to SWE3**
  - Coached for nearly 2 years, developing him from SWE2-2 to technical leader
  - Promotion went through panel with zero questions - signal of strong preparation
  - Now leads major technical initiatives independently
- **Hired 3 contractors by end of Feb** (interviewed 13)
  - Overcame slow start due to low quality pipeline
  - Set up meeting with Outpost team on process and candidate quality improvements
  - Anecdotally saw quality increase after intervention
  - Set up internal interview process with technical round led by tech lead
  - Met hiring goals without sacrificing bar

---

## **2023 Q4 (Oct-Dec)**

### GEODES Initiative
- **Conversation Alias M0 & M1** - MVP delivery
  - Advocated for incremental delivery resulting in stable releases meeting initial objectives
  - Scoped MVP to Indeed TA accounts (internal dogfooding) for controlled rollout
  - Limited to new 1:1 post-apply conversations on Dradis jobs initially
  - Led one of two major initiatives for Get Email Out of Driver's Seat (GEODES)
  - Successfully migrated 2/3 of legacy DREMR traffic while increasing response rates from 16% to 21.5%
- **Messaging Attachment Strategy** - MVP rollout in <1 week
  - Delivered working attachments feature in under 1 week through aggressive scope reduction
  - Maintained long-term architectural vision while shipping incrementally
  - SMBMSG-280: Stored emails and attachments in S3 for IMS consumption
  - SMBMSG-283: Updated inbound relay service to retrieve from S3, upload to Blobby, include in messages
  - SMBMSG-287: Updated dremr-webapp to store message attachments with proper correlation
  - SMBMSG-288: Updated dremr-webapp to store complete message data
  - SMBMSG-292: Created S3 buckets with event-sourcing to SQS for processing pipeline
  - Follow-up work added PII compliance, file type restrictions, and edge case handling
- **Participant Management M0** (helped)
  - Supported participant management system for controlling who can message whom
  - Critical component of GEODES privacy and safety model
- **Global Docked Messaging** (helped)
  - Contributed to expanding docked messaging UI across global markets
  - Improved accessibility of messaging on mobile devices

### Horizon
- **Horizon M2** - Scope definition, candidate ranking, basic messaging, AI messaging
  - Spearheaded scope definition and reduction focusing on core features
  - Kept work focused and on track for aggressive timeline
  - Successfully delivered despite high complexity and cross-team coordination needs
- **ims-components** - Shared UI components repository
  - Maintained main repository of shared UI components for Messaging
  - Enabled consistency across Employer and Job Seeker messaging experiences
  - Facilitated faster development for teams building on messaging platform

### Infrastructure
- **Jenkins to GitLab CI Migration** (mandate)
  - Migrated messaging repositories from Jenkins to GitLab CI ahead of company-wide mandate
  - Improved CI/CD pipeline reliability and speed
  - Completed alongside multiple other priority initiatives
- **Java 18 Upgrade** (mandate)
  - Upgraded messaging services to Java 18 before deadline
  - Maintained production stability throughout upgrade
  - Addressed alongside P0 feature work
- **64bit Account ID Migration** (mandate)
  - Updated messaging systems to handle 64-bit account IDs
  - Ensured scalability for future user growth
  - Critical dependency for broader Indeed architecture evolution

### Supporting Work
- **HQM Realtime Messaging** (helped)
  - Supported Hourly Queue Messaging team on realtime messaging implementation
  - Provided architectural guidance and code reviews
- **Parts of Dremr deprecation** (helped)
  - Contributed to broader effort to migrate away from legacy DREMR systems
  - Identified opportunities for parallel work and coordination
- **Employer Messaging GQL API** (helped)
  - Supported development of GraphQL API for employer messaging
  - Enabled modern frontend development patterns

---

## **2023 Q3 (Jul-Sep)**

### Primary Focus
- **Conversation Alias** - Led team through at-risk project to green status
  - Project was most at risk to block broader GEODeS schedule spanning multiple teams
  - Took action to re-focus team, shuffle priorities, and adjust work assignments
  - Project moved from red/yellow status to green
  - Critical milestone for Get Email Out of Driver's Seat initiative
- **Took on team's DFR responsibilities for 2.5 months** to unblock engineers
  - Personally absorbed on-call/operational burden for entire quarter
  - Allowed engineers to be 100% focused on Conversation Alias delivery
  - Demonstrated servant leadership by removing blockers directly
  - Resulted in successful project delivery on aggressive timeline

---

## **2023 Q2 (Apr-Jun)**

### Messaging Platform Evolution
- **Timeline UI Components** - Shared across Job Seeker and Employer
  - Built reusable UI components for message timelines used across both employer and job seeker experiences
  - Eliminated duplication of effort across GM lines through shared design and development
  - Reduced dependency on HTML email content, increasing team velocity
  - Provided autonomy for message type owner teams for faster experimentation
  - Achieved 90%+ code coverage for rapid iteration over time
- **Attachment Improvements** in messaging
  - Enhanced attachment handling in legacy messaging systems
  - Improved reliability and user experience for file transfers
- **Migrating Employer Messaging Services to AWS**
  - Migrated messaging infrastructure from on-premise to AWS
  - Improved scalability and reliability of messaging platform
- **Messaging FBEs (Frontend Backend Extensions)**
  - Implemented frontend backend for employment pattern for messaging
  - Enabled richer client-side experiences with server-side coordination
- **Multi-recipient Fixes**
  - Fixed bugs in multi-recipient messaging scenarios
  - Improved group messaging reliability
- **Conversation Alias Planning** - Selected to lead iterative delivery
  - Chosen by steering committee consensus to lead Conversation Alias work iteratively
  - Recognized for influence toward iterative development across messaging
- **DB Schema Tech Debt Fix** - SMBMSG-838, SMBMSG-1063
  - Pushed back on GEODES timeline to fix database schema technical debt first
  - Moved jsId and aggJobId from nested scope field to first-class attributes in DynamoDB
  - Built reusable migration infrastructure (backup system, transformation pipeline)
  - Ran transformations in QA then Production across all existing data (V2.0, V2.1)
  - Delayed milestone by weeks but enabled better long-term performance and querying
  - Infrastructure paid dividends for subsequent schema upgrades
  - Learned to be more thorough in testing after oversight during verification

### Supporting Work
- **Support for 21 client issues**
  - Resolved 21 support issues fixing problems reported through client support
  - Improved production stability and user experience
  - Reduced support burden on partner teams
- **Show and Tell** - Created demo format that expanded org-wide
  - Started as team's demo day, expanded to all six teams across GMs
  - Included presentations from engineering, UX, product, and client teams
  - Engineers from team continue to lead meeting org-wide
  - Improved visibility and celebration of progress across organization

---

## **2023 Q0 (Jan-Mar) - First Full Review Cycle**

### Priority 0 (P0) Work
- **Shared Messaging Timeline UI Components** - Delivered iteratively starting in January
  - Lobbied for iterative approach vs original plan (code complete Feb, ramp Mar)
  - Led team to iteratively ramp pieces into production as early as January
  - Enabled faster learning and contributed to successful delivery on aggressive timeline
  - Pushed for 90%+ code coverage enabling rapid iteration over time
  - Now code complete and ramped to 100% in en_US
- **One Host Migration** - 4X drop in page load time for Inbox
  - Led team to complete rollout of Inbox One Host migration world-wide to 100%
  - Resulted in 4X drop in page load time improving load performance for all users
  - Significant user experience improvement for millions of employers
- **Indeed Messaging System (IMS) Architectural Plan** - Build vs. Buy decision
  - Allocated senior SWE to work with messaging domain advocate on architectural planning
  - Participated in design review for build vs buy decision
  - Milestone: approved design ratified by 4 GMs to begin work on new IMS platform
  - Foundation for multi-year messaging modernization initiative

### Team Building
- **Built first Employer Messaging team from scratch**
  - Hired and onboarded engineers in 2022 who became among Indeed's strongest contributors
  - Established team culture emphasizing autonomy, iterative delivery, and high test coverage
  - Built one of the strongest teams at Indeed for independence and delivery velocity
- **Hired 3 engineers** - Now among strongest contributors
  - Successfully recruited and onboarded mid-level to senior engineers
  - Engineers operate with high autonomy and demonstrate leadership
  - Accounts for much of team's exceptional output and job satisfaction

### Partner Support
- Supported **HQM** on attachment upload, triage, single thread addition
  - Set up direct working relationship to speed up delivery and enable faster feature implementation
  - Onboarded two HQM SWEs to aid in One Host migration acceleration
- Supported **Employer Safe/Trust** on typingDNA integration
  - Enabled fraud prevention capability in messaging platform
- Supported **First Conversations** on ad-hoc interview migration to OG
  - Facilitated migration of interview scheduling to OneGraph
- Supported **Enterprise Candidate** team (ENTCAND-60)
  - Provided support for enterprise messaging features
- Supported **Data Science** on candidate connection cron job
  - Enabled ML model for candidate response prediction to run regularly

---

## **2022 Q3 (Jul-Sep) - First Quarter at Indeed**

### Initial Work
- **One Host Migration** - T0 OKR: 100% traffic through One Host
  - Assigned 2 SWEs to Candidates OH Tiger Team to accelerate migration
  - Began Employer messaging inbox OH migration (ramped in Oct/Nov)
  - T0 company-wide OKR to move 100% of traffic through One Host in all markets
  - Foundation for improved performance and modern architecture
- **Indeed Messaging System Architectural Planning** - Participated in design review
  - Allocated senior SWE to work with ENT messaging domain advocate (TF4)
  - Participated in design review for build vs buy architectural plans
  - Milestone achieved: approved design ratified by 4 GMs to begin work on new IMS
  - Multi-year platform overhaul initiated

### Team Formation
- **Built Messaging team from scratch**
  - Formed first T4 Messaging team in Candidates SMB
  - Responsible for employer inbox and docked messaging
  - Started with 0 engineers, grew to functional team within quarter
- **Hired first 2 engineers**
  - Shadowed 2 RDDs, hosted 4 team match calls
  - Two successful SWE hires, 1 onboarded immediately, other started 9/26
  - Negotiated transfer of two SWEs from First Conversation team (continuity - both had worked on codebase previously)
  - Built foundation of high-performing team
- **Set up direct working relationship with HQM team**
  - Established partnership to speed up One Host delivery
  - Provided HQM opportunity to implement features more quickly
  - Cross-team collaboration model became template for future work

---

## **Key Cross-Cutting Themes**

### Process & Culture Changes
- **Iterative Delivery** - Drove org-wide shift from waterfall (delivered value 4 months earlier)
  - Influenced TDM and PM leaders across messaging bridge team toward iterative development
  - Lobbied for artifact-driven iterative development with daily MR posts
  - Broadened weekly demos from just team to all of IMS to push mindset at grass roots level
  - Shifted culture toward continuous delivery vs big-bang releases
  - Enabled faster learning and risk mitigation through incremental rollouts
- **Weekly Demos** - Established "Show and Tell" format across 7 teams
  - Created demo format that started as team demo day, expanded to 6 teams across GMs
  - Engineers from team continue to lead org-wide meetings
  - Includes presentations from engineering, UX, product, and client teams
  - Eliminated redundant meetings, enabled faster information sharing
  - Improved visibility and celebration of progress across organization
- **Triage and Support Process** - Established for messaging org
  - Initiated and expedited establishment of messaging triage and support process
  - Improved ability to handle inbound customer complaints
  - Identified and fixed issues faster
  - Defined SLAs and reduced MTTR by 25%
- **Cross-team Resource Coordination** - Multiplied output 3-4x
  - Strategically coordinated work across 6+ teams to multiply team output
  - Successfully staffed and delivered messaging platform integration, email modernization, critical mandates
  - Brokered multiple team shares within IMS (Interview Navigator, ENTMSG, JSMSG)
  - Served as engineering POC for staffing and strategy across 5 concurrent high-visibility initiatives
- **Streamlined Jira** - Single project down from ~17
  - Consolidated team processes to utilize single Jira project
  - Reduced complexity and improved visibility into team work
  - Moved to self-service model for Conversation Central and Dremr Central access

### Leadership & Hiring
- **Scaled messaging org from 2 to 7 teams** - Charter definitions, onboarding, mentoring managers
  - Aided in scaling messaging org from 2 to 7 teams through charter definitions and onboarding coordination
  - Mentored managers across organization
  - Helped pivot new team to Messaging (AI suggested messaging for Horizon)
  - Provided oversight and guidance to help teams onboard to the space
- **Hired 7 FTEs and 3 contractors**
  - Interviewed and hired 7 FTEs and 3 contractors over tenure
  - Built team from scratch starting June 2022
  - Engineers became among Indeed's strongest contributors
- **Improved hiring process** - 4x increase in candidate success rate
  - Drove hiring process improvements that increased org-wide candidate success rate by ~4x
  - Worked with recruiting to improve pipeline quality
  - Set up structured interview processes with technical rounds
- **Led/coordinated 6+ teams** - Team of 12 + coordinated 6 additional engineers
  - Led teams of up to 12 engineers at peak
  - Coordinated work for additional 6 engineers across partner teams
  - Managed reporting including metrics, demos, Q&As to VP and CTO level

---

## **Initiative Count by Category**

| Category | Count |
|----------|-------|
| GEODES/Conversation Alias | 10+ |
| CORGI/Mandates | 10+ |
| Horizon | 5+ |
| EVNT/Incidents | 2 |
| Team/Org Building | 5+ |
| Process Improvements | 5+ |
| Supporting Work | 15+ |
| **Total** | **60+** |

---

## **Key Metrics & Outcomes**

- **24M users** affected by EVNT-5796 (zero data loss, mitigated €20M+ fine exposure)
- **4 months** of engineering work saved (Navi decommissioning in <1 week)
- **4x improvement** in page load time (One Host migration)
- **4x increase** in hiring candidate success rate
- **3-4x multiplier** on team output through cross-team coordination
- **20M+ monthly active** messaging users served
- **80% improvement** in incident response time
- **1.5M+ additional** messaging connections (OpenAI LLM integration)
- **Response rates increased** from 16% to 21.5% (messaging modernization)
- **100%+ team growth** year-over-year

---

## **Notable Achievements**

### Speed of Delivery
- **<1 week**: Attachments MVP rollout
- **<1 week**: Navi + Reminder Email decommissioning (saved 4 months)
- **2.5 months**: Personal DFR coverage to unblock team
- **8 weeks**: Led EVNT-5796 resolution

### Technical Leadership
- **Pushed back on leadership** to fix DB schema tech debt before GEODES ramp
- **Strategic deferral** of Navi migration saved months of work
- **Built reusable migration infrastructure** for database schema changes

### Team Impact
- **Zero questions at promotion panel** for Yuanyuan's SWE3 promotion
- **100% retention** through reorgs while maintaining high morale
- **Shielded team** from organizational chaos during 2 reorgs + 8-week EVNT

