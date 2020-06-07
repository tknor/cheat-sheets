#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local/local.sh

script_start

phase "copying private scripts"

cp -r $CONST_SCRIPTS_LOCAL_FOLDER $CONST_SCRIPTS_LOCAL_BACKUP_FOLDER

phase "commiting and pushing public cheat-sheets with scripts"

cd $CONST_CHEATS_FOLDER
git status

echo "Continue'?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) git add .; git status; break;;
        No ) exit;;
    esac
done

echo "Continue'?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) git commit -a -m "auto push"; break;;
        No ) exit;;
    esac
done

echo "Continue'?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) git push origin master; break;;
        No ) exit;;
    esac
done
