# Using [docker-compose.yml](./docker-compose.yml) for local RegTech development

As with most local development, some support services need to be running to support the app being developed. These services can be started by using the [docker-compose.yml](./docker-compose.yml) file in this repo.

---
## Pre-requesite
- [Docker](https://docs.docker.com/get-docker/) engine version 1.13.0+ with docker compose version 3.0+ support needs to be installed to run all the containerized support services.
- Optional Github repository:
  - Additional RegTech developed modules may need to be added to support local development:
    - [user-fi-management](https://github.com/cfpb/regtech-user-fi-management) may be needed for front end development, it is used for user management, and institutions api.
    - [sbl-filing-api](https://github.com/cfpb/sbl-filing-api) may be needed for front end development, it is used for filing SBL submissions.
    - [regtech-mail-api](https://github.com/cfpb/regtech-mail-api) may be needed to test the frontend sending mail to SBL Help.
  - If additional repository modules are needed as support services, the following folder structure should be followed, so [docker-compose.yml](./docker-compose.yml) can find and build the module with the correct relative path:
    ```
    code-root
    ├── regtech-mail-api
    ├── regtech-user-fi-management
    ├── sbl-filing-api
    └── sbl-project (current repository)
    ```

---
## Running the support services
The [docker-compose.yml](./docker-compose.yml) currently contains 7 support services - 4 open source third party services, and 3 RegTech developed services:
- [PostgreSQL](https://www.postgresql.org/) as the database storage
- [Keycloak](https://www.keycloak.org/) for authentication and authorization
- [Locust](https://locust.io/) for load balance testing of the filing-api
- [user-fi-management](https://github.com/cfpb/regtech-user-fi-management) for user management, and institutions api.
- [sbl-filing-api](https://github.com/cfpb/sbl-filing-api) for filing SBL submissions
- [mail-api](https://github.com/cfpb/regtech-mail-api) for sending mail via SMTP to Mailpit or through AWS SES
- [mailpit](https://mailpit.axllent.org/) "dead-end" SMTP server for testing the mail-api

The [docker-compose.yml](./docker-compose.yml) is broken into profiles:
- backend - Runs Postgres, Keycloak, user-fi-management, sbl-filing-api, mail-api and mailpit
- locust - Runs Postgres, Keycloak, Locust, and sbl-filing-api

> **NOTE** When running `docker-compose`, you now have the option to use released images by removing the `--build` option in the command

> If you plan on running compose with the released images, you **MUST** run the `pull_images` script linked below. This script will pull and properly tag the images that docker-compose is expecting. The script will run `docker login` for the CFPB Github Container Registry.

[Pull Images Script](./dev_setup/pull_images)


Only run development needed services. For front end development, the 6 backend services are likely to be needed; if development is done on [user-fi-management](https://github.com/cfpb/regtech-user-fi-management), [sbl-filing-api](https://github.com/cfpb/sbl-filing-api), or [mail-api](https://github.com/cfpb/regtech-mail-api) then only `PostgreSQL` and `Keycloak` are needed.
- To run all services, simply issue command
  ```bash
  docker compose --profile '*' up -d --remove-orphans --build
  ```
  This will launch every service defined in the [docker-compose.yml](./docker-compose.yml)
- To run just the backend services (no Locust)
  ```bash
  docker compose --profile backend up -d --remove-orphans --build
  ```
- To run Locust load testing
  ```bash
  docker compose --profile locust up -d --remove-orphans --build
  ```
- If only some of the services are needed, check what services are availabe in [docker-compose.yml](./docker-compose.yml), then run the command specifying the services. e.g. to start up `PostgreSQL` and `Keycloak`, issue the command
  ```bash
  docker compose up -d pg keycloak
  ```
  - in [docker-compose.yml](./docker-compose.yml), `PostgreSQL` service is named `pg`, and `Keycloak` is named `keycloak`
  - the `-d` flag in the command is to run the containers in detached mode, so your development terminal is not inundated with logs
  - the `--remove-orphans` flag removes containers not defined in the compose file.  Good way to clean up dangling containers.
  - the `--build` flag ensures the latest image is built for the supporting repos and not using Docker cached images
- To stop the containers, simply issue the command
  ```bash
  docker compose --profile <name of profile loaded> stop
  ```
- If you would like to completely destroy the containers and the volumes, so they can be recreated with fresh data:
  ```bash
  docker compose --profile <name of profile loaded> down -v
  ```
  - the `-v` flag removes any volumes created by docker compose, this makes sure the services that attaches a volume, like `PostgreSQL`, gets the data wiped as well.
- If a RegTech module needs to have the image rebuilt because there was an update to the codebase, we can use the `docker compose build` command with the service name, e.g.
  ```bash
  docker compose build user-fi
  ```
- Exposed ports for each service is specified in [docker-compose.yml](./docker-compose.yml), for reference here:
  - PostgreSQL(`pg`) can be accessed from the host machine at port `5432`
  - Keycloak (`keycloak`) is accessible at `8880`
  - user-fi-management (`user-fi`) is accessible at `8881`
  - sbl-filing (`filing`) is accessible at `8882`
  - regtech-mail-api (`mail-api`) is accessible at `8765`
  - mailpit (`mailpit`) is accessible at `1025` for SMTP, `8025` for the web interface (http://localhost:8025/)
  - locust (`locust`) is accessible at `8089` for the web interface (http://localhost:8089/)

---

## Mock data population
With [user-fi-management](https://github.com/cfpb/regtech-user-fi-management), pre-populating the database with some mock institutions can aid front-end development. We've created some instructions, and some mock institution json files in [mock_data](./dev_setup/mock_data/) directory to help with that process.
