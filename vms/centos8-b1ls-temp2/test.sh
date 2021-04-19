#!/bin/bash
#Add to the beginning of each bash script
#
templateFile="template.2.json"
devParameterFile="parameters.2.json"
az group create \
	  --name centos8-t1-rg \
	    --location "East US 2"
az deployment group create \
	  --name djr-deployment-1 \
	    --resource-group centos8-t1-rg \
	      --template-file $templateFile \
	        --parameters $devParameterFile

