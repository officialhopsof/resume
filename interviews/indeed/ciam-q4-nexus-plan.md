# CIAM FY’Q4 plan for Nexus

**Source**: [https://docs.google.com/document/d/1-0pS3ZVPMSRzHNO3ZCvErcYaE0VUkq51cpzsmmo9JZc](https://docs.google.com/document/d/1-0pS3ZVPMSRzHNO3ZCvErcYaE0VUkq51cpzsmmo9JZc)
**Owner**: Hannah Han-Ciaravella
**Last Updated**: 2026-01-26T20:54:38Z

---

This document outlines the overall problem space and high level solution workstreams CIAM is accountable for in Q4 in order to support Advanced Screening. This is not a PRD.
1. Automate permission provisioning via ATS integration through Kombo
a. Target users
i. ATS Recruiters and HMs who need to access Nexus via the Hub or Slackapp.
b. User problem:
i. Configuring job level permission for users Nexus Hub access is manual and time consuming.
c. Solution:
i. Automate job level permission provisioning based on the user's job level role set in their ATS. Eg, user X is a recruiter for Job a, b and c
d. CIAM deliverables
i. Complete the pipeline Integration with Kombo to gather users job level role information in their ATS. Focusing on top 30 ATSes supported by Kombo based on current US job vol, minus Workday
ii. UX for employer to activate the sync
iii. A default role mapping service which translates user’s role from Kombo AND Workday to “Nexus full permission” or Nexus “read only” permission At job level.
iv. Programmatically assigning Nexus full or read only persimmons based on the post translated permission from the role mapping service, for both Kombo ATSes and Indeed built Workday.
v. Converting peripheral ID to full account ID
e. Out of scope for CIAM
i. Indeed built integration with Workday
1. Workday integration will be built by the Interop team, in alignment with CIAM, reusing UX and code wherever possible
f. Nexus PRD: Auto-permissioning: Q4FY25 Advanced Screening Releases
g. CIAM Platform capabilities PRD: Rita Prather ATS Identity Sync MVP for Q4FY25
h. Involved CIAM pods:
i. IIs
ii. PAC
i. Other supporting documents
i. ATS Identity sync: three-pronged approach
2. Nexus full permission
a. Target users
i. ATS recruiters and agency users
b. User problem
i. ATS recruiters for large ENT do not use i<a href="http://indeed.com">ndeed.com </a>for TME. Nexus is the only reason why they need to access indeed.com.
ii. Existing ENT employers who use both i<a href="http://indeed.com">ndeed.com </a>and Nexus do not want their agency users to gain access to anything other than Nexus
c. Solution
i. Provide a dedicated Nexus full permission set which only gives users access to ALL features with Nexus, nothing else on indeed.com
d. Scope
i. Advertiser level and Job level are both required
ii. The permission can be provisioned automatically via ATS identity sync AND admins manually add (the same employer can only choose one approach for MVP).
1. Admins add include both admins proactively add users AND user request access
iii. An experience that's clear for the admins to give users Nexus specific permissions
iv. This permission must be easy to integrate by the Nexus team.
v. Guest permission is not required for Q4
e. Nexus PRD:
i. Q4FY25 Advanced Screening Releases
f. CIAM Platform Capabilities PRD: Saranya Mohandoss PAC - Q4 Advanced Screening PRD
g. Involved CIAM pods:
i. PAC
ii. OM (for future)
h. Other supporting documents
Others
1. Rebranding Nexus to Smart Screening - on track to deliver by Feb 6th
Another related user problem: Admins having to come to Indeed and manually add users is also a pain point
Somewhere in these problems, can we add that these need to get 'edit' access to all features within Nexus, and that is not supported using the existing permissions?
I think that's included in this.
I don't think that's a user problem, but a problem with how the platform works today.
Why is this out of scope? And how much is it out of scope. PAC is getting questions from interops team that is working on this, should we deprioritize answering any of there questions?
I can elaborate in the doc, but Workday is out of scope for CIAM, but the plan we've heard from interop is for them to reuse our role to permissions mapping service. If they are asking questions to PAC without II, let's all be in the same conversation.
@hbillings@indeed.com : can you make sure POCs from IIs are looped in your conversation with Interop?
The interaction between CIAM and Interop is also called out in the above section:
"A default role mapping service which translates user’s role from Kombo AND Workday to “Nexus full permission” or Nexus “read only” permission At job level.
"Programmatically assigning Nexus full or read only persimmons based on the post translated permission from the role mapping service, for both Kombo ATSes and Indeed built Workday."
👍
