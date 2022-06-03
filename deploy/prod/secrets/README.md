# Secrets

TODO: find a way to encrypt these secrets at rest on dev machine.

### exporter-password

The basic auth password required to access node-exporter endpoints. See ansible-vault.

### grafana-admin-user, grafana-admin-password

The credentials used to create the Grafana admin user. See 1password.

### grafana-config.ini

The grafana.ini configuration file.

### invidious-database-url, invidious-database-password

The credentials for the invidious database. See ansible-vault.

### gitea-admin-username, gitea-admin-email, gitea-admin-password

The credentials for the Gitea admin user. See 1password.

### gitea-config.ini

The full Gitea app.ini file.

### drone-database-url, drone-rpc-secret, drone-gitea-client-id, drone-gitea-client-secret

Drone configuration. See ansible-vault for database credentials.
