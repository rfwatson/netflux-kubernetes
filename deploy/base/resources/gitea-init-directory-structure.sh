#!/usr/bin/env bash
set -euo pipefail

echo "Initializing directory structure..."

mkdir -p /data/git/.ssh
chmod -R 700 /data/git/.ssh

echo "Creating GITEA_CUSTOM=$GITEA_CUSTOM ..."
mkdir -p "$GITEA_CUSTOM"
chmod 0500 "$GITEA_CUSTOM"

echo "Creating GITEA_TEMP=$GITEA_TEMP ..."
mkdir -p "$GITEA_TEMP"
chmod ug+rwx "$GITEA_TEMP"

echo "Done"
