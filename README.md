# SBL Project

Project management for the SBL (Small Business Lending) project.

## Issue tracking

The source code for SBL's software is spread across multiple
GitHub repositories. We use
[GitHub Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects)
to manage the work across these repos.

Our project is up at:
- [SBL Project](https://github.com/orgs/cfpb/projects/21)

## Sprints

We work in two week sprints. The current sprint is viewable on the
[Sprint](https://github.com/orgs/cfpb/projects/21/views/2) tab of
[SBL Project](https://github.com/orgs/cfpb/projects/21).

## User stories

We use [User Stories](https://www.atlassian.com/agile/project-management/user-stories)
to define the features we will implement for SBL.
These user stories are represented as GitHub issues, labeled as
[**story**](https://github.com/cfpb/sbl-project/issues?q=is%3Aopen+is%3Aissue+label%3Astory). During our Sprint Planning meetings, we 
select User Stories for the upcoming Sprint that meet our
**definition of ready**.

### Definition of ready

In order for a user story to be considered "ready", and brought into
a sprint, the team must agree that it meets the following criteria.

1. All dependencies have been identified.
1. UX requirements are complete, with UX resources linked to the user story.
1. Acceptance criteria is complete.
1. The story can be accomplished in a single sprint.

### Definition of done

In order for a user story to be consider "done", and the issue closed,
it must meet the following criteria.

1. All acceptance criteria have been met.
1. All UX requirements have been met.
1. There are no known defects.
1. Unit test coverage > 85%.
1. Is deployed to the development environment.
1. Documentation has been updated (if needed).

## Epics

We use [**Epics**](https://www.atlassian.com/agile/project-management/epics)
to represent larger bodies of work that span multiple user stories across
multiple sprints. These epics are represented as GitHub issues, labeled as
[**epic**](https://github.com/cfpb/sbl-project/issues?q=is%3Aopen+is%3Aissue+epic). We use these issues for the initial research and
discussion before we take on the underlying user stories.

### UX and design

We also do most of our UX and design on **epic** issues. This work includes
producing wireframes and mockups, gathering background information, and
user research. We don't start work on any user stories until this upfront
work has been completed.


## Milestones

We use [**Milestones**](https://github.com/cfpb/sbl-project/milestones)
as a means of grouping our **epic** issues. We use these for grouping
our work into larger initiatives. This is especially useful in our project
[Roadmap](https://github.com/orgs/cfpb/projects/21/views/3) view.
view


## Development tasks

We use GitHub issues to track our development tasks as well. These
issues live in separate repos alongside their corresponding code.
These issues will frequently be associated with [story](#user-stories) 
issues, but can also be indepedent tasks, such as bug fixes. These
issues do not follow any consistent labeling scheme as each repo
has different needs.

### Development repositories

- [design-system-react](https://github.com/cfpb/design-system-react) - React implementation of [CFPB's Design System](https://cfpb.github.io/design-system/)
- [regtech-api-commons](https://github.com/cfpb/regtech-api-commons) - Shared FastAPI components for CFPB's RegTech services
- [regtech-data-validator](https://github.com/cfpb/regtech-data-validator) - Data validation tool for CFPB's RegTech services
- [regtech-deployments](https://github.com/cfpb/regtech-deployments) - Shared Kubernetes resources for CFPB's RegTech services
- [regtech-mail-api](https://github.com/cfpb/regtech-mail-api) - REST API for sending emails
- [regtech-user-fi-management](https://github.com/cfpb/regtech-user-fi-management) - REST API for user and institution data in CFPB's RegTech systems
- [sbl-filing-api](https://github.com/cfpb/sbl-filing-api) - REST API for filing SBL submissions
- [sbl-frontend](https://github.com/cfpb/sbl-frontend/) - Web frontend for the CFPB's SBL filing system

### Development setup

For local development, we use docker compose to run the supporting services. Please refer to [LOCAL_DEV_COMPOSE](./LOCAL_DEV_COMPOSE.md) for details.

## Open source licensing info
1. [TERMS](TERMS.md)
2. [LICENSE](LICENSE)
3. [CFPB Source Code Policy](https://github.com/cfpb/source-code-policy/)
