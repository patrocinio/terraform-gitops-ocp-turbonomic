#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname "$0"); pwd -P)
CHART_DIR=$(cd "${SCRIPT_DIR}/../charts"; pwd -P)

DEST_DIR="$1"

mkdir -p "${DEST_DIR}"
echo "adding xl chart..."
#cp "${CHART_DIR}/charts.helm.k8s.io_xls.yaml" "${DEST_DIR}/xl.yaml"
cat "${CHART_DIR}/charts.helm.k8s.io_xls.yaml" > "${DEST_DIR}/sc.yaml"
