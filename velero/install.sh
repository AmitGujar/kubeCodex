#!/bin/bash

resourceGroup="storage account resource group name"
storageAccount="name of storage account"

recovery() {

    velero install \
        --provider azure \
        --bucket velero \
        --secret-file ./credentials-velero \
        --backup-location-config resourceGroup=$resourceGroup,storageAccount=$storageAccount \
        --plugins velero/velero-plugin-for-microsoft-azure:v1.10.0 \
        --use-volume-snapshots=false

    velero snapshot-location create default --provider azure
}

read -p "Do you want to install velero(y/n) = " choice

if [ "$choice" == "y" ]; then
    recovery
else
    yes | velero uninstall
fi

printf "\n=============================================================================\n"

printf "\nUse following commands to get started\n"

echo ""

printf "1. Create backup = velero backup create nginx-backup --selector app=nginx\n"

echo "2. Restore backup = velero restore create --from-backup nginx-backup"
