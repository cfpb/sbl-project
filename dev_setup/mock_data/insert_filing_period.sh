docker cp ./filing_period_insert.sql sbl-project-pg-1:/filing_period_insert.sql
docker exec sbl-project-pg-1 psql -U filing_user filing -f /filing_period_insert.sql