#!/bin/bash
 
# Get list of peered VNets
az account set --subscription "MYSUB"
az network vnet peering list --resource-group MYRG --vnet-name MY-VNET | \                                       
grep -e /subscriptions/ -e /virtualNetworks/ | grep -v /virtualNetworkPeerings | \
awk -F '/' '{print $3, $5, $9;}' | \
sed 's/",//g' \
# > "output-file.txt"
 
 
