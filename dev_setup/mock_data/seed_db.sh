#!/bin/bash

psql postgresql://fi:fi@localhost:5432/financial_institutions -a -f address_state.sql
psql postgresql://fi:fi@localhost:5432/financial_institutions -a -f federal_regulator.sql
psql postgresql://fi:fi@localhost:5432/financial_institutions -a -f hmda_institution_type.sql
psql postgresql://fi:fi@localhost:5432/financial_institutions -a -f sbl_institution_type.sql