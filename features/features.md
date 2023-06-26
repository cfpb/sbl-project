# User types / personas

1. **FI User** - Anyone who can login to the RegTech system.
    1. **FI Standard User** - Users under the flat authorization structure.
        - Default type of FI user.
        - FI(s) have NOT opted-in to the self-admin feature.
    1. **FI Admin** - Users who can manage subordinate users.
        - FI(s) HAVE opted-in to 
    1. **FI Subordinate** - Users managed by FI Admins.
         - Cannot self-register
         - Cannot manage which institutions they are associated with.
1. SBL Help
1. CFPB Analysts
1. External Analysts
1. Other regulators

# Features

## RegTech Home

### RegTech landing page (unauthenticated)

#### User stores
1.  As a curious member of the public, I would like to overview of CFPB's RegTech program.
1.  As a filer, I would like instructions on how to submit my filing data to CFPB.
1.  As a filer, I would like instructions on how to create an an account.
1.  As a filer, I would like to login to CFPB's RegTech app with my Login.gov credentials.

#### Technical requirements
1. We need to select a mean of hosting static sites
    - Option:
        1. Nginx on Kubernetes
        1. S3
        - **Note:** This will influence how we implement frontend env-specific settings...or vice-versa.
    - Questions:
        1. Does CloudFront CDN provide any value?


### First-time user login process

#### User stories
1. As a filer, I would like to complete my user profile upon my first login.
    - First name
    - Last name
    - Work phone?
1. As a filer, I would like to associate myself with one or more FIs. 
1. As a filer, I would like to find my FIs by LEI.
1. As a filer, I would like to find my FIs by name.
1. As a filer, I would like to know which FIs are already associated with my email domain.
1. As a filer, I would like instructions on what to do if my FI is not registered with CFPB.
1. As a filer, I would like instructions on what to do if my email domain is not registered with CFPB.
1. As a SBL Help user, ...

#### Technical requirements

1. User management API
    1. Writes user data back to Keycloak
1. Institutions API
    1. Retrieve institution data by LEI, name, and email domain.

#### Questions

1. What's the UX for a user who cannot self-associate with at least one FI?
    1. Can they even proceed into the app?
1. What's the UX for a user who can self-associate with some FIs, but not all?
    1. Can they go into the app, and subsequent FI associations can just be
       handled in the **User profile** page?
1. Do we need a user-to-fi approval state that's visible to the user?
    - waiting-for-approval
    - approved
1. To what extent can we streamline the process of what HMDA does today?
    1. Auto-create a Salesforce ticket?
    1. Proactively call users?
    1. _Some_ means of viewing a queue/list of users who've logged in, but
      cannot use the system due no institution associations.

#### Notes

1. This/these screen(s) should be very similar to the **User profile** screen, perhaps just
   optimized for first-time users, and acting as more of a gate to insure the user is fully
   configured prior to entering the rest of the system.


### RegTech home

#### User stories

1. User can get an overview of all things they can do.
    1. File for SBL
    1. File for HMDA
    1. View their User Profile
    1. View their Institutions
1. User can see notifications for actions they need to take.

### User profile

#### Questions

1. In what ways is the **User profile** different from first-time login screen.


### Institution list

#### User stories

1. As a filer, I would like to see list of all my associated institutions.
1. As a filer, I would like to select an institution from the list to view its **Institution profile**.
1. As a filer, I would like to see 

#### Questions

1. What details should be in this list?
    1. Name, LEI
    1. Status: Active, Deactivated
    1. Filing status for SBL and HMDA for the current filing season.
    1. User association status? Only when waiting for approval?


### Institution profile

#### User stories

1. As a filer, I would like to view my institution data as CFPB understands it.
1. As a filer, I would like clear instruction on how to change read-only institution fields.
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


## SBL filing app

### SBL Home

#### User stories

1. As a filer, I can see a list of active institutions I need to file for this filing season.
1. As a filer, I can see a list of inactive institutions I have filed for in the past.
1. As a filer, I can see the current filing status for each of my institutions.
1. As a filer, I can easily tell when a filing season starts and ends.
1. As a filer, I can select an institution to start the filing process.
1. As a filer, I can select an institution to view past filings.
1. As a filer, I can view the institution data snapshot for a past filing season.
1. As a filer, I can select an institution to restart a filing I've previously completed.

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


### Validation review

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


### Finalize filing

#### User stories

1. As a filer, I want to submit ("sign" in HMDA-speak) a given submission as my SBL
   filing for a given filing season.
1. As a filer, I want an receipt-like identifier for my completed filing.
1. As a filer, I would like an email-based confirmation that my filing is complete.


## Post-filing data analysis

### User stores
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
