# Using [docker-compose.yml](./docker-compose.yml) for local RegTech development

As with most local development, some support services need to be running to support the app being developed. These services can be started by using the [docker-compose.yml](./docker-compose.yml) file in this repo.

---
## Pre-requesite
- [Docker](https://docs.docker.com/get-docker/) engine version 1.13.0+ with docker compose version 3.0+ support needs to be installed to run all the containerized support services.
- Optional Github repository:
  - Additional RegTech developed modules may need to be added to support local development:
    - [user-fi-management](https://github.com/cfpb/regtech-user-fi-management) may be needed for front end development, it is used for user management, and institutions api.
  - If additional repository modules are needed as support services, the following folder structure should be followed, so [docker-compose.yml](./docker-compose.yml) can find and build the module with the correct relative path:
    ```
    code-root
    ├── regtech-user-fi-management
    └── sbl-project (current repository)
    ```

---
## Running the support services
The [docker-compose.yml](./docker-compose.yml) currently contains 3 support services, 2 open source third party services, and 1 RegTech developed service:
- [PostgreSQL](https://www.postgresql.org/) as the database storage
- [Keycloak](https://www.keycloak.org/) for authentication and authorization
- [user-fi-management](https://github.com/cfpb/regtech-user-fi-management) for user management, and institutions api.

Only run development needed services. For front end development, all 3 services are likely to be needed; if development is done on [user-fi-management](https://github.com/cfpb/regtech-user-fi-management), then only `PostgreSQL` and `Keycloak` are needed.
- To run all services, simply issue command
  ```bash
  docker compose up -d
  ```
- If only some of the services are needed, check what services are availabe in [docker-compose.yml](./docker-compose.yml), then run the command specifying the services. e.g. to start up `PostgreSQL` and `Keycloak`, issue the command
  ```bash
  docker compose up -d pg keycloak
  ```
  - in [docker-compose.yml](./docker-compose.yml), `PostgreSQL` service is named `pg`, and `Keycloak` is named `keycloak`
  - the `-d` flag in the command is to run the containers in detached mode, so your development terminal is not inundated with logs
- To stop the containers, simply issue the command
  ```bash
  docker compose stop
  ```
- If you would like to completely destroy the containers and the volumes, so they can be recreated with fresh data:
  ```bash
  docker compose down -v
  ```
  - the `-v` flag removes any volumes created by docker compose, this makes sure the services that attaches a volume, like `PostgreSQL`, gets the data wiped as well.
- If a RegTech module needs to have the image rebuilt because there was an update to the codebase, we can use the `docker compose build` command with the service name, e.g.
  ```bash
  docker compose build user_fi
  ```
- Exposed ports for each service is specified in [docker-compose.yml](./docker-compose.yml), for reference here:
  - PostgreSQL(`pg`) can be accessed from the host machine at port `5432`
  - Keycloak (`keycloak`) is accessible at `8880`
  - user-fi-management (`user_fi`) is accessible at `8881`

---
## Mock data population
With [user-fi-management](https://github.com/cfpb/regtech-user-fi-management), pre-populating the database with some mock institutions can aid front-end development. We've created some instructions, and some mock institution json files in [mock_data](./dev_setup/mock_data/) directory to help with that process.