#!/bin/bash

#set -o nounset
#set -o errexit

#### Description: Installs python tools
#### Written by: Guillermo de Ignacio - gdeignacio@gmail.com on 11-2022
#### WARNING: Check if DOCKER_CUSTOM_USERNAME is set. See settings/500_docker file

###################################
###   DOCKER INSTALL UTILS      ###
###################################

echo ""
PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
echo "Project path at $PROJECT_PATH"
echo ""
echo "[$(date +"%Y-%m-%d %T")] Installing docker..."
echo ""

# Taking values from .env file

source $PROJECT_PATH/bin/lib_string_utils.sh 
source $PROJECT_PATH/bin/lib_env_utils.sh

lib_env_utils.loadenv ${PROJECT_PATH}
echo ""
lib_env_utils.check_os
echo ""

if [[ isLinux -eq 1 ]]; then
    sudo apt-get update
    sudo apt-get upgrade
   
    sudo apt-get install \
        $PYTHON \
        python3-virtualenv \
        virtualenv
    echo ""
else
    echo ""
    echo "Python should be installed manually"
    echo ""
fi

