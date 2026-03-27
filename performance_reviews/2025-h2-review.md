# SWE3 Review Brandon Murphy

## Scope

* PAC (10 SWEs), SWE3.  
* Led APD Phase 2 end-to-end across 10+ services, authored Nexus frontend permission gating design, improved reliability and reduced tech debt across PAC/PIE, and multiplied team output through AI skills library.

## Accomplishments (in priority order)

* Org | Led and delivered APD Phase 2\.  
  * Eliminated PIE's runtime dependency on AdvertiserService, removing \~2,500 RPS redundant lookups and rolling 0% to 100% ahead of schedule ([1](https://indeed.atlassian.net/browse/PACMAN-1462))  
  * Implemented across 7 repos: owner caching (seconds to ms, [1](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1752)), synchronous PIE sync ([2](https://code.corp.indeed.com/adsystem/advertiserservice/-/merge_requests/1437)), preemptive non-determinism fix ([3](https://code.corp.indeed.com/pie/employer-hierarchy-service/-/merge_requests/607))  
  * Negotiated synchronous approach with Spending Employer team [(Slack)](https://indeed-pte.slack.com/archives/C0924P4HL6S/p1768315341787279); helped Jayesh migrate APD streaming events  
  * "Brandon contributed crucial changes in Advertiser Service to improve ownership role update operation during the Advertiser Creation process... Brandon was a trusted partner to Spending Employer team for a complex project like APD and provided strong technical and business expertise through review process." \-- Jayesh Kshirsagar  
* Org | Nexus frontend permission gating.  
  * End-to-end delivery: authored [design review](https://docs.google.com/document/d/1_bHzVE6YLnnJzQoDucgpzAdzWpZxJ76_GyqMGkpVvqc), broke down [epic](https://indeed.atlassian.net/browse/PACMAN-12430) and delivered all tickets  
  * Delivered reusable helpers and route guards across 3+ routes ([1](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/922), [2](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/889), [3](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/893))  
  * Coordinated with One Host over multiple weeks [(Slack)](https://indeed-pte.slack.com/archives/C01S44035M3/p1771349779080039)  
  * "Brandon identified a simplified architectural path... avoided the 'anti-pattern' of creating redundant permissions and instead re-engineered our existing backend logic." \-- Saranya Mohandoss  
* Team | Improved reliability and reduced tech debt across PAC/PIE.  
  * Fixed 15+ flaky tests and standardized repo hygiene across 14+ repos  
  * Examples include: race conditions ([1](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/729)), mock pollution ([2](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1792)), DB replication lag ([3](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1738)), MySQL 5.7 to 8.0 ([4](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1717)), 118 deprecation warnings ([5](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1796))  
  * Found and fixed pie-webapp broken silently in QA ([1](https://indeed.atlassian.net/browse/SCAPE-181), [2](https://indeed.atlassian.net/browse/SCAPE-182)); migrated pie-tool dashboard to Terraform ([1](https://indeed.atlassian.net/browse/PACMAN-12227))  
  * "Brandon contributed a lot to stabilizing tests across PAC and PIE projects which had been historically flaky." \-- Bryan Yoo  
* Team | Multiplied team output through AI skills library: 7 reusable AI skills, bulk migration tooling enabling 8 services migrated ahead of deadline, and shared code review helper  
  * Created GitLab CLI, Sourcegraph, Slack, Google Docs, ACLI, and APD prompt skills in [pac-ai-library](https://code.corp.indeed.com/pac/pac-ai-library); bulk migration prompt ([1](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/5)) cut per-service migration time  
  * "He completely took advantage of AI and put it to work. He was able to submit MRs for complex services way sooner than any other developer on the team." \-- Heber Billings  
  * "Brandon has shown great initiative in streamlining our code review process through AI-assisted prompts... He has freely offered to collaborate on AI tooling, and shared his prompts with me which have inspired my own creativity with prompt writing and utilizing subagents." \-- Tatiana Quintana

## Growth Opportunities

* Leverage AI tooling expertise as a force multiplier for his new team \-- Brandon built a strong platform of AI skills and workflows during his IC rotation that accelerated his own velocity and those around him. As he transitions back into management, the opportunity is to drive adoption of these tools and the AI-first mindset across his new team, raising the baseline productivity of every engineer he manages.

