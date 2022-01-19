#!/bin/bash
templateFile="template.2.json"
devParameterFile="parameters.2.json"
resourceGroup="centos8-a1-www-rg"
az group create \
  --name $resourceGroup \
  --location "East US 2"
az deployment group create \
  --name djr-deployment-1 \
  --resource-group $resourceGroup \
  --template-file $templateFile \
  --parameters $devParameterFile

