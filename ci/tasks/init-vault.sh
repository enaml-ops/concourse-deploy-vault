#!/bin/bash

if [ -z "$VAULT_IP" ]; then
    echo "Need to set VAULT_IP"
    exit 1
fi

VAULT_ADDR="http://${VAULT_IP}:8200"

echo "found all required ENV VARS"

echo "running vault init..."
vault init

echo "Your vault info is above"
