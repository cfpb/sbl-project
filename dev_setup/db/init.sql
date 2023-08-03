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

CREATE TABLE financial_institutions (
	lei varchar NOT NULL,
	"name" varchar NULL,
	event_time timestamp NULL DEFAULT now(),
	CONSTRAINT financial_institutions_pkey PRIMARY KEY (lei)
);
CREATE UNIQUE INDEX ix_financial_institutions_lei ON financial_institutions USING btree (lei);
CREATE INDEX ix_financial_institutions_name ON financial_institutions USING btree (name);
ALTER TABLE financial_institutions OWNER TO fi;

CREATE TABLE financial_institution_domains (
	"domain" varchar NOT NULL,
	lei varchar NOT NULL,
	event_time timestamp NULL DEFAULT now(),
	CONSTRAINT financial_institution_domains_pkey PRIMARY KEY (domain, lei)
);
CREATE INDEX ix_financial_institution_domains_domain ON financial_institution_domains USING btree (domain);
CREATE INDEX ix_financial_institution_domains_lei ON financial_institution_domains USING btree (lei);

ALTER TABLE financial_institution_domains ADD CONSTRAINT financial_institution_domains_lei_fkey FOREIGN KEY (lei) REFERENCES financial_institutions(lei);
ALTER TABLE financial_institution_domains OWNER TO fi;

INSERT INTO financial_institutions (lei,"name") VALUES
	 ('TEST1LEI','Test 1'),
	 ('TEST2LEI','Test 2'),
	 ('TEST3LEI','Test 3');

INSERT INTO financial_institution_domains ("domain",lei) VALUES
	 ('test1.local','TEST1LEI'),
	 ('test2.local','TEST2LEI'),
	 ('test3.local','TEST3LEI');
