#!/bin/bash
# ./install.sh <VENDOR> # Vendor will be used to generate the namespace and chart name.

PROJECT="profile-manager" # Name of the application 
NAMESPACE=$1
if [[ ${DOPPLER_SECRET} && ${NAMESPACE} ]]; then
    CONFIG="/tmp/$PROJECT-config.yaml"
    ENV="/tmp/env"
    PACKAGE_NAME=$NAMESPACE
    rm -rf $CONFIG
    rm -rf $ENV

    # Download the application config from doppler and substititue any values
    doppler secrets download --project $PROJECT --token $DOPPLER_SECRET --no-file --format env > /tmp/env
    export $(cat /tmp/env | xargs)
    envsubst < values.yaml > $CONFIG
    
    helm dependency update
    helm package . 
    PACKAGE_NAME=$(ls -t | grep tgz | head -1)
    kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -
    helm upgrade --install $PACKAGE_NAME --namespace $NAMESPACE  $PACKAGE_NAME -f $CONFIG
else
  echo "PLEASE MAKE SURE THAT THE DOPPLER_SECRET, ENV VAR IS SET. Do NOT FORGET TO PASS  NAMESPACE TO THE SCRIPT"
fi
