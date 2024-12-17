#!/bin/bash
# this is used because keycloak's image does not have curl or wget commands
exec 3<>/dev/tcp/localhost/9000 || { echo "Connection Failed"; exit 1; }

echo -e "GET /health/ready HTTP/1.1\r\nHost: localhost\r\n\r\n" >&3

response=$(head -n 1 <&3)

echo "Response: $response"

exec 3<&-
exec 3>&-