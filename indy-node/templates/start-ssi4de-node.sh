#!/bin/sh

# Sets new /etc/passwd file
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
envsubst < /tmp/passwd.template > /tmp/passwd
export LD_PRELOAD=/usr/lib/libnss_wrapper.so
export NSS_WRAPPER_PASSWD=/tmp/passwd
export NSS_WRAPPER_GROUP=/etc/group

echo "Indy node prepared to run as user indy"


# Input parameters
NODE_ALIAS=$1
#SERVICE_IP=$(oc get svc -o wide -l app=indy-node --no-headers=true | grep -io '1[-.a-z0-9]\+')
SERVICE_IP=$2
SEED_PHRASE=$3

cd /tmp
git clone https://github.com/CHempel-esatus/SSI4DE_Genesis.git
cd /tmp/SSI4DE_Genesis

# Get CheckSum from read.me file
SHA256_DOMAIN_TRANSACTION_GENESIS=$(sed '5q;d' README.md)
SHA256_POOL_TRANSACTION_GENESIS=$(sed '7q;d' README.md)

# Calculte Checksum
SHA256_DOMAIN_TRANSACTION_GENESIS_CHECKSUM=$(sha256sum domain_transactions_genesis | awk '{print $1}')
SHA256_POOL_TRANSACTION_GENESIS_CHECKSUM=$(sha256sum pool_transactions_genesis | awk '{print $1}')

# if [ "${SHA256_DOMAIN_TRANSACTION_GENESIS}" = "${SHA256_DOMAIN_TRANSACTION_GENESIS_CHECKSUM}" ] && [ "${SHA256_POOL_TRANSACTION_GENESIS}" = "${SHA256_POOL_TRANSACTION_GENESIS_CHECKSUM}" ]; then
#     mv /tmp/domain_transactions_genesis /var/lib/indy/ssi4de_test
#     mv /tmp/pool_transactions_genesis /var/lib/indy/ssi4de_test
#     init_indy_node ${NODE_ALIAS} ${SERVICE_IP} 9701 ${SERVICE_IP} 9702 ${SEED_PHRASE} && start_indy_node ${NODE_ALIAS} ${SERVICE_IP} 9701 ${SERVICE_IP} 9702
# else
#     echo "CHECKSUM DOESN'T MATCH!!!! ERROR!!!!"
# fi

# mv /tmp/SSI4DE_Genesis/domain_transactions_genesis /var/lib/indy/ssi4de_test
mv /tmp/SSI4DE_Genesis/pool_transactions_genesis /var/lib/indy/ssi4de_test
init_indy_node ${NODE_ALIAS} ${SERVICE_IP} 9701 ${SERVICE_IP} 9702 ${SEED_PHRASE}
start_indy_node ${NODE_ALIAS} ${SERVICE_IP} 9701 ${SERVICE_IP} 9702


