# PAC - Q4 Smart Screening PRD

## Overview

| Field | Detail |
|-------|--------|
| PRD Name | PAC - Q4 Smart Screening PRD |
| Version | 1.2 |
| Target Launch Date | End of Q4 FY25 (Launch Ready) |
| Author | Saranya Mohandoss |
| Status | Implementation Ready |
| Related Documents | CIAM FY'Q4 plan for Nexus |
| Involved CIAM Pods | PAC |
| JIRA | PACMAN-12108: Nexus Q4 Support |

## Sign-Off & Approval

| Role | Name | Org/Team | Date | Signature/Status |
|------|------|----------|------|------------------|
| Product | Hannah Han-Ciaravella | CIAM | Jan 6, 2026 | Sign off |
| Eng | Michael Arlt | PAC | Jan 6, 2026 | Reviewed |
| UX | Elliott Sweet | CIAM | Jan 7, 2026 | Reviewed |
| Eng | Heber Billings | CIAM | Jan 6, 2026 | Reviewed |
| Product | Abhishek Chhibber | CIAM | | Informed |
| Eng | Jeremy Fu | CIAM | | Informed |

Note: References to Indeed.com within this document pertain to the full suite of Indeed employer capabilities outside Smart Screening Hub—including, but not limited to, Job Management and Candidate Management.

## Goals & Hypothesis

### Problem Statement

#### User Problems

1. Large enterprise employers need to restrict some users (for example, agency users) access only to Smart Screening Hub. Without this, they hesitate to adopt Smart Screening or limit which users they onboard due to security concerns about exposing their sensitive information.
2. Employers cannot directly grant edit permissions for Smart Screening features, which creates a complicated user experience and often results in them granting more access than necessary.

#### Platform Problems

1. Current Smart Screening permissions are modeled at a very granular level (e.g., view:screening_criteria, view:candidate_profile), requiring PAC to build new permissions and clients to integrate for every Smart Screening launch. This creates a recurring integration bottleneck, preventing product-ready Smart Screening features from being shipped until the permissions infrastructure and integration are complete.

### Goals

1. Provide Smart Screening: View and Smart Screening: Edit permissions that strictly enforce Smart Screening-only job-level access and completely restrict access to Indeed.com employer features.
2. Create a seamless and less confusing experience for Admins/User managers to grant Smart Screening-only permissions, which should also take into account:
   - Supporting job-based permission syncing of ATS user data.
   - Not adding complexity in granting existing Indeed.com permissions
3. Enable the Smart Screening team to easily integrate to add access checks for the new permissions.

### Hypothesis

By providing dedicated Smart Screening permissions that restrict access to Indeed.com, large ENT employers feel comfortable adding their ATS recruiters and agency users to operate fully within Smart Screening.

## Success Metrics

### Primary

- Increase the % of secondary users with Smart Screening permissions (Smart Screening View/Edit ONLY) from 1% to 10% within Nexus-enrolled advertisers.
- Baseline:
  - Nexus shared an IQL to get the Nexus enrolled advertisers, but many Nexus advertisers were added prior to building this IQL. Using this IQL, ~1.05% is the baseline as of 2/19/26.
  - Nexus also shared a spreadsheet with the full list of Nexus advertisers. Using this list, ~1.12% is the baseline.

### Secondary

- 80% of users with Smart Screening: Edit permissions perform at least one edit action inside the Smart Screening Hub in 4 weeks.
- 99% of users with Smart Screening permissions are able to access assigned jobs within 5 seconds of permission grant (grant can be from user management UX, ATS sync, or ISS link automation)
- Positive customer feedback regarding improved permissions.
  - Piggyback on Smart Screening's UXR to collect feedback
- Positive client feedback regarding the integration experience.
  - Collect feedback from Nexus and other clients using a survey/questionnaire

### DNH (Guardrail)

- No decrease in users added with existing Indeed permissions (Admin, Jobs, Candidates)
- Volume of general permission-related support tickets must remain within a 5% variance of the pre-launch baseline during the first 30 days post-release.

### Opportunity Size

TBD (To Be Determined: Requires quantification of advertisers, users, or estimated business value).

## Target Audience & Impact

### Target Users

- **Primary**: ATS recruiters and agency users at large Enterprise (ENT) Employers.
- **Secondary**: Employer Admins/User Managers who need a simple, low-friction way to provision Smart Screening-only access.

### Use Cases

1. As an ATS Recruiter/Agency user with only Smart Screening permissions, I should be able to access the Smart Screening Hub and its features without being exposed to Indeed.com employer capabilities, such as Job and Candidate Management, that are irrelevant to me.
2. As an ATS Recruiter user, I should be able to access the Smart Screening Hub and its features, in addition to accessing the Indeed.com employer capabilities to which I have access to.
3. As an Employer Admin/User Manager, I need to easily onboard external agency users/my own recruiters to access Smart Screening for specific jobs, ensuring they cannot access any other features on Indeed.com.
4. As an Identity Integration Eng team member, I need to easily use Smart Screening permissions to map ATS and Indeed (Smart Screening) permissions for ATS sync.
5. As an Employer Admin/User Manager, I need to manage users and grant them access to Indeed.com capabilities, while ensuring the user management effort does not exceed the current experience.
6. As a member of the Smart Screening client team, I require clear guidance and integration steps to easily integrate the Smart Screening product with the Smart Screening permissions.

## Scope (In / Out)

### Q4 Launch Scope

| Feature | Detail |
|---------|--------|
| New Permissions | Creation of the Smart Screening: Edit permissions; Implementation of the new permissions within PAC |
| Improvements to Existing Permissions | Enhancement to Smart Screening: View to grant view-only access to "all" features inside Smart Screening and not just to screening criteria and candidate profile |
| Access Control | Users with only Smart Screening permissions must be blocked from accessing the main Indeed.com employer platform (Job Management, Billing, etc.). |
| Smart Screening Feature Access | Smart Screening: Edit users must be able to edit all features within the Smart Screening Hub for their jobs (e.g., Editing screening criteria, setting up automations). |
| Permission Granularity | Support for granting Smart Screening permissions at both the Advertiser level (all Smart Screening enrolled jobs) and the Job level. |
| Provisioning | New permissions support both methods for granting permissions: automatic provisioning via ATS identity sync AND manual admin add (via Admin Portal and Request Access flow). |
| Permissions Framework and Admin Portal UX Enhancements | Handling of a single user receiving different Smart Screening permissions for different jobs (i.e., same user getting Smart Screening: View for one job and Smart Screening: Edit for another) (Involves complex admin portal UX improvement). |
| Request Access | |
| Source Management | |

### Out-of-Scope

- Client teams are responsible for adding access checks to gate Smart Screening capabilities behind the different Smart Screening permissions.
- II team is responsible for ATS user sync, mapping of ATS roles and Nexus permissions

### Future Scope (Out-of-Scope for Q4 Launch)

- Smart Screening Guest permissions.

## Technical Constraints & Considerations

- The solution should be easy for the Smart Screening team to integrate and may not require changes from domain teams across Indeed.com (avoiding significant technical dependencies).
- The new framework must support granular data from ATS sync (e.g., user is a recruiter on job A and hiring manager on job B) without complicating manual Admin portal management.
- Permissions should be scalable, as the list of Smart Screening features is expected to expand in the near future.
- The system needs to support an option for employers to either restrict Smart Screening users or allow them to access any employer capabilities outside the Smart Screening hub.

## Requirements (Functional & Non-Functional)

### High-Level Requirements (User Stories)

- As a user with only Smart Screening: Edit permission, I can access and use all editing features within the Smart Screening Hub for the jobs I am assigned, but I am unable to access the main Indeed.com employer platform (Job Management, Billing, etc.).
- As a user with only Smart Screening: View permission, I can access and view all features within the Smart Screening Hub for the jobs I am assigned, but I do not have access to the main Indeed.com employer platform (Job Management, Billing, etc.).
- As an Employer, I must be able to grant the Smart Screening: Edit and Smart Screening: View permissions to users through the Admin Portal.
- As part of the Permissions system, I must enable employer admins to grant Smart Screening permissions at both the Advertiser Level (all Smart Screening-enrolled jobs) and the specific Job Level.
- As part of the Permissions system, I must enable users to obtain Smart Screening: View permissions for one job and Smart Screening: Edit permissions for another, if needed.

### Functional Requirements

Note: This section talks about the general Nexus Q4 requirements, and there is a separate requirements section for ATS sync.

1. Smart Screening: Edit permissions should grant users edit access to all Smart Screening features for their jobs. The list below is provided for reference, but the permissions should be flexible enough to allow Smart Screening to expand its features without requiring permission changes for every release.
   - Smart Screening: Edit users are not expected to edit job attributes, such as title and description. They should be able to view them.
   - Features inside Smart Screening:
     - Enroll jobs - TBD
     - Set-up/Edit Auto-enrollment rule - TBD
     - Edit screening criteria
     - Set up AI Recruiter
     - Perform license verifications
     - Filter applicants by license verification status
     - Set up Automations - Messaging, Interviews based on candidate score or verification completion
     - CSV export and distributing score visualization on the job list
     - Rules/bulk job management for the above
     - Candidate re-scoring, candidate list re-scoring

   **Note** (added on 2/3/25): Based on Slack discussions, for Q4 as a short-term solution, users with Smart Screening: Edit permissions will not be scheduling or managing interviews inside Nexus Hub. This will be an exception to the statement made above. The Nexus team (and Interviews) will learn from this launch, iterate, and decide on the long-term requirements for Interview capabilities. Only users with Candidates permissions can access Interviews inside Nexus Hub.

2. Smart Screening: View permissions should grant users view access to all features within Smart Screening for their assigned jobs.
   - Note: Users with Smart Screening: View permissions will not have access to Interviews inside Nexus Hub for the same reasons as listed for users with Smart Screening: Edit permissions.

3. Users with only Smart Screening permissions (both View and Edit) should not be able to access Indeed.com capabilities (Job Management, Candidate Management, Billing, etc).

4. Users with Smart Screening permissions (both View and Edit) should be able to access their account management, including changing their email address.

5. Admins/User managers should be able to grant Smart Screening: View or Smart Screening: Edit permissions manually via the Admin Portal for all or specific Smart Screening jobs. The experience should be seamless and straightforward (Indeed.com's current dependencies, including Jobs, Candidates, and Smart Screening permissions, are extremely confusing).

6. (P1) Admins/User managers should be able to grant Smart Screening: View or Smart Screening: Edit permissions manually within the Smart Screening workflow. (We can introduce a workflow similar to the Post A Job funnel - Add users with FGP Candidates).

7. Smart Screening users should be able to get Smart Screening: View for one job and Smart Screening: Edit for another job. This should be supported for:
   - **PAC UI** - Admins should be able to grant the same user Smart Screening: View access for one job and Smart Screening: Edit access for another job.
   - **ATS sync** - Support ATS sync to handle users with mixed-access levels (e.g., Job A: View, Job B: Edit) and ensure Indeed permissions are provisioned to match this 1:1 job-to-permission relationship.
   - **Request Access**: When a user has Smart Screening: View for one job request and Smart Screening: Edit for another job, admins should be able to approve the request and grant the requested access.

8. Granting Smart Screening permissions at the advertiser level must grant access only to all Smart Screening-enrolled jobs within that advertiser, not to all jobs.

9. Admins/User managers should be able to decide whether to grant Indeed.com permissions in addition to Smart Screening permissions, if they wish.

10. Admins/User managers should be able to grant existing Indeed.com permissions (E.g., Jobs, Candidates) without any added complexity (depending on whether Jobs+Candidates will get Smart Screening access and the migration of existing users with those permissions).

11. The Users page should display a list of Smart Screening users with the correct permissions.

12. Admins/User managers should be able to edit Smart Screening users' permissions (grant more jobs, remove jobs, change job-based Smart Screening: View or Edit permissions).

13. Admins/User Managers should be able to edit user permissions: grant Smart Screening: Edit to Smart Screening: View users to assign specific jobs; and change Smart Screening: Edit to Smart Screening: View permissions to assign specific jobs.

14. User Managers should be able to grant Smart Screening permissions that are the same as or less than their own, and only to jobs for which they have access.
    - User managers with Smart Screening: Update permission set should be able to:
      1. Add/edit users and grant them Smart Screening: Update permission sets.
      2. Add/edit users and grant them Smart Screening: View All (+optional update some) permission sets. They should be able to grant update access to any set of jobs.
      3. Add/edit users and grant them Smart Screening: Limited permission sets. They should be able to grant view and/or update access to any set of jobs.
    - User managers with Smart Screening: View All (+optional update some) permission set should be able to:
      1. Add/edit users and grant them Smart Screening: View All (+optional update some) permission sets. They should be able to grant update access only to the jobs they have update access to.
      2. Add/edit users and grant them Smart Screening: Limited permission sets. They should be able to grant view_all; and/or update access only to the jobs they have update access to.
    - User managers with Smart Screening: Limited permission set should be able to:
      1. Add/edit users and grant them Smart Screening: Limited permission sets. They should be able to grant view access only to the jobs they have view access to, and/or update access only to the jobs they have update access to.

15. Existing users accessing Smart Screening capabilities with their "Jobs + Candidates" permissions should not lose their Smart Screening access.

16. Admins should be able to access the Smart Screening Hub, edit all Smart Screening features, and enroll/unenroll jobs in Smart Screening.

17. (TBD) Edge cases: To handle edge cases (users with Jobs, Candidates, Limited Candidates, or Jobs and Limited Candidates for CGA1), we introduced new logic on the modal, including disabling Smart Screening permissions. Based on the design, we need to revisit these cases and determine the requirements.

**Notes** (Updated based on decisions made by PAC team on 2/5/25):
- New users post-Q4 with the Jobs and Candidates permission sets will not automatically have access to Smart Screening. Jobs, Candidates permission sets, and Smart Screening permission sets will not be mutually exclusive.
- If admins want to grant users access to both Indeed.com capabilities and Smart screening, they will grant Jobs, Candidates, and the needed Smart Screening permission sets.
- If admins want to grant users access to only Indeed.com capabilities, they will grant them Jobs, Candidates, or whatever permission sets as needed, and not the Smart Screening permission set.
- If admins want to grant users access only to Smart Screening, they will grant them the Smart Screening permission set, not the Jobs or Candidates permission sets.
- Existing users in Nexus advertisers with the Jobs + Candidates permission sets have edit access to the Smart Screening hub for CGA1. To make sure they have a seamless experience, they will be granted Smart screening: Edit permission set via backfill before the Q4 launch.

18. (Updated on 3/18/26) Forcegrant Smart Screening: Update (advertiser-level RBAC) permission set to all existing users with Jobs and Candidate permission sets in all advertisers.
    - This migration should happen immediately after we launch Q4 so that admins can see the Nexus permission sets on PAC UX and the users who have been granted Nexus permission set can access Nexus.

**Premium Plus**: Some background on why we changed the migration strategy. CGA1 and Q4 Nexus model is advertiser-based; employers enroll specific advertisers in Nexus, and those advertisers can use smart screening across all Nexus-enrolled jobs. However, to expand into the SMB market, Nexus introduced Premium Plus. This model is job-based: a recruiter posts a hosted job, sponsors it for Premium Plus, and expects immediate access to Smart Screening. Requiring admins to manually grant the Nexus permission set before using a paid feature would create significant adoption friction. To unblock Premium Plus, we are automatically granting the SmartScreening_update permission set to all existing users with the Jobs and Candidates permission set (the largest SMB user segment next to admins). Also, data shows admins use the "Currently Used" tab 98% of the time in the PAC Add User modal; by updating this segment, we ensure admins will likely reuse these pre-configured permission set combinations for new users.

### ATS Sync

Descoped version - PACMAN-12363: Update PAC UI to disable Nexus permissionSets editing when ATS sync is enabled

Note: The following requirements apply to only Smart Screening permissions and to all users on the advertiser, not just those synced from ATS. Please note that the ATS sync here refers to the Kombo-based integration and the Workday (Indeed-built) sync.

19. If ATS sync is turned on for an advertiser, users and their Nexus permissions synced from ATS should be displayed in the Users table.

20. If ATS sync is turned on for an advertiser, admins/user managers should not be able to grant Smart Screening permissions (View, Edit) to new users they add.

21. If ATS sync is turned on for an advertiser, admins/user managers should not be able to grant Smart Screening permissions by editing existing users' permissions (View, Edit).

22. If ATS sync is turned on for an advertiser, admins/user managers should not be able to select any existing user with Nexus permissions in the "Currently Used" tab of the Add/Edit User modal.

23. If ATS sync is turned on for an advertiser, admins/user managers should not be able to access "manage limited access" to edit jobs assigned to the user for Nexus permissions.

24. (TBD) If ATS sync is turned on for an advertiser, users should not be able to request Nexus permissions.
    - Users should not be able to request "Smart Screening: View or edit" permission sets from the Request Access modal via the Request Access CTA available on the Users page and Product Chooser page.
    - (Not in PAC Scope, in Nexus's scope) Users with the "Smart Screening: View" permission set should not be able to request the "Smart Screening: Edit" permission from the Nexus Hub.

25. When an ATS sync is turned off for an advertiser, admins/user managers should be able to grant Smart Screening permissions (View, Edit) to new users they add in the PAC Admin portal.

26. When an ATS sync is turned off for an advertiser, admins/user managers should be able to grant Smart Screening permissions (View, Edit) by editing existing users' permissions in the PAC Admin portal.

27. If ATS sync is turned off for an advertiser, admins/user managers should be able to select any existing user with Nexus permissions in the "Currently Used" tab of the Add/Edit User modal.

28. If ATS sync is turned off for an advertiser, admins/user managers should be able to access "manage limited access" to edit jobs assigned to the user for Nexus permissions.

29. Irrespective of the advertiser's ATS sync status, admins/user managers should be able to remove users from the advertiser (including users synced from ATS).
    - (TBD) Should we inform admins that if they remove users synced from ATS, they will be added back during the next sync?

30. Auditability: For troubleshooting purposes, our systems should know where permissions are added from, at a minimum, by an admin user or via ATS sync.
    - (TBD) To achieve this, is it possible to update PAC indexes (pac_add_user, pac_fgp_update_relation, pieUpdateUserPermissions) to log that data?

31. If ATS sync is turned on for an advertiser, we should inform admins why the Smart Sourcing permissions are locked.

32. Emp Org/hierarchy - Smart Screening permissions should be locked for the ATS-integrated advertiser and their child advertisers.
    - L1 - ATS integration is on
      - Lock Smart Screening permissions for L1, L21, L22, L211 and L212
    - L21 - ATS integration is on
      - Lock Smart Screening permissions for L21, L211, and L212

### Request Access

33. Smart Screening: View users should be able to request Smart Screening: Edit permissions for specific jobs.

34. Any user on the Smart Screening advertiser should be able to request Smart Screening: View or Smart Screening: Edit for all Smart Screening jobs or specific jobs.

35. Smart Screening: View users should be able to request Smart Screening: Edit permissions from within the Smart Screening hub for all or specific Smart Screening jobs (using the Request Access banner).

36. Users should be able to request Smart Screening permissions for all or specific Smart Screening jobs via the Request Access CTA on the Users and Product Chooser pages.

37. Admins should be able to approve access requests for all Smart Screening jobs or specific jobs.

38. Admins should be able to edit the access requests for Smart Screening permissions for specific jobs and add/remove jobs as needed before approving.

### Non-Functional Requirements

39. (TBD) Smart Screening UI displays filtered job and candidate lists based on user permissions (e.g., a user with access to Jobs 1, 5, and 10 sees only those jobs in the list). If this is supported by PAC calls, they should be performant and not have any latency issues (Latency: < 500ms).

40. IQL - Job-based Request Access
    - # of jobs that a user requests Smart Screening: View permissions for
    - # of jobs that a user requests Smart Screening: Update permissions for
    - # of users that requested Smart Screening: View permissions for specific jobs
    - # of users that requested Smart Screening: Edit permissions for specific jobs
    - (Not related to Job-based requests specifically) What was the user's entry point for the access request? (e.g., Nexus Hub, Product Chooser, or the Users page)

## Design & UX

- **Design Link**: [Nexus permissions (Figma)](https://www.figma.com/design/Ll2m2YMQHs9WI6KW3LiBpe/Nexus-permissions?node-id=210-12375&p=f&t=upcfWZwqdi1dD84a-0) (WIP)
- **UX Goal**: The Admin portal UX (Granting Smart Screening-only permissions) must follow the principle of least friction.

## Building Blocks

Smart Screening Q4 deliverables extend beyond Smart Screening-specific permissions to include foundational platform improvements. Building Smart Screening-only permissions properly requires addressing three interconnected components:

1. **Smart Screening Product-Scoped Permissions**: New permissions (Smart Screening: View, Smart Screening: Edit) that restrict users to Smart Screening Hub features without granting access to Indeed.com.
2. **FGP Framework Improvements**: Address technical debt and UX limitations from the FGP Candidates MVP that were deferred due to timeline and priority constraints. Building Smart Screening on a fragile foundation would compound issues, so we must stabilize the underlying FGP infrastructure to ensure reliable, intuitive experiences.
3. **Source Management UX**
4. **(TBD) Search-Based Job Groups (v1)**: Smart Screening job enrollment utilizes search-based job groups with dynamic search criteria. To grant users access to "all Smart Screening jobs in advertiser," we need a mechanism to resolve which jobs belong to the Smart Screening search-based job group. While full end-to-end support is planned for post-Q4, we must first build foundational capabilities (v1) to make this operationally viable.

**Outcome**: A stable, scalable permission framework that supports Smart Screening requirements and sets the foundation for future product surface permissions.

## Dependencies

- **Smart Screening Team**: Implementation of client-side permission checks and ensuring their endpoints are correctly gated behind the Smart Screening permissions.
- **Identity Integration Team for ATS User Sync**: Ensuring the sync can correctly handle and provision users with Smart Screening permissions.

## Change Log

| Version | Date | Author | Section Changed | Description of Change | Reason |
|---------|------|--------|----------------|----------------------|--------|
| 1.0 | 12-15-2025 | Saranya Mohandoss | Initial | Initial PRD creation | Based on CIAM FY'Q4 plan for Nexus and meeting notes |
| 1.1 | 01-07-2026 | Saranya Mohandoss | Use cases | Split a use case into 2 | Split into 2 use cases to cover users who have only Smart Screening permissions and users who have Smart Screening permissions in addition to other Indeed.com permissions |
| 1.1 | 01-08-2026 | Saranya Mohandoss | Functional Requirements | Removed part of requirement #15 | New users who are granted Jobs+Candidates may or may not be granted Smart Screening access; there are no specific requirements, so this has been removed. |
| 1.1 | 01-08-2026 | Saranya Mohandoss | Functional Requirements | Added details to #7 | Added the different workflows where this requirement needs to be supported. |
| 1.1 | 01-08-2026 | Saranya Mohandoss | Out of Scope | Removed "enroll/un-enroll" Nexus jobs for Edit users | Confirmed with Nexus that Smart Screening: Edit users will not be expected to enroll/un-enroll jobs in Nexus at any time. |
| 1.1 | 01-11-2026 | Saranya Mohandoss | High-Level Requirements | Updated one of them to reflect what permissions systems control over | Rather than saying "correctly enforce permissions at the advertiser level and job level", updated it to "enable admins to grant access at the advertiser level and job level". |
| 1.1 | 01-11-2026 | Saranya Mohandoss | Non-Functional Requirements | Updated "Source" admin UX requirements | Added detailed requirements for admin portal UX for job permissions added from ATS sync. |
| 1.2 | 01-22-2026 | Saranya Mohandoss | Functional Requirements | Update "Source" requirements | Updated requirements to support the descoped Kombo MVP version. |
| 1.2 | 01-23-2026 | Saranya Mohandoss | Full doc | Rebranding | Replaced "Advanced Screening" with "Smart Screening". |
| 1.2 | 02-03-2026 | Saranya Mohandoss | Functional Requirements | Added interview exception for Smart Screening users | Nexus decided that, to deliver quickly in Q4, they can limit access to Interview capabilities to only users with Candidates permissions. |
| 1.2 | 02-06-2026 | Saranya Mohandoss | Functional Requirements | Added note on non-mutually exclusive permission sets | New users who post Q4 with the Jobs and Candidates permission sets will not automatically have access to Smart Screening. |
| 1.2 | 02-17-2026 | Saranya Mohandoss | Functional Requirements | Added User Manager-specific requirements | Updated user manager requirements with more clarity on permission sets exposed on UX. |
| 1.2 | 02-19-2026 | Saranya Mohandoss | Functional Requirements | Updated EmpOrg/hierarchy requirements for ATS sync | Updated based on discussions with II. |
| 1.2 | 02-19-2026 | Saranya Mohandoss | Primary KR | Updated the KR to better show the value | Updated the KR to better show the value |
| 1.2 | 03-02-2026 | Saranya Mohandoss | Non-Functional Requirements | Updated job-based request access requirements for IQL | The current request access index does not support job-based requests. |
| 1.3 | 03-18-2026 | Saranya Mohandoss | Functional Requirements | Change in migration strategy for Premium Plus | Changed to forcegrant Nexus_update permission set to all existing users with Jobs and Candidate permission sets. |

## Appendix

### Context

#### What have we built already for CGA1?

Smart Screening: View grants read-only access (view screening criteria and candidate profiles) only within the Smart Screening Hub for a user's assigned jobs. Access to these same jobs on Indeed.com is blocked because the broad `hosted_jobs: read` and `hosted_jobs: candidates` permissions required by Indeed.com are not granted.

Admins and users with full Jobs+Candidates permissions can access the Smart Screening Hub and edit all its features.

#### Why did we not build Smart Screening: Edit permissions for CGA1?

Initial plan to build Smart Screening: Edit permissions (extending Smart Screening: View with specific edit access) failed due to two main issues:

1. The Admin Portal could not support assigning different Fine-Grained Permissions (FGP) across separate job subsets for a single user (e.g., Job Set A for Smart Screening: View, Job Set B for Smart Screening: Edit).
2. The initial scope of Smart Screening: Edit (only edit screening and edit candidate profile) did not grant access to other critical Smart Screening features (e.g., setting up messaging automations), failing to meet the requirement for full editing capabilities.

**Resolution**: Smart Screening: Edit was dropped. Users needing full edit access within Smart Screening are granted the existing Jobs+Candidates permission set for CGA1.

### Requirements Moved Out of CGA1

41. (TBD - Some of this ownership may go to the II team) "Source" for ATS Sync (PACMAN-12110: Configurable Permission Source Management)
    - Develop a configurable Source management system to track and manage user permissions across multiple sources (e.g., different ATSes).
    - When the ATS sync is removed, the user's explicitly granted permissions on Indeed.com should not be affected.
    - Source should be displayed on the Users page for ATS users and/or permissions (and also for permissions added via ISS link, inheritance)
      - Should we display the exact ATS info based on which the access is granted?
      - Is it ok if we mention the source without going into the details of whether users and/or permissions are added via ATS sync?
    - Admins should not be able to edit the permissions synced from ATS.
      - TBD - Order of precedence of permissions from ATS sync, ISS link, access granted on Indeed, and FIM permissions.
      - If a user is granted Smart Screening: view for a job via the ISS link, but the ATS sync grants edit access to the same job, should admins be able to edit the permissions? Vice versa, if edit is granted via ISS link and ATS sync says View, would we leave the edit permissions as-is?
    - Admins should not be able to remove users who are added using the ATS sync data
