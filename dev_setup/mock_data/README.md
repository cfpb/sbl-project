## Seeding mock data


### Prerequisite
* Have the docker compose local setup running, according to [LOCAL_DEV_COMPOSE](../../LOCAL_DEV_COMPOSE.md)
  * Running `docker compose --profile backend up -d --remove-orphans --build` would be beneficial to build a new image if you've previously ran the local setup before
  * May also be beneficial to refresh the setup's data by issuing `docker compose --profile backend down -v` first
* Have `psql` cli installed: `brew install libpq`
  * you may also need to set the PATH to include the libpq directory: `export PATH=$PATH:$HOME/homebrew/opt/libpq/bin`
* Have `jq` cli installed: `brew install jq`
  * you may also need to set the PATH to include the homebrew directory: `export PATH=$PATH:$HOME/homebrew/bin`

### Create mock institutions
With the script below, institutions will be created; you may reference the information shown in the json files [sbl-test-data](https://github.com/cfpb/sbl-test-data/tree/main/financial_institutions)
```bash
./create_institutions.sh
```
You may use one of the json files as a template and follow the `regtech-user-fi-management` repo's README's [functionalities](https://github.com/cfpb/regtech-user-fi-management/blob/main/README.md#functionalities) section to create your own institution. To create 1 institution from command line, you can follow below:

```bash
export RT_ACCESS_TOKEN=$(curl 'localhost:8880/realms/regtech/protocol/openid-connect/token' \
-X POST \
-H 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'username=admin1' \
--data-urlencode 'password=admin' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'client_id=regtech-client' | jq -r '.access_token')

file=path_to_your_institution_json_file

curl localhost:8881/v1/institutions/ -X POST \
  -H "Authorization: Bearer ${RT_ACCESS_TOKEN}" \
  -H 'Content-Type: application/json' \
  --data-binary "@$file" | jq -r '.'
```
You will need to replace `path_to_your_institution_json_file` to the json file you've created, for example `file=test_bank_123.json`

To associate a domain to the institution, you can follow below:
```bash
export RT_ACCESS_TOKEN=$(curl 'localhost:8880/realms/regtech/protocol/openid-connect/token' \
-X POST \
-H 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'username=admin1' \
--data-urlencode 'password=admin' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'client_id=regtech-client' | jq -r '.access_token')

lei=your_mock_institution_lei
domain=mock.domain

curl "localhost:8881/v1/institutions/$lei/domains" -X POST \
  -H "Authorization: Bearer ${RT_ACCESS_TOKEN}" \
  -H 'Content-Type: application/json' \
  -d "[{\"domain\": \"$domain\"}]" | jq -r '.'
```
Change `lei`, and `domain` to the appropriate values

__NOTE__: These instructions are scripts works with the user_fi app through the docker compose setup of port `8881`, if you run the app locally instead via the instructions through user_fi's [README](https://github.com/cfpb/regtech-user-fi-management/blob/main/README.md), please change the port numbers `8881` to `8888`

### Filing Period insert
To get an initial Filing Period into the filing database (which Filings, Submissions, and Contact Info are all children of), run the following commands after running docker compose up (see  [LOCAL_DEV_COMPOSE](./LOCAL_DEV_COMPOSE.md)):
  1. cd into dev_setup/mock_data
  2. Run `sh insert_filing_period.sh`

This script uses docker commands to insert a filing period in the database, in case you don't have postgres/psql installed locally.  If you do, you can simply run:
  1. `psql -U filing_user -h localhost filing -f filing_period_insert.sql`
  2. Enter password of filing_user when prompted