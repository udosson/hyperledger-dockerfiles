#!/bin/bash

export OPEN_SHIFT_PROJECT=$1
export OC=$2
RECREATE=$3

#get the directory of this script
CURRENT_PATH=`dirname "$0"`

if [[ "$#" -ne 2 ]] && [[ "$#" -ne 3 ]]; then
  echo MISSING PARAMETERS
  echo "$#" "parameters passed, but 2 or 3 are expected ($@)"
  echo "  => please provide the OpenShift project name and 'oc' as parameters; optionally, provide YES to recreate all build configurations and image streams"
  exit -1
fi

# export OC_DEPLOYER_TOKEN=YjHsjTzvN7rcDUEI2M6myR4T4tITWMyypQFr6dVVO6w
# $OC login https://console.wien.dbcs.db.de:443 --token=$OC_DEPLOYER_TOKEN --insecure-skip-tls-verify
# $OC project $OPEN_SHIFT_PROJECT

#create templates on OpenShift
echo "+++ Creating templates on OpenShift..."

echo "  processing *build.yaml files"
find $CURRENT_PATH/ -name "*build.yaml" -print | xargs -n 1 $CURRENT_PATH/create-or-replace-template.sh $OPEN_SHIFT_PROJECT $OC
#find -name "*build.yaml" -print | xargs -n 1 $OC create -f 

echo "  processing *deploy.yaml files"
find $CURRENT_PATH/ -name "*deploy.yaml" -print | xargs -n 1 $CURRENT_PATH/create-or-replace-template.sh $OPEN_SHIFT_PROJECT $OC
#find -name "*deploy.yaml" -print | xargs -n 1 $OC create -f

#trigger the build process of all build-templates
echo "+++ Building the image streams..."

if [ -z $RECREATE ]; then
  $OC get templates --no-headers | grep -io ^[-\.a-z0-9.]*build[\ ] | grep -io ^[-\.a-z0-9.]*build | xargs -n 1 $OC new-app --template=
#      get templates --no-headers | grep -io ^[-\.a-z0-9.]*build | xargs -n 1 $OC new-app --template=
else
  $OC get templates --no-headers | grep -io ^[-\.a-z0-9.]*build[\ ] | grep -io ^[-\.a-z0-9.]*build | xargs -n 1 $CURRENT_PATH/create-or-replace-build-configuration.sh $OPEN_SHIFT_PROJECT $OC
#      get templates --no-headers | grep -io ^[-\.a-z0-9.]*build\$ | xargs -n 1 $CURRENT_PATH/create-or-replace-build-configuration.sh $OPEN_SHIFT_PROJECT $OC
fi
