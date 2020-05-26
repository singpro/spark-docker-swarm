#!/usr/bin/env bash

# To use an OpenStack cloud such as pouta.csc.fi you need to authenticate against 
# the identity service named keystone which needs the following information. 
# please fill in the appropriate values for each key which can be fetched from 
# https://pouta.csc.fi/dashboard/project/access_and_security/ incase of pouta.csc.fi 
# cloud usage. More info can also be found from https://docs.csc.fi/cloud/pouta/install-client/

export OS_SECURITY_GROUPS=<name of the security group to use>
export OS_FLAVOR_NAME=<flavor or size of the VM e.g. standard.medium>
export OS_COMPUTE_API_VERSION=3
export OS_IDENTITY_API_VERSION=3
export OS_DOMAIN_NAME=Default
export OS_IMAGE_ID=<the image id to use can be found from https://pouta.csc.fi/dashboard/project/images>
export OS_SSH_USER=ubuntu
export OS_KEYPAIR_NAME=<key pair to use>
export OS_PRIVATE_KEY_FILE=<.pem file containing your private key>
export OS_AUTH_URL=https://pouta.csc.fi:5001/v3
export OS_USERNAME=<user name >
export OS_PASSWORD=<password>
export OS_PROJECT_NAME=< project number e.g. project_xxxxxxx>
export OS_TENANT_ID=<also called project id>
export OS_TENANT_NAME=<also called project name>
