# Supplemental — Impactful Work Not in Main Reviews

> For reference during calibration and 1:1s. Organized by theme with evidence links.

---

## Key Metrics Summary


| Metric                                        | Value                 |
| --------------------------------------------- | --------------------- |
| MRs authored & merged                         | 134                   |
| MRs reviewed                                  | 105+                  |
| Jira tickets (PACMAN + SCAPE + EVNT + ELDARG) | 145+                  |
| Distinct repositories contributed to          | 30                    |
| Services migrated (Spring Boot 3.x)           | 8                     |
| AI skills created                             | 7                     |
| SEV-1 incident retros owned                   | 2                     |
| Cross-team interactions                       | 15+ teams/individuals |


---

## Complete Merged MR & Jira Ticket Inventory (Oct 1 2025 – Mar 17 2026)

### 1. APD (Advertiser-PieService Decoupling) — Epic [PACMAN-1462](https://indeed.atlassian.net/browse/PACMAN-1462)

The largest body of work. Led Phase 2 end-to-end across 10+ services, coordinating with 4+ teams.

#### Phase 2 API Migrations (Advertiser-Centric APIs)


| MR                                                                                          | Repo                            | Title                                                                    | Merged     |
| ------------------------------------------------------------------------------------------- | ------------------------------- | ------------------------------------------------------------------------ | ---------- |
| [!377](https://code.corp.indeed.com/pac/pac-authorization-service/-/merge_requests/377)     | pac-authorization-service       | [SCAPE-173] APD Phase 2: Advertiser-Centric APIs                         | 2025-11-18 |
| [!415](https://code.corp.indeed.com/pac/pac-onegraph/-/merge_requests/415)                  | pac-onegraph                    | [SCAPE-129] APD Phase 2: Migrate to Advertiser-Centric APIs              | 2025-11-18 |
| [!32](https://code.corp.indeed.com/pac/pac-authorization-sync-postajob/-/merge_requests/32) | pac-authorization-sync-postajob | [SCAPE-131] APD Phase 2: Optimize to Advertiser-Centric API              | 2025-11-18 |
| [!39](https://code.corp.indeed.com/pac/permission-notification-service/-/merge_requests/39) | permission-notification-service | [SCAPE-132] APD Phase 2: Migrate to Advertiser-Centric APIs              | 2025-11-18 |
| [!1735](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1735)                 | pie-service                     | APD Phase 2: Migrate pie-service to advertiser-centric APIs [SCAPE-160]  | 2025-11-18 |
| [!1657](https://code.corp.indeed.com/pie/pie-webapp/-/merge_requests/1657)                  | pie-webapp                      | [SCAPE-161] APD Phase 2: Migrate pie-webapp                              | 2025-11-20 |
| [!536](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/536)                      | pie-tool                        | [SCAPE-162] APD Phase 2: Migrate pie-tool                                | 2025-11-20 |
| [!544](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/544)                      | pie-tool                        | [PACMAN-12002] MigrateMasterSubToHierarchy to advertiser-centric APIs    | 2025-12-04 |
| [!546](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/546)                      | pie-tool                        | [PACMAN-1970] Migrate SyncMasterSubToHierarchy to advertiser-centric API | 2025-12-10 |


**Jira:** [SCAPE-128](https://indeed.atlassian.net/browse/SCAPE-128), [SCAPE-129](https://indeed.atlassian.net/browse/SCAPE-129), [SCAPE-130](https://indeed.atlassian.net/browse/SCAPE-130), [SCAPE-131](https://indeed.atlassian.net/browse/SCAPE-131), [SCAPE-132](https://indeed.atlassian.net/browse/SCAPE-132), [SCAPE-133](https://indeed.atlassian.net/browse/SCAPE-133), [SCAPE-160](https://indeed.atlassian.net/browse/SCAPE-160), [SCAPE-161](https://indeed.atlassian.net/browse/SCAPE-161), [SCAPE-162](https://indeed.atlassian.net/browse/SCAPE-162), [SCAPE-173](https://indeed.atlassian.net/browse/SCAPE-173), [PACMAN-1970](https://indeed.atlassian.net/browse/PACMAN-1970), [PACMAN-12002](https://indeed.atlassian.net/browse/PACMAN-12002)

#### Hidden Owner Removal (effectiveOwner → owner)


| MR                                                                                      | Repo                      | Title                                                             | Merged     |
| --------------------------------------------------------------------------------------- | ------------------------- | ----------------------------------------------------------------- | ---------- |
| [!427](https://code.corp.indeed.com/pac/pac-onegraph/-/merge_requests/427)              | pac-onegraph              | [PACMAN-2015] Add owner field to EmployerEntity type              | 2025-12-01 |
| [!386](https://code.corp.indeed.com/pac/pac-authorization-service/-/merge_requests/386) | pac-authorization-service | [PACMAN-12001] Migrate test query from effectiveOwner to owner    | 2025-12-02 |
| [!768](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/768)               | pac-ui                    | [PACMAN-1981] Migrate pac-ui from effectiveOwner to owner field   | 2025-12-02 |
| [!188](https://code.corp.indeed.com/pie/pie-client/-/merge_requests/188)                | pie-client                | [PACMAN-12022] Deprecate HiddenOwnerEmailUtils                    | 2025-12-03 |
| [!246](https://code.corp.indeed.com/one-host/ehs-components/-/merge_requests/246)       | ehs-components            | [PACMAN-12008] Add owner fallback for primaryAccountEmail         | 2025-12-02 |
| [!773](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/773)               | pac-ui                    | [PACMAN-1981] Update ehs-components for owner field fallback      | 2025-12-03 |
| [!774](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/774)               | pac-ui                    | Revert [PACMAN-1981] Migrate from effectiveOwner                  | 2025-12-03 |
| [!777](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/777)               | pac-ui                    | [PACMAN-1981] Migrate pac-ui from effectiveOwner to owner         | 2025-12-04 |
| [!789](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/789)               | pac-ui                    | Fix SwitchAccountModal test to expect 'owner'                     | 2025-12-04 |
| [!245](https://code.corp.indeed.com/one-host/ehs-components/-/merge_requests/245)       | ehs-components            | [PACMAN-12008] Migrate from effectiveOwner to owner field         | 2025-12-10 |
| [!443](https://code.corp.indeed.com/pac/pac-onegraph/-/merge_requests/443)              | pac-onegraph              | [PACMAN-12044] Refactor effectiveOwner variable names to owner    | 2025-12-10 |
| [!189](https://code.corp.indeed.com/pie/pie-client/-/merge_requests/189)                | pie-client                | [PACMAN-12037] Remove HiddenOwnerEmailUtils class                 | 2025-12-10 |
| [!1753](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1753)             | pie-service               | [PACMAN-12007] Remove hidden owner logic from pie-service         | 2025-12-10 |
| [!441](https://code.corp.indeed.com/pac/pac-onegraph/-/merge_requests/441)              | pac-onegraph              | [PACMAN-12021] Remove hidden owner logic from pac-onegraph        | 2025-12-15 |
| [!388](https://code.corp.indeed.com/pac/pac-authorization-service/-/merge_requests/388) | pac-authorization-service | [PACMAN-12020] Remove HIDDEN_OWNER from SpiceDB schema            | 2025-12-15 |
| [!545](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/545)                  | pie-tool                  | [PACMAN-12006] Remove hidden owner logic from pie-tool            | 2025-12-02 |
| [!421](https://code.corp.indeed.com/pac/pac-authorization-service/-/merge_requests/421) | pac-authorization-service | [PACMAN-12020] Revert removal of HIDDEN_OWNER from SpiceDB schema | 2026-01-23 |


**Jira:** [PACMAN-2015](https://indeed.atlassian.net/browse/PACMAN-2015), [PACMAN-1981](https://indeed.atlassian.net/browse/PACMAN-1981), [PACMAN-1986](https://indeed.atlassian.net/browse/PACMAN-1986), [PACMAN-12001](https://indeed.atlassian.net/browse/PACMAN-12001), [PACMAN-12007](https://indeed.atlassian.net/browse/PACMAN-12007), [PACMAN-12006](https://indeed.atlassian.net/browse/PACMAN-12006), [PACMAN-12008](https://indeed.atlassian.net/browse/PACMAN-12008), [PACMAN-12009](https://indeed.atlassian.net/browse/PACMAN-12009), [PACMAN-12020](https://indeed.atlassian.net/browse/PACMAN-12020), [PACMAN-12021](https://indeed.atlassian.net/browse/PACMAN-12021), [PACMAN-12022](https://indeed.atlassian.net/browse/PACMAN-12022), [PACMAN-12037](https://indeed.atlassian.net/browse/PACMAN-12037), [PACMAN-12042](https://indeed.atlassian.net/browse/PACMAN-12042), [PACMAN-12043](https://indeed.atlassian.net/browse/PACMAN-12043), [PACMAN-12044](https://indeed.atlassian.net/browse/PACMAN-12044), [PACMAN-12091](https://indeed.atlassian.net/browse/PACMAN-12091), [PACMAN-1445](https://indeed.atlassian.net/browse/PACMAN-1445), [SCAPE-134](https://indeed.atlassian.net/browse/SCAPE-134), [SCAPE-135](https://indeed.atlassian.net/browse/SCAPE-135)

#### Owner Cache Optimization & Performance


| MR                                                                          | Repo        | Title                                                               | Merged     |
| --------------------------------------------------------------------------- | ----------- | ------------------------------------------------------------------- | ---------- |
| [!1752](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1752) | pie-service | [PACMAN-2014] Implement owner cache optimization                    | 2025-12-02 |
| [!1764](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1764) | pie-service | [PACMAN-12143] Add missing CachingDictionary tests for cache miss   | 2025-12-15 |
| [!1769](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1769) | pie-service | [PACMAN-12135] Extend owner cache to accountIds with batching       | 2025-12-15 |
| [!1775](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1775) | pie-service | [PACMAN-12135] Fix compilation: Remove usergroups from batch query  | 2025-12-15 |
| [!1839](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1839) | pie-service | [PACMAN-12631] Prime owner cache on sync write to avoid replica lag | 2026-03-02 |


**Jira:** [PACMAN-2014](https://indeed.atlassian.net/browse/PACMAN-2014), [PACMAN-12135](https://indeed.atlassian.net/browse/PACMAN-12135), [PACMAN-12143](https://indeed.atlassian.net/browse/PACMAN-12143), [PACMAN-12631](https://indeed.atlassian.net/browse/PACMAN-12631), [PACMAN-12089](https://indeed.atlassian.net/browse/PACMAN-12089)

#### Synchronous PIE Sync (AdvertiserService → PIE)


| MR                                                                                     | Repo              | Title                                                                        | Merged     |
| -------------------------------------------------------------------------------------- | ----------------- | ---------------------------------------------------------------------------- | ---------- |
| [!1424](https://code.corp.indeed.com/adsystem/advertiserservice/-/merge_requests/1424) | advertiserservice | [PACMAN-12268] Add listener to sync new advertiser permissions synchronously | 2026-01-28 |
| [!1437](https://code.corp.indeed.com/adsystem/advertiserservice/-/merge_requests/1437) | advertiserservice | [PACMAN-12268] Add synchronous PIE sync on advertiser creation               | 2026-02-05 |
| [!1439](https://code.corp.indeed.com/adsystem/advertiserservice/-/merge_requests/1439) | advertiserservice | [PACMAN-12506] Fix PIE permission set IDs for environment-specific values    | 2026-02-11 |
| [!1445](https://code.corp.indeed.com/adsystem/advertiserservice/-/merge_requests/1445) | advertiserservice | [PACMAN-12561] Remove proctor pac_sync_advertiser_to_pie_on_create           | 2026-03-16 |


**Jira:** [PACMAN-12268](https://indeed.atlassian.net/browse/PACMAN-12268), [PACMAN-12269](https://indeed.atlassian.net/browse/PACMAN-12269), [PACMAN-12323](https://indeed.atlassian.net/browse/PACMAN-12323), [PACMAN-12322](https://indeed.atlassian.net/browse/PACMAN-12322), [PACMAN-12506](https://indeed.atlassian.net/browse/PACMAN-12506), [PACMAN-12561](https://indeed.atlassian.net/browse/PACMAN-12561)

#### Skip ADVS Owner Fallback (Proctor Rollout)


| MR                                                                                 | Repo          | Title                                                                  | Merged     |
| ---------------------------------------------------------------------------------- | ------------- | ---------------------------------------------------------------------- | ---------- |
| [!1772](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1772)        | pie-service   | PACMAN-12113: Skip AdvertiserService fallback on cache miss            | 2025-12-18 |
| [!1784](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1784)        | pie-service   | Revert "Skip AdvertiserService fallback on cache miss"                 | 2025-12-18 |
| [!1785](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1785)        | pie-service   | [PACMAN-12113] Revert the revert: Restore skip ADVS fallback           | 2026-01-05 |
| [!201](https://code.corp.indeed.com/dradis-api/drmx-auth-api/-/merge_requests/201) | drmx-auth-api | [PACMAN-12247] Force proctor inactive in integration tests             | 2026-01-07 |
| [!202](https://code.corp.indeed.com/dradis-api/drmx-auth-api/-/merge_requests/202) | drmx-auth-api | [PACMAN-12249] APD ASYNC: Add retry logic for PIE sync delay           | 2026-01-12 |
| [!1789](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1789)        | pie-service   | [PACMAN-12254] APD ASYNC: Remove proctor forcing in integration tests  | 2026-01-12 |
| [!204](https://code.corp.indeed.com/dradis-api/drmx-auth-api/-/merge_requests/204) | drmx-auth-api | [PACMAN-12247] Fix proctor bucket to actually be inactive              | 2026-01-12 |
| [!205](https://code.corp.indeed.com/dradis-api/drmx-auth-api/-/merge_requests/205) | drmx-auth-api | Just in case: Revert APD ASYNC retry logic                             | 2026-01-13 |
| [!1798](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1798)        | pie-service   | [PACMAN-12254] Just In Case: Revert Remove proctor forcing             | 2026-01-13 |
| [!1829](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1829)        | pie-service   | [PACMAN-12560] Add validation logging for owner fallback discrepancies | 2026-02-18 |
| [!1833](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1833)        | pie-service   | Revert PACMAN-12560: Remove validation logging for owner fallback      | 2026-02-18 |
| [!1838](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1838)        | pie-service   | [PACMAN-12630] Centralize proctor force groups via gRPC interceptor    | 2026-03-03 |
| [!1844](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1844)        | pie-service   | [PACMAN-12681] Fix ADVS proctor bucketing mismatch                     | 2026-03-05 |
| [!1836](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1836)        | pie-service   | [PACMAN-12611] APD: Fix batching proctor allocation                    | 2026-02-26 |


**Jira:** [PACMAN-12113](https://indeed.atlassian.net/browse/PACMAN-12113), [PACMAN-12241](https://indeed.atlassian.net/browse/PACMAN-12241), [PACMAN-12247](https://indeed.atlassian.net/browse/PACMAN-12247), [PACMAN-12249](https://indeed.atlassian.net/browse/PACMAN-12249), [PACMAN-12254](https://indeed.atlassian.net/browse/PACMAN-12254), [PACMAN-12402](https://indeed.atlassian.net/browse/PACMAN-12402), [PACMAN-12403](https://indeed.atlassian.net/browse/PACMAN-12403), [PACMAN-12404](https://indeed.atlassian.net/browse/PACMAN-12404), [PACMAN-12405](https://indeed.atlassian.net/browse/PACMAN-12405), [PACMAN-12560](https://indeed.atlassian.net/browse/PACMAN-12560), [PACMAN-12601](https://indeed.atlassian.net/browse/PACMAN-12601), [PACMAN-12602](https://indeed.atlassian.net/browse/PACMAN-12602), [PACMAN-12603](https://indeed.atlassian.net/browse/PACMAN-12603), [PACMAN-12604](https://indeed.atlassian.net/browse/PACMAN-12604), [PACMAN-12611](https://indeed.atlassian.net/browse/PACMAN-12611), [PACMAN-12631](https://indeed.atlassian.net/browse/PACMAN-12631), [PACMAN-12681](https://indeed.atlassian.net/browse/PACMAN-12681), [PACMAN-12755](https://indeed.atlassian.net/browse/PACMAN-12755), [PACMAN-12761](https://indeed.atlassian.net/browse/PACMAN-12761), [PACMAN-12763](https://indeed.atlassian.net/browse/PACMAN-12763)

#### APD Rate Limiter Tuning (pie-tool)


| MR                                                                     | Repo     | Title                                                                    | Merged     |
| ---------------------------------------------------------------------- | -------- | ------------------------------------------------------------------------ | ---------- |
| [!548](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/548) | pie-tool | [PACMAN-12113] Add latency metric for CreateAdvertiserEvent              | 2026-01-05 |
| [!551](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/551) | pie-tool | [PACMAN-12229] Increase advertiser sync rate limiter in QA               | 2026-01-05 |
| [!553](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/553) | pie-tool | [PACMAN-12239] Increase advertiser sync rate limiter in Prod             | 2026-01-07 |
| [!557](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/557) | pie-tool | [PACMAN-12292] Update advertiser sync rate limiter default to 50 req/sec | 2026-01-12 |


**Jira:** [PACMAN-12229](https://indeed.atlassian.net/browse/PACMAN-12229), [PACMAN-12239](https://indeed.atlassian.net/browse/PACMAN-12239), [PACMAN-12250](https://indeed.atlassian.net/browse/PACMAN-12250), [PACMAN-12251](https://indeed.atlassian.net/browse/PACMAN-12251), [PACMAN-12252](https://indeed.atlassian.net/browse/PACMAN-12252), [PACMAN-12253](https://indeed.atlassian.net/browse/PACMAN-12253), [PACMAN-12292](https://indeed.atlassian.net/browse/PACMAN-12292)

#### APD Phase 2 — Single Owner Constraint (CORGI-82)

**Jira (planning/spike):** [SCAPE-126](https://indeed.atlassian.net/browse/SCAPE-126), [SCAPE-149](https://indeed.atlassian.net/browse/SCAPE-149), [SCAPE-150](https://indeed.atlassian.net/browse/SCAPE-150), [SCAPE-151](https://indeed.atlassian.net/browse/SCAPE-151), [SCAPE-152](https://indeed.atlassian.net/browse/SCAPE-152), [SCAPE-153](https://indeed.atlassian.net/browse/SCAPE-153), [SCAPE-154](https://indeed.atlassian.net/browse/SCAPE-154), [SCAPE-155](https://indeed.atlassian.net/browse/SCAPE-155)

---

### 2. Nexus UI Updates — Epic [PACMAN-12430](https://indeed.atlassian.net/browse/PACMAN-12430)

Authored [Frontend Permissions Design Review](https://docs.google.com/document/d/1_bHzVE6YLnnJzQoDucgpzAdzWpZxJ76_GyqMGkpVvqc) defining the Nexus dashboard frontend changes.

#### Permission Helpers


| MR                                                                        | Repo   | Title                                                                   | Merged     |
| ------------------------------------------------------------------------- | ------ | ----------------------------------------------------------------------- | ---------- |
| [!889](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/889) | pac-ui | [PACMAN-12431] NEXUS_UI: Implement canViewAnalytics() permission helper | 2026-02-18 |
| [!893](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/893) | pac-ui | [PACMAN-12447] NEXUS_UI: Add canViewInterviews() permission helper      | 2026-02-23 |
| [!922](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/922) | pac-ui | [PACMAN-12448] NEXUS_UI: Add isNexusOnlyUser() permission helper        | 2026-03-04 |
| [!977](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/977) | pac-ui | [PACMAN-12435] Fix duplicate property in UserDetailsPageTest            | 2026-03-04 |


**Jira:** [PACMAN-12431](https://indeed.atlassian.net/browse/PACMAN-12431), [PACMAN-12432](https://indeed.atlassian.net/browse/PACMAN-12432), [PACMAN-12433](https://indeed.atlassian.net/browse/PACMAN-12433), [PACMAN-12434](https://indeed.atlassian.net/browse/PACMAN-12434), [PACMAN-12435](https://indeed.atlassian.net/browse/PACMAN-12435), [PACMAN-12263](https://indeed.atlassian.net/browse/PACMAN-12263)

#### Route Guards (employers-routes / pac-ui)


| MR                                                                                           | Repo             | Title                                                             | Merged     |
| -------------------------------------------------------------------------------------------- | ---------------- | ----------------------------------------------------------------- | ---------- |
| [!626](https://code.corp.indeed.com/one-host/platform/employers-routes/-/merge_requests/626) | employers-routes | [PACMAN-12437] NEXUS: Add route guard for /candidates             | 2026-03-12 |
| [!630](https://code.corp.indeed.com/one-host/platform/employers-routes/-/merge_requests/630) | employers-routes | [PACMAN-12443] NEXUS_UI: Add route guard for /interview-routing   | 2026-03-12 |
| [!631](https://code.corp.indeed.com/one-host/platform/employers-routes/-/merge_requests/631) | employers-routes | [PACMAN-12442] NEXUS_UI: Add route guard for /ihp (Hiring Events) | 2026-02-23 |
| [!642](https://code.corp.indeed.com/one-host/platform/employers-routes/-/merge_requests/642) | employers-routes | [PACMAN-12442] Revert: route guard for /ihp                       | 2026-02-23 |
| [!644](https://code.corp.indeed.com/one-host/platform/employers-routes/-/merge_requests/644) | employers-routes | [PACMAN-12442] Add IHP permission guard for /ihp routes           | 2026-03-11 |
| [!649](https://code.corp.indeed.com/one-host/platform/employers-routes/-/merge_requests/649) | employers-routes | [PACMAN-12438] NEXUS: Add route guard for /analytics              | 2026-03-17 |


**Jira:** [PACMAN-12436](https://indeed.atlassian.net/browse/PACMAN-12436), [PACMAN-12437](https://indeed.atlassian.net/browse/PACMAN-12437), [PACMAN-12438](https://indeed.atlassian.net/browse/PACMAN-12438), [PACMAN-12439](https://indeed.atlassian.net/browse/PACMAN-12439), [PACMAN-12440](https://indeed.atlassian.net/browse/PACMAN-12440), [PACMAN-12441](https://indeed.atlassian.net/browse/PACMAN-12441), [PACMAN-12442](https://indeed.atlassian.net/browse/PACMAN-12442), [PACMAN-12443](https://indeed.atlassian.net/browse/PACMAN-12443), [PACMAN-12444](https://indeed.atlassian.net/browse/PACMAN-12444), [PACMAN-12445](https://indeed.atlassian.net/browse/PACMAN-12445), [PACMAN-12446](https://indeed.atlassian.net/browse/PACMAN-12446), [PACMAN-12447](https://indeed.atlassian.net/browse/PACMAN-12447), [PACMAN-12448](https://indeed.atlassian.net/browse/PACMAN-12448), [PACMAN-12449](https://indeed.atlassian.net/browse/PACMAN-12449), [PACMAN-12450](https://indeed.atlassian.net/browse/PACMAN-12450)

#### Nexus Bug (ADMIN / JOBS+CANDIDATES permission set)


| MR                                                                          | Repo        | Title                                                                           | Merged     |
| --------------------------------------------------------------------------- | ----------- | ------------------------------------------------------------------------------- | ---------- |
| [!1809](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1809) | pie-service | [PACMAN-12424] Fix integration test expectations for NEXUS_READ_LIMITED removal | 2026-02-03 |


**Jira:** [PACMAN-12418](https://indeed.atlassian.net/browse/PACMAN-12418), [PACMAN-12424](https://indeed.atlassian.net/browse/PACMAN-12424), [PACMAN-12471](https://indeed.atlassian.net/browse/PACMAN-12471)

---

### 3. Spring Boot 3.x Bulk Migration

Created AI-assisted bulk migration prompt, reducing time-to-complete per service. 8 services migrated ahead of Nov 14 deadline.


| MR                                                                                             | Repo                               | Title                                               | Merged     |
| ---------------------------------------------------------------------------------------------- | ---------------------------------- | --------------------------------------------------- | ---------- |
| [!357](https://code.corp.indeed.com/pac/pac-authorization-service/-/merge_requests/357)        | pac-authorization-service          | Spring Boot 3 Migration                             | 2025-10-20 |
| [!104](https://code.corp.indeed.com/pac/pac-rbac-backfill/-/merge_requests/104)                | pac-rbac-backfill                  | Spring Boot 3 Migration                             | 2025-10-21 |
| [!28](https://code.corp.indeed.com/pac/pac-authorization-sync-postajob/-/merge_requests/28)    | pac-authorization-sync-postajob    | Spring Boot 3 Migration                             | 2025-10-21 |
| [!45](https://code.corp.indeed.com/pac/pac-authorization-sync-permissions/-/merge_requests/45) | pac-authorization-sync-permissions | Spring Boot 3 Migration                             | 2025-10-21 |
| [!65](https://code.corp.indeed.com/pac/pac-activity-logger/-/merge_requests/65)                | pac-activity-logger                | Spring Boot 3 Migration                             | 2025-10-22 |
| [!69](https://code.corp.indeed.com/pac/pac-activity-logger/-/merge_requests/69)                | pac-activity-logger                | Revert "Spring Boot 3 Migration"                    | 2025-10-22 |
| [!70](https://code.corp.indeed.com/pac/pac-activity-logger/-/merge_requests/70)                | pac-activity-logger                | Re-apply Spring Boot 3 Migration (Revert of Revert) | 2025-10-22 |
| [!77](https://code.corp.indeed.com/pac/pac-hierarchy-change-listener/-/merge_requests/77)      | pac-hierarchy-change-listener      | PACMAN-1945: Migrate to Spring Boot 3.4             | 2025-10-22 |
| [!172](https://code.corp.indeed.com/dradis-api/drmx-auth-api/-/merge_requests/172)             | drmx-auth-api                      | PACMAN-1946: Spring Boot 3 Migration                | 2025-10-22 |
| [!92](https://code.corp.indeed.com/pac/pac-authorization-sync-candidate/-/merge_requests/92)   | pac-authorization-sync-candidate   | Spring Boot 3 Migration                             | 2025-10-29 |


**Jira:** [PACMAN-1945](https://indeed.atlassian.net/browse/PACMAN-1945), [PACMAN-1946](https://indeed.atlassian.net/browse/PACMAN-1946), [PACMAN-1949](https://indeed.atlassian.net/browse/PACMAN-1949), [PACMAN-1954](https://indeed.atlassian.net/browse/PACMAN-1954), [PACMAN-1957](https://indeed.atlassian.net/browse/PACMAN-1957), [PACMAN-1959](https://indeed.atlassian.net/browse/PACMAN-1959), [PACMAN-1961](https://indeed.atlassian.net/browse/PACMAN-1961), [PACMAN-1966](https://indeed.atlassian.net/browse/PACMAN-1966)

---

### 4. Flaky Tests & CI Pipeline Reliability

Fixed 15+ flaky tests across multiple repos, improving team velocity and pipeline trust.


| MR                                                                                      | Repo                      | Title                                                                   | Merged     |
| --------------------------------------------------------------------------------------- | ------------------------- | ----------------------------------------------------------------------- | ---------- |
| [!725](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/725)               | pac-ui                    | [PACMAN-1994] Fix all flaky timer tests (5 test files)                  | 2025-10-27 |
| [!727](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/727)               | pac-ui                    | PACMAN-1996: Fix flaky manage/add users tests                           | 2025-10-27 |
| [!729](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/729)               | pac-ui                    | PACMAN-1999: Fix flaky tests with race conditions (5 files)             | 2025-10-27 |
| [!733](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/733)               | pac-ui                    | [SCAPE-115] Fix flaky integration tests - race conditions               | 2025-11-03 |
| [!754](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/754)               | pac-ui                    | [SCAPE-178] Fix TestCafe browser initialization timeout in CI           | 2025-11-19 |
| [!790](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/790)               | pac-ui                    | [PACMAN-12047] Fix flaky tests in Grant Access, Manage Users            | 2025-12-15 |
| [!978](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/978)               | pac-ui                    | [PACMAN-12691] Fix flaky assignRoleToManyUsers integration test         | 2026-03-04 |
| [!1738](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1738)             | pie-service               | [SCAPE-177] Fix flaky integration tests due to DB replication lag       | 2025-11-20 |
| [!1792](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1792)             | pie-service               | [PACMAN-12303] Fix flaky CachedAdvertiserServiceSpec (mock pollution)   | 2026-01-14 |
| [!1794](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1794)             | pie-service               | [PACMAN-12312] Fix flaky test: add missing resolveAdvertiser mock       | 2026-01-12 |
| [!1799](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1799)             | pie-service               | [PACMAN-12329] Fix flaky SetPermissionsForUserOnAllAdvertisersTests     | 2026-01-20 |
| [!1837](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1837)             | pie-service               | [PACMAN-12618] Fix flakey parallel tests in CachedAdvertiserServiceSpec | 2026-02-26 |
| [!1796](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1796)             | pie-service               | [PACMAN-12313] Fix 118 test deprecation warnings                        | 2026-01-13 |
| [!373](https://code.corp.indeed.com/pac/pac-authorization-service/-/merge_requests/373) | pac-authorization-service | [SCAPE-157] Fix GraphQL list non-null linter warning                    | 2025-11-18 |


**Jira:** [PACMAN-1994](https://indeed.atlassian.net/browse/PACMAN-1994), [PACMAN-1996](https://indeed.atlassian.net/browse/PACMAN-1996), [PACMAN-1999](https://indeed.atlassian.net/browse/PACMAN-1999), [PACMAN-12303](https://indeed.atlassian.net/browse/PACMAN-12303), [PACMAN-12312](https://indeed.atlassian.net/browse/PACMAN-12312), [PACMAN-12313](https://indeed.atlassian.net/browse/PACMAN-12313), [PACMAN-12329](https://indeed.atlassian.net/browse/PACMAN-12329), [PACMAN-12618](https://indeed.atlassian.net/browse/PACMAN-12618), [PACMAN-12691](https://indeed.atlassian.net/browse/PACMAN-12691), [SCAPE-108](https://indeed.atlassian.net/browse/SCAPE-108), [SCAPE-115](https://indeed.atlassian.net/browse/SCAPE-115), [SCAPE-157](https://indeed.atlassian.net/browse/SCAPE-157), [SCAPE-177](https://indeed.atlassian.net/browse/SCAPE-177), [SCAPE-178](https://indeed.atlassian.net/browse/SCAPE-178)

#### pie-webapp Pipeline Fixes (Spring Boot 3.4 compatibility)


| MR                                                                         | Repo       | Title                                                                              | Merged     |
| -------------------------------------------------------------------------- | ---------- | ---------------------------------------------------------------------------------- | ---------- |
| [!1662](https://code.corp.indeed.com/pie/pie-webapp/-/merge_requests/1662) | pie-webapp | [SCAPE-181] Fix DradisBoxcarConfig @Autowired incompatibility with Spring Boot 3.4 | 2025-11-20 |
| [!1663](https://code.corp.indeed.com/pie/pie-webapp/-/merge_requests/1663) | pie-webapp | SCAPE-182: Add missing Jakarta EL dependencies for Proctor                         | 2025-11-20 |
| [!1664](https://code.corp.indeed.com/pie/pie-webapp/-/merge_requests/1664) | pie-webapp | SCAPE-182: Fix Jakarta EL version mismatch for Proctor compatibility               | 2025-11-20 |


**Jira:** [SCAPE-181](https://indeed.atlassian.net/browse/SCAPE-181), [SCAPE-182](https://indeed.atlassian.net/browse/SCAPE-182)

---

### 5. Gradle Build Caching — Epic [PACMAN-12158](https://indeed.atlassian.net/browse/PACMAN-12158)

Added Gradle build caching to 28 repositories to improve CI/CD pipeline performance.


| MR                                                                          | Repo        | Service     | Merged     |
| --------------------------------------------------------------------------- | ----------- | ----------- | ---------- |
| [!1719](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1719) | pie-service | pie-service | 2025-10-29 |


**Jira (28 repos):** [PACMAN-12157](https://indeed.atlassian.net/browse/PACMAN-12157) (datadrop-service), [PACMAN-12159](https://indeed.atlassian.net/browse/PACMAN-12159) (drmx-auth-api), [PACMAN-12160](https://indeed.atlassian.net/browse/PACMAN-12160) (drmx-common-auth), [PACMAN-12161](https://indeed.atlassian.net/browse/PACMAN-12161) (employer-hierarchy-service), [PACMAN-12162](https://indeed.atlassian.net/browse/PACMAN-12162) (graphql-authorization-starter), [PACMAN-12163](https://indeed.atlassian.net/browse/PACMAN-12163) (pac-activity-logger), [PACMAN-12164](https://indeed.atlassian.net/browse/PACMAN-12164) (pac-authorization-backfill-candidate), [PACMAN-12165](https://indeed.atlassian.net/browse/PACMAN-12165) (pac-authorization-connector-spicedb), [PACMAN-12166](https://indeed.atlassian.net/browse/PACMAN-12166) (pac-authorization-events), [PACMAN-12167](https://indeed.atlassian.net/browse/PACMAN-12167) (pac-authorization-permission-events-producer), [PACMAN-12168](https://indeed.atlassian.net/browse/PACMAN-12168) (pac-authorization-sync-candidate), [PACMAN-12169](https://indeed.atlassian.net/browse/PACMAN-12169) (pac-authorization-sync-permissions), [PACMAN-12170](https://indeed.atlassian.net/browse/PACMAN-12170) (pac-authorization-sync-postajob), [PACMAN-12171](https://indeed.atlassian.net/browse/PACMAN-12171) (pac-eee-debezium), [PACMAN-12172](https://indeed.atlassian.net/browse/PACMAN-12172) (pac-eee-domain-events-transformer), [PACMAN-12173](https://indeed.atlassian.net/browse/PACMAN-12173) (pac-hierarchy-change-listener), [PACMAN-12174](https://indeed.atlassian.net/browse/PACMAN-12174) (pac-index-builders), [PACMAN-12175](https://indeed.atlassian.net/browse/PACMAN-12175) (pac-jp-ad-agency-sync), [PACMAN-12176](https://indeed.atlassian.net/browse/PACMAN-12176) (pac-qa-integration-test-nightly), [PACMAN-12177](https://indeed.atlassian.net/browse/PACMAN-12177) (pac-rbac-backfill), [PACMAN-12178](https://indeed.atlassian.net/browse/PACMAN-12178) (permission-notification-service), [PACMAN-12179](https://indeed.atlassian.net/browse/PACMAN-12179) (pie-client), [PACMAN-12180](https://indeed.atlassian.net/browse/PACMAN-12180) (pie-datadrop-worker), [PACMAN-12181](https://indeed.atlassian.net/browse/PACMAN-12181) (pie-tool), [PACMAN-12182](https://indeed.atlassian.net/browse/PACMAN-12182) (pie-webapp), [PACMAN-12183](https://indeed.atlassian.net/browse/PACMAN-12183) (rbac-permission-service), [PACMAN-12184](https://indeed.atlassian.net/browse/PACMAN-12184) (shadow-authzed-client), [PACMAN-12189](https://indeed.atlassian.net/browse/PACMAN-12189) (pie-service), [PACMAN-2006](https://indeed.atlassian.net/browse/PACMAN-2006)

---

### 6. Observability & Monitoring


| MR                                                                                          | Repo                            | Title                                                                        | Merged     |
| ------------------------------------------------------------------------------------------- | ------------------------------- | ---------------------------------------------------------------------------- | ---------- |
| [!550](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/550)                      | pie-tool                        | [PACMAN-12227] Add Terraform-managed Datadog dashboard                       | 2026-01-05 |
| [!554](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/554)                      | pie-tool                        | [PACMAN-12272] Add Terraform pipeline to pie-tool CI                         | 2026-01-12 |
| [!559](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/559)                      | pie-tool                        | PACMAN-12272: Fix dashboard_lists Terraform resource                         | 2026-01-12 |
| [!560](https://code.corp.indeed.com/pie/pie-tool/-/merge_requests/560)                      | pie-tool                        | [PACMAN-12272] Fix dashboard tags                                            | 2026-01-12 |
| [!68](https://code.corp.indeed.com/pac/pac-eee-debezium/-/merge_requests/68)                | pac-eee-debezium                | [PACMAN-12696] Increase Kafka Connect lag monitor window to 20m              | 2026-03-05 |
| [!1848](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1848)                 | pie-service                     | [PACMAN-12726] Exclude weak urgency deps from PieService healthcheck monitor | 2026-03-16 |
| [!45](https://code.corp.indeed.com/pac/permission-notification-service/-/merge_requests/45) | permission-notification-service | [PACMAN-12725] Adjust PermissionNotificationService healthcheck monitor      | 2026-03-16 |
| [!101](https://code.corp.indeed.com/pac/pac-hierarchy-change-listener/-/merge_requests/101) | pac-hierarchy-change-listener   | [PACMAN-12724] Adjust Pac Hierarchy Change Latency monitor window            | 2026-03-16 |
| [!1818](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1818)                 | pie-service                     | [PACMAN-12474] Fix missing PIE logs when validation fails                    | 2026-02-05 |
| [!68](https://code.corp.indeed.com/pac/pac-activity-logger/-/merge_requests/68)             | pac-activity-logger             | PACMAN-1991: Fix DataDog dashboard deployment                                | 2025-10-22 |


**Jira:** [PACMAN-12227](https://indeed.atlassian.net/browse/PACMAN-12227), [PACMAN-12272](https://indeed.atlassian.net/browse/PACMAN-12272), [PACMAN-12474](https://indeed.atlassian.net/browse/PACMAN-12474), [PACMAN-12696](https://indeed.atlassian.net/browse/PACMAN-12696), [PACMAN-12724](https://indeed.atlassian.net/browse/PACMAN-12724), [PACMAN-12725](https://indeed.atlassian.net/browse/PACMAN-12725), [PACMAN-12726](https://indeed.atlassian.net/browse/PACMAN-12726), [PACMAN-12738](https://indeed.atlassian.net/browse/PACMAN-12738), [PACMAN-1991](https://indeed.atlassian.net/browse/PACMAN-1991)

---

### 7. Code Health & Repository Maintenance

#### .gitignore Cleanup (12 repos)


| MR                                                                                             | Repo                               | Merged     |
| ---------------------------------------------------------------------------------------------- | ---------------------------------- | ---------- |
| [!176](https://code.corp.indeed.com/dradis-api/drmx-auth-api/-/merge_requests/176)             | drmx-auth-api                      | 2025-10-27 |
| [!71](https://code.corp.indeed.com/pac/pac-activity-logger/-/merge_requests/71)                | pac-activity-logger                | 2025-10-27 |
| [!96](https://code.corp.indeed.com/pac/pac-authorization-sync-candidate/-/merge_requests/96)   | pac-authorization-sync-candidate   | 2025-10-28 |
| [!48](https://code.corp.indeed.com/pac/pac-authorization-sync-permissions/-/merge_requests/48) | pac-authorization-sync-permissions | 2025-10-27 |
| [!30](https://code.corp.indeed.com/pac/pac-authorization-sync-postajob/-/merge_requests/30)    | pac-authorization-sync-postajob    | 2025-11-03 |
| [!47](https://code.corp.indeed.com/pac/pac-eee-debezium/-/merge_requests/47)                   | pac-eee-debezium                   | 2025-10-28 |
| [!46](https://code.corp.indeed.com/pac/pac-eee-domain-events-transformer/-/merge_requests/46)  | pac-eee-domain-events-transformer  | 2025-11-03 |
| [!81](https://code.corp.indeed.com/pac/pac-hierarchy-change-listener/-/merge_requests/81)      | pac-hierarchy-change-listener      | 2025-10-27 |
| [!61](https://code.corp.indeed.com/pac/pac-index-builders/-/merge_requests/61)                 | pac-index-builders                 | 2025-10-29 |
| [!396](https://code.corp.indeed.com/pac/pac-onegraph/-/merge_requests/396)                     | pac-onegraph                       | 2025-10-27 |
| [!107](https://code.corp.indeed.com/pac/pac-rbac-backfill/-/merge_requests/107)                | pac-rbac-backfill                  | 2025-10-27 |
| [!1713](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1713)                    | pie-service                        | 2025-11-03 |


**Jira:** [SCAPE-81](https://indeed.atlassian.net/browse/SCAPE-81) through [SCAPE-93](https://indeed.atlassian.net/browse/SCAPE-93)

#### CODEOWNERS


| MR                                                                         | Repo         | Merged     |
| -------------------------------------------------------------------------- | ------------ | ---------- |
| [!384](https://code.corp.indeed.com/pac/pac-onegraph/-/merge_requests/384) | pac-onegraph | 2025-10-14 |


**Jira:** [SCAPE-57](https://indeed.atlassian.net/browse/SCAPE-57) (14 repos total)

#### Automated Dependency Updates

**Jira:** [PACMAN-12153](https://indeed.atlassian.net/browse/PACMAN-12153), [PACMAN-12154](https://indeed.atlassian.net/browse/PACMAN-12154), [PACMAN-12155](https://indeed.atlassian.net/browse/PACMAN-12155)


| MR                                                                                          | Repo                            | Merged     |
| ------------------------------------------------------------------------------------------- | ------------------------------- | ---------- |
| [!33](https://code.corp.indeed.com/pac/pac-authorization-sync-postajob/-/merge_requests/33) | pac-authorization-sync-postajob | 2025-12-17 |
| [!194](https://code.corp.indeed.com/dradis-api/drmx-auth-api/-/merge_requests/194)          | drmx-auth-api                   | 2025-12-17 |
| [!63](https://code.corp.indeed.com/dradis-api/drmx-common-auth/-/merge_requests/63)         | drmx-common-auth                | 2025-12-17 |


#### Eldarg Onboarding


| MR                                                                                | Repo                  | Title                                          | Merged     |
| --------------------------------------------------------------------------------- | --------------------- | ---------------------------------------------- | ---------- |
| [!1714](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1714)       | pie-service           | [PACMAN-1216] Onboard pie-service to Eldarg    | 2025-10-29 |
| [!1721](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1721)       | pie-service           | [PACMAN-1216] Add Gradle publishing for Eldarg | 2025-10-30 |
| [!1722](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1722)       | pie-service           | Revert Eldarg integration changes              | 2025-10-30 |
| [!16](https://code.corp.indeed.com/pac/shadow-authzed-client/-/merge_requests/16) | shadow-authzed-client | [PACMAN-1389] Onboard to Eldarg                | 2025-10-30 |


**Jira:** [PACMAN-1216](https://indeed.atlassian.net/browse/PACMAN-1216), [PACMAN-1389](https://indeed.atlassian.net/browse/PACMAN-1389)

#### MySQL 8 Upgrade


| MR                                                                          | Repo        | Title                                         | Merged     |
| --------------------------------------------------------------------------- | ----------- | --------------------------------------------- | ---------- |
| [!1717](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1717) | pie-service | Upgrade MySQL from 5.7 to 8.0 for CI/CD tests | 2025-11-03 |


**Jira:** [PACMAN-2005](https://indeed.atlassian.net/browse/PACMAN-2005)

#### Parallel Test Execution


| MR                                        | Repo        | Title                                                   | Merged |
| ----------------------------------------- | ----------- | ------------------------------------------------------- | ------ |
| (included in pie-service CI improvements) | pie-service | Enable parallel test execution for 20-40% faster builds | —      |


**Jira:** [PACMAN-2007](https://indeed.atlassian.net/browse/PACMAN-2007)

#### Other


| MR                                                                               | Repo                 | Title                                                       | Merged     |
| -------------------------------------------------------------------------------- | -------------------- | ----------------------------------------------------------- | ---------- |
| [!21](https://code.corp.indeed.com/crm/master-accounts-tool/-/merge_requests/21) | master-accounts-tool | [PACMAN-12141] Populate tblmasteraccount.country            | 2025-12-15 |
| [!1808](https://code.corp.indeed.com/pie/pie-service/-/merge_requests/1808)      | pie-service          | [PACMAN-12563] Document nested GitLab CI pipeline structure | 2026-03-03 |
| [!12](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/12)       | pac-ai-library       | [PACMAN-11997] Add GitLab and Atlassian CLI skills          | 2025-12-02 |


**Jira:** [PACMAN-12141](https://indeed.atlassian.net/browse/PACMAN-12141), [PACMAN-12563](https://indeed.atlassian.net/browse/PACMAN-12563), [PACMAN-12576](https://indeed.atlassian.net/browse/PACMAN-12576), [PACMAN-12188](https://indeed.atlassian.net/browse/PACMAN-12188)

---

### 8. FGP / Resource Access Requests


| MR                                                                         | Repo         | Title                                                     | Merged     |
| -------------------------------------------------------------------------- | ------------ | --------------------------------------------------------- | ---------- |
| [!383](https://code.corp.indeed.com/pac/pac-onegraph/-/merge_requests/383) | pac-onegraph | SCAPE-46: Extend GraphQL schema for FGP resource requests | 2025-10-15 |
| [!723](https://code.corp.indeed.com/one-host/pac-ui/-/merge_requests/723)  | pac-ui       | [SCAPE-77] Add RequestAccessDialog component              | 2025-10-27 |


**Jira:** [SCAPE-46](https://indeed.atlassian.net/browse/SCAPE-46), [SCAPE-55](https://indeed.atlassian.net/browse/SCAPE-55), [SCAPE-77](https://indeed.atlassian.net/browse/SCAPE-77), [SCAPE-79](https://indeed.atlassian.net/browse/SCAPE-79)

---

### 9. PAC AI Library

Created the PAC AI Library with 7 reusable AI skills for team productivity.


| MR                                                                         | Repo           | Title                                                               | Merged     |
| -------------------------------------------------------------------------- | -------------- | ------------------------------------------------------------------- | ---------- |
| [!5](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/5)   | pac-ai-library | Add Spring Boot 3 bulk migration prompt                             | 2025-10-21 |
| [!9](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/9)   | pac-ai-library | [SCAPE-172] Add APD Phase 2 Planning Prompts                        | 2025-12-02 |
| [!12](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/12) | pac-ai-library | [PACMAN-11997] Add GitLab and Atlassian CLI skills                  | 2025-12-02 |
| [!14](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/14) | pac-ai-library | [PACMAN-12028] Add Sourcegraph CLI skill                            | 2025-12-03 |
| [!17](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/17) | pac-ai-library | [PACMAN-12374] Add Slack browser automation skill                   | 2026-01-28 |
| [!18](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/18) | pac-ai-library | [PACMAN-12375] Add Google Docs/Sheets Browser Automation Skill      | 2026-01-29 |
| [!19](https://code.corp.indeed.com/pac/pac-ai-library/-/merge_requests/19) | pac-ai-library | [PACMAN-12377] Add Atlassian Document Format guidance to ACLI skill | 2026-02-04 |


**Jira:** [PACMAN-11997](https://indeed.atlassian.net/browse/PACMAN-11997), [PACMAN-12028](https://indeed.atlassian.net/browse/PACMAN-12028), [PACMAN-12374](https://indeed.atlassian.net/browse/PACMAN-12374), [PACMAN-12375](https://indeed.atlassian.net/browse/PACMAN-12375), [PACMAN-12378](https://indeed.atlassian.net/browse/PACMAN-12378), [SCAPE-172](https://indeed.atlassian.net/browse/SCAPE-172)

---

### 10. Incident Response

#### EVNT-8083 — Global Apply ACR Drop (~$664K revenue impact)

**Jira:** [PACMAN-12395](https://indeed.atlassian.net/browse/PACMAN-12395) (Epic), [PACMAN-12394](https://indeed.atlassian.net/browse/PACMAN-12394), [PACMAN-12396](https://indeed.atlassian.net/browse/PACMAN-12396), [PACMAN-12397](https://indeed.atlassian.net/browse/PACMAN-12397), [PACMAN-12406](https://indeed.atlassian.net/browse/PACMAN-12406), [EVNT-8083](https://indeed.atlassian.net/browse/EVNT-8083)

Documents: [Retrospective](https://docs.google.com/document/d/1dwBTm9If87IVNh8TPsXtmdcEBy_BCbAjuTPvmQ2Hpx8), [RCA](https://docs.google.com/document/d/1um9Gu8VxLZEwc--hGJKjiPRJkL__nHXZK83Foh8-btg)

#### EVNT-8378 — Permission error, employers can't access candidate page (~7k customers)

**Jira:** [PACMAN-12597](https://indeed.atlassian.net/browse/PACMAN-12597) (Epic), [PACMAN-12598](https://indeed.atlassian.net/browse/PACMAN-12598), [PACMAN-12600](https://indeed.atlassian.net/browse/PACMAN-12600), [PACMAN-12609](https://indeed.atlassian.net/browse/PACMAN-12609), [PACMAN-12688](https://indeed.atlassian.net/browse/PACMAN-12688), [EVNT-8378](https://indeed.atlassian.net/browse/EVNT-8378), [EVNT-8381](https://indeed.atlassian.net/browse/EVNT-8381), [EVNT-8390](https://indeed.atlassian.net/browse/EVNT-8390)

Documents: [Retrospective](https://docs.google.com/document/d/13sLJzDLVp7lCRJmadIl4vCyU8vzL1m-QOiJ8jQ9k-Tg), [Executive Comms](https://docs.google.com/document/d/19q1v_DJrXEco5OWmEN0nGERItIbl8sZ29XUARdjNrgc)

---

### 11. pac-authorization-service Test Data Builder (In Progress)

Ongoing effort to modernize test infrastructure with jOOQ-based TestDataBuilder.

**Jira:** [PACMAN-12791](https://indeed.atlassian.net/browse/PACMAN-12791) through [PACMAN-12803](https://indeed.atlassian.net/browse/PACMAN-12803) (13 tickets)

---

### 12. Other Jira Tickets


| Key                                                              | Summary                                                               | Status         |
| ---------------------------------------------------------------- | --------------------------------------------------------------------- | -------------- |
| [PACMAN-12575](https://indeed.atlassian.net/browse/PACMAN-12575) | Investigate PIEP data drop for September 2026 scale                   | Closed         |
| [PACMAN-12262](https://indeed.atlassian.net/browse/PACMAN-12262) | Epic: Restrict Indeed.com Features for Nexus-Only Users               | In Progress    |
| [PACMAN-12372](https://indeed.atlassian.net/browse/PACMAN-12372) | Remove CI CPU and Memory Limits                                       | Pending Triage |
| [SCAPE-72](https://indeed.atlassian.net/browse/SCAPE-72)         | Fix Kafka authentication in pac-authorization-sync-candidate          | Closed         |
| [SCAPE-75](https://indeed.atlassian.net/browse/SCAPE-75)         | Add pac-hierarchy-change-listener dashboard to Pie dashboard list     | Closed         |
| [SCAPE-107](https://indeed.atlassian.net/browse/SCAPE-107)       | Review and merge Eldarg MR (pie-client)                               | Closed         |
| [ELDARG-555](https://indeed.atlassian.net/browse/ELDARG-555)     | dremr/dremr-content-rendering-service: Eldarg onboarding batch change | Closed         |


---

## Documents Authored (for calibration reference)


| Document                           | Link                                                                                   | Impact                              |
| ---------------------------------- | -------------------------------------------------------------------------------------- | ----------------------------------- |
| EVNT-8378 Retrospective            | [doc](https://docs.google.com/document/d/13sLJzDLVp7lCRJmadIl4vCyU8vzL1m-QOiJ8jQ9k-Tg) | SEV-1 retro, ~7k customers affected |
| EVNT-8083 Retrospective            | [doc](https://docs.google.com/document/d/1dwBTm9If87IVNh8TPsXtmdcEBy_BCbAjuTPvmQ2Hpx8) | SEV-1 retro, ~$664K revenue impact  |
| EVNT-8083 RCA                      | [doc](https://docs.google.com/document/d/1um9Gu8VxLZEwc--hGJKjiPRJkL__nHXZK83Foh8-btg) | Root cause analysis                 |
| EVNT-8378 Exec Comms               | [doc](https://docs.google.com/document/d/19q1v_DJrXEco5OWmEN0nGERItIbl8sZ29XUARdjNrgc) | Executive communication             |
| Frontend Permissions Design Review | [doc](https://docs.google.com/document/d/1_bHzVE6YLnnJzQoDucgpzAdzWpZxJ76_GyqMGkpVvqc) | Nexus permission architecture       |
| PieServiceSyncListener Rollout     | [doc](https://docs.google.com/document/d/1LPclBTwih8mGtg2v9Mzfz08_EXHPK0FIr7LZou9zI-U) | APD rollout checklist               |
| APD Proctor Comms                  | [doc](https://docs.google.com/document/d/1clkc1M4RpEoM6qCE11jLiRwd_qvKgp9WQBkyrffC7kA) | Cross-team coordination             |


---

## Cross-Team Support

- **Trust & Safety** — triaged bulk messaging PIE permission request: [Slack](https://slack.com/archives/C033KRPLS57/p1772146424837709)
- **AI Sourcing** — reviewed OneGraph client MR for Dan Jackson: [Slack](https://slack.com/archives/C033KRPLS57/p1772666010882639)
- **org-mgmt** — helped diagnose Root Advertiser creation failure with Maggie Abbott: [Slack](https://slack.com/archives/C045LJMKUEP/p1768247957691399)
- **ATS team** — picked up ATS Sync blocker: [Slack](https://indeed-pte.slack.com/archives/C033KRPLS57/p1772816625340729)
- **Spending Employer** — negotiated synchronous approach citing EVNT-8083: [Slack](https://indeed-pte.slack.com/archives/C0924P4HL6S/p1768315341787279)
- **CamCap** — coordinated APD streaming events with Jayesh Kshirsagar: [Slack](https://indeed-pte.slack.com/archives/C033KRPLS57/p1770386107007689)
- **Interview Platform** — coordinated to eliminate PIE runtime dependency: [Slack](https://indeed-pte.slack.com/archives/CP0V1C9QF/p1767734009142209)
- **One Host** — coordinated Nexus UI changes over multiple weeks: [Slack](https://indeed-pte.slack.com/archives/C01S44035M3/p1771349779080039)

---

## Onboarding Velocity

- Productive within first week (Oct 6). Led first cross-team initiative by week 3 (SCAPE-46). Reviewed SpiceDB deep dive, CIAM onboarding guide, and Sourcegraph deep search within first 2 weeks. Set up 1-1s with all team members immediately.

