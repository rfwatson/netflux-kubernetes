#!/usr/bin/env bash
set -euo pipefail

echo "Running Gitea migrations..."

gitea migrate

echo "Setting up Gitea admin user..."

# https://gitea.com/gitea/helm-chart/src/commit/80032dfc5c34950edea384e0227f7ab7c994f4ef/templates/gitea/init.yaml#L54
function configure_admin_user() {
  local account_id=$(gitea admin user list --admin | grep -e "\s\+${GITEA_ADMIN_USERNAME}\s\+" | awk -F " " "{printf \$1}")
  if [[ -z "${account_id}" ]]; then
    echo "No admin user '${GITEA_ADMIN_USERNAME}' found. Creating now..."
    gitea admin user create --admin --username "${GITEA_ADMIN_USERNAME}" --password "${GITEA_ADMIN_PASSWORD}" --email "${GITEA_ADMIN_EMAIL}" --must-change-password=false
    echo '...created.'
  else
    echo "Admin account '${GITEA_ADMIN_USERNAME}' already exists. Running update to sync password..."
    gitea admin user change-password --username "${GITEA_ADMIN_USERNAME}" --password "${GITEA_ADMIN_PASSWORD}"
    echo '...password sync done.'
  fi
}

configure_admin_user

echo "Done"
