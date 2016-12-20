#!/bin/bash

if [ -z "$VAULT_IP" ]; then
    echo "Need to set VAULT_IP"
    exit 1
fi

if [ -z "$VAULT_KEY_1" ]; then
    echo "Need to set VAULT_KEY_1"
    exit 1
fi
if [ -z "$VAULT_KEY_2" ]; then
    echo "Need to set VAULT_KEY_2"
    exit 1
fi
if [ -z "$VAULT_KEY_3" ]; then
    echo "Need to set VAULT_KEY_3"
    exit 1
fi

export VAULT_ADDR="http://${VAULT_IP}:8200"

echo "found all required ENV VARS"

echo "running vault unseal..."
vault unseal ${VAULT_KEY_1}
vault unseal ${VAULT_KEY_2}
vault unseal ${VAULT_KEY_3}
echo "Your vault unseal process is complete"
