# PAC - Q4 Smart Screening PRD

**Source**: [https://docs.google.com/document/d/1xuoEyLE2SaYBNpFt-DCwsgrlqHjonjbP29aevIP3uis](https://docs.google.com/document/d/1xuoEyLE2SaYBNpFt-DCwsgrlqHjonjbP29aevIP3uis)
**Owner**: Saranya Mohandoss
**Last Updated**: 2026-03-18T19:08:53Z

---

# PAC - Q4 Smart Screening PRD
# Overview
# Field,Detail
PRD Name,PAC - Q4 Smart Screening PRD
Version, 1.2
Target Launch Date,End of Q4 FY25 (Launch Ready)
Author,Saranya Mohandoss
Status,Implementation Ready
Related Documents, CIAM FY'Q4 plan for Nexus
Involved CIAM Pods,PAC
JIRA, PACMAN-12108: Nexus Q4 Support
# Sign-Off & Approval
# Role,Name,Org/Team,Date,Signature/Status
Product, Hannah Han-Ciaravella ,CIAM,"Jan 6, 2026",Sign off
Eng, Michael Arlt ,PAC,"Jan 6, 2026",Reviewed
UX, Elliott Sweet ,CIAM,"Jan 7, 2026",Reviewed
Eng, Heber Billings ,CIAM,"Jan 6, 2026",Reviewed
Product, Abhishek Chhibber ,CIAM,,Informed
Eng, Jeremy Fu ,CIAM,,Informed
Note: References to Indeed.com within this document pertain to the full suite of Indeed employer capabilities outside Smart Screening Hub—including, but not limited to, Job Management and Candidate Management.
# Goals & Hypothesis
# Problem Statement
# User Problems
1. Large enterprise employers need to restrict some users (for example, agency users) access only to Smart Screening Hub. Without this, they hesitate to adopt Smart Screening or limit which users they onboard due to security concerns about exposing their sensitive information.
2. Employers cannot directly grant edit permissions for Smart Screening features, which creates a complicated user experience and often results in them granting more access than necessary.
# Platform Problems
1. Current Smart Screening permissions are modeled at a very granular level (e.g., view:screening_criteria, view:candidate_profile), requiring PAC to build new permissions and clients to integrate for every Smart Screening launch. This creates a recurring integration bottleneck, preventing product-ready Smart Screening features from being shipped until the permissions infrastructure and integration are complete.
# Goals
1. Provide Smart Screening: View and Smart Screening: Edit permissions that strictly enforce Smart Screening-only job-level access and completely restrict access to Indeed.com employer features.
2. Create a seamless and less confusing experience for Admins/User managers to grant Smart Screening-only permissions, which should also take into account.
· supporting job-based permission syncing of ATS user data.
· not adding complexity in granting existing <a href="http://indeed.com">Indeed.com</a> permissions
3. Enable the Smart Screening team to easily integrate to add access checks for the new permissions.
# Hypothesis
By providing dedicated Smart Screening permissions that restrict access to Indeed.com, large ENT employers feel comfortable adding their ATS recruiters and agency users to operate fully within Smart Screening.
# Success Metrics
# Primary
· Increase the % of secondary users with Smart Screening permissions (Smart Screening View/Edit ONLY) from 1<a href="https://link.indeed.tech/RTPDAMYHKE3">%</a> to 10% within Nexus-enrolled advertisers.
· Baseline
· Nexus shared an <a href="https://link.indeed.tech/RTPDAWEPH9C">IQL</a> to get the Nexus enrolled advertisers, but many Nexus advertisers were added prior to building this IQL. Using this IQL, ~<a href="https://link.indeed.tech/RTPDAMYHKE3">1.05% </a>is the baseline as of 2/19/26.
· Nexus also shared a spreadsheet with the full list of Nexus advertisers. Using this list, ~<a href="https://link.indeed.tech/RTPDAY3EXKW">1.12% </a>is the baseline.
# Secondary
· 80% of users with Smart Screening: Edit permissions perform at least one edit action inside the Smart Screening Hub in 4 weeks.
· 99% of users with Smart Screening permissions are able to access assigned jobs within 5 seconds of permission grant (grant can be from user management UX, ATS sync, or ISS link automation)
· Positive customer feedback regarding improved permissions.
· Piggyback on Smart Screening’s UXR to collect feedback
· Positive client feedback regarding the integration experience.
· Collect feedback from Nexus and other clients using a survey/questionnaire??
# DNH (Guardrail)
· No decrease in users added with existing Indeed permissions (Admin, Jobs, Candidates)
· Volume of general permission-related support tickets must remain within a 5% variance of the pre-launch baseline during the first 30 days post-release.
# Opportunity Size
TBD (To Be Determined: Requires quantification of advertisers, users, or estimated business value).
# Target Audience & Impact
# Target Users
· Primary: ATS recruiters and agency users at large Enterprise (ENT) Employers.
· Secondary: Employer Admins/User Managers who need a simple, low-friction way to provision Smart Screening-only access.
# Use Cases
1. As an ATS Recruiter/Agency user with only Smart Screening permissions, I should be able to access the Smart Screening Hub and its features without being exposed to I<a href="http://indeed.com">ndeed.com </a>employer capabilities, such as Job and Candidate Management, that are irrelevant to me.
2. As an ATS Recruiter user, I should be able to access the Smart Screening Hub and its features, in addition to accessing the Indeed.com employer capabilities to which I have access to.
3. As an Employer Admin/User Manager, I need to easily onboard external agency users/my own recruiters to access Smart Screening for specific jobs, ensuring they cannot access any other features on Indeed.com.
4. As an Identity Integration Eng team member, I need to easily use Smart Screening permissions to map ATS and Indeed (Smart Screening) permissions for ATS sync.
5. As an Employer Admin/User Manager, I need to manage users and grant them access to I<a href="http://indeed.com">ndeed.com </a>capabilities, while ensuring the user management effort does not exceed the current experience.
6. As a member of the Smart Screening client team, I require clear guidance and integration steps to easily integrate the Smart Screening product with the Smart Screening permissions.
# Scope (In / Out)
# Q4 Launch Scope
# Feature,Detail
New Permissions,Creation of the Smart Screening: Edit permissions; Implementation of the new permissions within PAC
Improvements to Existing Permissions,Enhancement to Smart Screening: View to grant view-only access to “all” features inside Smart Screening and not just to screening criteria and candidate profile
Access Control,"Users with only Smart Screening permissions must be blocked from accessing the main Indeed.com employer platform (Job Management, Billing, etc.)."
Smart Screening Feature Access,"Smart Screening: Edit users must be able to edit all features within the Smart Screening Hub for their jobs (e.g., Editing screening criteria, setting up automations)."
Permission Granularity,Support for granting Smart Screening permissions at both the Advertiser level (all Smart Screening enrolled jobs) and the Job level.
Provisioning,New permissions support both methods for granting permissions: automatic provisioning via ATS identity sync AND manual admin add (via Admin Portal and Request Access flow).
Permissions Framework and Admin Portal UX Enhancements,"Handling of a single user receiving different Smart Screening permissions for different jobs (i.e., same user getting Smart Screening: View for one job and Smart Screening: Edit for another) (Involves complex admin portal UX improvement)."
Request Access,
Source Management,
# Out-of-Scope
· Client teams are responsible for adding access checks to gate Smart Screening capabilities behind the different Smart Screening permissions.
· II team is responsible for ATS user sync, mapping of ATS roles and Nexus permissions
# Future Scope (Out-of-Scope for Q4 Launch)
· Smart Screening Guest permissions.
# Technical Constraints & Considerations
· The solution should be easy for the Smart Screening team to integrate and may not require changes from domain teams across Indeed.com (avoiding significant technical dependencies).
· The new framework must support granular data from ATS sync (e.g., user is a recruiter on job A and hiring manager on job B) without complicating manual Admin portal management.
· Permissions should be scalable, as the list of Smart Screening features is expected to expand in the near future.
· The system needs to support an option for employers to either restrict Smart Screening users or allow them to access any employer capabilities outside the Smart Screening hub.
# Requirements (Functional & Non-Functional)
# High-Level Requirements (User Stories)
· As a user with only Smart Screening: Edit permission, I can access and use all editing features within the Smart Screening Hub for the jobs I am assigned, but I am unable to access the main Indeed.com employer platform (Job Management, Billing, etc.).
· As a user with only Smart Screening: View permission, I can access and view all features within the Smart Screening Hub for the jobs I am assigned, but I do not have access to the main Indeed.com employer platform (Job Management, Billing, etc.).
· As an Employer, I must be able to grant the Smart Screening: Edit and Smart Screening: View permissions to users through the Admin Portal.
· As part of the Permissions system, I must enable employer admins to grant Smart Screening permissions at both the Advertiser Level (all Smart Screening-enrolled jobs) and the specific Job Level.
· As part of the Permissions system, I must enable users to obtain Smart Screening: View permissions for one job and Smart Screening: Edit permissions for another, if needed.
# Functional Requirements
Note: This section talks about the general Nexus Q4 requirements, and there is a separate <a href="https://docs.google.com/document/d/1xuoEyLE2SaYBNpFt-DCwsgrlqHjonjbP29aevIP3uis#ja4cwv16hihw">requirements section</a> for ATS sync.
1. Smart Screening: Edit permissions should grant users edit access to all Smart Screening features for their jobs. The list below is provided for reference, but the permissions should be flexible enough to allow Smart Screening to expand its features without requiring permission changes for every release.
· Smart Screening: Edit users are not expected to edit job attributes, such as title and description. They should be able to view them.
· Features inside Smart Screening
· Enroll jobs - TBD
· Set-up/Edit Auto-enrollment rule - TBD
· Edit screening criteria
· Set up AI Recruiter
· Perform license verifications
· Filter applicants by license verification status,
· Set up Automations - Messaging, Interviews based on candidate score or verification completion
· CSV export and distributing score visualization on the job list.
· Rules/bulk job management for the above
· candidate re-scoring, candidate list re-scoring
Note: (added on 2/3/25) Based on this <a href="https://indeed-pte.slack.com/archives/C08KD2JDWG7/p1770130805571289?thread_ts=1769639382.731299&cid=C08KD2JDWG7">thread</a>, for Q4 as a short-term solution, users with Smart Screening: Edit permissions will not be scheduling or managing interviews inside Nexus Hub. This will be an exception to the statement made above - “Smart Screening: Edit permissions should grant users edit access to all Smart Screening features for their jobs”. The Nexus team (and Interviews) will learn from this launch, iterate, and decide on the long-term requirements for Interview capabilities. Only users with Candidates permissions can access Interviews inside Nexus Hub.
2. Smart Screening: View permissions should grant users view access to all features within Smart Screening for their assigned jobs.
Note: Users with Smart Screening: View permissions will not have access to Interviews inside Nexus Hub for the same reasons as listed for users with Smart Screening: Edit permissions.
3. Users with only Smart Screening permissions (both View and Edit) should not be able to access I<a href="http://indeed.com">ndeed.com </a>capabilities (Job Man, Candidate Management, Billing, etc).
4. Users with Smart Screening permissions (both View and Edit) should be able to access their account management, including changing their email address.
5. Admins/User managers should be able to grant Smart Screening: View or Smart Screening: Edit permissions manually via the Admin Portal for all or specific Smart Screening jobs. The experience should be seamless and straightforward (Indeed.com's current dependencies, including Jobs, Candidates, and Smart Screening permissions, are extremely confusing).
6. (P1) Admins/User managers should be able to grant Smart Screening: View or Smart Screening: Edit permissions manually within the Smart Screening workflow. (We can introduce a workflow similar to the Post A Job funnel - Add users with FGP Candidates).
7. Smart Screening users should be able to get Smart Screening: View for one job and Smart Screening: Edit for another job. This should be supported for:
· PAC UI - Admins should be able to grant the same user Smart Screening: View access for one job and Smart Screening: Edit access for another job.
· ATS sync - Support ATS sync to handle users with mixed-access levels (e.g., Job A: View, Job B: Edit) and ensure Indeed permissions are provisioned to match this 1:1 job-to-permission relationship.
· Request Access: When a user has Smart Screening: View for one job request and Smart Screening: Edit for another job, admins should be able to approve the request and grant the requested access.
8. Granting Smart Screening permissions at the advertiser level must grant access only to all Smart Screening-enrolled jobs within that advertiser, not to all jobs.
9. Admins/User managers should be able to decide whether to grant I<a href="http://indeed.com">ndeed.com </a>permissions in addition to Smart Screening permissions, if they wish.
10. Admins/User managers should be able to grant existing I<a href="http://indeed.com">ndeed.com </a>permissions (E.g., Jobs, Candidates) without any added complexity (depending on whether Jobs+Candidates will get Smart Screening access and the migration of existing users with those permissions).
11. The Users page should display a list of Smart Screening users with the correct permissions.
12. Admins/User managers should be able to edit Smart Screening users' permissions (grant more jobs, remove jobs, change job-based Smart Screening: View or Edit permissions).
13. Admins/User Managers should be able to edit user permissions: grant Smart Screening: Edit to Smart Screening: View users to assign specific jobs; and change Smart Screening: Edit to Smart Screening: View permissions to assign specific jobs.
14. User Managers should be able to grant Smart Screening permissions that are the same as or less than their own, and only to jobs for which they have access.
· User managers with Smart Screening: Update permission set should be able to:
i. Add/edit users and grant them Smart Screening: Update permission sets.
ii. Add/edit users and grant them Smart Screening: View All (+optional update some) permission sets. They should be able to grant update access to any set of jobs.
iii. Add/edit users and grant them Smart Screening: Limited permission sets. They should be able to grant view and/or update access to any set of jobs.
· User managers with Smart Screening: View All (+optional update some) permission set should be able to:
i. Add/edit users and grant them Smart Screening: View All (+optional update some) permission sets. They should be able to grant update access only to the jobs they have update access to.
ii. Add/edit users and grant them Smart Screening: Limited permission sets. They should be able to grant view_all; and/or update access only to the jobs they have update access to.
· User managers with Smart Screening: Limited permission set should be able to:
i. Add/edit users and grant them Smart Screening: Limited permission sets. They should be able to grant view access only to the jobs they have view access to, and/or update access only to the jobs they have update access to.
15. Existing users accessing Smart Screening capabilities with their “Jobs + Candidates” permissions should not lose their Smart Screening access.
16. Admins should be able to access the Smart Screening Hub, edit all Smart Screening features, and enroll/unenroll jobs in Smart Screening.
17. (TBD) Edge cases: To handle edge cases (users with Jobs, Candidates, Limited Candidates, or Jobs and Limited Candidates for CGA1), we introduced new logic on the modal, including disabling Smart Screening permissions. Based on the design, we need to revisit these cases and determine the requirements.
Notes(Updated based on decisions made by PAC team on 2/5/25):
· New users post-Q4 with the Jobs and Candidates permission sets will not automatically have access to Smart Screening. Jobs, Candidates permission sets, and Smart Screening permission sets will not be mutually exclusive.
· If admins want to grant users access to both <a href="http://indeed.com">Indeed.com</a> capabilities and Smart screening, they will grant Jobs, Candidates, and the needed Smart Screening permission sets.
· If admins want to grant users access to only <a href="http://indeed.com">Indeed.com</a> capabilities, they will grant them Jobs, Candidates, or whatever permission sets as needed, and not the Smart Screening permission set.
· If admins want to grant users access only to Smart Screening, they will grant them the Smart Screening permission set, not the Jobs or Candidates permission sets.
· Existing users in Nexus advertisers with the Jobs + Candidates permission sets have edit access to the Smart Screening hub for CGA1. To make sure they have a seamless experience, they will be granted Smart screening: Edit permission set via backfill before the Q4 launch.
18. (Updated on 3/18/26) Forcegrant Smart Screening: Update (advertiser-level RBAC) permission set to all existing users with Jobs and Candidate permission sets in all advertisers.
· This migration should happen immediately after we launch Q4 so that admins can see the Nexus permission sets on PAC UX and the users who have been granted Nexus permission set can access Nexus.
Premium Plus: Some background on why we changed the migration strategy. CGA1 and Q4 Nexus model is advertiser-based; employers enroll specific advertisers in Nexus, and those advertisers can use smart screening across all Nexus-enrolled jobs. However, to expand into the SMB market, Nexus introduced Premium Plus. This model is job-based: a recruiter posts a hosted job, sponsors it for Premium Plus, and expects immediate access to Smart Screening. Requiring admins to manually grant the Nexus permission set before using a paid feature would create significant adoption friction. To unblock Premium Plus, we are automatically granting the SmartScreening_update permission set to all existing users with the Jobs and Candidates permission set (the largest SMB user segment next to admins). Also, data shows admins use the “Currently Used” tab 98% of the time in the PAC Add User modal; by updating this segment, we ensure admins will likely reuse these pre-configured permission set combinations for new users.
ATS Sync
Descoped version - PACMAN-12363: Update PAC UI to disable Nexus permissionSets editing when ATS sync is enabled
Note: The following requirements apply to only Smart Screening permissions and to all users on the advertiser, not just those synced from ATS. Please note that the ATS sync here refers to the Kombo-based integration and the Workday (Indeed-built) sync.
19. If ATS sync is turned on for an advertiser, users and their Nexus permissions synced from ATS should be displayed in the Users table.
20. If ATS sync is turned on for an advertiser, admins/user managers should not be able to grant Smart Screening permissions (View, Edit) to new users they add.
21. If ATS sync is turned on for an advertiser, admins/user managers should not be able to grant Smart Screening permissions by editing existing users’ permissions (View, Edit).
22. If ATS sync is turned on for an advertiser, admins/user managers should not be able to select any existing user with Nexus permissions in the “Currently Used” tab of the Add/Edit User modal.
23. If ATS sync is turned on for an advertiser, admins/user managers should not be able to access “manage limited access” to edit jobs assigned to the user for Nexus permissions.
24. (TBD) If ATS sync is turned on for an advertiser, users should not be able to request Nexus permissions.
· Users should not be able to request “Smart Screening: View or edit” permission sets from the Request Access modal via the Request Access CTA available on the Users page and Product Chooser page.
· (Not in PAC Scope, in Nexus’s scope) Users with the “Smart Screening: View” permission set should not be able to request the “Smart Screening: Edit” permission from the Nexus Hub.
25. When an ATS sync is turned off for an advertiser, admins/user managers should be able to grant Smart Screening permissions (View, Edit) to new users they add in the PAC Admin portal.
26. When an ATS sync is turned off for an advertiser, admins/user managers should be able to grant Smart Screening permissions (View, Edit) by editing existing users' permissions in the PAC Admin portal.
27. If ATS sync is turned off for an advertiser, admins/user managers should be able to select any existing user with Nexus permissions in the “Currently Used” tab of the Add/Edit User modal.
28. If ATS sync is turned off for an advertiser, admins/user managers should be able to access “manage limited access” to edit jobs assigned to the user for Nexus permissions.
29. Irrespective of the advertiser’s ATS sync status, admins/user managers should be able to remove users from the advertiser (including users synced from ATS).
· (TBD) Should we inform admins that if they remove users synced from ATS, they will be added back during the next sync?
30. Auditability: For troubleshooting purposes, our systems should know where permissions are added from, at a minimum, by an admin user or via ATS sync.
· (TBD) To achieve this, is it possible to update PAC indexes (pac_add_user, pac_fgp_update_relation, pieUpdateUserPermissions) to log that data?
31. If ATS sync is turned on for an advertiser, we should inform admins why the Smart Sourcing permissions are locked.
32. Emp Org/hierarchy - Smart Screening permissions should be locked for the ATS-integrated advertiser and their child advertisers.
· L1 - ATS integration is on
i. Lock Smart Screening permissions for L1, L21, L22, L211 andans L212
· L21 - ATS integration is on
i. Lock Smart Screening permissions for L21, L211, and L212
# Request Access
33. Smart Screening: View users should be able to request Smart Screening: Edit permissions for specific jobs.
34. Any user on the Smart Screening advertiser should be able to request Smart Screening: View or Smart Screening: Edit for all Smart Screening jobs or specific jobs.
35. Smart Screening: View users should be able to request Smart Screening: Edit permissions from within the Smart Screening hub for all or specific Smart Screening jobs (using the Request Access banner).
36. Users should be able to request Smart Screening permissions for all or specific Smart Screening jobs via the Request Access CTA on the Users and Product Chooser pages.
37. Admins should be able to approve access requests for all Smart Screening jobs or specific jobs.
38. Admins should be able to edit the access requests for Smart Screening permissions for specific jobs and add/remove jobs as needed before approving.
# Non-Functional Requirements
39. (TBD) Smart Screening UI displays filtered job and candidate lists based on user permissions (e.g., a user with access to Jobs 1, 5, and 10 sees only those jobs in the list). If this is supported by PAC calls, they should be performant and not have any latency issues (Latency: < 500ms??).
40. IQL - Job-based Request Access
· # of jobs that a user requests Smart Screening: View permissions for
· # of jobs that a user requests Smart Screening: Update permissions for
· # of users that requested Smart Screening: View permissions for specific jobs
· # of users that requested Smart Screening: Edit permissions for specific jobs
· (Not related to Job-based requests specifically) What was the user's entry point for the access request? (e.g., Nexus Hub, Product Chooser, or the Users page)
# Design & UX
· Design Link: <a href="https://www.figma.com/design/Ll2m2YMQHs9WI6KW3LiBpe/Nexus-permissions?node-id=210-12375&p=f&t=upcfWZwqdi1dD84a-0">Nexus permissions</a>(WIP).
· UX Goal: The Admin portal UX (Granting Smart Screening-only permissions) must follow the principle of least friction.
# Building Blocks
Smart Screening Q4 deliverables extend beyond Smart Screening-specific permissions to include foundational platform improvements. Building Smart Screening-only permissions properly requires addressing three interconnected components:
1. Smart Screening Product-Scoped Permissions: New permissions (Smart Screening: View, Smart Screening: Edit) that restrict users to Smart Screening Hub features without granting access to Indeed.com.
2. FGP Framework Improvements: Address technical debt and UX limitations from the FGP Candidates MVP that were deferred due to timeline and priority constraints. Building Smart Screening on a fragile foundation would compound issues, so we must stabilize the underlying FGP infrastructure to ensure reliable, intuitive experiences.
3. Source Management UX
4. (TBD)Search-Based Job Groups (v1): (TBD) Smart Screening job enrollment utilizes search-based job groups with dynamic search criteria. To grant users access to "all Smart Screening jobs in advertiser," we need a mechanism to resolve which jobs belong to the Smart Screening search-based job group. While full end-to-end support is planned for post-Q4, we must first build foundational capabilities (v1) to make this operationally viable.
Outcome: A stable, scalable permission framework that supports Smart Screening requirements and sets the foundation for future product surface permissions.
# Dependencies
· Smart Screening Team: Implementation of client-side permission checks and ensuring their endpoints are correctly gated behind the Smart Screening permissions.
· Identity Integration Team for ATS User Sync: Ensuring the sync can correctly handle and provision users with Smart Screening permissions.
# Change log
# Version,Date,Author,Section Changed,Description of Change,Reason
1.0, 12-15-2025, Saranya Mohandoss ,Initial,Initial PRD creation,Based on  CIAM FY'Q4 plan for Nexus and meeting notes  Nexus_edit permission/permission set discovery
1.1, 01-07-2026, Saranya Mohandoss ,Use cases,Split a use case into 2,Split into 2 use cases to cover users who have only Advance Screening permissions and users who have Advance Screening permissions in addition to other  Indeed.com  permissions
1.1, 01-08-2026, Saranya Mohandoss ,Functional Requirements,Removed part of requirement #15,"New users who are granted Jobs+Candidates may or may not be granted Smart Screening access; there are no specific requirements, so this has been removed."
1.1, 01-08-2026, Saranya Mohandoss ,Functional Requirements,Added details to #7,Added the different workflows where this requirement needs to be supported.
1.1, 01-08-2026, Saranya Mohandoss ,Out of Scope,Removed “enroll/un-enroll” Nexus jobs for Edit users,"Confirmed with Nexus that Smart Screening: Edit users will not be expected to enroll/un-enroll jobs in Nexus at any time, so removed this."
1.1, 01-11-2026, Saranya Mohandoss ,High-Level Requirements (User Stories),Updated one of them to reflect what permissions systems as control over,"Rather than saying “correctly enforce permissions at the advertiser level and job level”, updated it to “enable admins to grant access at the advertiser level and job level”."
1.1, 01-11-2026, Saranya Mohandoss ,Non-Functional Requirements,Updated “Source” admin UX requirements,Added detailed requirements for admin portal UX for job permissions added from ATS sync.
1.2, 01-22-2026, Saranya Mohandoss ,Functional Requirements,Update “Source” requirements,Updated requirements to support the descoped Kombo MVP version.
1.2, 01-23-2026, Saranya Mohandoss ,Full doc,Rebranding,Replaced “Advanced Screening” with “Smart Screening”.
1.2, 02-03-2026, Saranya Mohandoss ,Functional Requirements,Added an exception to users with Smart Screening: Edit and Smart_Screening: View permissions so they will not have access to Interviews inside Nexus Hub.,"Nexus decided that, to deliver quickly in Q4, they can limit access to Interview capabilities to only users with Candidates permissions; hence, users with only Smart Screening permissions will not have access to Interviews inside Nexus Hub."
1.2, 02-06-2026, Saranya Mohandoss ,Functional Requirements,"Added a note on the decisions made to make Jobs, Candidates, and Smart Screening permission sets non-mutually exclusive.",New users who post Q4 with the Jobs and Candidates permission sets will not automatically have access to Smart Screening. Admins can grant the Jobs+Candidates+Smart Screening permission sets to users who need access to both  Indeed.com  and Smart Screening.
1.2, 02-17-2026, Saranya Mohandoss ,Functional Requirements,Added User Manager-specific requirements.,"Updated user manager requirements, as there is more clarity on the permission sets that will be exposed on the UX."
1.2, 02-19-2026, Saranya Mohandoss ,Functional Requirements,Updated EmpOrg/hierarchy requirements for ATS sync.,Updated this based on discussions with II as they figure out how ATS sync should work in the hierarchy.
1.2, 02-19-2026, Saranya Mohandoss ,Primary KR,Updated the KR to better show the value,Updated the KR to better show the value
1.2, 03-02-2026, Saranya Mohandoss ,Non-Functional Requirements,Updated job-based request access requirements for IQL,The current request access index does not support job-based requests. So added new requirements to support it.
1.3, 03-18-2026, Saranya Mohandoss ,Functional Requirements,Change in migration strategy to accommodate Premium Plus requirements,Changed it to forcegrant Nexus_update permission set to all existing users with Jobs and Candidate permission sets.
# Appendix
# Context
# · What have we built already for CGA1?
Smart Screening: View grants read-only access (view screening criteria and candidate profiles) only within the Smart Screening Hub for a user's assigned jobs. Access to these same jobs on Indeed.com is blocked because the broad <hosted_jobs: read> and <hosted_jobs: candidates> permissions required by Indeed.com are not granted.
Admins and users with full Jobs+Candidates permissions can access the Smart Screening Hub and edit all its features.
# · Why did we not build Smart Screening: Edit permissions for CGA1?
Initial plan to build Smart Screening: Edit permissions (extending Smart Screening: View with specific edit access) failed due to two main issues: 1. The Admin Portal could not support assigning different Fine-Grained Permissions (FGP) across separate job subsets for a single user (e.g., Job Set A for Smart Screening: View, Job Set B for Smart Screening: Edit). 2. The initial scope of Smart Screening: Edit (only edit screening and edit candidate profile) did not grant access to other critical Smart Screening features (e.g., setting up messaging automations), failing to meet the requirement for full editing capabilities.
Resolution: Smart Screening: Edit was dropped. Users needing full edit access within Smart Screening are granted the existing Jobs+Candidates permission set for CGA1.
# Requirements Moved Out of CGA1
41. (TBD - Some of this ownership may go to the II team ) “Source” for ATS Sync (P<a href="https://indeed.atlassian.net/browse/PACMAN-12110">ACMAN-12110: Configurable Permission Source Management)</a>
· Develop a configurable Source management system to track and manage user permissions across multiple sources (e.g., different ATSes).
· When the ATS sync is removed, the user’s explicitly granted permissions on Indeed.com should not be affected.
· Source should be displayed on the Users page for ATS users and/or permissions (and also for permissions added via ISS link, inheritance)
i. Should we display the exact ATS info based on which the access is granted?
ii. Is it ok if we mention the source without going into the details of whether users and/or permissions are added via ATS sync?
· Admins should not be able to edit the permissions synced from ATS.
i. TBD - Order of precedence of permissions from ATS sync, ISS link, access granted on Indeed, and FIM permissions.
ii. If a user is granted Smart Screening: view for a job via the ISS link, but the ATS sync grants edit access to the same job, should admins be able to edit the permissions? Guess no, but TBD. Vice versa, if edit is granted via ISS link and ATS sync says View, would we leave the edit permissions as-is?
· Admins should not be able to remove users who are added using the ATS sync data
# image1.png
Can we have a sign off matrix?
Not just irrelevant, but it also gives more than what Nexus only users need. Violation of least privilege principle.
what's the difference between problem 2 and 1?
should we be explicit about read only and full permissions?
Another important goal is to make it easier for Nexus to integrate with.
+ add the job level.
somewhere we need to measure client teams (like Nexus)'s integration experience.
This might be a subset of Nexus features. Did we mean to use these as examples?
+ As a Nexus client team, I need to be provided with clear guidance and integration steps and easily integrate Nexus product with the Nexus permissions.
To be clear, is changing how read only is implemented today in scope or not?
I will get a confirmation.
I would divide this into user problem AND platform problem. For the latter, it is around we don't have an easy way to support the ever-growing Nexus features at scale.
If we think this is the right experience, we should be firm about this being a functional requirement; whether this can be implemented or who should implement it is a different discussion.
I would reword this to be a functional requirement that existing users with Nexus permissions (granted via Job+candidates) should NOT lose their access.
I didn't get this.
Not just Job management. Nexus only users should not be able to access ANY links to ANY features outside of Nexus.
I didn't get this.
Added, good idea, thanks
Added
Added
added
Added
added
Fair enough, updated
Updated
This has been a confusing term for a while. Nexus is another tab on the left hand nav of Indeed.com. They will have access to it. A nexus user shouldn't get jobs/candidates page access, right? They should still have all their standard account management access? (change email, etc?)
I like how this is worded much better (see my comment above). This is just how standard permissions already work, right? Just like how a user with 'candidates' permissions can't see the 'jobs' page?
Updated, see if it makes sense now
Updated
Updated
Updated it, I think I started conveying this better with the PRD flow and forgot to come back and update this :)
Updated the first bullet point to reflect and removing this one
#2 talks about the need for "Edit" permissions specifically
Added
It seems like these are the two user problems?
1 - Users cannot directly grant Nexus Edit permissions which creates a complicated user experience and grants more access than necessary
2 - Users require the ability to restrict some users to only access Nexus Hub
Adding why would be helpful here
We should add the other Nexus access combinations here
I don't think this statement is accurate without "only" added here
same here, I think this needs "only" to be accurate
+ only, unless we are planning to make nexus permissions sets mutually exclusive with Indeed.com sets
Confirming this means there are 4 options for Nexus permissions - View specific, View all, Edit specific, Edit all; and users can have both View and Edit permissions simultaneously
Is this a requirement or nice to have?
+ for all jobs
We will need to evaluate if this is actually possible based on the various combinations of permissions and what they mean functionally
Is this already possible in the EJP component?
Does this mean new users with Jobs + Candidates will not get Nexus access?
Throughout we need to align on clear language for the permission sets, which is IMO Nexus_View and Nexus_Edit because we ultimately have these 4 options:
Nexus_View_Limited
Nexus_View
Nexus_Edit_Limited
Nexus_Edit
Do the references to indeed.com in this doc refer to employers.indeed.com or the actual indeed.com? I've been assuming it's the employers site all along, but have had some confusion around this.
Is there a target number or percentage that could be added?
How will this data be gathered and analyzed?
Similar to the above, we should probably have specific targets
We're actually restricting access to specific parts, not the entire site, right?
Since we do not have Nexus_full for CGA1, users who are required to edit Nexus features are granted Jobs+Candidates permissions, which gives them access to job and candidate management on Indeed.com
Updated it. But yes, even if restricted, the users should have access to the account settings.
Added account management access to Requirements
Yes, this is how it works for Nexus_limited user managers (after bug fixes)
updated
Semantics question: why did we choose Nexus_full for edit and Nexus_limited for view access, instead of Nexus_edit and Nexus_view?
employers.indeed.com, in some places, I updated it to "the main Indeed.com employer platform (Job Management, Billing, etc.).
based on Heber's comment.
Does this mean the various links should be hidden? If so, do we control rendering of all these links?
Additionally, having a full list would be great so we have a definition of done.
updated
added
Great question, and the more I think about it, it feels like Nexus_view and Nexus_edit are descriptive without being subjective. @esweet@indeed.com thoughts?
added
+1
It reads to me that #2 says "lacking of the solution, aka, Nexus edit permission" is the user problem, which seems off.
To me the user problems are
1. employers who do not use Indeed.com for TME do not have a way to grant Nexus only permissions.
2. employers who use indeed.com for TME do not have a way limit certain users access to Nexus.
Any employer capabilities outside of the Nexus Hub.
My recommendation: ANY employer capabilities outside of the Nexus hub.
I'm leaning towards that, but would like to understand what makes the most sense to users.
Regardless of that decision, existing job+candidate users should not lose the Nexus access.
Sorry, still not. Isn't it implicit of Nexus permission?
Added a note below sign-off for clarity
Updated, please check
Updated, please check
Updated
There is another PRD: https://docs.google.com/document/d/106PncjbGAJ4N6UD3My1gxqAnRgCGsEJ0eIxCqNl6brQ/edit?tab=t.0
It covers a lot of the syncing (adding AND REMOVING) of permissions. This requires us to keep track of a permission source which would need to be done during this quarter. Should tracking the permission source be a goal here?
I added a comment with a very similar thought at the very top of this doc
Will that be a technical challenge? There might be some UX challenge unless we add Nexus_Edit as an additional permission for users who already have J+C as a part of migration. My preference would be to make it so J+C doesn't grant Nexus, only Nexus or Admin
I also felt like this seemed like a Nexus problem to solve, not an us problem
For this doc, we can use Nexus_View or Nexus_Edit
+ Admin, Jobs+Candidates
@hannahh@indeed.com to confirm this
@hannahh@indeed.com Does this need to be supported through the PAC UI, or would this being a BE option that can function for request access flows and ATS sync be sufficient?
Updated
Updated
We talked about this and decided to keep it as Nexus_View and Nexus_Edit for the purpose of this doc
Improve this
Moved this to non-functional and elaborated. Look-up resources call in Spicedb is known for its performance issues, so if Nexus decides to use that to build these lists, I want to make sure it's called out explicitly to be performant
Elliot suggested this to understand if there are dependencies between permissions, such as for CGA1, where jobs+candidates, as well as Nexus_Limited, are mutually exclusive.
If there are no such conditions identified, I will remove the table
Added
Tag Elliott
@jfu@indeed.com
Added, please check
@esweet@indeed.com this is part of ATS sync, but adding it here as their MVP is primary getting built to support Nexus
Added something for now, I will update this as we evolve
@hannahh@indeed.com any insights on this? Do you think it is fair to say 50% of users with Nexus-only permissions will get Nexus_edit permissions?
Added some thoughts, will update these later
@marlt@indeed.com @hannahh@indeed.com @esweet@indeed.com @hbillings@indeed.com Please provide your sign off once you are aligned and think the PRD is good to go
@smohandoss@indeed.com update this
What can candidate profiles access do? IIRC, this allows Nexus users to view applicants as well as automate messages to applicants?
Is it because Nexus team tries to limit CGA scope or technical challenges?
Nitpick: could we rename these permissions? I’d prefer not to base permission names on project codenames. Naming them by functionality would be clearer and avoid confusion over time.
I was thinking to use Reduce the number of users with admin privileges by 80% (e.g., from 20 users down to 4). I prefer this because it shows that we designed a solution where we are offering least privilege and users can still get their work done.
Like less than 5% increase?
@marlt@indeed.com In addition to product goals, I think there should be some engineering goals given SWEs are raising concerns around its complexity.
CC: @mnethery@indeed.com
Can we put this in appendix? We should keep the focus on what shall be built. All of the context here will be part of the solution considerations I assume.
I don't have a strong opinion on this.
I would explicitly call out AND "everything else"
With CGA1, there were lessons learned that some folks take the examples as the only thing users should have access to or should be blocked from.
What are other features other than screening criteria and candidate profile?
@hannahh@indeed.com Does it mean, the automated permission provisioning through ISS clicks will be deactivated?
I wonder why do we need to define a so-called "Nexus_Edit" permissions which represent a set of more granular permissions? Wouldn't it be better to define and support those granular permissions as lego blocks and allow clients to compose their own?
CC: @marlt@indeed.com
No I think this is specifically for Nexus full permissions.
The automated provisioning will still be in place for read only permission.
We provide the permissions, it would be up to the Nexus Team(s) to gate the features behind the provided permissions. Is there more work here for us to provide?
"implementation" is nebulous. We can implement the `nexus_edit` in the user management pages, but implementing the checks on these permissions would be done by other teams.
There shouldn't be anything for us to do here, this is how our permissions already work.
need edit access
Thank you Hannah!
I don't have a specific recommendation on how to fix this, I'm just noticing that there's some repetitiveness between this section and the preceding ones. I think there's an opportunity to make things more concise (and I'd get AI to do it :D )
Updated
Gave edit access, sorry
Fair suggestion, moved it
The original plan is to name the customer-facing permission set names with "Advanced Screening" only, but you are making a fair point, updated the doc to reflect this
Good point, updated, see if it makes sense
Also added client integrations to out-of-scope
For CGA1, we created new resources for candidate_profile and screening_criteria, which were used by the Nexus team to gate the related capabilities for view-only access.
If they were to gate all Nexus capabilities, these resources would not be enough, for example, viewing the messaging automation configuration.
We can support this using "view job details and candidates for their jobs" or a different mechanism. So added it here to make sure we can support this use case
For example, to support view-only access to jobs and candidates for specific jobs, if we end up using existing permissions like FGP Candidates, the user might get access to Indeed.com candidate capabilities. So added it here to make sure that does not happen.
Please can you provide an example? Some were purposefully explained in multiple sections to avoid certain misunderstandings that happened in CGA1, but there can be opportunities to improve for sure, and I can take care of it if I understand it correctly
@jfu@indeed.com can you elaborate on this please?
Candidate profile, for CGA1, gives read access to candidate profile details like resume and does not give access to messaging
for example:
below - "Users with only Advanced Screening permissions (both View and Edit) should not be able to access Indeed.com capabilities (Job Man, Candidate Management, Billing, etc)."
is a restatement of what is said above: "Users with Advanced Screening: Edit must be blocked from accessing the main Indeed.com employer platform (Job Management, Billing, etc.)."
having two places where you say the same thing introduces the opportunity for confusion to creep in, especially if you only update one of the two places and not the other
During the FGP Candidates MVP, the admin portal was limited to assigning jobs at the permission category level. This prevented granular assignments—such as assigning one job for 'View' and another for 'Manage'—within the same permission set. Transitioning to this more granular model required a significant architectural refactor that was descoped from CGA1 to ensure the timely delivery of core MVP features.
The repetition here is intentional because the audience and objectives for these sections differ. Think of the Scope table as the executive summary, it’s about visibility and commitment. Functional Requirements are the technical blueprints, they ensure the build actually satisfies those commitments. One defines the goal, while the other ensures the solution is technically sound. Does that make sense?
I agree this better shows the value we deliver as opposed to a pure adoption metric. What about this:
80% users who only use Nexus are using Nexus edit or read only permission set.
They may be updating "Advanced Screening" terminology as well, but it's likely to be similar enough that we can use it
Is this new job postings specifically within Advanced Screening?
Just verifying, do we meet this constraint if we say a user with any permissions in addition to AS permissions gets Indeed.com access?
Can we get the baseline? E.g. how many users are using the admin permission? If so, I think Hanna's suggestion makes sense to me.
Sorry for a naive question. How does read candidate profile differ from the current candidate view permission?
I like Hannah's suggestion too, it shows the direct value of our Q4 work, where Nexus-only users are granted Nexus permissions and are forced to get Admin or RBAC jobs+candidates, so updated the metric
Here is the list of features that we know so far, but the requirement is that the view/edit Nexus permissions should be able to support any new features that Nexus would like to add in the future:
- Edit screening criteria
- Set up AI Recruiter
- Perform license verifications
- Filter applicants by license verification status,
- Set up Automations - Messaging, Interviews based on candidate score or verification completion
- CSV export and distributing score visualization on the job list.
- Rules/bulk job management for the above
- candidate re-scoring, candidate list re-scoring
Yes that was my intention when I added this, but now rethinking, this is not essential, so will remove it.
Currently, the FGP candidate permissions we have. give users "view and manage candidates for specific jobs", i.e., these users can view candidate profiles and also message candidates. Whereas the candidate profile: read gives them view access to candidate profiles but not messaging access. Messaging is one example of a capability beyond candidate profile, there could be more.
👍
Added a target, please see if it makes sense
Thinking out loud, here are the possibilities:
- AS+Member permissions - May be needed to access some basic employer default capabilities.
- AS+Something like Smart sourcing permissions, that does not relate to Jobs/Candidates - Unlikely, but if they want this for their recruiters, is that problematic to support?
- AS+Jobs/Candidates - Should not be allowed as they can directly grant Jobs+Candidates instead of AS permissions.
@hannahh@indeed.com , thoughts?
@marlt@indeed.com @hbillings@indeed.com added this for performance, see if it makes sense
I don't think I understand what this statement means
"The system needs to support an option for employers to restrict Advanced Screening users OR allow them to access any employer capabilities outside of the Advanced Screening hub."
We need an AS permission, and implicitly the user can be given other existing permissions to get access to indeed.com outside AS (I think that's what Elliot is trying to confirm?) but I don't think that's a technical constraint (which this statement is currently under).
I think the latter unless I am missing something.
The user can get view only on job 1 via ISS link or ATS sync; they can get edit on job 2 via request access.
Need to split this into users who have only AS permissions and users who have AS permissions in addition to other permissions
@esweet@indeed.com to review with @kathryns@indeed.com
@smohandoss@indeed.com With search-based jobs not complete, users will only be able to meaningfully manually select jobs since we will not be automatically updating the jobs based on the search
it makes sense, just has drawbacks. Up to you!
My intention behind this statement is to enable admins to either restrict AS users to just AS capabilities or allow them to access Indeed.com capabilities in addition to AS capabilities, if desired.
@hannahh@indeed.com, when you say " implicitly the user can be given other existing permissions to get access to indeed.com outside AS", do you imply basic/member permissions?
How about explicitly granting existing permissions, such as for Company Pages? Do you think we need to support this? I guess so, but would like to confirm
👍
generally we like to work with nines :)
99% of users... can anything ever be 100%
Updated, thanks
In other words, when admins assign jobs using PAC UX, if we just support assigning only one type of permissions for a specific user, UserA -> AS: View for Jobs 1,2
Rather than,
UserA -> AS_View for Job1
UserA -> AS_Edit for Job2
However, if we do not support the latter on PAC UX, I am unsure how we will support edits. ATS sync data cannot be edited on PAC UX, so that is fine. However, let's say the user receives AS_View for Job1 via the ISS link, and the admin wants to grant AS_edit access to Job2 to the user. They cannot do so until we support the latter on PAC UX.
Is this assuming that this user will have FGP access on the other non-Nexus jobs?
Are we actively blocking this user from going to any employers.indeed.com page outside of Nexus?
Based on our discussions with Eng, there are possibilities of solving this issue if we design permissions in a specific way. I will keep this comment open until we know the design specifics and update it accordingly.
@esweet@indeed.com will update this based on the UX requirements
OK, I will remove this then to avoid confusion
From CIAM, we will not be granting other Indeed.com permissions to Nexus-only users to help achieve this, for example, not giving them hosted_jobs or hosted_candidates or fgp_candidates permissions that will give them access to Job and Candidate Management on Indeed.com
I am thinking about a few possibilities here:
1. Users use only AS Hub (Advanced Screening) and access Indeed for User settings, Users page, etc (basic access).
2. Users use AS Hub and also access Indeed.com for something like Company Pages.
3. users use AS Hub and also do job and candidate management on Indeed.com
Coming to your question on how this will be solved using permissions is TBD. Please wait for us to share the high-level Eng design
Updated
I think Saranya is right and the edit use case where they already have mixed permissions makes the assignment flow necessary to create
Thanks for clarifying!
Yeah I would also be interested in this and what the requirements are here. This could have impact to the Job Ownership work that we are planning for enrollment
This one feels confusing because we are saying above that those with Advanced Screening: View/Edit permissions will not have access Indeed.com. Are there situations where a user has Advanced Screening:View/Edit permissions but then will have access to the Job List page because they have permissions to other jobs on Indeed.com?
The plan is for users with only AS permissions to not have access to Indeed.com. If they have any other permissions, they will have access based on those permissions (like anyone else) -- do you foresee concerns with that?
@smohandoss@indeed.com TBD: removing this, correct?
This might be related to another, similar comment I have above, but are you envisioning that a user with both AS and indeed.com permissions will see both sets of jobs when they go to employers.indeed.com/jobs?
I assume yes? But that's based on my understanding that all Nexus jobs are "Indeed" jobs, but not all Indeed jobs are Nexus jobs. I could be misunderstanding that though.
Confirmed. Enroll jobs in Nexus will be excluded from the Nexus edit permission.
I was going to ask the same question actually. What Jeremy is asking is rather than an Advanced Screening: Edit permission, why not create a permission for each of these. For example: Screening_Criteria:edit, Automations:edit, etc. A permission for each of these and that way you can slice and dice how you see fit. What if we discover clients don't want to give ALL of these permissions to users with the Advanced Screening:edit permission. If we don't have a permission for each of these, would it be hard to allow for them to give granular access?
Is it the permissions system that is required to do this or the client team that is using the permission system? Another way of asking: PAC isn't going to actually enforce anything right, it'll just say this user does/does not have this permission.
Thank you Bryan for elaborating on my question! It is exactly what I was wondering.
Updated to reflect this discussion and recorded the change in change log table.
Thanks, will remove this.
Good point, I updated the use case to reflect what we have control over as a permissions system
This can be one way to build the Nexus_Edit permission set, a combination of permissions for individual features/fields. But I will explain why we are taking a different approach for Q4.
When we used a granular, feature-specific approach for CGA1, separating screening criteria and candidate profiles, the model proved difficult to scale. For example, Nexus: View users did not get access to 'Messaging Automations' when it was added, creating a bottleneck.
To support the Q4 expansion, our strategy is to shift toward a more inclusive permission model. Nexus stakeholders expect 'future-proof' permissions where Nexus_Edit and Nexus_View automatically encompass new Hub features without requiring immediate, granular configuration. Should a future requirement demand strict isolation for a specific high-risk feature, we can create a standalone resource/permission at that time.
My understanding is the same as Elliott's. If the user has both AS and Indeed.com permissions, their job experience on Indeed.com will be dictated strictly by their jobs access for Indeed.com (hosted jobs: CRUD for now and FGP Jobs for indeed.com later when it is available); Nexus access will be defined by Nexus permissions that they have.
Re-open
@esweet@indeed.com to review with @kathryns@indeed.com
Correct, based on the final Nexus permissions framework, this may be taken care of without having to support SBJG, I will remove this once we finalize the solution.
@rprather@indeed.com do you have any insights on this?
cc: @esweet@indeed.com
@rprather@indeed.com is this accurate?
cc: @esweet@indeed.com
I think we worked out my concerns async. This can be resolved
👍
Hi Saranya, sorry to reopen this thread. Could you please elaborate why this granular configuration does not scale? E.g. Let's say Nexus decides to introduce "messaging automations", if we pursue the more granular approach, what does the development look? Having a strawman example can help illustrate the scalability more clear.
I'm not sure I understand the claim about why CGA1 permissions were difficult to scale. The Nexus team was unable to identify what APIs the Nexus experience used, or what existing permissions were required for those APIs.
If we went back and used a single Nexus_View permission for CGA1, how would that have made anything "more scalable"?
It doesn't matter how we package or label new permissions, if product teams don't know what APIs they're calling, we have no way of guaranteeing a user with some permission will be able to use their product.
If Nexus wants a new class of users whose access to various APIs is not aligned with the access of existing classes of users, the only way to effect that without sweeping changes across all Indeed.com domain teams is for Nexus to build their experiences on top of their own Nexus specific APIs instead of directly invoking Indeed.com APIs.
It would then be trivial to give this Nexus specific API simple, appropriate permissions, but it would have to be able to make trusted service-to-service calls to existing Indeed.com APIs with approval from those domain teams.
Advanced Screening permissions would give Jobs users access to Candidates in certain contexts. That seems like it would:
1. Not respect the wishes of admins who had not granted candidates access in the past
2. Potentially raise issues if Advanced Screening is ever rolled out to Japan (not sure if there are other places with legal restrictions on candidate viewing)
Does that mean we are comfortable saying the screening criteria do not count as a job attribute?
Does that include the non-public job attributes?
These are all described as features of Nexus. Permissions are primarily enforced on an API level. Requirements should be focused on what APIs a user can and cannot call.
Big +1 to what @bgarrett@indeed.com is saying.
Whatever design comes out of this, we should NOT have APIs that check whether users have EITHER advanced_screening:view/edit OR candidate:read/update (or job:read/update).
I actually talked this one through with Elliott recently. Elliott doesn't see a clean way to block someone from removing a user like this, so they will be able to remove an ATS-added user, but the sync will just put them back.
Makes sense, I added this before the descoped version discussions, I will remove it, thanks Rita!
I don't think this is necessary for MVP. It could be nice in the future to show the user which ATS / ATS tenant a permission came from, but I don't think that's a must have especially for MVP when an emp org can only have one ATS ID Sync connection at a time
how do you want to capture the caveats that are introduced once ATS ID Sync is turned on? could simply say something like 'except for when ATS ID sync is on; intended behavior described here' and link to my doc?
just want to make sure your team knows there is a UX change that must take place on the permissions modal/page when ATS ID sync is on
except for when that user is an ATS user; the idea was that we want to prevent that ATS user from requesting access through the Request Access flow and instead the admin should give them the correct role in the ATS, which will give them the correct permissions on Indeed
except for when ATS ID Sync is on
huh, I didn't know a user could access Advanced Screening with a "Jobs + Candidates" permission. I guess that could be a loophole way for an admin to manually give Nexus access to a person not in an ATS?
(this applies to more stories, but I didn't want to keep commenting the same thing)
I think all of these should be blocked when ATS ID Sync is on
ah okay I see these now! Maybe my above comments are moot
There is a separate ATS sync requirements section - https://docs.google.com/document/d/1xuoEyLE2SaYBNpFt-DCwsgrlqHjonjbP29aevIP3uis/edit?tab=t.0#bookmark=id.ja4cwv16hihw. I added a note to this one to be clear, thanks.
We need to wait for the design to be complete, but to give a user with Jobs+Candidates permissions access to Nexus Hub, they will be granted Nexus permissions. We will most probably be doing this in the BE as a backfill.
So just by granting Jobs+Candidates, admins will not be granting Nexus permissions.
It makes sense. If the outcome of the design review is that this requirement is not feasible, I think that is acceptable as well, and we need to convey that to the Nexus team with good reasoning, and I will come back and remove/update this requirement to reflect that.
@jfu@indeed.com, there have been many discussions on this topic since this thread was started. I learned from Hannah that Nexus is planning to add more features to the Hub and that expecting them to work with us on integration every time will not be a scalable model. So the requirements were written with that in mind, to explore a solution where Nexus can expand without relying on PAC and still support users with Nexus-only permissions.
But based on my discussions with PAC Eng, there is no solution that can achieve this, even if we introduce a Nexus-specific resource, they still have to gate the new Nexus features behind the Nexus permission. So I am aligned with the way you have it here, as LEGO blocks. Once @bgarrett@indeed.com's design review is complete, based on the outcome, I will update these requirements with the appropriate rationale.
Is there a specific reason for calling this out? I am trying to understand that so that I can think about it and reframe the requirement.
Good question, I think it is just the public job attributes, but I will check with Hannah.
Do we need the list of APIs if we end up finalizing the solution of creating different resources (as appropriate) and we would need to know what resources to create?
This is all inside Nexus Hub right?
Either inside of Nexus Hub or by calling APIs directly.
I am assuming this example, a user has Jobs + Advanced_Screening: Edit. This user can view candidate profiles, messaging automation settings, etc, inside Nexus Hub.
In this case, their admin granted them explicit advanced screening permissions, which means they get some candidates' access (as described in the Add user modal, and it can be updated if we think it is not good enough) as part of AS permissions. Do you think that is not enough to inform admins?
API access: I think the way we design (Resource-based) means it's inevitable that Nexus-only users will get common API access for Jobs, Candidates, etc. I think that risk can be called out and ok to proceed.
@hannahh@indeed.com, what do you think? Would Edit users need to see non-public job attributes?
@gstephens@indeed.com - can you help confirm here?
@rprather@indeed.com can I get your thoughts on this?
@hannahh@indeed.com we talked about this already, PAC team is aligned (Product, Eng, UX), so documented here for transparency. Please let me know if this looks good, and if we need to inform the Nexus team, please do so.
@tquintana@indeed.com Updated this requirement for EmpOrg/hierarchies based on discussions with II team, please include this in your scope
Baseline - https://link.indeed.tech/RTPDAMYHKE3 - 1%, but Nexus advertisers IQL does not include all Nexus advertisers
👍
I am assuming that this example is covering the case, parent + n child nodes. IE there is no limit to how far down/up the hierarchy we need to check. Imagine if there were 10 layers deep in a hierarchy. L1 is the only advertiser with ats sync enabled so their children should all be disabled. If the current logged in user is L9, then we have to check all the way up the hierarchy until we find a parent with ats sync enabled (or none).
