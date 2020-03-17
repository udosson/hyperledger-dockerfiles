#!/bin/bash

export OC_DEPLOYER_TOKEN=YjHsjTzvN7rcDUEI2M6myR4T4tITWMyypQFr6dVVO6w
PROJECT_NAME=$1
OC=$2
FILENAME=$3

if [ "$#" -ne 3 ]; then
  echo MISSING PARAMETERS
  echo "$#" "parameters passed, but 3 are expected ($@)"
  echo "  OpenShift project name"
  echo "  oc"
  echo "  filename of OpenShift template"
  exit -1
fi


TEMPLATE_NAME=$(find -samefile "$FILENAME" -print | xargs grep -izoP "kind: template.*\n*metadata.*\n*.*name: \K[-\.-\.0-9a-z]*" | tr -d "\0")

if [ -z $TEMPLATE_NAME ]; then
  echo "no template name found in file $FILENAME"
  exit 0
fi

echo "Using template name: "$TEMPLATE_NAME


# $OC login https://console.wien.dbcs.db.de:443 --token=$OC_DEPLOYER_TOKEN --insecure-skip-tls-verify

$OC login https://console.wien.dbcs.db.de:443 --token=$OC_DEPLOYER_TOKEN
$OC project $PROJECT_NAME

TEMPLATE_FOUND=$($OC get template $TEMPLATE_NAME -o name)

if [ $TEMPLATE_FOUND ]; then
  echo "template $TEMPLATE_NAME found on OpenShift project $PROJECT_NAME"
  $OC delete $TEMPLATE_FOUND
fi

$OC create -f $FILENAME
