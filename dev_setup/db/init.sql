CREATE DATABASE keycloak;
CREATE USER keycloak WITH PASSWORD 'keycloak';
GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;

CREATE DATABASE financial_institutions;
CREATE USER fi WITH PASSWORD 'fi';
GRANT ALL PRIVILEGES ON DATABASE financial_institutions TO fi;

\c keycloak
GRANT ALL ON SCHEMA public TO keycloak;

\c financial_institutions
GRANT ALL ON SCHEMA public TO fi;
