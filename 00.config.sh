#!/bin/bash

#Change your configuration and set READY=true when done
READY=true

#Container env setting
SUDO=
CONTAINER_MGR=podman

#IP addresses of conjur and crc VM
CONJUR_IP=10.10.10.1
POC_IP=$CONJUR_IP
POC_DOMAIN=mtech.local
POC_CONJUR_ADMIN_PW=CyberArk123!
POC_CONJUR_ACCOUNT=MTech
POC_CONJUR_HTTPS_PORT=443
#Path to folder with all docker images
UPLOAD_DIR=/opt/upload
conjur_appliance_file=conjur-appliance-Rls-v13.4.0.tar.gz
conjur_version=13.4.0
#Conjur container name
node_name=conjur
