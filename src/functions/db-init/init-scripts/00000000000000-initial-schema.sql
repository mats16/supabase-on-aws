-- Set up realtime
create schema if not exists realtime;
-- defaults to empty publication
create publication supabase_realtime;

-- Supabase super admin (we immediately make this postgres a member of supabase_admin so we can set it up, need to revoke later)
create user supabase_admin role postgres;
-- Cannot grant superuser since user postgres is not a superuser in Amazon RDS/Aurora
-- alter user supabase_admin with superuser createdb createrole replication bypassrls; 
alter user supabase_admin with createdb createrole bypassrls;

-- Supabase replication user (again, cannot grant replication in Amazon RDS/Aurora)
-- create user supabase_replication_admin with login replication;
create user supabase_replication_admin with login;

 -- Added for Amazon RDS/Aurora
GRANT rds_superuser TO supabase_admin;
GRANT rds_replication TO supabase_admin;
GRANT rds_replication TO postgres;
GRANT rds_replication TO supabase_replication_admin;

-- Supabase read-only user
create role supabase_read_only_user with login bypassrls;
grant pg_read_all_data to supabase_read_only_user;

-- Extension namespacing
create schema if not exists extensions;
create extension if not exists "uuid-ossp"      with schema extensions;
create extension if not exists pgcrypto         with schema extensions;
-- Have to manually install pgjwt in Amazon RDS/Aurora (see other init files)
-- create extension if not exists pgjwt            with schema extensions;

-- Set up auth roles for the developer
create role anon                nologin noinherit;
create role authenticated       nologin noinherit; -- "logged in" user: web_user, app_user, etc
create role service_role        nologin noinherit bypassrls; -- allow developers to create JWT's that bypass their policies

create user authenticator noinherit;
grant anon              to authenticator;
grant authenticated     to authenticator;
grant service_role      to authenticator;
grant supabase_admin    to authenticator;

grant usage                     on schema public to postgres, anon, authenticated, service_role;
alter default privileges in schema public grant all on tables to postgres, anon, authenticated, service_role;
alter default privileges in schema public grant all on functions to postgres, anon, authenticated, service_role;
alter default privileges in schema public grant all on sequences to postgres, anon, authenticated, service_role;

-- Allow Extensions to be used in the API
grant usage                     on schema extensions to postgres, anon, authenticated, service_role;

-- Set up namespacing
alter user supabase_admin SET search_path TO public, extensions; -- don't include the "auth" schema

-- These are required so that the users receive grants whenever "supabase_admin" creates tables/function
alter default privileges for user supabase_admin in schema public grant all
    on sequences to postgres, anon, authenticated, service_role;
alter default privileges for user supabase_admin in schema public grant all
    on tables to postgres, anon, authenticated, service_role;
alter default privileges for user supabase_admin in schema public grant all
    on functions to postgres, anon, authenticated, service_role;

-- Set short statement/query timeouts for API roles
alter role anon set statement_timeout = '3s';
alter role authenticated set statement_timeout = '8s';

-- migrate:down
