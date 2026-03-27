# SWE Management Interview Prep — TDM Role at Indeed

## Interview Format

- **Core Question**: "Tell me about a time you helped grow someone's career / made a team effective"
- **Duration**: ~55 minutes
- **Goal**: "Would this candidate be successful at growing careers and at making teams effective at Indeed?"
- **Source**: [Management Interview Signals](https://indeed.atlassian.net/wiki/spaces/eng/pages/273414653) · [Dev Management Interview](https://indeed.atlassian.net/wiki/spaces/eng/pages/273415030)

---

## Evaluated Signals & Scoring Rubric (1–5)

### Coaching

| Score | Description |
|---|---|
| **4** | Identifies leadership potential and coaches through others. Uses strong conceptual frameworks to get better results. |
| **3** | Enough experience to successfully navigate high and low performer issues (by examples). Clear evidence of success managing through moderate to difficult individual situations. |
| **2** | Passion for career growth of others (with success or clear learnings in minimally complex situations) and correct instincts regardless of experience. |

**Sub-signals**: Servant leadership, tools for responsive/proactive coaching, mentoring (formal vs. informal, proactive vs. reactive), performance management (overall, underperformers, top performers).

### Team Effectiveness / Business Alignment

| Score | Description |
|---|---|
| **4** | Able to use data effectively to drive product priorities and has skills to make changes that result in increased team effectiveness. |
| **3** | Successfully uses data to make teams more effective (experiments, resolving effectiveness challenges). Recognizes team successes, willing to own less desirable outcomes. |
| **2** | Good grasp on what makes the team effective, has biases/capabilities for optimizations. Rudimentary conceptual framework for understanding team effectiveness. |

**Sub-signals**: Data-driven decisions, bottom-up vs. top-down decision making, growing/reshaping teams.

### Organizational Influence

| Score | Description |
|---|---|
| **4** | Strong evidence of contributions impacting more than the immediate team, champions efforts spanning an organization. |
| **3** | Able to think beyond scope of current team and make other teams/organizations more effective. Solid experience partnering with other teams. Strives to understand before being understood. |
| **2** | Has partnered with other organizations to be successful. |

**Sub-signals**: Bias for action/ownership, process/product impact (near and far), personal growth (recency, self-awareness).

### Topics Covered in the Conversation

1. A recent project — architecture, team structure, your role (PM? Team management? Architecture? Coding?)
2. Building a product from scratch — project planning, A/B testing, keeping team on track
3. Building a team around a product — team size decisions, mix of seniority, clearing obstacles, collaboration vs. directive leadership
4. Performance management — reviews, 1:1s, upleveling, career development, feedback loops
5. Dealing with underperformers — what interventions did you try? At what point would you let someone go?
6. Managing people who know more than you — how do you check progress? How do you determine performance?
7. Areas where you need to grow — self-awareness about weaknesses
8. Hiring and interviewing — screening, recruiting, selling Indeed to candidates
9. Compensation — how should pay changes be determined? Tied to performance?

---

## TDM Rubric Dimensions (for context)

Source: [TDM Rubrics](https://indeed.atlassian.net/wiki/spaces/eng/pages/273425094) (updated Sept 2025)

| Dimension | Description | Scope (TDM3) |
|---|---|---|
| **Coaching** | Regular feedback, progressive evaluation, performance reviews, promotion support. Directly addresses low performance. Arranges growth opportunities. Identifies/develops leaders. | Product/Platform/Team |
| **Engineering Stewardship** | Leads by example with AI tools and modern practices. Reduces tech debt. Validates quality of AI and human output. Fosters culture aligned with Indeed Quality Dimensions. | Product/Platform/Team |
| **Organizational Impact** | Drives org health through team design, feedback, and improvements. Leads change management. Cross-functional partnership. Mentorship, interviewing, hiring. Sets clear goals and delivers results. | Product/Platform/Team |
| **Business Alignment** | Drives rapid innovation cycles. Makes effective product/tech/org decisions. Influences priorities for value delivery. Creates alignment across engineering, product, and leadership. | Product/Platform/Team |

TDM4 scope = Product Area · TDM5 scope = Functional/Business Area

---

## Your Stories by Signal

## Signal 1: Coaching (aim for 4+)

### Star Story: Yuanyuan's Growth Arc

Nearly 2 years of coaching, from SWE2-2 who only delivered smaller-scoped projects to successfully leading the entire Timeline UI project:

- How you gave him increasing scope (first component ownership, then whole project leadership)
- How you helped him learn to delegate (he struggled with being overwhelmed)
- How you coached him on working externally to unblock himself
- **Result**: Promotion to SWE3 "with 0 questions at panel"

### High Performer Coaching

- Identify and develop leaders: Two tech leads took on TLA roles spanning multiple teams. One received Transformation recognition as a direct result of your coaching and empowerment.
- Give engineers autonomy in project assignments (called out by reports as a strength)

### Low Performer / Difficult Situations

- **Redfin**: Managed PIPs for multiple engineers through clear expectations and targeted development.
- **Approach**: Set specific metric and delivery goals, monthly hindsight check-ins, ensure alignment on deliverables. Addressed low-quality external contributions affecting code coverage and product stability.

### Coaching Philosophy

- 100% Managerial Behavior Score and 100% DEIB Score across multiple cycles
- Reports consistently highlight servant leadership style, autonomy, transparency, focus on alignment
- "Brandon is among the best managers that I have worked with in the years I have worked in this industry."

---

## Signal 2: Team Effectiveness / Business Alignment (aim for 4+)

### Lead Story: Navigating Constant Change (2024 H1)

Led a team of 9 through 2 reorgs, a product shift mid-cycle, and an 8-week incident, and still delivered:

- Identified staffing shortage for Horizon M2 and influenced other TDMs to loan frontend engineers. Then identified a SWE3 within the broader group for AI Messaging and influenced the staffing decision.
- Strategically deferred the Navi service migration, knowing IMS progress would make parts unnecessary. When the time came, decommissioned Navi + Reminder Email in under a week instead of the months it would have taken.
- Pivoted DREMR index deprecation plan when EVNT-5796 consumed buffer time. Flexibility of original plan enabled seamless pivot to PigIndex migration instead.

### Data-Driven Decisions

- Built capacity planning visualizations and project timeline tools
- Moved locale resolution from 89% to 94% through data gathering and prioritization
- Used metrics to decide when to ramp GEODES (ramped to 1% in India, observed issues, ramped down, then adjusted and ramped to 100% excluding India/Japan)

### Team Structure Decisions

- Built the first Messaging team in Employer from scratch in 2022, hiring and onboarding engineers that proved to be among the strongest contributors
- Made deliberate decisions about team size and composition
- Streamlined from ~17 Jira projects to 1, moved to self-service model for internal tool access

---

## Signal 3: Organizational Influence (aim for 4+)

### Cross-Org Impact

- Created weekly Show & Tell format that expanded from your team to all 6+ messaging teams across GMs, including engineering, UX, product, and client teams
- Took on leadership role among the 6 messaging TDMs across Employer and Job Seeker, leading regular sync and coordinating load balancing of engineers across teams
- Drove shift from waterfall to iterative delivery across entire messaging organization. Manager: "a positive influence on the messaging space as a whole"

### Candid Disagreement (this is gold)

Manager specifically called this out: "Brandon has demonstrated a willingness to speak the truth, especially when he has a contrarian perspective... Many leaders might think 'this doesn't make sense' but few have the courage to say those things out loud or the diplomacy to do so in a way that encourages people instead of rubbing them the wrong way." Examples:

- Advocated against TEL when it was adding complexity without proportional value
- Pushed for scoping down every effort
- Challenged TDM4 manager's decisions, but "does so in a way that feels respectful and helpful"

### Personal Growth / Self-Awareness

- Identified early on that broadening influence was your growth area and have consistently worked on it
- Took feedback about team cohesion (the AJ departure) seriously
- Transitioned from TDM back to IC (SWE3) on PAC and immediately became cross-team point of contact within first month — showing adaptability

---

## Quick Reference: Top 5 Stories

| # | Story | Use For |
|---|---|---|
| 1 | **APD Phase 2** (10+ services, 4 teams, cache optimization, sync design, proctor rollout) | Complex Problems, Product/Data Sense, Technical Depth |
| 2 | **EVNT-5796** (8-week incident, 24M users, legal coordination, exec comms) | Challenges, Leadership, Organizational Influence |
| 3 | **Yuanyuan's promotion arc** (2 years, SWE2-2 to SWE3, zero questions at panel) | Coaching, Growing People |
| 4 | **Navigating 2 reorgs + product shift** (staffing influence, Navi deferral, GEODES ramp) | Team Effectiveness, Business Alignment, Change Management |
| 5 | **Iterative delivery culture change** (Show & Tell, scope reduction, messaging-wide influence) | Organizational Influence, Process/Values |
