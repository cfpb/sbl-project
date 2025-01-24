#!/bin/bash

: <<DESCRIPTION
Run this to pull and tag released LATEST api and frontend images BEFORE running
../docker-compose.yml.
This script will pull the image and tag according to what docker-compose is expecting.

When running docker-compose, you have the option to build local dependency images
or pull release images from Github Container Registry.

Using the GHCR images eliminates the need to clone all dependency repositories 
such as frontend and backend apis.

Refer to ../LOCAL_DEV_COMPOSE.md to learn how to run docker-compose with released
images vs local built images.

PREREQUISITE:
- docker daemon must be running before executing this script
- you must have access to the CFPB github container registry to pull images.
DESCRIPTION

# login to docker github registry 
docker login ghcr.io/cfpb

# pull and tag so that docker-compose finds the image locally
docker pull ghcr.io/cfpb/regtech/sbl/sbl-frontend:latest
docker tag ghcr.io/cfpb/regtech/sbl/sbl-frontend:latest sbl-project-sbl-frontend:latest

docker pull ghcr.io/cfpb/regtech/sbl/regtech-user-fi-management:latest
docker tag ghcr.io/cfpb/regtech/sbl/regtech-user-fi-management:latest sbl-project-user-fi:latest

docker pull ghcr.io/cfpb/regtech/sbl/sbl-filing-api:latest
docker tag ghcr.io/cfpb/regtech/sbl/sbl-filing-api:latest sbl-project-filing:latest

docker pull ghcr.io/cfpb/regtech/sbl/regtech-mail-api:latest
docker tag ghcr.io/cfpb/regtech/sbl/regtech-mail-api:latest sbl-project-mail-api:latest

docker pull ghcr.io/cfpb/regtech/sbl/regtech-cleanup-api:latest
docker tag ghcr.io/cfpb/regtech/sbl/regtech-cleanup-api:latest sbl-project-cleanup:latest
