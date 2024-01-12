CREATE DATABASE keycloak;
CREATE USER keycloak WITH PASSWORD 'keycloak';
GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;

CREATE DATABASE financial_institutions;
CREATE USER fi WITH PASSWORD 'fi';
GRANT ALL PRIVILEGES ON DATABASE financial_institutions TO fi;

CREATE USER filing_user WITH PASSWORD 'filing_user';
CREATE DATABASE filing OWNER filing_user;

\c keycloak
GRANT ALL ON SCHEMA public TO keycloak;

\c financial_institutions
GRANT ALL ON SCHEMA public TO fi;

\c filing
CREATE SCHEMA filing;
ALTER SCHEMA filing OWNER TO filing_user;
ALTER ROLE filing_user IN DATABASE filing SET search_path TO filing;
