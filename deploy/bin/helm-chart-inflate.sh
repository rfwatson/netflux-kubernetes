#!/usr/bin/env bash
#
# Usage:
#
# helm-chart-inflate.sh prometheus prometheus-community/prometheus
set -euo pipefail
IFS=$'\n\t'

name="$1"
chart="$2"
base="$3"
namespace="$4"

mkdir -p "$base/inflated"
rm -rf "$base/inflated/$name"

valuesfile="$base/values/$name.yaml"
if [ -f $valuesfile ]; then
  echo "Inflating template with values file: $valuesfile ..."
  helm template $name $chart --output-dir $base/inflated --namespace $namespace -f $valuesfile 
else
  echo "Inflating template with default values ..."
  helm template $name $chart --output-dir $base/inflated --namespace $namespace
fi

echo "YAML entries for $base/kustomzation.yaml:"
find $base/inflated/$name -iname '*.yaml' | xargs realpath --relative-to $base | sed 's/^/- /'
