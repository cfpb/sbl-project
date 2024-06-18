#!/bin/bash

export RT_ACCESS_TOKEN=$(curl 'localhost:8880/realms/regtech/protocol/openid-connect/token' \
-X POST \
-H 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'username=admin1' \
--data-urlencode 'password=admin' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'client_id=regtech-client' | jq -r '.access_token')

curl localhost:8881/v1/admin/me -H "Authorization: Bearer ${RT_ACCESS_TOKEN}" | jq -r '.'

inst_json_files=( $(curl -v https://api.github.com/repos/cfpb/sbl-test-data/contents/financial_institutions | jq -r '.[].download_url') )

for file in "${inst_json_files[@]}"
do
  json=$(curl $file | jq '.')
  lei=$(echo $json | jq -r '.lei')
  domain=$(echo $lei | tr '[:upper:]' '[:lower:]').local
  curl localhost:8881/v1/institutions/ -X POST \
      -H "Authorization: Bearer ${RT_ACCESS_TOKEN}" \
      -H 'Content-Type: application/json' \
      -d "$json" | jq -r '.'
  curl "localhost:8881/v1/institutions/$lei/domains" -X POST \
      -H "Authorization: Bearer ${RT_ACCESS_TOKEN}" \
      -H 'Content-Type: application/json' \
      -d "[{\"domain\": \"$domain\"}]" | jq -r '.'
done