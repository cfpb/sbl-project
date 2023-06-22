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
1. Institution list
    1. Show current filing season's filing status.
    1. Provides link to **Begin filing** if not started.
1. Previous filing seasons list.
    1. **Q:** Do we need to think about this year 1?
    

1. SBL single line validator

# Questions

1. Do we need to differentiate HMDA vs. SBL users at all?
    1. Can we leave all RegTech filing apps visible to all users, and they
       can voluntarily decide which they need to file for?
1. What are our filing statuses?
    - Not started - No submissions for the season.
    - In progress - One or more submissions, but not signed.
        - **Q:** How does _Accept FI data_
        - **Q:** Do we need to show submission-level status?
            - Failed upload
            - Uploaded
            - Validating
            - Failed formatting validations
            - Failed logic validations
            - Awaiting warning acceptance
            - Awaiting signature
            - Signed
    - Complete - Once a given submission has been signed.
