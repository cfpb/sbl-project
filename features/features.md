# User types / personas

1. **FI User** - Anyone who can login to the RegTech system.
    1. **FI Standard User** - Users under the flat authorization structure.
        - Default type of FI user.
        - FI(s) have NOT opted-in to the self-admin feature.
    1. **FI Admin** - Users who can manage subordinate users
        - FI(s) HAVE opted-in to 
    1. **FI Subordinate** - Users managed by FI Admins.
         - Cannot self-register
         - Cannot manage which institutions they are associated with.
1. SBL Help
1. CFPB Analysts
1. External Analysts
1. Other regulators

Where should we store the source of truth for what each of these users can do in the system? There are a number of user stories related to FI admins in the SBL data collection backlog board under "Authentication and authorization" column.

# Features

## CFPB shared data filing platform

Includes: 
- Authentication and authorization
- User profile completion
- Financial institution association
- User profile management
- Financial institution details

### Shared landing page (unauthenticated)

#### User stories
- [x] As a filer, I want to be able to go to a website and log in to my existing account, so I can access the filing system.
- [x] As a filer, I want to be able to create an account and assign my own password, so that I can start the registration and filing process with minimal hurdles.
- [x] As a filer, I want to have a shared user profile across CFPB data filing platforms, so that I can more easily manage my filings.
- [x] As a filer, I would like instructions on how to create a Login.gov account and user profile, so that I can access the filing platform.
- [x] As a filer, I would like to log in to the CFPB's filing app with my Login.gov credentials, so that I can trust that my information is secure. 
- [x] As a filer, I want to understand the steps I need to follow in order to create an account, so that I can access the filing platform.
- [x] As a filer, I want to understand what Login.gov is, so that I can trust that my information is safe and secure.
- [x] As a filer, I want to know what email address I must use when I create an account with Login.gov, so that I can gain access to the filing platform.
- [x] As a filer, I want to know where to go for help with setting up my account, so that I can access the filing platform.

- [ ] As a filer, I would like instructions on how to submit my filing data to the CFPB, so that I can comply with regulatory requirements. 

#### Technical requirements
1. We need to select a mean of hosting static sites
    - Option:
        1. Nginx on Kubernetes
        1. S3
        - **Note:** This will influence how we implement frontend env-specific settings...or vice-versa.
    - Questions:
        1. Does CloudFront CDN provide any value?

#### Content requirements
1. Orient a user to the fact that they are on a shared filing platform for lending data.
2. Information on what is needed to create an account, log in to the filing platform, and begin the filing process (LEI, Login.gov account using financial institution email address).
3. Information on Login.gov and why we use it.
4. Communicate that although users may have an exiting Login.gov account for other things, in order to access the filing platform they need to create a Login.gov account that is tied to their FI email address.
5. Information on what a user should do if they need technical help (they can go to the FAQ page or they can submit a question to SBL help via the help form).

### Complete user profile (first-time user)

#### User stories
- [x] As a filer, I would like to complete my user profile upon my first login, so that I can begin the filing process (First name, Last name)
- [x] As a filer, I want to associate my account with a financial institution, so I can file on behalf of that institution. 
- [x] As a filer, I would like to associate myself with one or more FIs, so that I can manage all of the filings I’m responsible for in one place.
- [x] As a a filer, I want to be able to search for and select my financial institution(s) by LEI, so that I can file on behalf of that institution.
- [x] As a filer, I want to be able to search for and select my financial institution(s) by name, so that I can file on behalf of that institution.
- [x] As a filer, I want to choose which institution(s) I want to be associated with from a pre-populated list (based on email domain), so that I don’t need to look up my FI’s LEI info during the registration process. 
- [x] As a filer whose institution is not already known to the CFPB, I want to be provided information on how to register my FI with GLEIF so I can create an account associated with that FI.
- [x] As a filer, I want to choose which institution(s) I want to be associated with from a pre-populated list, so I don’t need to look up my FI’s LEI info during the registration process.
- [x] *As a filer, I would like to receive a notification if I try to complete my profile using a personal email address, so that I know to go back to Login.gov and login with my financial institution email address.
- [x] As a filer, I want each person on my team to have a separate account, so we don’t have to share login information.
- [x] (This is currently being added to the prototype - wireframe has been designed) As a filer, I would like to know which FIs are already associated with my email domain, so that I don't have to search by financial institution name or LEI.


- [ ] ?[Dev user story] As a filer, I want filings for my FI to be viewable only by people logged in and associated with my FI, so that only trusted users are seeing and modifying my filings.
- [ ] [Need further review] As a filer, I would like instructions on what to do if my email domain is not registered with the CFPB, so that I can create a user profile and access the filing platform. (In this instance does the selection have to go to SBL help for review/approval?)
- [ ] [Need further review] As a filer, I want to be able to log out of my account at the end of a session, to keep it secure. Add timeout period for session?


#### Technical requirements

1. User management API
    1. Writes user data back to Keycloak
1. Institutions API
    1. Retrieve institution data by LEI, name, and email domain.

#### Questions

1. What's the UX for a user who cannot self-associate with at least one FI? Can they even proceed into the app? 
    1. No, their only option is to file an SBL Help ticket or wait for their institution to show up in the system (this would be if they have recently registered with GLEIF). 

1. What's the UX for a user who can self-associate with some FIs, but not all?
    1. Can they go into the app, and subsequent FI associations can just be handled in the **Request changes to user profile** page?

1. Do we need a user-to-fi approval state that's visible to the user?
    1. waiting-for-approval
    1. approved

1. To what extent can we streamline the process of what HMDA does today?
    1. Auto-create a Salesforce ticket?
    1. Proactively call users?
    1. _Some_ means of viewing a queue/list of users who've logged in, but
      cannot use the system due no institution associations.

1. Is the email domain or email address used for anything other than associating a user with a financial institution? 
    1. Aside from FI association, the confirmation of submission email would go to this email address.  

1. For the “Associate with a financial institution” what is the default list - do we show every institution in our database or do we narrow it down initially? 
    1. Prioritize the FIs that match their email domain (TBD)
    1. Show all FIs in database so users can search by bank name or LEI to add other FIs whose domain does not initially match 

1. What if we start with showing all financial institutions in our database so users can search by financial institution name or LEI? Then we can decide whether there is a user benefit to prioritizing the results by email domain?   

1. Can we get the email domains associated with all existing LEIs from GLEIF? 
    1. If so our database of known financial institutions and LEIs will match GLEIF’s data. 
    1.  Still unknown. David is working on this. 

1. Is a user's email address in our system associated with the primary Login.gov email address at the time of completing their user profile or is it automatically updated in our system when a user changes their email in Login.gov? 
    1. Requires some testing with Login.gov; we should always have the user’s current Login.gov email address & not require them to complete a new user profile + re-do FI associations if their Login.gov email address changes (based on user id)
    1. Based on this we should have messaging that lets a filer know that any changes to their email address should be made in Login.gov
  
#### Financial institution association scenarios

1) The user has logged in to Login.gov with a personal email address.
Do we want an explicit blacklist of email domains (gmail.com, yahoo.com, hotmail.com, etc.) to tell users up-front that we don't support non-FI email addresses, or do we want to just let the SBL Help process take care of letting them they'll have to use a different email address?
If the user has logged in to Login.gov with a personal email address that’s in our blacklist...then we show an error message and ask the user to go back to Login.gov to use their FI email address.

2) The user has logged in to Login.gov with their financial institution email address but we do not have their financial institution's email domain in our system and we do have their financial institution/LEI in our system. 
If we do not have their FI email domain in our system, but we have their FI/LEI...
then the user would use the search feature to find their FI and select it, which then routes to SBL Help for approval, and we should display a message on this complete user profile page that tells the user this approval process is occurring; they will have to wait for an email from SBL Help that their account is approved and they are able to proceed.

3) The user has logged in to Login.gov with their financial institution email address but we do not have their financial institution's email domain in our system and we do not have their financial institution/LEI in our system.
This should only occur in the following cases: 1) entity has not registered, 2) our data from GLEIF does not contain the entity because they registered recently.
If the user logs in with their FI email address but we do not have their domain in our system, and we do not have their FI/LEI in our system then we’re showing them an error message that tells them they either need to register for an LEI with GLEIF, or that if they recently registered for an LEI it’s not in our system yet and they should check back in _____ days?

4) The user has logged in to Login.gov with their financial institution email address and we do have their email domain in our system and we do have their financial institution/LEI in our system. This will predominantly be those filers from HMDA. This could also happen outside of just HMDA FIs if we're able to get domain data from GLEIF or NIC or ... somebody
If the user logs in with their FI email address and we do have their domain in our system, and we do have their FI/LEI then the search feature should filter prioritize the results to display only the results that match their email domain, the user can use the search features to further narrow their results as needed based on FI name or LEI

5) The user has logged in to Login.gov with their financial institution email address and we do have their email domain in our system and we do not have their financial institution/LEI in our system.
This scenario _probably_ isn't possible if we structure the data appropriately...and even if it is, it should be considered a bug if that state gets makes it out to the UI. It's a good one to think about, though. If we have Fis and domains as a many-to-many relationship...🤔 theoretically possible I suppose.
If the user logs in with their FI email and we do have their email domain in our system and do not have their FI/LEI in our system then this is a bug and the user should contact SBL Help.

#### Notes
1. This/these screen(s) should be very similar to the **Request changes to user profile** screen, perhaps just
   optimized for first-time users, and acting as more of a gate to insure the user is fully
   configured prior to entering the rest of the system.

### Shared landing page (authenticated)

#### User stories
Add user stories 

#### Content requirements
Overview of what a user can do:
- [x] File for SBL
- [x] File for HMDA
- [x] Access to manage user profile page
- [x] Access individual financial institution details
- [x] Notification that a user has successfully completed their user profile.
- [x] A way for a user to review and request changes to their user profile
- [x] Navigation for getting to the place for filing HMDA versus SBL data

- [ ] Indication that tells a user that they have successfully logged in to the platform (Login/Logout in header area)?
- [ ] User can see notifications for actions they need to take.

### Request changes to user profile

#### User stories
- [x] As a filer, I want to view the list of FIs I’m associated with, so I know which FIs I need to file for.
- [x] * As a filer, I want to view the information contained in my user profile, so that I can make sure that it's accurate.
- [x] * As a filer, I want to be able to associate with additional financial institutions, so that I can file on behalf of all financial institutions that I am responsible for.  

#### Content requirements

A user can view:
- First name and last name
- Email address 
- Associated financial institutions
- Instructions on how to request changes to their user profile details

#### Questions
1. In what ways is the **Request changes to user profile** different from the **Create user profile** screen?

### List of associated financial institutions (we should review this as a team)

#### User stories
1. As a filer, I would like to see list of all my associated institutions.
1. As a filer, I would like to select an institution from the list to view its **Financial institution details**.

#### Questions
1. What details should be in this list?
    1. Name, LEI
    1. Status: Active, Deactivated
    1. Filing status for SBL and HMDA for the current filing season.
    1. User association status? Only when waiting for approval?

### View financial institution profile (we should review this as a team)

#### User stories
1. As a filer, I would like to view my financial institution data as the CFPB understands it.
1. As a filer, I would like clear instructions on how to change read-only financial institution fields.
1. As a filer, I would like to view the history of changes to my institution data.
    1. Who: person or automation w/ data source
    1. What: Which fields changed from what to what
    1. When: Timestamp
    1. Why: automation or human note
1. Common institution data across all RegTech apps.
1. Defaults to latest version of institution data.
1. Clearly delineates shared vs. HMDA and SBL-specific data fields
1. Full history of all data changes is available.
1. Data will be _mostly_ read-only, with possible exceptions for:
    1. FI contact info (name, phone, email, etc.)

## Small business lending data filing app

### Small business lending data filing home

#### User stories

- [x] As a filer, I can see a list of active institutions I need to file for this filing season.
- [x] As a filer, I can see the current filing status for each of my institutions.
- [x] As a filer, I can easily tell when a filing season starts and ends.
- [x] As a filer, I can select an institution to start the filing process.
- [x] As a filer, I can select an institution to view past filings.
- [x] As a filer, I can view the institution data snapshot for a past filing season.
- [x] As a filer, I can select an institution to restart a filing I've previously completed.

- [ ] ? As a filer, I can see a list of inactive institutions I have filed for in the past.

#### Questions

1. How much consideration do we need to give now to all of the 2nd year+ scenarios?
    1. A filer is told by SEFL they need to re-file after an exam.
    1. A filer didn't file for a past year.
1. Are we going to have a 3-year window where we allow refiling like HMDA?

### Confirm institution data

#### User stories

1. As a filer, I can confirm my institution data is accurate for given filing period.
1. As a filer, I want clear instructions on what to do to if my institution data is inaccurate.

#### Questions

1. Are there institution data fields that the user can fix themselves?
    1. Can they do it on this screen, or do they go back to the **Institution profile**
       page in RegTech Home?
1. Does a user have to go through this screen every time the upload a new version?
    1. Seems like the answer should be _no_, but then how does the flow work?

#### Notes

1. This is one way SBL is different from HMDA. HMDA has the "Transmittal Sheet" as
   the first record of their file, which contains their institution data for a given
   filing season. So, we can't really "do what HMDA does" for this one.


### Upload file

1. As a filer, I can upload my FI's SBLAR data for a given filing period.
1. As a filer, I can view the status of my submission while it is being processed.
1. As a filer, I can view the results of my submission once processing is complete.
1. As a filer, I can get clear error messages if the file failed to be processed.

#### Questions

1. What are the statuses visible to the end user?
    - Uploading
    - Upload failed
    - Processing failed (ex: file is an invalid format)
    - Validating data
    - Validation complete

### Review errors and Verify warnings

#### User stories

1. As a filer, I can see a list of all validations raised on a given submission.
1. As a filer, I can cannot proceed with my submission if I have any error-level validations.
1. As a filer, I can proceed with my submission if I only have warning-level validations.
1. As a filer, I can view all info required to resolve a given validations.
    1. Validation id
    1. Validation name
    1. Validation description
    1. Validation severity (error vs. warning)
    1. Link to the FIG
    1. Row number
    1. Related columns
    1. Column data for each failed record
1. As a filer, I can download a CSV validations report.

#### Questions

1. Should errors and validations be separate steps in the process like HMDA?
1. If we go with a multi-staged parsing routine, where we check for formatting/syntax errors
   first, then logical errors, should those be a separate steps, or would those just fall
   both be on the "errors" step, and we just accept that users with syntax errors may get
   logical errors on the same screen after resolving syntactical errors?


### Sign and submit

#### User stories

1. As a filer, I want to submit ("sign" in HMDA-speak) a given submission as my SBL
   filing for a given filing season.
1. As a filer, I want an receipt-like identifier for my completed filing.
1. As a filer, I would like an email-based confirmation that my filing is complete.
2. As a filer, I would like to provide my financial institution contact phone number, so that the CFPB can contact the appropriate person with questions about my financial institution's filing. 


## Post-filing data analysis

### User stories
1. As a CFPB analyst, I want finalized (aka "signed") SBL data to be available for analysis.
    1. FI data
    1. SBLAR data


## Anonymous validation

### Single-line validator

#### User stories

1. As a filer, I would like to check my SBL data for errors prior to submission, so I can
   ensure I have acceptable data in advance of the filing deadline.
1. As a filer, I have instructions detailing which validations cannot be performed while
   validating anonymously.

#### Questions

1. Would this just be an API, or is there a UI for this as well?
1. Is this really just a "single line" validator, or do we allow batch as well?


# Questions

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
