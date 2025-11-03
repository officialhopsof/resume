# Tilt Product Interview - Examples from Brandon's Experience

## Product Strategy & Vision

### 1. Balance technical excellence with speed to market

**Example 1: Messaging Attachments MVP (<1 week delivery)**
- **Situation**: Needed attachments feature but could take months to build properly
- **Action**: Delivered working MVP in under 1 week through aggressive scope reduction
- **Result**: Maintained long-term architectural vision while shipping incrementally
- **Framework**: Identified "good enough" as basic S3 storage → Blobby upload → message correlation, then iterated on PII compliance and edge cases

**Example 2: Timeline UI Components - Iterative vs Waterfall**
- **Situation**: Original plan was code complete Feb, ramp March
- **Action**: Lobbied for iterative approach, ramping pieces to production starting in January
- **Result**: Enabled faster learning, contributed to successful delivery on aggressive timeline, achieved 90%+ code coverage for rapid iteration
- **Tradeoff**: More work upfront to enable incremental delivery, but paid dividends in risk reduction

### 2. Disagreed with product decision

**Example 1: DB Schema Tech Debt Before GEODES**
- **Situation**: Leadership wanted to push GEODES timeline forward
- **Action**: Pushed back to fix database schema technical debt first (moved jsId/aggJobId to first-class attributes)
- **Result**: Delayed milestone by weeks but enabled better long-term performance and querying; built reusable migration infrastructure that paid dividends for subsequent upgrades
- **Relationship**: Maintained strong PM partnership by explaining long-term benefits

**Example 2: Deferring Navi Service Migration**
- **Situation**: Pressure to migrate Navi service immediately
- **Action**: Advocated for pausing months earlier, waiting for IMS migration progress
- **Result**: Strategic patience enabled decommissioning Navi AND Reminder Email in <1 week vs 4+ months originally estimated
- **How Handled**: Demonstrated foresight in identifying architectural dependencies, explained waiting would multiply ROI

### 3. Evaluate whether feature request is worth building

**Example 1: Dremr Indexes Deprecation Pivot**
- **Situation**: Attempted to deprecate 2 complex DREMR indexes by migrating clients
- **Assessment**: Unsuccessful due to unanticipated EVNT and challenges for users manually querying data
- **Decision**: Pivoted engineers to focus on Pig index migration instead
- **Framework**: Evaluated effort vs impact, recognized sunk cost fallacy, made pragmatic pivot

**Example 2: Shield Test Migration Deprioritization**
- **Situation**: Team expected to migrate Shield tests
- **Assessment**: Current tests were low value and highly mocked
- **Decision**: Pushed to deprioritize in favor of redefining e2e tests from ground up with higher fidelity
- **Framework**: Value = test reliability + coverage; Cost = migration time; Better investment = rebuild with semantic testing

### 4. MVPs vs. building for scale

**Example 1: Conversation Alias M0/M1**
- **MVP Approach**: Scoped to Indeed TA accounts (dogfooding), limited to new 1:1 post-apply conversations on Dradis jobs
- **Scale Approach**: Built architecture to support eventual 2/3 of legacy DREMR traffic migration
- **Result**: Stable releases meeting initial objectives, increased response rates 16% → 21.5%
- **"Good Enough"**: Working for internal users first, proven pattern, then expand

**Example 2: CAPM Rollout**
- **Wrong Call**: Oversight during verification phase lacking appropriate permissions led to immediate pause
- **Learning**: Need more thorough testing during verification, even when trying to move fast
- **Correction**: Deferred ramp-up weeks to address monitoring concerns, implemented improved observability

## Product-Engineering Collaboration

### 5. Work with PMs to define requirements

**Example 1: Horizon M2 Scope Definition**
- **Approach**: Spearheaded scope definition and reduction focusing on candidate ranking, basic messaging, AI messaging
- **Result**: Kept work focused and on track for aggressive timeline
- **Ideal Relationship**: Active collaboration on what's truly MVP vs nice-to-have

**Example 2: Generic Bounce Back Email**
- **Process**: Guided senior SWE to design solution, provided design feedback, decomposed tasks to kick off project
- **Partnership**: PM defined the problem, engineering defined the solution approach, collaborated on scope

### 6. Engineering constraints impacted product scope

**Example 1: Navi/IMS Architecture Dependencies**
- **Constraint**: Navi migration would require significant rework if done before IMS migration
- **Communication**: Explained architectural dependencies to leadership, showed waiting would save 4 months work
- **Outcome**: Approved to wait, ultimately saved massive engineering effort

**Example 2: EVNT-5796 Impact on Roadmap**
- **Constraint**: 8-week critical incident affecting 24M users required full team focus
- **Communication**: Regular executive updates to VP/CTO level explaining impact, legal exposure (€20M+ fine), zero data loss achieved
- **Outcome**: Roadmap adjusted, but trust maintained through transparent communication

### 7. Involve team in product discussions

**Example 1: CAPM Rollout Decision**
- **Inclusion**: Team raised concerns about monitoring, workload, exhaustion
- **Action**: Deferred ramp-up weeks to address concerns, hosted CAPM observability knowledge share
- **Result**: Team felt ready to proceed after concerns addressed

**Example 2: Weekly Demos/Show and Tell**
- **Process**: Broadened weekly demos from just team to all 6 teams across GMs
- **Involvement**: Engineers present work to product, UX, clients - builds ownership
- **Impact**: Engineers from team continue to lead org-wide meetings

### 8. Advocate for engineering needs vs feature pressure

**Example 1: DB Schema Tech Debt (mentioned above)**
- **Business Case**: "Fixing this now costs 2 weeks but enables all future querying improvements. Not fixing costs us 2 weeks on every future feature that needs this data."
- **Result**: Approved, infrastructure paid dividends

**Example 2: Test Coverage Requirement**
- **Business Case**: Pushed for 90%+ code coverage in timeline UI while working on aggressive timelines
- **Result**: Enabled rapid iteration over time, reduced regression bugs
- **How Made Case**: "This takes 10% more time now but saves 50% time on every future change"

## Customer Focus & Impact

### 9. Ensure team understands customer needs

**Example 1: TAKE/SAN Glassdoor Compliance**
- **Customer Research**: Guided team to conduct user testing for Glassdoor workflow
- **Involvement**: Required close collaboration with Glassdoor, Indeed Apply, JSBE teams
- **Documentation**: Documented "how-to" test Glassdoor workflow for team learning
- **Impact**: Eliminated long-standing legal risks, improved privacy for users

**Example 2: Indeed Plus Locale Support**
- **Customer Pain**: 11% of messages had missing/wrong locale affecting 20M+ users
- **Technical Response**: Championed prioritization due to user experience AND legal impact
- **Result**: Improved locale resolution from 89% to 94%

### 10. Shipped something that didn't work well

**Example: CAPM Verification Oversight**
- **Issue**: Oversight on common scenario lacking appropriate permissions during testing
- **Discovery**: Ramped to test, had to immediately pause
- **Response**: Implemented improved monitoring, hosted observability knowledge share, deferred ramp-up weeks until team ready
- **Learning**: Need more thorough testing during verification phase, especially for common user scenarios
- **Change**: Now ensure permission scenarios are explicitly tested before ramp

### 11. Measure success of features

**Example 1: Messaging Modernization (GEODES)**
- **Metrics**: Response rates increased from 16% to 21.5%, migrated 2/3 of legacy traffic
- **Usage**: Used data to validate iterative approach was working, informed expansion decisions

**Example 2: One Host Migration**
- **Metrics**: 4X drop in page load time (improved performance for millions of employers)
- **Data Usage**: Performance data justified continued investment in modernization

**Example 3: OpenAI LLM Integration**
- **Metrics**: Generated 1.5M+ additional messaging connections
- **Technical Decisions**: Metrics informed ML infra team on risk acceptance criteria

### 12. Feature with significant customer impact

**Example: Unified Pre/Post Apply Conversations**
- **Impact**: Streamlined experience for 20M+ monthly active messaging users
- **Measurement**: Response rates, engagement metrics, user feedback
- **Success Factors**: Defined technical and product direction, iterative rollout, cross-functional collaboration

## Prioritization & Roadmap

### 13. Quarterly/sprint planning process

**Example 1: 2024 H2 - GEODES, CORGI, Operations**
- **Process**: Conducted monthly hindsight check-ins, set specific metric and delivery goals with everyone
- **Competing Priorities**: Balanced 10+ CORGI mandates, GEODES compliance, 2 major EVNTs, 4 handoffs
- **Capacity**: Built visualizations for capacity planning and project timelines for accurate reporting
- **Result**: Delivered all mandates on time while completing compliance work

**Example 2: Cross-Team Resource Coordination**
- **Process**: Multiplied team output 3-4x through strategic coordination across 6+ teams
- **Examples**: Brokered shares (Interview Navigator, ENTMSG, JSMSG), influenced other TDMs to loan frontend engineers for Horizon M2
- **Alignment**: Served as engineering POC for staffing across 5 concurrent high-visibility initiatives

### 14. Handle urgent requests/shifting priorities

**Example 1: EVNT-5796 (8-week incident)**
- **Framework**: Assessed legal exposure (€20M+ fine) + user impact (24M users) = P0
- **Protection**: Personally took on DFR responsibilities for 2.5 months to unblock engineers for critical work
- **Result**: Team stayed focused on highest priorities, zero data loss, 80% improvement in future response time

**Example 2: Multiple Reorgs + Product Shifts**
- **Situation**: 2 reorgs + product ownership changes mid-year (CAPM, DockedMessaging, Push Notifications handoffs)
- **Approach**: Shielded team from worst of organizational chaos, handled change management for them
- **Result**: Maintained high morale and productivity throughout

### 15. Cut scope to hit deadline

**Example 1: Horizon M2 Scope Reduction**
- **Original**: Large feature set for messaging integration
- **Cut To**: Candidate ranking, basic messaging, AI messaging (core features only)
- **Communication**: Spearheaded scope definition with PM, focused on "what must work for M2"
- **Result**: Delivered on aggressive timeline

**Example 2: Attachments MVP**
- **Original**: Full-featured attachment system with all edge cases
- **Cut To**: Basic S3 storage → Blobby → message correlation
- **Decision**: "What's minimum to prove value?" Follow-up added PII, file restrictions, edge cases
- **Result**: <1 week vs months, validated approach, iterated from there

### 16. Balance features, tech debt, operational work

**Example 1: Shield Test vs E2E Test Rebuild**
- **Decision**: Deprioritized Shield migration in favor of ground-up e2e test rebuild
- **Rationale**: Current tests low value, highly mocked; better investment = semantic testing
- **Framework**: "Not all test migration is equal; invest where it multiplies future velocity"

**Example 2: DB Schema Tech Debt Investment**
- **Balance**: Delayed GEODES weeks to fix schema debt
- **Buy-in**: Built reusable migration infrastructure, showed it would accelerate all future schema work
- **Result**: Infrastructure paid dividends for subsequent migrations

**Framework Used**:
- ~70% features (P0 OKRs)
- ~20% operational (incidents, support, monitoring)
- ~10% tech debt (but strategic - must enable future velocity)

## Technical Decision Making with Product Context

### 17. Technical decision influenced by product strategy

**Example 1: IMS Architecture - Build vs Buy**
- **Product Strategy**: Multi-year messaging modernization, need to scale to 20M+ MAU
- **Technical Decision**: Allocated senior SWE to work with domain advocate on architectural planning, participated in design review
- **Tradeoffs**: Higher upfront investment vs vendor licensing, but full control and Indeed-specific optimization
- **Result**: Design ratified by 4 GMs, foundation for platform evolution
- **Would Do Again**: Yes - gave us flexibility to iterate quickly based on learnings

**Example 2: Conversation Alias Iterative Delivery**
- **Product Strategy**: GEODES initiative to reduce email dependency, high-risk migration
- **Technical Decision**: MVP to TA accounts first (dogfooding), limited to new 1:1 conversations
- **Tradeoffs**: More deployment work vs big-bang release risk
- **Result**: Response rates 16% → 21.5%, stable rollout
- **Would Do Again**: Absolutely - de-risked major migration

### 18. Build vs. buy decisions

**Example 1: IMS Platform (Build)**
- **Factors**: Scale (20M+ users), customization needs, integration with Indeed infrastructure, long-term cost
- **Decision**: Build - Approved design for new IMS after architectural review
- **Outcome**: Multi-year investment paying off with performance and feature velocity

**Example 2: Leveraging Existing Services (Buy/Reuse)**
- **Example**: Litigation Hold work for Conversation Central aliased message display
- **Factors**: Service already built by CommsPlat, met requirements, faster time to value
- **Decision**: Reuse - Shared knowledge with Flow team for handoff
- **Outcome**: Faster delivery, leveraged cross-team investment

### 19. Technical solution unlocked product opportunities

**Example 1: Reusable Timeline UI Components**
- **Technical Solution**: Built shared UI components with 90%+ code coverage
- **Product Opportunity**: Eliminated duplication across Job Seeker and Employer, reduced dependency on HTML email, gave autonomy to message type owners for faster experimentation
- **Impact**: Multiplied team velocity, enabled rapid iteration

**Example 2: DB Schema Migration Infrastructure**
- **Technical Solution**: Built backup system + transformation pipeline for schema changes
- **Product Opportunity**: Enabled all future schema upgrades with confidence
- **Impact**: Powered subsequent migrations (V2.0, V2.1), reduced risk

### 20. Platform/infrastructure vs. features

**Example 1: IMS Migration Before Navi**
- **Signal**: Saw architectural dependency - doing Navi first would require duplicate work
- **Decision**: Wait for IMS progress
- **Case to Leadership**: "4 months of work now vs <1 week of work in 6 months"
- **Result**: Saved 4 months, decommissioned 2 services instead of 1

**Example 2: Test Infrastructure Investment**
- **Signal**: Low-value tests slowing velocity, high mock usage reducing confidence
- **Investment**: Rebuild e2e tests from ground up with semantic testing
- **Case**: "Current tests cost time but don't catch bugs; new tests cost less and catch more"
- **Result**: Improved velocity and quality

**Signals for Platform Investment**:
- Team velocity declining due to tech debt
- Same problem solved differently across teams (Timeline UI case)
- Near-term work would be obsolete soon (Navi case)
- Manual work that could be automated at scale

## Startup-Specific

### 21. Excites you about early-stage startup

**Why Tilt Excites Me**:
- **Influence**: At Indeed, influenced messaging org (7 teams); at startup, can shape entire eng culture from early stages
- **End-to-End Ownership**: Built first messaging team from scratch at Indeed - love the greenfield opportunity
- **Velocity**: My style (minimize process, maximize autonomy, iterative delivery) thrives in startup environment
- **Impact**: Attachments MVP in <1 week shows what's possible when you cut through bureaucracy

**Startup vs Larger Company**:
- **Larger**: More resources, established patterns, but slower decision-making
- **Startup**: Faster cycles, broader scope, but need to build infrastructure while shipping
- **My Strength**: History of doing more with less - multiplied output 3-4x through coordination

**Anticipated Challenges**:
- **Resource Constraints**: Need to be even more disciplined about what NOT to build
- **Ambiguity**: Need to define processes while executing (I've done this: built team from 0 → 12)
- **Wearing Multiple Hats**: Prepared to be both IC and manager when needed

### 22. Maintain quality while moving fast

**Non-Negotiables**:
- **Test Coverage**: 90%+ on critical paths (Timeline UI example)
- **Rollback Plans**: Always have escape hatch (learned from CAPM pause)
- **Security/Privacy**: GDPR/CCPA compliance non-negotiable (TAKE/SAN work)
- **Monitoring**: Must be able to detect issues fast (CAPM observability)

**Flexible Areas**:
- **Perfect Architecture**: Ship MVP, iterate (Attachments <1 week example)
- **Process**: Minimal meetings, lightweight documentation, focus on artifacts
- **Complete Feature Set**: Core features first, edge cases later
- **UI Polish**: Functional first, beautiful second (if customer-facing, balance this)

**Examples**:
- Timeline UI: Pushed for 90% coverage while moving fast on aggressive timeline
- Attachments: Shipped basic version in <1 week, added PII/restrictions later
- CAPM: Deferred when monitoring wasn't ready - quality gate worked

### 23. Resource-constrained: what NOT to build

**Example 1: Dremr Indexes Deprecation**
- **Important**: Reduce tech debt by deprecating complex indexes
- **Decision**: Said no after attempting - better ROI on Pig migration
- **Conversation**: "We tried, learned it's harder than expected, here's better investment"
- **Framework**: Sunk cost vs future value

**Example 2: Shield Test Migration**
- **Important**: Migrate existing tests to new framework
- **Decision**: Said no - rebuild from scratch instead
- **Conversation**: "These tests don't catch bugs; let's invest in better tests, not migrate bad ones"
- **Framework**: Migration cost + ongoing maintenance vs rebuild that improves velocity

**Framework for Saying No**:
1. **ICE Score**: (Impact × Confidence) / Effort
2. **Ask**: Does this multiply future velocity or just add features?
3. **Ask**: If we don't do this, what breaks?
4. **Communicate**: Show the math, offer alternatives

### 24. Shape engineering culture as early leader

**Values Most Important**:
1. **Autonomy**: Engineers own their projects end-to-end (my teams consistently report high satisfaction)
2. **Iterative Delivery**: Artifact-driven development, daily MR posts, weekly demos
3. **High Bar**: 90%+ test coverage, thorough reviews, but pragmatic (MVP first)
4. **Transparency**: Weekly demos across teams, visible work, candid feedback
5. **Servant Leadership**: Took on DFR for 2.5 months to unblock team

**How to Balance Culture + Execution**:
- **Culture IS Execution**: How we work defines velocity
- **Lead by Example**: I demo, I'm candid, I take operational burden when needed
- **Rituals**: Weekly demos became org-wide at Indeed
- **Hire for Values**: Hired 7 FTEs + 3 contractors with 4x success rate improvement

**At Tilt**:
- Establish demo culture from day 1
- Minimize process overhead, maximize output
- Build test coverage standards early
- Create safe space for candid disagreement (I challenge decisions respectfully)

## Data-Driven Decisions

### 25. Use data to inform technical decisions

**Example 1: Locale Issue Impact Analysis**
- **Data Gathering**: Drove IQL queries and data analysis
- **Finding**: Moved from 89% → 94% locale resolution (with 1% more in progress)
- **Technical Decision**: Prioritized Indeed Plus Locale support based on user impact + legal exposure
- **Instrumentation**: Set up tracking to monitor improvement over time

**Example 2: GEODES Success Metrics**
- **Instrumentation**: Response rate tracking, traffic migration metrics
- **Data**: 16% → 21.5% response rates, 2/3 traffic migrated
- **Decision**: Data validated iterative approach, informed expansion to more markets

**Example 3: One Host Performance**
- **Measurement**: Page load time tracking
- **Result**: 4X drop in load time
- **Decision**: Performance data justified continued modernization investment

**Approach to Observability**:
- Must be able to detect failures fast (CAPM observability session)
- Track impact metrics, not just technical metrics
- Use data to validate or invalidate assumptions

### 26. Decision with incomplete data

**Example 1: Navi Service Deferral**
- **Incomplete Data**: Didn't know exact IMS timeline, didn't know all dependencies
- **Approach**: Made educated bet that architectural dependencies meant waiting was better
- **Reasoning**: Even if IMS delayed, migration infrastructure would improve; worst case = same timeline
- **Outcome**: Saved 4 months - bet paid off

**Example 2: CAPM Rollout Scope**
- **Incomplete Data**: Didn't know how all edge cases would behave at scale
- **Approach**: Scoped to M/L/XL segment pilot first (dogfooding)
- **Reasoning**: Start narrow, learn, expand - incomplete data is fine if you can iterate
- **Outcome**: Found permission issues in pilot, fixed before wide ramp

**Framework**:
1. What's the worst case if we're wrong?
2. Can we make decision reversible? (feature flags, small batches)
3. What can we learn quickly to reduce uncertainty?
4. Is waiting for data more expensive than potentially being wrong?

### 27. Balance qualitative vs quantitative

**Example 1: CAPM Team Concerns**
- **Quantitative**: Capacity calculations showed team could handle volume
- **Qualitative**: Team raised concerns about monitoring, exhaustion
- **Decision**: Weighted qualitative higher - deferred ramp weeks
- **Rationale**: Burnout risk + poor monitoring = incidents later; morale matters
- **Conflict Resolution**: Added observability (quantitative fix for qualitative concern)

**Example 2: Test Quality vs Migration Timeline**
- **Quantitative**: Shield migration = X weeks of work
- **Qualitative**: Team feedback that current tests didn't catch real bugs
- **Decision**: Weighted qualitative - rebuild tests instead
- **Rationale**: Numbers said migrate, experience said tests were low value

**When to Weight Each**:
- **Quantitative**: Business decisions, capacity planning, performance optimization
- **Qualitative**: Team morale, user experience, architectural direction
- **Both**: When they conflict, dig deeper - often means you're measuring wrong thing

## Cross-Functional Leadership

### 28. Working with Design

**Example 1: Timeline UI Components**
- **Collaboration**: Built shared UI with UX across Job Seeker and Employer GMs
- **Tradeoff**: Designer wanted richer interactions, engineering pushed for simpler MVP first
- **Resolution**: Shipped functional version, agreed to iterate on polish
- **Technical Reason**: Complexity would slow initial delivery; simpler version easier to test and maintain

**Example 2: Docked Messaging Global**
- **Collaboration**: Contributed to expanding docked messaging UI across global markets
- **Tradeoff**: Design consistency vs local market preferences
- **Approach**: Defined component API that allowed customization within constraints

**When to Push Back**:
- Implementation cost >> incremental UX value
- Design creates performance issues
- Design requires architecture we're deprecating

### 29. Collaborate with Sales/CS/Support

**Example 1: Client Support Issues**
- **Process**: Resolved 21 support issues fixing problems from client support (Q1 2023)
- **Feedback Loop**: Support tickets → priority assessment → fixes
- **Product Improvement**: Reduced support burden on partner teams, improved stability

**Example 2: Generic Bounce Back Email**
- **CS/Support Input**: Users confused when emails failed without feedback
- **Product Decision**: Built bounce-back solution for invalid email addresses
- **Result**: Improved sender experience with clear feedback

**Example 3: TAKE/SAN Compliance**
- **Legal Input**: GDPR/CCPA deletion requirements
- **Product Decision**: Implemented privacy compliance for 3 critical workflows
- **Result**: Eliminated long-standing legal risks

**Gathering Feedback**:
- Triage support tickets weekly
- Partner directly with teams (HQM, ENTMSG, etc.)
- Make engineers accessible for questions

### 30. Align multiple stakeholders

**Example 1: EVNT-5796 (8-week incident)**
- **Stakeholders**: VP/CTO (executives), Legal (compliance), Engineering (resolution), PM (communication)
- **Approach**: Regular executive updates with technical concepts explained for Legal, action item tracking, retro completion
- **Alignment**: Everyone understood exposure (€20M+ fine), impact (24M users), progress (zero data loss)
- **Result**: Trust maintained, corrective actions completed, 80% faster future response

**Example 2: Locale Issue Resolution**
- **Stakeholders**: CommsPlat (owners), Legal (requirements), Senior Leadership (priority), Engineers (implementation)
- **Approach**: Hosted x-team syncs, drove precise requirements from Legal, aligned on scope
- **Technical Decision**: Prioritize Indeed Plus Locale based on user + legal impact
- **What Different**: Could have involved stakeholders earlier in discovery phase

**Alignment Approach**:
1. Identify what each stakeholder cares about (Legal = compliance, Eng = feasibility, etc.)
2. Frame decision in terms of their concerns
3. Show tradeoffs clearly
4. Get decisions documented (JIRA tickets from Legal meetings)

## Failure & Learning

### 31. Product/feature that failed

**Example: CAPM Verification Oversight**
- **Role**: Led rollout, responsible for verification phase
- **Failure**: Oversight on common permission scenario, had to pause immediately after ramp
- **Learning**: Need more thorough testing of common user paths, not just happy paths; checklists for permission scenarios
- **Change**: Now ensure explicit permission testing before any ramp; added observability as gate

**Example 2: Dremr Indexes Deprecation**
- **Role**: Led initiative to deprecate 2 complex indexes
- **Failure**: Unsuccessful due to unanticipated EVNT + challenges for manual query users
- **Learning**: Underestimated impact on power users; need to validate with users before deprecating
- **Change**: Pivoted quickly to Pig migration; now survey users before deprecating tools

### 32. Technical decision → poor product outcome

**Example: Test Migration vs Rebuild**
- **Decision**: Initially pushed for Shield test migration
- **Poor Outcome**: Would have migrated low-value tests, ongoing maintenance burden
- **Identification**: Team feedback + code review showed tests highly mocked, didn't catch real bugs
- **Course Correct**: Pivoted to ground-up rebuild with semantic testing
- **Earlier Detection**: Should have audited test quality before committing to migration

**Example 2: CAPM Monitoring Gap**
- **Decision**: Attempted to ramp CAPM without sufficient observability
- **Poor Outcome**: Team anxiety, lack of confidence to debug issues
- **Identification**: Team raised concerns about monitoring and exhaustion
- **Course Correct**: Deferred ramp, hosted observability knowledge share, improved monitoring
- **Learning**: Monitoring is not optional for scale features

### 33. Biggest product lesson learned

**Lesson: Iterative Delivery Multiplies Value AND Reduces Risk**

**The Journey**:
- **Started**: Traditional waterfall mindset (plan everything, build, ship)
- **Shifted**: Influenced by Shape Up methodology, driven by Timeline UI success
- **Now**: Artifact-driven iterative development is my core philosophy

**Why It Matters**:
- **Value**: Delivered value 4 months earlier than other teams (messaging modernization)
- **Risk**: Found CAPM permission issues in pilot vs at full scale
- **Learning**: Customer feedback changed technical approach (response rates validated decisions)
- **Morale**: Team sees progress weekly, builds momentum

**How I Spread It**:
- Lobbied TDM and PM leaders across messaging toward iterative development
- Broadened weekly demos from team to org-wide (6-7 teams)
- Engineers post MRs daily to show progress
- Became my reputation: "Brandon is the clear pick to lead iterative efforts" (2023 Q2 review)

**Applied to Product Thinking**:
- Perfect is the enemy of shipped (Attachments <1 week)
- Scope to core capabilities (Horizon M2 reduction)
- Ramp to small audience first (CAPM dogfooding)
- Measure, learn, iterate (GEODES response rates)

---

## Key Themes Across Examples

### Speed + Quality
- Attachments in <1 week (speed)
- 90%+ test coverage on Timeline UI (quality)
- **Balance**: MVP speed, then iterate quality

### Influence Without Authority
- Multiplied output 3-4x through cross-team coordination
- Influenced org toward iterative delivery
- Brokered engineer shares across teams

### Customer + Business Thinking
- GDPR compliance (legal risk)
- Locale support (user experience + legal)
- Response rates (business metrics)

### Servant Leadership
- Took DFR for 2.5 months to unblock team
- Shielded team from reorg chaos
- Maintained high morale through change

### Pragmatic Technical Decisions
- Build vs Buy based on context
- Defer when it multiplies ROI (Navi)
- Invest in platform when it enables velocity (Timeline UI, DB schema)

