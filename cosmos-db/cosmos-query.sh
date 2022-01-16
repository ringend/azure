#!/bin/bash

# Connets to a Cosmos DB instance via the Rest SQL API and returned the defined database.
# Uses a REST SQL API call done via "curl"

# ---------------------------------------------------
# Enter the instance name & the primary/master key
comsosDbInstanceName="aan-cosmos-db-01"
masterKey="Mo1RO1moJaXtUduQ2lcOrfyrntbctUNel4JVJgrfcDHbp2sNJQy3L6njkOjDk3O13sBgNN3D2PbKpECV8QdFrQ=="
# ---------------------------------------------------

# Get "dbs" will list all the databases in the instance
verb="get"
resourceType="dbs"
resourceLink="dbs"
resourceId=""

# Creating the variables
baseUrl="https://$comsosDbInstanceName.documents.azure.com/"
now=$(env LANG=en_US TZ=GMT date '+%a, %d %b %Y %T %Z')
signature="$(printf "%s" "$verb\n$resourceType\n$resourceId\n$now" | tr '[A-Z]' '[a-z]')\n\n"
hexKey=$(printf "$masterKey" | base64 --decode | hexdump -v -e '/1 "%02x"')
hashedSignature=$(printf "$signature" | openssl dgst -sha256 -mac hmac -macopt hexkey:$hexKey -binary | base64)
authString="type=master&ver=1.0&sig=$hashedSignature"
urlEncodedAuthString=$(printf "$authString" | sed 's/=/%3d/g' | sed 's/&/%26/g' | sed 's/+/%2b/g' | sed 's/\//%2f/g')
url="$baseUrl$resourceLink"

# Print out the variables
printf '\n'
echo "--------------------------------------------------------- "
echo "Cosmos Instance: $comsosDbInstanceName"
echo "Masterkey: $masterKey"
echo "Date: " $now
echo "Signature: $signature"
echo "Hex key: " $hexKey
echo "Hashed signature: $hashedSignature"
echo "Auth string: $authString"
echo "URL encoded auth string: $urlEncodedAuthString"
echo "URL: $url"
echo "--------------------------------------------------------"
printf '\n'

# Execute the curl command
echo "Output:"

# Uncomment to display output without formatting
#curl --request $verb -H "x-ms-date: $now" -H "x-ms-version: 2018-12-31" -H "x-ms-documentdb-isquery: true" -H "Content-Type: application/query+json" -H "Authorization: $urlEncodedAuthString" $url

# Formats output to insert carriage returns to make more readable
curl --request $verb -H "x-ms-date: $now" -H "x-ms-version: 2018-12-31" -H "x-ms-documentdb-isquery: true" -H "Content-Type: application/query+json" -H "Authorization: $urlEncodedAuthString" $url | sed -e 's/"Databases":\[/"Databases":\[\n/g' -e 's/},/},\n/g'

printf '\n'
printf '\n'
