# RDD Interview Prep — TDM Role at Indeed

## Interview Format

- **Core Question**: "Walk me through your resume"
- **Duration**: 60 minutes
- **Goal**: "Based on the candidate's experience, would this candidate contribute positively to engineering solutions (either via a team if TDM or directly if IC) and to the overall engineering organization?"
- **Source**: [RDD Signals](https://indeed.atlassian.net/wiki/spaces/eng/pages/273417521) · [RDD Interview Guide](https://indeed.atlassian.net/wiki/spaces/eng/pages/273409170)

---

## Evaluated Signals & Scoring Rubric (1–5)

### Product/Data Sense

| Score | Description |
|---|---|
| **5** | Top tier |
| **4** | Influences product decisions with data. Uses iterations and data to learn what to do next. Understands and influences product value beyond current team. |
| **3** | Uses product-success criteria to make good technical decisions. Suggests or leverages data to make design choices. Has a bias for iterative problem-solving. Strong self-awareness on non-optimal choices. |
| **2** | Has a solid grasp on "why problem was important enough to invest in". Can describe measurement if one exists. Moderate self-awareness on non-optimal choices. |
| **1** | Weak signals |

### Solved Complex Problems Well

| Score | Description |
|---|---|
| **4** | Tackled very complex problem(s), making insightful decisions with a deep understanding of alternatives and implications. Considered tradeoffs and addressed risks. |
| **3** | Tackled a complex-enough project to drive a design expected of an engineer at the top of L2 or minimum expectation of Senior. Could discuss/defend choices and suggest alternatives. |
| **2** | Could describe in detail work accomplished and why. Problems of at least moderate complexity. Could describe technical implementation in moderate depth. |

### Broader Influence / Make Improvements

| Score | Description |
|---|---|
| **4** | Strong evidence of contributions that impact more than the immediate team or champions efforts spanning an organization. |
| **3** | Clear signs of at least one successful cross-team/function collaboration and/or mentorship. Evidence of "making the world better around you" through tools, process changes, or personal influence. Strong bias for action. |
| **2** | Minimal evidence of collaborating with other functions/roles and/or mentoring. Adequate ownership. |

### Flags

- **Yellow flag**: A signal that *could* disqualify but is ambiguous enough to warrant discussion (phrased as questions during debrief)
- **Red flag**: A clear disqualifying signal (malfeasance, overt biases, verbal abuse, etc.)

### What They Probe For (TDM-specific)

- **Technical ability**: Pick a project you personally designed. Describe the technical choices and why. What would you do differently?
- **Leadership**: People leadership — team structure, involvement, leadership style, mentoring, empowerment vs. micromanagement
- **Process and values**: Iterative approach, team ownership, data-driven decisions, cross-functional collaboration, release frequency
- **Dealing with challenges**: How you handle conflict, both technical and interpersonal
- **Handling mistakes**: Biggest mistake, what led to it, what you learned
- **Reasons for leaving**: Pattern of loyalty/stability, professionalism in departures

---

## Your Stories by Signal

## Signal 1: Product/Data Sense (aim for 4+)

### Lead Story: APD Phase 2

- Eliminated ~2,500 RPS of redundant lookups by decoupling PIE from AdvertiserService. Frame *why* this mattered: runtime dependency meant any AdvertiserService issues cascaded into PIE permission failures (which you saw with EVNT-8083, the ~$664K revenue incident).
- Used data to make the decision for synchronous sync vs. async: the EVNT-8083 RCA showed that the async approach created a race condition where new advertisers couldn't set permissions immediately. Cited this data when negotiating with the Spending Employer team to justify the synchronous approach.
- Measured success through IQL queries and DataDog dashboards, then rolled 0% to 100% with confidence because you had pre-built validation logging to catch discrepancies.
- The owner cache optimization took batch lookups from seconds to milliseconds for 1000+ batches — talk about *why* you chose caching and the tradeoffs (replica lag, cache priming on writes).

### Supporting Story: GEODeS / Conversation Alias (TDM era)

- Led product discovery and MVP definition for a 3-quarter messaging modernization initiative.
- Pushed for delivering Conversation Alias in smaller pieces, which proved stable and met M0 objectives.
- Reduced scope to core capabilities and established iterative delivery approach that migrated 2/3 of legacy traffic while increasing response rates from 16% to 21.5%.

### Key Phrases

"I used data to validate choices," "I iterated and measured," "I understood the product impact beyond just my team."

---

## Signal 2: Solved Complex Problems Well (aim for 4+)

### Lead Story: APD Phase 2 Technical Complexity

Spans 10+ services, 7 repos, 4 teams, and multiple technical challenges:

- **Non-determinism bug**: Caught a non-determinism bug preemptively in employer-hierarchy-service before it hit production. Talk about *how* you identified it and what the impact would have been.
- **Synchronous PIE sync design**: Designed and implemented the PieServiceSyncListener in AdvertiserService to synchronously create permissions on advertiser creation, eliminating a race condition. Required working in someone else's codebase (AdvertiserService), negotiating the approach, and handling environment-specific permission set IDs.
- **Proctor rollout complexity**: The skip-ADVS-fallback rollout required multiple reverts, proctor bucketing fixes, and a centralized gRPC interceptor pattern. Explain the "revert-revert-restore" cycle — you had the foresight to make it safe to roll forward and back.
- **Owner cache with replica lag**: Had to prime the cache on sync writes specifically to avoid MySQL replica lag issues. Talk about the tradeoff between cache freshness and database load.

### Supporting Story: EVNT-5796 (8-week incident)

- Led team through an 8-week long critical incident affecting 24M users.
- Coordinated cross-functional team including legal, executive communication, achieved zero data loss, and mitigated potential fine exposure.
- Talk about the technical complexity of gathering data for legal across the DREMR system.

### "What Would You Do Differently?"

Talk about the APD proctor rollout where you had to revert multiple times. You'd add more validation logging upfront and build the centralized proctor interceptor pattern from the start rather than retrofitting it later.

---

## Signal 3: Broader Influence / Make Improvements (aim for 4+)

- **Cross-team coordination on APD**: Point of contact for permissions across 4+ teams (Spending Employer, CamCap, Interview Platform, One Host) within first month on PAC. Negotiated synchronous approach with Spending Employer, helped Jayesh from CamCap migrate streaming events, coordinated Nexus UI changes with One Host over multiple weeks.
- **AI Skills Library**: Created 7 reusable AI skills that teammates used. Manager Heber: "completely took advantage of AI and put it to work... able to submit MRs for complex services way sooner than any other developer." Bulk migration prompt enabled 8 services migrated ahead of Nov 14 deadline. Shared self-eval prompt and code review helper with team.
- **Flaky tests and CI reliability**: Fixed 15+ flaky tests and standardized repo hygiene across 14+ repos. Classic "making the world better around you."
- **Process improvements (TDM era)**: Created Show & Tell demo format that expanded from your team to all 6+ messaging teams. Streamlined Jira from ~17 projects to 1. Established triage/support process. Drove iterative delivery shift across messaging org.
- **Mentoring**: Coached Yuanyuan from SWE2-2 to SWE3 over ~2 years. Two tech leads took on TLA roles spanning multiple teams; one received Transformation recognition.
- **Hiring**: Interviewed 13, hired 3 contractors, set up internal interview process with technical rounds, drove improvements with Outpost team to improve candidate quality.

---

## Red/Yellow Flag Avoidance

- **Don't say "we" for everything** — Clearly state what *you* did vs. what the team did. "I negotiated the synchronous approach," "I identified the staffing gap," "I designed the cache optimization."
- **Admit mistakes readily** — The proctor rollout reverts are a great humility signal. The EVNT-8083 incident had a gap in testing you can own. Navi deferral was a calculated risk that paid off, but acknowledge the uncertainty.
- **Don't bad-mouth past teams/situations** — Frame reorgs, product shifts, and understaffing as challenges you navigated, not complaints.
- **Show growth** — Reviews consistently identify "broadening influence" as your growth area. Show you've actively worked on it, from grassroots to cross-team APD coordination.
