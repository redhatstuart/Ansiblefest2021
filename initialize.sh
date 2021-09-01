#!/bin/bash
#
# Initialize Script
# Ansiblefest 2021
# Written by Stuart Kirk <stuart.kirk@microsoft.com>

# Init
if [ -f "vars-myvars.yaml" ]; then
    echo "This script has already been run and your vars-myvars.yaml file already exists."
    exit 1
fi

# Variables
RANDNUM="$(shuf -i 20000-50000 -n 1)"
RG="ansiblefest2021"
USERNAME="$(whoami)"
VMNAME="$(echo $USERNAME | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]//g' | cut -c 1-15)"
AZUREDC="$(cat ../az.region)"

# Operations
cp vars.yaml vars-myvars.yaml
sed -i "s/MYRANDOM/$RANDNUM/g" vars-myvars.yaml
sed -i "s/MY_RESOURCE_GROUP/$RG/g" vars-myvars.yaml
sed -i "s/MYVM/$VMNAME-vm/g" vars-myvars.yaml
sed -i "s/MYAZUREDATACENTER/$AZUREDC/g" vars-myvars.yaml
sed -i "s/MYUSERNAME/$USERNAME/g" vars-myvars.yaml

# Finish
echo " "
echo "Your custom variables file, vars-myvars.yaml, has been created.  Go forth and conquer!"
exit 0


