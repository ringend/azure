#!/bin/bash
templateFile="vm-template.json"
devParameterFile="vm-parameters.json"
az group create \
  --name vm-name-rg \
  --location "East US 2"
az deployment group create \
  --name djr-deployment-1 \
  --resource-group vm-name-rg \
  --template-file $templateFile \
  --parameters $devParameterFile