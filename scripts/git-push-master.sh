#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

script_start

cd $1

if [ -d "scripts/scripts-local" ]; then
    phase "I guess we're in cheat-sheets, copying scripts-local folder"
    cp -r scripts/scripts-local $CONST_SCRIPTS_LOCAL_BACKUP_FOLDER
    cp scripts/local-common.sh $CONST_SCRIPTS_LOCAL_BACKUP_FOLDER/local-common.sh
fi

phase "status:"
git status

phase "Add?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) phase "added status:"; git add .; git status; break;;
        No ) exit;;
    esac
done

phase "Commit?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) phase "commiting"; git commit -a -m "auto push"; break;;
        No ) exit;;
    esac
done

phase "Push?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) phase "pushing"; git push origin master; break;;
        No ) exit;;
    esac
done

phase "done"
