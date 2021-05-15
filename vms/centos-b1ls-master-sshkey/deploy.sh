#!/bin/bash
templateFile="template.json"
devParameterFile="parameters.json"
resourceGroup="cent8-chub-s1-rg"
location="CentralUS"
az group create \
  --name $resourceGroup \
  --location $location
az deployment group create \
  --name djr-deployment-1 \
  --resource-group $resourceGroup \
  --template-file $templateFile \
  --parameters $devParameterFile
