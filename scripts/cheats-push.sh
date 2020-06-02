#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local/local.sh

script_start

cp -r $CONST_SCRIPTS_LOCAL_FOLDER $CONST_SCRIPTS_LOCAL_BACKUP_FOLDER

cd $CONST_CHEATS_FOLDER
git status
git add .
git commit -a -m "auto push"
git push origin master
