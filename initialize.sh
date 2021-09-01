#!/bin/bash
#
# Initialize Script
# Ansiblefest 2021
# Written by Stuart Kirk <stuart.kirk@microsoft.com>

# Init
if [ -f "vars-myvars.yml" ]; then
    echo "This script has already been run and your vars-myvars.yml file already exists."
    exit 1
fi

# Variables
RANDNUM="$(shuf -i 20000-50000 -n 1)"
AZUREDC="$(az group list -o table |grep ansiblefest2021 | awk '{print $2}')"
RG="ansiblefest2021"
USERNANE="$(whoami)"
VMNAME="$(echo $USERNAME | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]//g' | cut -c 1-15)"

# Operations
cp vars.yml vars-myvars.yml
sed -i "s/MYRANDOM/$RANDNUM/g" vars-myvars.yml
sed -i "s/MY_RESOURCE_GROUP/$RG/g" vars-myvars.yml
sed -i "s/MYVM/$VMNAME/g" vars-myvars.yml
sed -i "s/MYAZUREDATACENTER/$AZUREDC/g" vars-myvars.yml
sed -i "s/MYUSERNAME/$USERNAME/g" vars-myvars.yml

# Finish
echo " "
echo "Your custom variables file, vars-myvars.yml, has been created.  Go forth and conquer!"
exit 0


