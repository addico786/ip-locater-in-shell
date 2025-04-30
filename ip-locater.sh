#!/bin/bash

if [[ -z "$1" ]]; then
    echo "usage: $0 IP"
    echo "please provide an ip "
    exit
fi

res=$(curl http://ip-api.com/json/$1 -s)

status=$(echo $res | jq '.status' -r)

if [ $status = "success" ]
then
        city=$(echo $res | jq '.city' -r)
        echo "CITY:$city"
        region=$(echo $res | jq '.regionName' -r)
        echo "REGION: $region"
        country=$(echo $res | jq '.country' -r)
        echo "COUNTRY: $country"
fi
