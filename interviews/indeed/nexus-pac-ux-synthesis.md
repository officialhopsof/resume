# Nexus Smart Screening & PAC UX Integration — Synthesis

**Generated via Glean AI Chat on 2026-03-18**

---

## 1. What is Nexus Smart Screening?

- "Nexus/Smart Screening/Advanced Screening" are used interchangeably for a new AI-powered candidate screening product that evaluates candidates and provides a Smart Screening Hub experience for employers.
- It relies on specific permissions/permission sets (e.g., Nexus_Update, nexus_read_permissionset, Smart Screening–related perms) so that some users can access only the Smart Screening Hub without broader employer capabilities.

## 2. How does Premium Plus work in relation to Smart Screening?

- In the SMB/hosted segment, Premium Plus is a sponsored-jobs model: a recruiter posts a hosted job, sponsors it for Premium Plus, and expects immediate access to Smart Screening on that job.
- To avoid friction (needing an admin to manually assign Nexus/Smart Screening permissions before a paid feature works), the plan is to automatically grant SmartScreening-related permissions to a large existing user segment:
  - For Q4 Smart Screening, the PRD says: "To unblock Premium Plus, we are automatically granting the SmartScreening_update permission set to all existing users with the Jobs and Candidates permission set (the largest SMB user segment next to admins)."
- More recent change log in the same PRD updates this strategy to "forcegrant Nexus_update permission set to all existing users with Jobs and Candidate permission sets" to accommodate Premium Plus requirements.
- There is some naming evolution here (SmartScreening_update vs Nexus_update), but the underlying intent is the same: Premium Plus purchases should "just work" by ensuring the typical SMB users (Jobs+Candidates) automatically have the Nexus/Smart Screening update-level permission set.

## 3. What is the forcegrant migration for SmartScreening_update / Nexus_update permission sets?

- The Q4 Smart Screening PRD describes a migration that should run "immediately after we launch Q4 so that admins can see the Nexus permission sets on PAC UX and the users who have been granted Nexus permission set can access Nexus."
- For Premium Plus, the migration strategy is:
  - Automatically (force) grant the relevant Nexus/Smart Screening update permission set to all existing users who currently have Jobs and Candidates permission sets.
  - The PRD explicitly calls this out as a "change in migration strategy to accommodate Premium Plus requirements" and labels it as "forcegrant Nexus_update permission set to all existing users with Jobs and Candidate permission sets."
- A key rationale cited: admins use the "Currently Used" tab of the PAC Add User modal ~98% of the time; updating that large preconfigured segment (Jobs+Candidates+Nexus) means admins will naturally reuse those combos when adding new users, scaling Smart Screening access without them having to think about Nexus-specific grants.

## 4. What changes does PAC UX need to make?

Across the docs and JIRA epics, the PAC UI / user management changes cluster into a few areas:

### a) Show and allow assignment of Nexus/Smart Screening permission sets

- The design and JIRA epics call for new Nexus permission sets (e.g., nexus_read_limited, nexus_update / Nexus_Update, Smart Screening-specific sets) to be exposed in the PAC (user management) UI so that:
  - Admins can assign them to new and existing users.
  - Admins can see which users already have these permission sets.
- SCAPE-96 explicitly: "Add nexus_read_limited and nexus_update permission sets to user management interface. An admin should be able to assign these permission sets to a new user, add them to an existing user, and they should also be able to see if a user has access to the permission sets from the user management page."

### b) Integrate the new Nexus permission sets into PAC UI selection behavior

- The "Create/Update Permission Sets for Nexus User Use-Cases" epic (PACMAN-12237) and its sibling "PAC-UI Nexus Permission Sets Integration" (PACMAN-12236) cover:
  - Creating/updating Nexus permission sets (e.g., nexus_read_permissionset variants, Nexus_Update) for different Nexus user use-cases.
  - Making sure these show up correctly in the PAC UI flows where admins manage user permissions (add user, edit user, etc.).
- Bug bash notes confirm that Jobs, Candidates, and Smart Screening permission sets are not mutually exclusive in the UI and can be selected together, which is consistent with the Premium Plus approach of layering Smart Screening on top of existing roles.

### c) Reflect ATS sync / FIM constraints in the UI

- For advertisers where ATS sync becomes the source of truth for Nexus/Smart Screening permissions, the PAC UI must disable manual editing of those permission sets:
  - PACMAN-12363: "When ATS sync is turned on for an advertiser, admin users should not be able to edit the nexus permissionSets."
- This aligns with the FIM initiative where the ATS is the only source of truth for Nexus (Smart Screening) permissions and manual granting through PAC UX is prohibited for Smart Screening permissions in that configuration.

### d) Make Nexus permission sets visible to admins right after Q4 launch

- The Q4 Smart Screening PRD emphasizes that the migration (forcegrant) must occur immediately after launch so that:
  - Admins can see the Nexus permission sets in the PAC UX.
  - Users who have been granted Nexus permission sets can access Nexus without extra admin steps, especially in the Premium Plus flow.

---

## Key Source Documents

| Document | URL |
|----------|-----|
| Smart Screening Overview | https://docs.google.com/document/d/1YAnsHATameYtklRmUdyWZMeH32iwHYV0EObzvVNPvsQ |
| PAC - Q4 Smart Screening PRD | https://docs.google.com/document/d/1xuoEyLE2SaYBNpFt-DCwsgrlqHjonjbP29aevIP3uis |
| Q4 Nexus Permission Sets Design Review | https://docs.google.com/document/d/1b-VjtA-cUWgD6Y5p6UTo5v77IGMRKBtCaSaX4JgpLXo |
| Design Review: UI elements for Nexus-only users | https://docs.google.com/document/d/1_bHzVE6YLnnJzQoDucgpzAdzWpZxJ76_GyqMGkpVvqc |
| Smart Screening FY26 Expansion Planning Onsite | https://docs.google.com/document/d/1O9ZPagQnI_jW4wCctIeea2hRrDOUBbJ7NTc6_5rN8xg |

## Key Jira Tickets

| Ticket | Summary |
|--------|---------|
| PACMAN-12237 | Create/Update Permission Sets for Nexus User Use-Cases |
| PACMAN-12236 | PAC-UI Nexus Permission Sets Integration |
| PACMAN-12363 | Update PAC UI to disable Nexus permissionSets editing when ATS sync is enabled |
| SCAPE-96 | Nexus - CGA1 - UX changes in user management page |
| ORGMGMT-843 | Implement new PAC edit permissions in Nexus |
| FIM-2034 | Nexus Post-MVP Enhancements |
