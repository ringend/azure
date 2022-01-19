#!/bin/bash

templateFile="template.json"
devParameterFile="parameters.json"
resourceGroup="djr-uscent-rg-1"
az deployment group create \
  --name djr-deployment-1 \
  --resource-group $resourceGroup \
  --template-file $templateFile \
  --parameters $devParameterFile

