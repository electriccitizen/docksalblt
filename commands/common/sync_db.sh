#!/usr/bin/env bash

## Import a database from a Pantheon environment.
##
## Usage: this function is included in various custom fin commands via:
## source "${PROJECT_ROOT}/.docksal/commands/common/dbsync.sh"

source "${PROJECT_ROOT}/.docksal/commands/common/sync_config.sh"

SKIPCIM=$1



# Console colors
red='\033[0;31m'
green='\033[0;32m'
green_bg='\033[42m'
yellow='\033[1;33m'
NC='\033[0m'
bg='\[\033[0;35m\]'

echo-red () { echo -e "${red}$1${NC}"; }
echo-green () { echo -e "${green}$1${NC}"; }
echo-green-bg () { echo -e "${green_bg}$1${NC}"; }
echo-yellow () { echo -e "${yellow}$1${NC}"; }


sync_db ()

{
echo "Change folder to $PROJECT_ROOT"
cd $PROJECT_ROOT


  # Drop the current database before continuing
  fin drush sql-drop -y
  
  # Sync the database
  echo "Syncing database from $REMOTE_ALIAS..."
  fin drush sql:sync $REMOTE_ALIAS @self -y

  #update admin pwd
  echo "Updating user 1 $USER1 password to admin..."
  fin drush user:password $USER1 "admin"

  # Move on to config sync
  _sync_config

}

_sync_config ()
{
    time sync_config "$SKIPCIM"
}
