-- Setup the PostgreSQL instance in the dev cluster.
-- TODO: automate the execution post-cluster start.
CREATE DATABASE invidious;
CREATE ROLE kemal LOGIN ENCRYPTED PASSWORD 'kemal';
GRANT ALL PRIVILEGES ON DATABASE invidious TO kemal;
CREATE DATABASE grafana;
CREATE DATABASE drone;
CREATE DATABASE gitea;
CREATE DATABASE synapse ENCODING UTF8 LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
