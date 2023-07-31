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


## Shared landing page (unauthenticated)
The CFPB shared data filing platform landing page will be the first place a user lands before they have logged in to use the filing platform. Once the filer is logged in and have successfully completed their user profile they will be directed to the SBL or HMDA filing apps to file their data.

### User stories
- [x] As a filer, I want to create a shared user profile across CFPB data filing platforms, so that I can more easily manage my filings.
- [x] As a filer, I want to be able to go to a website and log in to my existing account, so I can access the filing system.
- [x] As a filer, I want to know how to get help with setting up my account, so that I can access the filing platform.

### Technical requirements
1. We need to select a mean of hosting static sites
    - Option:
        1. Nginx on Kubernetes
        1. S3
        - **Note:** This will influence how we implement frontend env-specific settings...or vice-versa.
    - Questions:
        1. Does CloudFront CDN provide any value?
          
### Content requirements
- Orient the user to the fact that they are on a shared filing platform for lending data (e.g. SBL, HMDA, NBR).
- Inform the user of what is needed to create an account (LEI), log in to the filing platform (Login.gov account), and begin the filing process.
- Information on Login.gov and why we use it (keep information safe and secure).
- Inform the user that in order to access the filing platform they will need to create a Login.gov account that is tied to their FI email address (not a personal email address).
- Inform the user that they must log in to Login.gov using their financial institution email address. 
- Inform the user of what they should do if they need technical help (they can go to the FAQ page or they can submit a question to SBL help via the help form).
- Inform the user of the requirements for logging in and creating an account.

## Login.gov account creation and sign in
The fist step in accessing the shared data filing platform will be to create an account and login with Login.gov. A user must login with their financial institution email address. Once the filer is logged in and set up with an account they will be directed to the SBL or HMDA filing apps to file their data.

### User stories
- [x] As a filer, I want to be able to go to a website and log in to my existing account, so I can access the filing system.
- [x] As a filer, I want to be able to create a Login.gov account and assign my own password, so that I can start the registration and filing process with minimal hurdles.
- [x] As a filer, I would like to access the CFPB's filing platform with my Login.gov credentials, so that I can trust that my information is secure.

### Create an account with Login.gov 
When the user clicks "Create an account with Login.gov" they will be directed to the Login.gov landing page. The account creation process is 7 screens and includes email confirmation, creating a password, setting up an authentication method, adding an authentication app, and continuing to the CFPB website. 

#### Login.gov screens
1. Sign in / Create an account 
2. Create your account 
3. Confirm your email 
4. Create a strong password
5. Authentication method setup 
6. Add an authentication app
7. You've added your first authentication method
8. Continue to the CFPB

### Sign in with Login.gov 
When the user clicks "Sign in with Login.gov" they will be directed to the Login.gov landing page. There they will enter their email address and password and click the sign in button. This will take them to the CFPB shared platform home (authenticated) page. 

### Your account
A user's email address will auto populate within the CFPB shared filing platform in the "Complete your user profile" page and the "Request changes to your user profile" pages. If a user wishes to make a change to the email address they use to sign in to Login.gov or add a new email address they will do so within Login.gov at https://secure.login.gov/account. Changes to email addresses will be handled in Login.gov and not in the CFPB shared filing platform.

## Complete your user profile (first time user)
- The user will arrive at this page on their first visit after creating their Login.gov account and/or logging in with Login.gov
- Once the user has a user profile and is authenticated they will not see this page again. 
- For an authenticated user any changes to their user profile will be handled on the "Request changes to your user profile" page. 

On this form: 
- The user will be asked to enter their First name and Last name 
- Their email address will auto-populate based on the email address they used to sign in with Login.gov. 
- They will be able to associate with one or more financial institutions either by selecting from a pre-populated list of financial institutions/LEIs that match their email domain or by manually searching and selecting from the full database.
- Only the selections from the pre-populated list of financial institutions/LEIs that match their email domain will allow a user immediate access to the system.
- Selections using the search and select go to SBL Help for review. 

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

### Technical requirements
1. User management API
    1. Writes user data back to Keycloak
1. Institutions API
    1. Retrieve institution data by LEI, name, and email domain.

### Content requirements: 
- [ ] Inform the user of what they should do if their financial institution is not registered with GLEIF (need LEI)
- [ ] Notification content/messaging for each of the possible financial institution association scenarios 

### Questions
**What's the UX for a user who cannot self-associate with at least one FI? Can they even proceed into the app?** 
- No, their only option is to file an SBL Help ticket or wait for their institution to show up in the system (this would be if they have recently registered with GLEIF). 

**What's the UX for a user who can self-associate with some FIs, but not all? Can they go into the app, and subsequent FI associations can just be handled in the **Request changes to user profile** page?**
- Yes, they could do that. Or, in our current design they could also self associate in the "Complete user profile" page

**Do we need a user-to-fi approval state that's visible to the user?**
- Waiting-for-approval
- Approved
We currently have a success message that shows up the first time a new user is authenticated and completes their user profile. We have not discussed an approval state within the context of the "Complete user profile" page or the "Request changes to your user profile" but we should. We will probably also need notifications for when a user submits changes to SBH help (clicks "Request changes" button.

**To what extent can we streamline the process of what HMDA does today?**
- Auto-create a Salesforce ticket?
- Proactively call users?
- _Some_ means of viewing a queue/list of users who've logged in, but cannot use the system due no institution associations.

**Is the email address used for anything other than associating a user with a financial institution?**
- Submission confirmations go to the email address on file. 

**For the “Associate with a financial institution” what is the default list - do we show every institution in our database or do we narrow it down initially?** 
- Show all FIs in database so users can search by financial institution name and/or LEI. This allows the user to select financial institution name and/or LEIs that don't match their email domain
- (We will start with a non-prioritized, standard list (show all financial institutions in our database so that users can search by financial institution name and/or LEI ). We have concerns about the UX of a prioritized list. May add complexity without a need or benefit.
- We have explored a design where the matches by email domain are pulled out of the search and select.

**Can we get the email domains associated with all existing LEIs from GLEIF?** 
- If so our database of known financial institutions and LEIs will match GLEIF’s data. 
- Still unknown. David is working on this. 

**Is a user's email address in our system associated with the primary Login.gov email address at the time of completing their user profile or is it automatically updated in our system when a user changes their email in Login.gov?** 
- Requires some testing with Login.gov; we should always have the user’s current Login.gov email address & not require them to complete a new user profile + re-do FI associations if their Login.gov email address changes (based on user id)
- Based on this we should have messaging that lets a filer know that any changes to their email address should be made in Login.gov

**Login.gov process for updating an email address:**
- Go to Login.gov & log in with email+password+2FA
- + Add new email (requires email validation link, re-sign in with original email+password+2FA)
- Can delete original email address

### Financial institution association (scenarios and results)
(for financial institution association/email domain/email address):

1) User logs in with Login.gov using their financial institution's email address. We have their email domain in our system. Their financial institution/LEI is in our database.
2) User logs in with Login.gov using a personal email address.
3)  User logs in with Login.gov using their financial institution email address. We do not have their financial institution's email domain in our system. We do have their financial institution/LEI in our database. 
4)  User logs in with Login.gov using their financial institution email address. We do not have their financial institution's email domain in our system. We do not have their financial institution/LEI in our system.
5) User logs in with Login.gov using their financial institution email address. We do have their financial institution's email domain in our system. We do not have their financial institution/LEI in our system.

### Scenario 1: 
User logs in with Login.gov using their financial institution's email address. We have their email domain in our system and their financial institution/LEI is in our database. 

#### A. User selects from the financial institution/LEI(s) that match by email domain
  - After user clicks "Submit" they are directed to the CFPB shared data filing platform landing page (authenticated)
  - A success notification appears at the top of the CFPB shared data filing platform landing page (authenticated) page. 
  - The user now has a user profile, is associated with a financial institution, and is authorized to proceed with filing data.  

#### B. User searches and selects from the full database
   - After user clicks "Submit" a warning notification appears below indicating that the user's selection has been submitted to SBL Help for review and that they will have to wait for an email from SBL Help that their account is approved and they are able to proceed.
   - The user does not proceed to the CFPB shared data filing platform landing page (authenticated) page.

#### C. User selects from the financial institution/LEI(s) that match by email domain and searches and selects from the full database
   - After the user clicks "Submit" they are directed to the CFPB shared data filing platform landing page (authenticated)
   - This user's self-selection (from search and select) goes to SBL Help for review/approval
   - The user now has a user profile, is associated with a financial institution, and is authorized to proceed with filing data (for only the financial institution(s) that they selected from the matches by email domain)
   - A warning notification appears at the top of the CFPB shared data filing platform landing page (authenticated) page indicating that the user can proceed with filing for the financial institutions that were pulled from email domain matches but that the user's self-selection(s) have been submitted to SBL Help for review and that they will have to wait for an email indicating that their account is approved and they are able to proceed with filing for the additional institutions. 

### Scenario 2: 
User logs in with Login.gov using a personal email address. 
- We would build an explicit deny list of personal email domains (gmail.com, yahoo.com, hotmail.com, etc.) to alert users up-front that we don't support non-financial institution email addresses
- In this scenario, if the email domain is in our deny list, an error message would show up under the email field that asks the user to go back to Login.gov and login with their financial institution email address.

### Scenario 3: 
User logs in with Login.gov using their financial institution email address. We do not have their financial institution's email domain in our system. We do have their financial institution/LEI in our database.
- In this scenario the user would use the search and select feature to find their financial institution and/or LEI and select one or more which then routes to SBL Help for approval.
- A notification displays on the complete user profile page indicating that the user's selection has been submitted to SBL Help for review and that they will have to wait for an email indicating that their account is approved and they are able to proceed.

### Scenario 4: 
User logs in with Login.gov using their financial institution email address. We do not have their financial institution's email domain in our system. We do not have their financial institution/LEI in our system.

- In this scenario the user would use the search and select feature to find their financial institution and/or LEI and select one or more which then routes to SBL Help for approval.
- A notification displays on the complete user profile page indicating that the user's selection has been submitted to SBL Help for review and that they will have to wait for an email indicating that their account is approved and they are able to proceed.
- This should only occur in the following cases:
  - The entity has not registered,
  - Our data from GLEIF does not contain the entity because they registered recently
- In this scenario the error message should tell the user that they either need to register for an LEI with GLEIF, or that if they recently registered for an LEI it’s not in our system yet and they should check back in _____ days?

### Scenario 5:
User logs in with Login.gov using their financial institution email address. We do have their financial institution's email domain in our system. We do not have their financial institution/LEI in our system.
- This scenario _probably_ isn't possible if we structure the data appropriately...and even if it is, it should be considered a bug if that state gets makes it out to the UI. It's a good one to think about, though. If we have Fis and domains as a many-to-many relationship...🤔 theoretically possible I suppose.
- If the user logs in with their FI email and we do have their email domain in our system and do not have their FI/LEI in our system then this is a bug and the user should contact SBL Help.


### Notes
1. This/these screen(s) should be very similar to the **Request changes to user profile** screen, perhaps just
   optimized for first-time users, and acting as more of a gate to insure the user is fully
   configured prior to entering the rest of the system.

## Shared landing page (authenticated)

### User stories
- [x] As a filer who submits both SBL and other data to CFPB (e.g. HMDA or NBR), I would like my financial institution details to be centrally managed, so that I don’t have to maintain the same information in multiple places. 
- [x] As a filer  who submits both SBL and other data to CFPB (e.g. HMDA or NBR), I want to be able to have a single user profile that is shared among the CFPB platforms, so that I don’t have to maintain the same information in multiple places. 

### Content requirements
Overview of what a user can do:
- [x] Navigate to "File for SBL"
- [x] Navigate to "File for HMDA"
- [x] Access to "Request changes to user profile" page
- [x] Access to "View financial institution details" page
- [x] Notification that a user has successfully completed their user profile (appears on first visit)

**Needs further review:** 
- [ ] Indication that tells a user that they have successfully logged in to the platform (Login/Logout in header area)?
- [ ] User can see notifications for actions they need to take.

## Request changes to your user profile

### User stories
- [x] As a filer, I want to view the list of financial institutions I’m associated with, so I know which financial institutions I need to file for.
- [x] As a filer, I want to view the information contained in my user profile, so that I can make sure that it's accurate.
- [x] As a filer, I want to be able to associate with additional financial institutions, so that I can file on behalf of all financial institutions that I am responsible for.
- [x] As a filer, I would like to see list of all my associated financial institutions, so that I know which financial institutions I need to file for. 
- [x] As a filer, I would like to select a financial institution from the list of financial institutions I'm associated with, so that I can view the individual financail to view the financial institution details. 

### Content requirements
A user can view:
- First name
- Last name
- Email address 
- Associated financial institutions
- Instructions on how to request changes to their user profile details

### Questions
**In what ways is the **Request changes to your user profile** different from the **Complete user profile** screen?**
- The **Complete user profile** screen, is optimized for first-time users, and acting as more of a gate to insure the user is fully configured prior to entering the rest of the system.
- The **Request changes to your user profile** should be used to check what user profile details we have on file and request any changes.
- A user will first see the details that we have on file and then be able to fill out a form to make changes.
- Changes will go to SBL help for processing.  

## Financial institution details

### User stories
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
  
### Questions
1. What details should be in this list?
    1. Name, LEI
    1. Status: Active, Deactivated
    1. Filing status for SBL and HMDA for the current filing season.
    1. User association status? Only when waiting for approval?

<br></br>
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

### Content requirements: 
- Comprehensive instructions on the steps of the filing process. 

**Needs further review:** 
- [ ] As a filer, I can see a list of inactive institutions I have filed for in the past.

### Questions
1. How much consideration do we need to give now to all of the 2nd year+ scenarios?
    1. A filer is told by SEFL they need to re-file after an exam.
    1. A filer didn't file for a past year.
1. Are we going to have a 3-year window where we allow refiling like HMDA?

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
