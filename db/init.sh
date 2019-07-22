#!/usr/bin/env bash

echo "Creating Semarchy extensions schema"
psql -d postgres --command "CREATE SCHEMA extensions;"
psql -d postgres --command "GRANT USAGE ON SCHEMA extensions TO PUBLIC;"
psql -d postgres --command "ALTER DEFAULT PRIVILEGES IN SCHEMA extensions GRANT EXECUTE ON FUNCTIONS TO PUBLIC;"
psql -d postgres --command "ALTER DATABASE postgres SET SEARCH_PATH TO \"\$user\", public, extensions;"
psql -d postgres --command "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\"     with schema extensions;"
psql -d postgres --command "CREATE EXTENSION IF NOT EXISTS \"fuzzystrmatch\" with schema extensions;"


echo "Creating Semarchy repository schema"

psql -d postgres --command "CREATE USER semarchy_repository WITH PASSWORD 'semarchy_repository';"
psql -d postgres --command "CREATE SCHEMA semarchy_repository AUTHORIZATION semarchy_repository;"
psql -d postgres --command "GRANT USAGE ON SCHEMA semarchy_repository TO public;"

echo "Creating Semarchy data schemas"

psql -d postgres --command "CREATE USER semarchy_customer_b2c_mdm WITH PASSWORD 'semarchy_customer_b2c_mdm';"
psql -d postgres --command "CREATE SCHEMA semarchy_customer_b2c_mdm AUTHORIZATION semarchy_customer_b2c_mdm;"
psql -d postgres --command "GRANT USAGE ON SCHEMA semarchy_customer_b2c_mdm TO public;"

psql -d postgres --command "CREATE USER semarchy_b2b_tutorial WITH PASSWORD 'semarchy_b2b_tutorial';"
psql -d postgres --command "CREATE SCHEMA semarchy_b2b_tutorial AUTHORIZATION semarchy_b2b_tutorial;"
psql -d postgres --command "GRANT USAGE ON SCHEMA semarchy_b2b_tutorial TO public;"

psql -d postgres --command "CREATE USER semarchy_product_retail_mdm WITH PASSWORD 'semarchy_product_retail_mdm';"
psql -d postgres --command "CREATE SCHEMA semarchy_product_retail_mdm AUTHORIZATION semarchy_product_retail_mdm;"
psql -d postgres --command "GRANT USAGE ON SCHEMA semarchy_product_retail_mdm TO public;"

psql -d postgres --command "CREATE USER semarchy_dloc2 WITH PASSWORD 'semarchy_dloc2';"
psql -d postgres --command "CREATE SCHEMA semarchy_dloc2 AUTHORIZATION semarchy_dloc2;"
psql -d postgres --command "GRANT USAGE ON SCHEMA semarchy_dloc2 TO public;"