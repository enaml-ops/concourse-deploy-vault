if [ -z "$BOSH_DOMAIN" ]; then
    echo "Need to set BOSH_DOMAIN"
    exit 1
fi

if [ -z "$BOSH_USER" ]; then
    echo "Need to set BOSH_USER"
    exit 1
fi

if [ -z "$BOSH_PASSWORD" ]; then
    echo "Need to set BOSH_PASSWORD"
    exit 1
fi

if [ -z "$VAULT_IP" ]; then
    echo "Need to set VAULT_IP"
    exit 1
fi

if [ -z "$NET_NAME" ]; then
    echo "Need to set NET_NAME"
    exit 1
fi

if [ -z "$STEMCELL_VERSION" ]; then
    echo "Need to set STEMCELL_VERSION"
    exit 1
fi

if [ -z "$STEMCELL_NAME" ]; then
    echo "Need to set STEMCELL_NAME"
    exit 1
fi

if [ -z "$AZ_NAME" ]; then
    echo "Need to set AZ_NAME"
    exit 1
fi

if [ -z "$VM_SIZE" ]; then
    echo "Need to set VM_SIZE"
    exit 1
fi

if [ -z "$DISK_TYPE" ]; then
    echo "Need to set DISK_TYPE"
    exit 1
fi

if [ -z "$OMG_PATH" ]; then
    echo "Need to set OMG_PATH"
    exit 1
fi

if [ -z "$CLOUD_CONFIG_PLUGIN" ]; then
    echo "Need to set CLOUD_CONFIG_PLUGIN"
    exit 1
fi


chmod +x ${OMG_PATH}

${OMG_PATH} register-plugin \
  --type product \
  --pluginpath omg-product-bundle/${PRODUCT_PLUGIN}


${OMG_PATH} deploy-product \
  --bosh-url https://${BOSH_DOMAIN} \
  --bosh-port 25555 \
  --bosh-user ${BOSH_USER} \
  --bosh-pass ${BOSH_PASSWORD} \
  --ssl-ignore \
${PRODUCT_PLUGIN} \
  --ip ${VAULT_IP} \
  --az ${AZ_NAME} \
  --network ${NET_NAME} \
  --vm-type ${VM_SIZE} \
  --disk-type ${DISK_TYPE} \
  --stemcell-ver ${STEMCELL_VERSION} \
  --stemcell-name ${STEMCELL_NAME} 
