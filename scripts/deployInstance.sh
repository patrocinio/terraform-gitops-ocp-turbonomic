#!/usr/bin/env bash

DEST_DIR="$1"
mkdir -p "${DEST_DIR}"

SANAME="$2"
PROBES="$3"
STOR_NAME="$4"

cat > "${DEST_DIR}/xl-release.yaml" << EOL
apiVersion: charts.helm.k8s.io/v1
kind: Xl
metadata:
  name: xl-release
  annotations:
    argocd.argoproj.io/sync-wave: "2"
spec:
  global:
    repository: turbonomic
    tag: 8.4.4
    storageClassName: ${STOR_NAME}
    serviceAccountName: ${SANAME}
  ui:
    enabled: true
  market:
    image:
      pullPolicy: IfNotPresent
      repository: docker.io/turbonomic
      tag: 8.4.4
    serviceAccountName: ${SANAME}    
  nginx:
    nginxIsPrimaryIngress: false
    httpsRedirect: false
  nginxingress:
    enabled: true
  openshiftingress:
    enabled: true

EOL


    if [[ "${PROBES}" =~ kubeturbo ]]; then
      echo "adding kubeturbo probe..."
      cat >> ${DEST_DIR}/xl-release.yaml << EOL

  kubeturbo:
    enabled: true
EOL
    fi

    if [[ "${PROBES}" =~ instana ]]; then
      echo "adding instana probe..."
      cat >> ${DEST_DIR}/xl-release.yaml << EOL
  
  instana:
    enabled: true
EOL
    fi

    if [[ "${PROBES}" =~ aws ]]; then
      echo "adding aws probe..."
      cat >> ${DEST_DIR}/xl-release.yaml << EOL
  
  aws:
    enabled: true
EOL
    fi

    if [[ "${PROBES}" =~ azure ]]; then
      echo "adding azure probe..."
      cat >> ${DEST_DIR}/xl-release.yaml << EOL
  
  azure:
    enabled: true
EOL
    fi

    if [[ "${PROBES}" =~ prometheus ]]; then
      echo "adding prometheus probe..."
      cat >> ${DEST_DIR}/xl-release.yaml << EOL
  
  prometheus:
    enabled: true
EOL
    fi

    if [[ "${PROBES}" =~ servicenow ]]; then
      echo "adding servicenow probe..."
      cat >> ${DEST_DIR}/xl-release.yaml << EOL
  
  servicenow:
    enabled: true
EOL
    fi

    if [[ "${PROBES}" =~ tomcat ]]; then
      echo "adding tomcat probe..."
      cat >> ${DEST_DIR}/xl-release.yaml << EOL
  
  tomcat:
    enabled: true
EOL
    fi

    if [[ "${PROBES}" =~ jvm ]]; then
      echo "adding jvm probe..."
      cat >> ${DEST_DIR}/xl-release.yaml << EOL
  
  jvm:
    enabled: true
EOL
    fi

    if [[ "${PROBES}" =~ websphere ]]; then
      echo "adding websphere probe..."
      cat >> ${DEST_DIR}/xl-release.yaml << EOL
  
  websphere:
    enabled: true
EOL
    fi

    if [[ "${PROBES}" =~ weblogic ]]; then
      echo "adding weblogic probe..."
      cat >> ${DEST_DIR}/xl-release.yaml << EOL
  
  weblogic:
    enabled: true
EOL
    fi

