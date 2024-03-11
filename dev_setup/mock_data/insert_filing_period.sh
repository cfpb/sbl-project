export pg_container=$(docker ps --format '{{.Names}}' | grep pg)
echo $pg_container
docker cp ./filing_period_insert.sql $pg_container:/filing_period_insert.sql
docker exec $pg_container psql -U filing_user filing -f /filing_period_insert.sql