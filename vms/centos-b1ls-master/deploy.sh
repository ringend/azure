#!/bin/bash
templateFile="template.json"
devParameterFile="parameters.json"
resourceGroup="vm-name-rg"
az group create \
  --name $resourceGroup \
  --location "East US 2"
az deployment group create \
  --name djr-deployment-1 \
  --resource-group $resourceGroup \
  --template-file $templateFile \
  --parameters $devParameterFile