#!/bin/bash

# parameter 1: project name
# parameter 2: oc
# parameter 3: name of build template
export OC_DEPLOYER_TOKEN=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJiY2RsdGNlIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRlcGxveWVyLXRva2VuLW1jN2RrIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImRlcGxveWVyIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiYjNmMjk0MGEtY2FjYS0xMWU3LTliMmEtMDJkMjQxZDFlMzk5Iiwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50OmJjZGx0Y2U6ZGVwbG95ZXIifQ.AQJbL--ZxxWKDX1uyOTFwQ7y8ZDcK2v64Lkv3DSCdV5ujqAEwATGs_lbTPxwoS0yQ_NsjVRYd1G80aMjL5CGTrawSvyMFPaNdiaKt1ACv7Nv_aUkWgWUdZpTEsWmglQ__SAqZXdixWt-lFR7wUW6FRprAHd6m5KFP-3vQM6S1QBdH6t_--XsI7fhbXZPBBRmG93ZhaARv1B9CIULJkCOcCqLt0M9dFhtGs3fm8QRDYjN4B9CpEOeEi54RZw_uo0LhRqAgLm1Kgf9VZ3QtqfwMAfj5MH-VpglcGiPHFmIksrD6fJXUVoO9WDCnLwDeG8V24AbNUYvIvE_5a8r4aIdKQ

PROJECT_NAME=$1
OC=$2
TEMPLATE_NAME=$3

if [ "$#" -ne 3 ]; then
  echo MISSING PARAMETERS
  echo "$#" "parameters passed, but 3 are expected ($@)"
  echo "  OpenShift project name"
  echo "  oc"
  echo "  name of OpenShift template"
  exit -1
fi


$OC login https://console.inet-abnahme.ose.db.de --token=$OC_DEPLOYER_TOKEN
$OC project $PROJECT_NAME

APPLICATION_NAME=$($OC describe template $TEMPLATE_NAME | grep -izoP "APPLICATION_NAME.*\n.*\n.*\n.*\n.*Value:[ \t]*\K[-\.-\.0-9a-z]*" | tr -d "\0")
BC_NAME=$($OC describe template $TEMPLATE_NAME | grep -izoP "BuildConfig[ \t]*\K.*" | tr -d "\0")
IMAGE_STREAM_NAME=$($OC describe template $TEMPLATE_NAME | grep -izoP "ImageStream[ \t]*\K.*" | tr -d "\0")

if [ -z $APPLICATION_NAME ]; then
  echo "no application found in template "$TEMPLATE_NAME
  exit 0
else
  echo "APPLICATION_NAME="$APPLICATION_NAME
fi

if [ $BC_NAME ] && [ $IMAGE_STREAM_NAME ]; then
  echo "  >> image stream name="$IMAGE_STREAM_NAME
  echo "  >> build configuration name="$BC_NAME
  
  BC=$BC_NAME
  if [[ $BC_NAME =~ "APPLICATION_NAME" ]]; then
    BC=$APPLICATION_NAME
  fi
  
  echo "  +++ delete build configuration: "$BC
  $OC delete bc $BC

  IS=$IMAGE_STREAM_NAME
  if [[ $IMAGE_STREAM_NAME =~ "APPLICATION_NAME" ]]; then
    IS=$APPLICATION_NAME
  fi

  echo "  +++ delete image stream: "$IS
  $OC delete is $IS

  # now create a new build configuration and build the image stream
  echo "  +++ create the build config and the image stream"
  $OC new-app --template=$TEMPLATE_NAME
fi

