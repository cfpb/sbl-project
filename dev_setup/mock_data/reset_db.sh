#!/bin/bash

psql postgresql://fi:fi@localhost:5432/financial_institutions -a -f reset_tables.sql
