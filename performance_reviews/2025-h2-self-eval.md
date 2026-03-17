# SWE3 Review Brandon Murphy

---

## Scope

- PAC (Permissions, Access & Controls), 10-person team, SWE3. Joined Oct 2025; cross-team point of contact for permissions by first month.
- Led APD across 10+ services coordinating with 4 teams. Authored Nexus frontend permissions design. 
- Metrics: 134 MRs (~1/day) authored & merged, 105 reviewed across 30 repos in Scala, Kotlin, TypeScript, and Java

## Accomplishments (in priority order)

- **Product/Platform** Led APD Phase 2 ([PACMAN-1462](https://indeed.atlassian.net/browse/PACMAN-1462)) end-to-end 
  - Coordinated with [Spending Employer](https://indeed-pte.slack.com/archives/C0924P4HL6S/p1768315341787279), [CamCap](https://indeed-pte.slack.com/archives/C033KRPLS57/p1770386107007689), [Interview Platform](https://indeed-pte.slack.com/archives/CP0V1C9QF/p1767734009142209) teams to eliminate PIE's runtime dependency on AdvertiserService, removed ~2,500 RPS redundant lookups, rolled 0%→100% ([DataDog](https://app.datadoghq.com/metric/explorer?fromUser=false&graph_layout=multi&start=1772987290330&end=1773160090330&paused=false#N4Ig7glgJg5gpgFxALlAGwIYE8D2BXJVEADxQEYAaELcqyKBAC1pEbghkcLIF8qo4AMwgA7CAgg4RKUAiwAHOChASAtnADOcAE4RNIKtrgBHPJoQaUAbVBGN8qVoD6gnNtUZCKiOq279VKY6epbINiAiGOrKQdpYAEwGIFCeGE4a+NoAxkrIIOoIulmWgWZxyhp4qsgACnoAyjoAbhA5ACIYcKpSAHQY8lBOGFBNGk52OGhNcOkA1hDyilDAfi05yPIhza1wKV1SPAAEAEZYh8BwIk08fWNZ+CIIABQAlCB8oJHRebFYAMxJFIINIZPDZXL5RBFEogX4VKq1BrbdqdboiPoDIYjMYTKYzLIYNBoXYrZFwDZbbRrXaog4nM4XK43DB3B7PN4fCJRCG-AAsgNS6UyOWUBWhSTheUq1UKGByPRg2nkWScWTQekePUY4g0pKpOwpmjJezRFEuTQ22hwUAoEzBOScX3JogEuz6Ix0Ej8qx27um2i9Oh9OQA9LjpsN-YHtBoKIcME0MBBMMdk+IsABaABeUnJ-QzIjcTDgLIQGbIGCOp3OdvBju5zNZeEer3eAF0qK53HhMKFwoSICyKvNFrskl3VD2MDEygl3hRQAOh3lPAguvIkJ23JPMDOdP954v1cuQOG4ABBD0BiDe8fbqd7uL8ngdkAaOTEmQgeSExBr5RQDgMCqr2GitEkjAsk4iZoGYTgpnAaChIUZhUOqIgzHIigVJM0BJOhMz0EwyiFu4hLzskN7yJgWBOFhELHBgMbtjwfBvtR4gAMJSMIMAoCIPZoDwQA), [IQL](https://data.indeed.tech/idash/workspace/112759/queries/0))
  - Planned and implemented Phase 2 across 7 repos. 
    - Ex: owner caching (seconds → ms for 1000+ batches, [!1752](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1752)). 
    - Ex: synchronous PIE sync ([!1437](https://code.corp.indeed.com/adsystem/advertiserservice/-/merge_requests/1437)) eliminating new-advertiser race condition. 
    - Ex: Caught non-determinism bug preemptively ([!607](https://code.corp.indeed.com/pie/employer-hierarchy-service/-/merge_requests/607))
  - Negotiated synchronous approach with Spending Employer team citing EVNT-8083 ([Slack](https://indeed-pte.slack.com/archives/C0924P4HL6S/p1768315341787279)). 
  - Helped Jayesh Kshirsagar migrate APD streaming events ([Slack](https://indeed-pte.slack.com/archives/C033KRPLS57/p1771520407468239)).
  - Fully APD phase 2 compliant ahead of schedule.
  - Continues to own tail end clean up, ETA ~2 weeks
    - Ex: Remove ADVS owner fallback proctors and all associated dead code [!1852](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1852)
  - Heber Billings: "Brandon started on the PAC team towards the end of the APD corgi. He got up to speed quickly. Helped other teams with their APD questions. Really helped move the needle on APD while the rest of the team was focused on Nexus. He worked closely with the advertiser-service team to come up with a solution that supports both team’s goals."
- **Product** Authored [Frontend Permissions Design Review](https://docs.google.com/document/d/1_bHzVE6YLnnJzQoDucgpzAdzWpZxJ76_GyqMGkpVvqc) ([PACMAN-12430](https://indeed.atlassian.net/browse/PACMAN-12430)) defining Nexus dashboard front end changes
  - Ex: reusable helpers (`isNexusOnlyUser` across 3+ routes ([!922](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/922)), `canViewAnalytics` ([!889](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/889)), `canViewInterviews` ([!893](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/893)))
  - Ex: route guards preventing unauthorized URL access ([!922](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/922))
  - Ex: Coordinated with One Host team over multiple weeks to land changes ([Slack](https://indeed-pte.slack.com/archives/C01S44035M3/p1771349779080039))
- **Team** Improved code quality and CI reliability across PAC ecosystem by fixing 15+ flaky tests and standardizing repo hygiene across 14+ repos
  - Ex: fixed race conditions ([!729](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/729))
  - Ex: mock pollution ([!1792](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1792))
  - Ex: DB replication lag ([!1738](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1738))
  - Ex: parallel flakiness ([!1837](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1837))
  - Ex: TestCafe CI timeout ([!754](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/754))
  - Ex: Fixed 118 deprecation warnings ([!1796](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1796))
  - Ex: MySQL 5.7 → 8.0 ([!1717](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1717))
  - Ex: Fixed pie-service pipeline multiple times ([example](https://indeed-pte.slack.com/archives/C0993AJ2GSE/p1770053808358039)).
  - Ex: Fixed pie-webapp broken silently in QA ([SCAPE-181](https://indeed.atlassian.net/browse/SCAPE-181), [SCAPE-182](https://indeed.atlassian.net/browse/SCAPE-182)).
  - Ex: Migrated pie-tool dashboard to Terraform ([PACMAN-12227](https://indeed.atlassian.net/browse/PACMAN-12227))
- **Team** Leveraged AI to multiply results by creating reusable AI skills library, bulk migration tooling, and shared code review helper to accelerate teammates' review cycles
  - Ex: Created 7 AI skills: GitLab CLI ([!12](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/12)), Sourcegraph ([!14](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/14)), Slack ([!17](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/17)), Google Docs ([!18](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/18)), ACLI ([!19](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/19)), APD prompts ([!9](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/9))
  - Ex: Created bulk migration prompt ([!5](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/5)) reducing time-to-complete per service migration, enabling 8 services migrated ahead of Nov 14 deadline
  - Ex: Shared code review helper with team to speed up MR review cycles. 
  - Ex: Shared self eval prompt with team to speed up PE ([slack](https://indeed.enterprise.slack.com/files/U03HRRUHE3G/F0AM2LN8N3W/untitled)).
  - Heber Billings: "[Brandon] completely took advantage of AI and put it to work. He was able to submit MRs for complex services way sooner than any other developer on the team. He also continues to lead the way with AI and teaches/shares his AI findings with the rest of the team."

## Supplemental Information

For more details please see [this document](https://docs.google.com/document/d/1YF53yOnRnDazo-ZjIObFY89ZA_HnRezeB-tcOQzQV9A/edit?usp=sharing).