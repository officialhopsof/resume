# Conversation Alias: Technical Deep Dive Preparation

## Project Overview
**Mission**: Replace DREMR (legacy messaging system) with a modernized, scalable messaging architecture  
**Duration**: ~9 months  
**Scale Impact**: 20M+ monthly active messaging users

## 1. Initial Technical Discovery & System Design

### Your Role in Architecture Design:
- **First iteration ownership**: Led initial system design and architecture decisions
- **Throughput & Scale Analysis**: 
  - Calculated requirements for 20M+ monthly active users
  - Designed for EU (24M users) + California (4M users) compliance requirements
  - Built for peak messaging volume during high-activity periods
  
### Domain Model & Ubiquitous Language:
- **Why fundamentally different?** DREMR was email-centric; Conversation Alias designed for chat-first model
- Created new domain abstractions separating:
  - Message transport layer
  - Conversation state management
  - Identity/routing layer
  
*(What specific domain entities did you define? e.g., ConversationThread, MessageEnvelope, ParticipantIdentity, RoutingContext)*

## 2. Service Decomposition

### Inbound Relay Component:
- **Purpose**: Receive and route incoming messages from multiple channels
- **Why separate?** Decoupled message ingestion from processing
- **Responsibilities**:
  - Protocol translation (email → chat format)
  - Message validation and sanitization
  - Routing decision logic
  - Anti-spam/bot detection integration

### Outbound Component:
- **Purpose**: Handle message delivery to end users
- **Why separate?** Independent scaling based on delivery patterns
- **Responsibilities**:
  - Channel-specific formatting (email, SMS, push, in-app)
  - Delivery confirmation tracking
  - Retry logic and dead-letter handling
  - Rate limiting per channel

### Data Sync Layer:
- **Why needed?** Maintain consistency between legacy DREMR and new system during migration
- **Challenges**:
  - Bidirectional sync during transition period
  - Handling eventual consistency
  - Data format transformation
  - Preventing duplicate messages

## 3. Scale & Performance Requirements

### Throughput Analysis:
*(Can you recall specific numbers?)*
- Messages per second at peak?
- Average message latency SLA?
- Database read/write ratios?
- Geographic distribution requirements?

### Technology Stack Decisions:
- What did you choose for message queue? (Kafka likely based on your Indeed experience)
- Database choices? (MongoDB Atlas mentioned in your eval)
- Why those choices for this scale?

## 4. Strategic Deferral Decision

From your eval:
> "Advocated for pausing Navi service until the readiness of CRS. Deferring the efforts prevented from building a short-term solutions"

> "Led effort to successfully decommission Navi. I had previously had the foresight to pause this effort knowing that if we waited for the IMS migration to get further along we could avoid parts of the Navi migration altogether and save us a lot of work. By waiting until we were close to the deadline to make the migration, we not only ended Navi with less than a week of work"

**Impact**: Saved **4 months** of engineering work by identifying architectural dependencies

---

## Meta Interview Framing

### Opening Statement:
"I led the architecture and initial design for Conversation Alias, a 9-month initiative to modernize Indeed's messaging platform serving 20M+ monthly active users. This involved replacing DREMR, our legacy email-centric system, with a chat-first architecture. I was responsible for defining the domain model, calculating throughput requirements, and decomposing the system into independently scalable services."

### Deep Dive Points to Emphasize:

1. **System Design Philosophy**: Why chat-first vs email-centric mattered
2. **Scale calculations**: Show your work on throughput analysis
3. **Service boundaries**: Explain the separation of concerns
4. **Migration strategy**: How data sync enabled zero-downtime migration
5. **Strategic deferral**: Example of technical leadership saving 4 months of work

### Questions to Prepare For:
- What was the target response time SLA?
- How did you handle message ordering guarantees?
- What monitoring/observability did you build in?
- How did you validate the design before implementation?
- What was the rollout strategy? (You mentioned 2/3 of legacy traffic migrated, response rates increased from 16% to 21.5%)

## Key Metrics to Remember:
- **User Impact**: 20M+ monthly active messaging users
- **Compliance**: EU (24M users) + California (4M users) GDPR/CCPA
- **Performance Improvement**: Response rates increased from 16% to 21.5% (34% improvement)
- **Migration Success**: 2/3 of legacy traffic migrated
- **Strategic Savings**: 4 months of engineering work saved through architectural deferral
- **Timeline**: 3-quarter initiative (9 months)

---

## Architecture Documentation & Diagrams

### Primary Design Documents:

#### 1. Inbound Conversation Relay Design Review
📄 https://docs.google.com/document/d/1C23kLDHch0eI3XDuhCcd50KTKxdfxxURFHWJh7tChEA
- **Owner**: Yuanyuan Zhu
- **Last updated**: June 2024
- **Contains**: Main design review for the Inbound Conversation Email Relay (ICER) component
- **Key content**: Conversation alias GQL API design, email relay architecture

#### 2. IMS Sourcing Migration - System Architecture
📄 https://indeed.atlassian.net/wiki/spaces/Messaging/pages/760153524
- **Owner**: Brian Sui
- **Last updated**: June 2025
- **Contains**: Section titled "**Additional System Architecture Diagrams**"
- **Key content**: How ICER picks up emails sent to conversation alias, overall system integration

#### 3. Conversation Alias Email Address Format - Technical Design
📄 https://docs.google.com/document/d/16d7Im4-A-REHcLSEZ3S6sL9ukajpVoP1MYsT6wpD-6w/edit
- **Linked from**: JIRA ticket MSGFLOW-105
- **Contains**: Technical design review with email format specifications

### Additional Resources:

#### Messaging Design Review Guide
📄 https://docs.google.com/document/d/1En0fO_J6-i21DLS5pzaZPPOl3JAD8xzRaAzRaEKcPg0
- **Owner**: Doug Rahn
- **Purpose**: General guide for messaging architecture documentation standards

#### Additional Technical Documents
📄 https://docs.google.com/document/d/1STu6swI9BEcfJ8w0kSvtygZEBh9nTgpxCXDp_du3DhQ/edit?tab=t.0
- **Purpose**: Additional technical design documentation

📄 https://docs.google.com/document/d/1arcLy7BRrEom5caul1gMKUUZyVQ4f0q9fbH1CXJ1ghw/edit?tab=t.0
- **Purpose**: Additional technical design documentation

📊 https://lucid.app/lucidchart/495310a4-eceb-4c21-bbad-fdacab03db3b/edit?page=0_0#
- **Type**: Architecture Diagram (Lucidchart)
- **Purpose**: System architecture visualization

### Document Review Strategy:
1. **Start with**: IMS Sourcing Migration Confluence page for overall system architecture diagrams
2. **Deep dive**: Inbound Conversation Relay Design Review for detailed design decisions you made
3. **Reference**: Email format technical design for specific implementation details

--- 

## Notes

- Problem: Emails determine recipients based on the To, CC, and BCC lines at the time each message is sent vs conversation participants in a chat. 
- Problem: Email requires to authentication to send, can send to unanticipated recipients.

---

## What to Expect: Meta EM Technical Deep Dive Interview

### Interview Format & Duration
- **60-75 minutes** of technical discussion
- Mix of **system design**, **architecture decisions**, and **technical trade-offs**
- **Deep dive into a specific project** (Conversation Alias in your case)
- Expect **both breadth and depth** - they'll go deep on specifics

### Core Question Categories

#### 1. System Design & Architecture (30-40% of interview)

**Question Types:**
- "Walk me through the architecture of Conversation Alias from end to end"
- "How did you determine the system boundaries between services?"
- "What were the main scalability bottlenecks you identified?"
- "Why did you choose to separate inbound relay from outbound delivery?"
- "How did you design for 20M+ users? Show me your capacity calculations"
- "What happens when [edge case scenario]?"

**What They're Assessing:**
- Systems thinking and decomposition
- Understanding of distributed systems patterns
- Ability to explain complex technical concepts clearly
- Scalability and performance reasoning
- Trade-off analysis

**Your Preparation:**
- Be ready to draw diagrams (whiteboard or shared doc)
- Know exact numbers: throughput, latency, storage, costs
- Understand every component in your architecture
- Prepare for "what if" scenarios (e.g., "What if traffic doubles overnight?")

#### 2. Technical Decision Making & Trade-offs (25-30% of interview)

**Question Types:**
- "Why MongoDB Atlas vs [alternative]?"
- "Walk me through the pros and cons of your approach"
- "What alternatives did you consider? Why did you reject them?"
- "If you could rebuild this today, what would you change?"
- "How did you balance speed to market vs technical quality?"
- "Tell me about a technical decision you made that you later regretted"

**What They're Assessing:**
- Depth of technical knowledge
- Decision-making framework
- Ability to weigh trade-offs pragmatically
- Learning from past decisions
- Understanding of when "good enough" is appropriate

**Your Preparation:**
- For every major decision, know: what you chose, why, what you didn't choose, trade-offs
- Be honest about mistakes and what you learned
- Have data to back up decisions where possible

#### 3. Scale & Performance (20-25% of interview)

**Question Types:**
- "How many messages per second can your system handle?"
- "What's your p99 latency? Why is that acceptable?"
- "How did you test the system at scale?"
- "What monitoring did you put in place? Why those metrics?"
- "How do you prevent cascading failures?"
- "Tell me about performance issues you encountered and how you debugged them"

**What They're Assessing:**
- Understanding of performance fundamentals
- Operational thinking
- Data-driven decision making
- Debugging and problem-solving skills
- Production system ownership mindset

**Your Preparation:**
- Know your SLAs and why you chose them
- Have specific examples of performance problems and fixes
- Understand your monitoring strategy and alert thresholds
- Be ready to discuss load testing approach

#### 4. Migration Strategy & Risk Management (15-20% of interview)

**Question Types:**
- "How did you migrate from DREMR without downtime?"
- "What was your rollback plan?"
- "How did you validate the new system was working correctly?"
- "How did you handle data consistency during the migration?"
- "What risks did you identify? How did you mitigate them?"
- "Tell me about a time the migration went wrong. What did you do?"

**What They're Assessing:**
- Risk assessment skills
- Planning and execution
- Contingency thinking
- Operational maturity
- Learning from production incidents

**Your Preparation:**
- Document your rollout phases (you mentioned 2/3 traffic migrated)
- Know your rollback criteria and procedures
- Have examples of issues you encountered and solved
- Explain your validation strategy

#### 5. Collaboration & Influence (10-15% of interview)

**Question Types:**
- "How did you get alignment on this design across teams?"
- "Tell me about a time your design was challenged. How did you respond?"
- "How did you communicate technical decisions to non-technical stakeholders?"
- "What feedback did you get from other engineers? How did it change your design?"
- "How did you handle disagreements about the architecture?"

**What They're Assessing:**
- Communication skills
- Ability to build consensus
- Openness to feedback
- Cross-functional collaboration
- Influence without authority

**Your Preparation:**
- Prepare examples of design reviews and feedback you received
- Know who your stakeholders were (Legal, Product, other teams)
- Examples of adapting design based on feedback

### Specific Deep Dive Areas for Conversation Alias

**Be Ready to Explain in Detail:**

1. **Domain Model**
   - Exact entities and their relationships
   - Why chat-first vs email-centric required new abstractions
   - How you handle conversation participants vs email recipients

2. **Inbound Relay**
   - Email parsing and validation
   - Routing logic and decision tree
   - Anti-spam integration
   - Error handling and dead letters

3. **Data Sync Layer**
   - Eventual consistency challenges
   - Conflict resolution strategies
   - Preventing duplicate messages
   - How you validated correctness

4. **Strategic Deferral (Navi)**
   - How you identified the dependency
   - Decision-making process with stakeholders
   - Risk of waiting vs cost of proceeding
   - The 4-month savings calculation

5. **EVNT-5796 Incident**
   - Technical root cause
   - 8-week response coordination
   - 24M users affected
   - Legal compliance (GDPR/CCPA)
   - Monitoring improvements (80% faster recovery)

### Red Flags to Avoid

❌ **Don't:**
- Say "I don't remember" for core technical decisions
- Blame others for problems
- Only talk at high level - have depth ready
- Get defensive about design critiques
- Oversell - be honest about limitations

✅ **Do:**
- Admit what you'd do differently
- Give credit to your team
- Use data and metrics
- Show learning and growth
- Demonstrate depth when probed

### Question Depth Progression

**Expect this pattern:**
1. "Tell me about Conversation Alias" *(High-level overview)*
2. "How did you design the inbound relay?" *(Zooming in)*
3. "What happens when you receive a malformed email?" *(Edge case)*
4. "How do you know if it's malformed?" *(Implementation detail)*
5. "What if the spam detector is down?" *(Failure mode)*
6. "How would you improve this component today?" *(Retrospective thinking)*

**Be prepared to go 5-6 levels deep on any component.**

### Success Signals

**You're doing well if:**
- ✅ You can explain technical concepts at multiple levels of abstraction
- ✅ You proactively mention trade-offs and alternatives
- ✅ You have specific numbers and metrics ready
- ✅ You can draw clear diagrams quickly
- ✅ You acknowledge limitations and areas for improvement
- ✅ The interviewer seems engaged and asking follow-ups
- ✅ You're having a technical conversation, not just giving a presentation

### Time Management

**Suggested pace:**
- **0-10 min**: High-level project overview and context
- **10-35 min**: Deep technical exploration (bulk of interview)
- **35-50 min**: Trade-offs, alternatives, what you'd change
- **50-60 min**: Wrap-up, edge cases, your questions

### Your Questions to Ask (Last 5-10 minutes)

**Strong questions to ask:**
- "What's the most challenging technical problem your team is working on?"
- "How does Meta approach messaging architecture differently than other companies?"
- "What would success look like for this role in the first 6 months?"
- "How do you balance technical innovation with moving fast?"
- "What's the technical culture like for EMs - how hands-on are they expected to be?"
