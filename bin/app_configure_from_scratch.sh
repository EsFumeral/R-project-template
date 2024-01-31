#!/usr/bin/env bash

#### Description: Init data folders
#### Written by: Guillermo de Ignacio - gdeignacio on 12-2022


######################################
###   SETUP FROM TEMPLATE UTILS    ###
######################################

set -o errexit
set -o nounset
set -o pipefail

if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./app_configure_from_scratch.sh

Creates an app from scratch

              Following steps are up to you
              Execute app_settings.sh
                      app_setappname.sh --codapp=codapp --app=app
                      app_setenv.sh    

'
    exit
fi

echo ""
PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
echo "Project path at $PROJECT_PATH"
echo ""
echo "[$(date +"%Y-%m-%d %T")] Setting builds and deploy conf files..."
echo ""

# Taking values from .env file

source $PROJECT_PATH/bin/lib_string_utils.sh 
source $PROJECT_PATH/bin/lib_env_utils.sh

lib_env_utils.loadenv ${PROJECT_PATH}
echo ""

echo "Begin automated settings"

echo ""
echo "Creating data folder if not exists"

if [ -d "${APP_FILES_BASE_FOLDER}" ]; then
    ### Take no action if $DIR exists ###
    echo "Skipping ${APP_FILES_BASE_FOLDER} creation. Folder already exists."
else
    ###  Control will jump here if dir does NOT exists ###
    echo "${APP_FILES_BASE_FOLDER} not found. Creating ..."
    $PROJECT_PATH/bin/app_init_data.sh 
fi

echo ""
echo "Creating jdk installation folder if not exists"
if [ -d "$JDK_TARGET" ]; then
    ### Take no action if $DIR exists ###
    echo "Skipping ${JDK_TARGET} creation. Folder already exists."
else
    ###  Control will jump here if dir does NOT exists ###
    echo "${JDK_TARGET} not found. Creating ..."
    $PROJECT_PATH/bin/jdk_jdkinstall.sh
fi


# TO-DO: APP_GENERATION




echo ""
echo "End of automated settings"
