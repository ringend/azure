#!/bin/bash
templateFile="template.2.json"
devParameterFile="parameters.2.json"
resourceGroup="cent8-ap4-s1-rg"
location="Central US"
az group create \
  --name $resourceGroup \
  --location $location
az deployment group create \
  --name djr-deployment-1 \
  --resource-group $resourceGroup \
  --template-file $templateFile \
  --parameters $devParameterFile