-- Setup the PostgreSQL instance in the dev cluster.
-- TODO: automate the execution post-cluster start.
CREATE DATABASE invidious;
CREATE ROLE kemal LOGIN ENCRYPTED PASSWORD 'testme';
GRANT ALL PRIVILEGES ON DATABASE invidious TO kemal;
CREATE DATABASE grafana;
CREATE DATABASE drone;
CREATE DATABASE gitea;
