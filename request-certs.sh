#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -h hostname"
   echo -e "\t-h fqdn of certificate to request"
   exit 1 # Exit script after printing help
}

while getopts "h:" opt
do
   case "$opt" in
      h ) hostname="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$hostname" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

/usr/bin/certbot certonly --standalone -d $hostname --non-interactive --agree-tos --http-01-port=8888

/opt/install-certs.sh
