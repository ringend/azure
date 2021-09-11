#!/bin/bash

# Usage: <script>.sh <appgwlog>.json

# This script takes a Azure Applications Gateway log file (retrieve from storage)
# parses it and outputs the following:
# time:xxx clientIP:xxx requestUri:xxx httpStatus:xxx originalHost:xxx

# Note there are several other fields that can be parsed for the log json file.

# cat file | removes spaces | removes }} | removes " | prints columns based on , delimiter

cat $1 | sed 's/ //g' |  sed 's/}}//g' | sed 's/"//g' | awk -F ',' '{ print $3, $6, $9, $12, $19; }'
