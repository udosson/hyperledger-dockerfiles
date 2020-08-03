#!/bin/sh

# Input parameters
NODE_ALIAS=$1
#SERVICE_IP=$(oc get svc -o wide -l app=indy-node --no-headers=true | grep -io '1[-.a-z0-9]\+')
SERVICE_IP=$2
SEED_PHRASE=$3

cd /tmp
git clone https://github.com/CHempel-esatus/SSI4DE_Genesis.git
cd SSI4DE_Genesis

# Get CheckSum from read.me file
SHA256_DOMAIN_TRANSACTION_GENESIS=$(sed '5q;d' README.md)
SHA256_POOL_TRANSACTION_GENESIS=$(sed '7q;d' README.md)

# Calculte Checksum
SHA256_DOMAIN_TRANSACTION_GENESIS_CHECKSUM=$(sha256sum domain_transactions_genesis | awk '{print $1}')
SHA256_POOL_TRANSACTION_GENESIS_CHECKSUM=$(sha256sum pool_transactions_genesis | awk '{print $1}')

if [ "${SHA256_DOMAIN_TRANSACTION_GENESIS}" = "${SHA256_DOMAIN_TRANSACTION_GENESIS_CHECKSUM}" ] && [ "${SHA256_POOL_TRANSACTION_GENESIS}" = "${SHA256_POOL_TRANSACTION_GENESIS_CHECKSUM}" ]; then
    init_indy_node ${NODE_ALIAS} ${SERVICE_IP} 9701 ${SERVICE_IP} 9702 ${SEED_PHRASE} && start_indy_node ${NODE_ALIAS} ${SERVICE_IP} 9701 ${SERVICE_IP} 9702
else
    echo "CHECKSUM DOESN'T MATCH!!!! ERROR!!!!"
fi
