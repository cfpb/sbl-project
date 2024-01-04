# CFPB shared data filing platform
The shared data filing platform will be used by filers of small business lending (SBL) and mortgage lending (HMDA) data to centrally manage their account (user profile, financial institution details, login through Login,gov, etc.). Once the filer is logged in and set up with an account they will be directed to the SBL or HMDA filing apps to file their data.  

### Epics:
- [Shared landing (unauthenticated)](https://github.com/cfpb/sbl-project/issues/7)
- [Login.gov account creation and sign in](https://github.com/cfpb/sbl-project/issues/9)
- [Complete your user profile](https://github.com/cfpb/sbl-project/issues/12)
- [Shared landing (authenticated)](https://github.com/cfpb/sbl-project/issues/8)
- [Request changes to your user profile](https://github.com/cfpb/sbl-project/issues/10)
- [View financial institution profile](https://github.com/cfpb/sbl-project/issues/11)

## User types / personas

**Filing platform user** 
- Anyone who can login to the CFPB shared data filing platform

**Standard user**
- Users under the flat authorization structure
    - Default type of financial institution user
    - Financial institution(s) that have NOT opted-in to the self-admin feature

**Financial institution administrator**
- Financial institution users who can manage subordinate users
    - Financial institution(s) HAVE opted-in

**Managed user** 
- Users managed by financial institution administrators
    - Cannot self-register
    - Cannot manage which institutions they are associated with

**Other user types**
  - SBL Help
  - CFPB Analysts
  - External Analysts
  - Other regulators

Where should we store the source of truth for what each of these users can do in the system? There are a number of user stories related to financial institution admins in the SBL data collection backlog board under "Authentication and authorization" column.
- [Filing platform roles matrix] (link to internal file)


## [Getting started shared landing page (unauthenticated)](https://github.com/cfpb/sbl-project/issues/7)
The CFPB shared data filing platform landing page will be the first place a user lands before they have logged in to use the filing platform. Once the filer is logged in and have successfully completed their user profile they will be directed to the SBL or HMDA filing apps to file their data.

### User stories 
#### MVP (Beta release)
- [ ] [Story: Go to a website and log in to existing account](https://github.com/cfpb/sbl-project/issues/3) (#3)
- [ ] [Story: Get help with setting up account](https://github.com/cfpb/sbl-project/issues/4) (#4)
- [ ] [Story: Understand the CFPB's legal right to request information](https://github.com/cfpb/sbl-project/issues/29) (#29)

#### Backlog
- Add email signup
- Add CFPB megamenu
- Link from Small business lending database page to this page

## [Login.gov account creation and sign in](https://github.com/cfpb/sbl-project/issues/9)
The fist step in accessing the shared data filing platform will be to create an account and login with Login.gov. A user must login with their financial institution email address. Once the filer is logged in and set up with an account they will be directed to the SBL or HMDA filing apps to file their data.

### User stories
#### MVP (Beta release)
- [ ] [Story: CFPB logo appears on Login.gov pages](https://github.com/cfpb/sbl-project/issues/64) (#64)
- [ ] [Story: CFPB text content appears on Login.gov pages](https://github.com/cfpb/sbl-project/issues/65) (#65)
- [ ] [Story: Create a Login.gov account and assign password](https://github.com/cfpb/sbl-project/issues/74) (#74)
- [ ] [Story: Access the CFPB's filing platform with Login.gov credentials](https://github.com/cfpb/sbl-project/issues/75) (#75)

## [Complete your user profile (first time user)](https://github.com/cfpb/sbl-project/issues/12)

### User stories
#### MVP (Beta release)
- [ ] [Story: Complete user profile (first name + last name) upon first login](https://github.com/cfpb/sbl-project/issues/17) (#17)
- [ ] [Story: Prevent the completion of user profile with personal email address](https://github.com/cfpb/sbl-project/issues/18) (#18)
- [ ] [Story: Associate with pre-approved institution(s) via email domain](https://github.com/cfpb/sbl-project/issues/19) (#19)
- [ ] [Story: Next steps to take when financial institution does not yet have an LEI](https://github.com/cfpb/sbl-project/issues/23) (#23)
- [ ] [Story: Actionable feedback when incomplete user profile form is submitted](https://github.com/cfpb/sbl-project/issues/27) (#27)

#### Backlog
- [ ] [Story: Self-associate from full financial institution database and submit for review](https://github.com/cfpb/sbl-project/issues/22)(#22)
- [ ] Story: As a filer, I want filings for my financial institution to be viewable only by people logged in and associated with my financial institution, so that only trusted users are seeing and modifying my filings.
- [ ] Story: As a filer, I want to be able to log out of my account at the end of a session, to keep it secure. Add timeout period for session? Login/Logout in the header area?
- [ ] Story: As a filer, I want each person on my team to have a separate account, so we don’t have to share login information. This is already built into the new system - Login.gov, user profile, etc.
- [ ] Story: As a financial institution point of contact, I want there to be a credible process for ensuring that users are really associated with financial institutions, so that malicious actors can’t sabotage my filing process.  

## [Shared landing page (authenticated)](https://github.com/cfpb/sbl-project/issues/8)

### User stories
#### MVP (Beta release)
GH story issues have not yet been created for this epic.
- [ ] As filer of SBL data, I can view my financial institution details, so that I can verify that I have the correct financial institution associations and take appropriate action if not. 
- [ ] As filer of SBL data, I can launch the filing platform, so that I start the filing process. 
- [ ] As filer of SBL data, I can view my user profile, so that I can confirm that the information is accurate. 
- [ ] [As filer of SBL data, I can access additional resources, so that I can learn about relevant aspects of the filing process. ](https://github.com/cfpb/sbl-project/issues/79)
- [ ] As filer of SBL data, I can Log out, so that I can ensure that my information is secure.

#### Backlog

## [Request changes to your user profile](https://github.com/cfpb/sbl-project/issues/10)

### User stories
#### MVP (Beta release)
GH story issues have not yet been created for this epic.
- [ ] As a filer, I want to view the information contained in my user profile, so that I can make sure that it's accurate.
- [ ] As a filer, I want to be able to associate with additional financial institutions, so that I can file on behalf of all financial institutions that I am responsible for.
- [ ] As a filer, I want to view the list of financial institutions I’m associated with, so I know which financial institutions I need to file for.
- [ ] As a filer, I would like to be able to select a financial institution from the list of financial institutions I'm associated with, so that I can view the individual financial institution details. 
- [ ] As a filer, I want to update/change my email address, so that I can keep my FI email address current. 

[Story: As a filer, I want to be able to view the information contained in my user profile] (https://github.com/cfpb/sbl-project/issues/68) #68
 [Story: As a filer, I want to be able to associate with additional financial institutions] (https://github.com/cfpb/sbl-project/issues/69) #69
 [Story: As a filer, I want to be able to view the list of financial institutions I’m associated with] (https://github.com/cfpb/sbl-project/issues/70 https://github.com/cfpb/sbl-project/issues/71) #70
 [Story: As a filer, I want to be able to select a financial institution from the list of financial institutions I'm associated with] (https://github.com/cfpb/sbl-project/issues/71) #71
  [Story: As a filer, I want to be able to update/change my email address] (https://github.com/cfpb/sbl-project/issues/72) #72

## [View financial institution profile](https://github.com/cfpb/sbl-project/issues/11)

### User stories
#### MVP (Beta release)
GH story issues have not yet been created for all of the user stories for this page. 
- [ ] [Story] View financial institution details #37
- [ ] [Story] Instructions on how to update data on financial institution details  #38
- [ ] [Story] View institution data change history #39
- As a filer, I would like to know where the CFPB obtained the data about my financial institution.
- As a filer, I would like to review my Parent and Top Holder information to ensure it is accurate.
  
# Small business lending data filing app

### Epics:
- Small business lending data filing home
- Review financial institution details
- Upload file
- Resolve errors
- Review warnings
- Sign and submit

## [Small business lending data filing home](https://github.com/cfpb/sbl-project/issues/14)

### User stories
#### MVP (Beta release)
- [ ] As a filer, I can see a list of active institutions I need to file for this filing season.
- [ ] As a filer, I can see the current filing status for each of my institutions.
- [ ] As a filer, I can easily tell when a filing season starts and ends.
- [ ] As a filer, I can select an institution to start the filing process.
- [ ] As a filer, I can select an institution to view past filings.
- [ ] As a filer, I can view the institution data snapshot for a past filing season.
- [ ] As a filer, I can select an institution to restart a filing I've previously completed.

## Review financial institution details
### User stories
#### MVP (Beta release)
- [ ] As a filer, I can confirm my institution data is accurate for given filing period.
- [ ] As a filer, I want clear instructions on what to do to if my institution data is inaccurate.

## Upload file
### User stories
#### MVP (Beta release)
- [ ] As a filer, I can upload my FI's SBLAR data for a given filing period.
- [ ] As a filer, I can view the status of my submission while it is being processed.
- [ ] As a filer, I can view the results of my submission once processing is complete.
- [ ] As a filer, I can get clear error messages if the file failed to be processed.

### Questions
1. What are the statuses visible to the end user?
    - Uploading
    - Upload failed
    - Processing failed (ex: file is an invalid format)
    - Validating data
    - Validation complete

## Review warnings
Should this be one section or should it be separated out between "Review errors" and "Verify warnings"?

### User stories
#### MVP (Beta release)
- [ ] As a filer, I can see a list of all validations raised on a given submission.
- [ ] As a filer, I can cannot proceed with my submission if I have any error-level validations.
- [ ] As a filer, I can proceed with my submission if I only have warning-level validations.
- [ ] As a filer, I can view all info required to resolve a given validations.
    1. Validation id
    1. Validation name
    1. Validation description
    1. Validation severity (error vs. warning)
    1. Link to the FIG
    1. Row number
    1. Related columns
    1. Column data for each failed record
- [ ] As a filer, I can download a CSV validations report.

### Questions
1. Should errors and validations be separate steps in the process like HMDA?
1. If we go with a multi-staged parsing routine, where we check for formatting/syntax errors
   first, then logical errors, should those be a separate steps, or would those just fall
   both be on the "errors" step, and we just accept that users with syntax errors may get
   logical errors on the same screen after resolving syntactical errors?

## Sign and submit

### User stories
#### MVP (Beta release)
- [ ] As a filer, I want to submit ("sign" in HMDA-speak) a given submission as my SBL
   filing for a given filing season.
- [ ] As a filer, I want an receipt-like identifier for my completed filing.
- [ ] As a filer, I would like an email-based confirmation that my filing is complete.
- [ ] As a filer, I would like to provide my financial institution contact phone number, so that the CFPB can contact the appropriate person with questions about my financial institution's filing. 

# Post-filing data analysis

### User stories
- [ ] As a CFPB analyst, I want finalized (aka "signed") SBL data to be available for analysis.
    1. FI data
    1. SBLAR data

# Anonymous validation

### Single-line validator

### User stories
- [ ] As a filer, I would like to check my SBL data for errors prior to submission, so I can
   ensure I have acceptable data in advance of the filing deadline.
- [ ] As a filer, I have instructions detailing which validations cannot be performed while
   validating anonymously.

### Questions
1. Would this just be an API, or is there a UI for this as well?
1. Is this really just a "single line" validator, or do we allow batch as well?

### Questions
1. Do we need to differentiate HMDA vs. SBL users at all?
    1. Can we leave all RegTech filing apps visible to all users, and they
       can voluntarily decide which they need to file for?
1. What are our filing statuses?
    - Not started
    - Institution data confirmed
    - Submission in progress - One or more submissions, but not signed.
        - **Q:** Do we need to show submission-level status?
            - Not started
            - Uploading...
            - Upload complete
            - Validating...
            - Validation complete 
            - Signed
        - **Q:** Do we need sub-statuses for **Validation complete**, or can that just be derived from validation results?
            - Success
            - Failed formatting validations
            - Failed logic validations
        - **Q:** Do we need statuses for steps in between 
            - Awaiting warning acceptance (is this needed?)
            - Awaiting signature (is this needed?)
    - Complete - Once a given submission has been signed.
   

# Additional user stories 
These user stories have been pulled from the GH board but are not prioritized yet for MVP. 

## FI Administrator
### User stories
- [ ] As an administrator, I want to view a registered user's details.
- [ ] As an administrator, I want to be able to discontinue an individual's access if they leave my FI, so they don't have inappropriate access to the filing system.
- [ ] As administrator, I want to be able to see which account was responsible for each action our FI has taken in the system, so I know who to hold accountable.
- [ ] As an administrator, I want to be able to communicate with users (probably via email), so that I can get any necessary information for the verification process. Investigate??
- [ ] As a FI administrator, I want to be able to impersonate a user in the system, so that I can more easily help them with issues they encounter. SBL Help Desk impersonations.

## SBL Help
Who do we need to talk to about the experience within SBL help for the SBL help administrators and platform users? 
### User stories
- [ ] As a SBL/SBL Help administrator, I want to be able to view the list of registered users so I can get more information about a specific user if needed. Will FI admin also manage FI association?
- [ ] As an administrator, I want to be able to view the list of users’ associations.
- [ ] As a filer, I want to get help with setting up my account, so that I can access the filing platform.
- [ ] As a filer, I want there to be a credible process for ensuring that users are really associated with FIs, so that malicious actors can’t sabotage my filing process.

