# CFPB shared data filing platform
The shared data filing platform will be used by filers of small business lending (SBL) and mortgage lending (HMDA) data to centrally manage their account (user profile, financial institution details, login through Login,gov, etc.). Once the filer is logged in and set up with an account they will be directed to the SBL or HMDA filing apps to file their data.  

## Pages: 
- [Shared landing (unauthenticated)](https://github.com/cfpb/sbl-project/issues/7)
- [Login.gov account creation and sign in](https://github.com/cfpb/sbl-project/issues/9)
- [Complete your user profile](https://github.com/cfpb/sbl-project/issues/12)
- [Shared landing (authenticated)](https://github.com/cfpb/sbl-project/issues/8)
- [Request changes to your user profile](https://github.com/cfpb/sbl-project/issues/10)
- [View financial institution details](https://github.com/cfpb/sbl-project/issues/11)

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
- [X] [As a filer, I want to be able to go to a website and log in to my existing account, so I can access the filing system](https://github.com/cfpb/sbl-project/issues/3).
- [X] [As a filer, I want to know how to get help with setting up my account, so that I can access the filing platform](https://github.com/cfpb/sbl-project/issues/4).
- [x] As a filer, I want to know how to get help with setting up my account, so that I can access the filing platform.

## [Login.gov account creation and sign in](https://github.com/cfpb/sbl-project/issues/9)
The fist step in accessing the shared data filing platform will be to create an account and login with Login.gov. A user must login with their financial institution email address. Once the filer is logged in and set up with an account they will be directed to the SBL or HMDA filing apps to file their data.

### User stories
- [x] As a filer, I want to be able to go to a website and log in to my existing account, so I can access the filing system.
- [x] As a filer, I want to be able to create a Login.gov account and assign my own password, so that I can start the registration and filing process with minimal hurdles.
- [x] As a filer, I would like to access the CFPB's filing platform with my Login.gov credentials, so that I can trust that my information is secure.

## [Complete your user profile (first time user)](https://github.com/cfpb/sbl-project/issues/12)

### User stories
- [x] As a filer, I would like to complete my user profile upon my first login, so that I can begin the filing process.
- [x] As a filer, I would like to be able to associate myself with one or more financial institutions, so that I can file on behalf of the institution(s) I am responsible for.
- [x] As a a filer, I would like to be able to search for and select my financial institution(s) by financial institution name and/or LEI, so that I can file on behalf of the institution(s) I am responsible for.
- [x] As a filer whose institution is not already known to the CFPB, I want information on how to register my financial institution with GLEIF, so that I can create an account associated with that financial institution.
- [x] As a filer, I would like to be alerted if I try to complete my profile using a personal email address, so that I know to go back to Login.gov and login with my financial institution email address.
- [x] As a filer, I would like each person on my team to have a separate account, so we don’t have to share login information.
- [x] As a filer, I would like to choose which institution(s) I want to be associated with from a pre-populated list (based on email domain), so I don’t need to look up my financial institution’s LEI during the registration process.

**Needs further review:** 
- [ ] [Dev user story] As a filer, I want filings for my financial institution to be viewable only by people logged in and associated with my financial institution, so that only trusted users are seeing and modifying my filings.
- [ ] [Need further review] As a filer, I want to be able to log out of my account at the end of a session, to keep it secure. Add timeout period for session? Login/Logout in the header area?
- [ ] [Need further review] As a filer, I want each person on my team to have a separate account, so we don’t have to share login information. This is already built into the new system - Login.gov, user profile, etc.
- [ ] [Needs further review] As a financial institution point of contact, I want there to be a credible process for ensuring that users are really associated with financial institutions, so that malicious actors can’t sabotage my filing process.  

## [Shared landing page (authenticated)](https://github.com/cfpb/sbl-project/issues/8)

### User stories
- [x] As a filer who submits both SBL and other data to CFPB (e.g. HMDA or NBR), I would like my financial institution details to be centrally managed, so that I don’t have to maintain the same information in multiple places. 
- [x] As a filer  who submits both SBL and other data to CFPB (e.g. HMDA or NBR), I want to be able to have a single user profile that is shared among the CFPB platforms, so that I don’t have to maintain the same information in multiple places. 

## [Request changes to your user profile](https://github.com/cfpb/sbl-project/issues/10)

### User stories
- [x] As a filer, I want to view the list of financial institutions I’m associated with, so I know which financial institutions I need to file for.
- [x] As a filer, I want to view the information contained in my user profile, so that I can make sure that it's accurate.
- [x] As a filer, I want to be able to associate with additional financial institutions, so that I can file on behalf of all financial institutions that I am responsible for.
- [x] As a filer, I would like to see list of all my associated financial institutions, so that I know which financial institutions I need to file for. 
- [x] As a filer, I would like to select a financial institution from the list of financial institutions I'm associated with, so that I can view the individual financail to view the financial institution details. 

## [View financial institution details](https://github.com/cfpb/sbl-project/issues/11)

### User stories (make sure these match with what's in the Epic issue)
- [ ] As a filer, I would like to view my financial institution data as the CFPB understands it.
- [ ] As a filer, I would like clear instructions on how to change read-only financial institution fields.
- [ ] As a filer, I would like to view the history of changes to my institution data.
    1. Who: person or automation w/ data source
    1. What: Which fields changed from what to what
    1. When: Timestamp
    1. Why: automation or human note
- [ ] Common institution data across all RegTech apps.
- [ ] Defaults to latest version of institution data.
- [ ] Clearly delineates shared vs. HMDA and SBL-specific data fields
- [ ] Full history of all data changes is available.
- [ ] Data will be _mostly_ read-only, with possible exceptions for:
    1. FI contact info (name, phone, email, etc.)
  
# Small business lending data filing app

#### Includes:
- Small business lending data filing home
- Upload file
- Review errors
- Verify warnings
- Sign and submit

## Small business lending data filing home

### User stories
- [ ] As a filer, I can see a list of active institutions I need to file for this filing season.
- [ ] As a filer, I can see the current filing status for each of my institutions.
- [ ] As a filer, I can easily tell when a filing season starts and ends.
- [ ] As a filer, I can select an institution to start the filing process.
- [ ] As a filer, I can select an institution to view past filings.
- [ ] As a filer, I can view the institution data snapshot for a past filing season.
- [ ] As a filer, I can select an institution to restart a filing I've previously completed.

## Confirm financial institution details for given filing period

### User stories
- [ ] As a filer, I can confirm my institution data is accurate for given filing period.
- [ ] As a filer, I want clear instructions on what to do to if my institution data is inaccurate.

### Questions
1. Are there institution data fields that the user can fix themselves?
    1. Can they do it on this screen, or do they go back to the **Institution profile**
       page in RegTech Home?
1. Does a user have to go through this screen every time the upload a new version?
    1. Seems like the answer should be _no_, but then how does the flow work?

### Notes
1. This is one way SBL is different from HMDA. HMDA has the "Transmittal Sheet" as
   the first record of their file, which contains their institution data for a given
   filing season. So, we can't really "do what HMDA does" for this one.

## Upload file
1. As a filer, I can upload my FI's SBLAR data for a given filing period.
1. As a filer, I can view the status of my submission while it is being processed.
1. As a filer, I can view the results of my submission once processing is complete.
1. As a filer, I can get clear error messages if the file failed to be processed.

### Questions
1. What are the statuses visible to the end user?
    - Uploading
    - Upload failed
    - Processing failed (ex: file is an invalid format)
    - Validating data
    - Validation complete

## Review errors and Verify warnings
Should this be one section or should it be separated out between "Review errors" and "Verify warnings"?

### User stories
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
