#!/bin/bash

auth_base='http://localhost:8880'
user_fi_base='http://localhost:8881'

export RT_ACCESS_TOKEN=$(curl "${auth_base}/realms/regtech/protocol/openid-connect/token" \
-X POST \
-H 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'username=admin1' \
--data-urlencode 'password=admin' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'client_id=regtech-client' | jq -r '.access_token')

curl $user_fi_base/v1/admin/me -H "Authorization: Bearer ${RT_ACCESS_TOKEN}" | jq -r '.'

inst_json_files=( 'test_bank_123.json' 'test_bank_456.json' 'test_sub_bank_456.json' )

for file in "${inst_json_files[@]}"
do
  lei=$(cat $file | jq -r '.lei')
  domain=$(echo $lei | tr '[:upper:]' '[:lower:]').local
  curl $user_fi_base/v1/institutions/ -X POST \
      -H "Authorization: Bearer ${RT_ACCESS_TOKEN}" \
      -H 'Content-Type: application/json' \
      --data-binary "@$file" | jq -r '.'
  curl $user_fi_base/v1/institutions/$lei/domains -X POST \
      -H "Authorization: Bearer ${RT_ACCESS_TOKEN}" \
      -H 'Content-Type: application/json' \
      -d "[{\"domain\": \"$domain\"},{\"domain\": \"cfpb.gov\"}]" | jq -r '.'
done