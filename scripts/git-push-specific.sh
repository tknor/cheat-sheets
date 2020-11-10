#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

cd $1

if [ -d "scripts/scripts-local" ]; then
    phase "I guess we're in cheat-sheets, copying scripts-local folder"
    cp -r scripts/scripts-local $CONST_SCRIPTS_LOCAL_BACKUP_FOLDER
    cp scripts/local-common.sh $CONST_SCRIPTS_LOCAL_BACKUP_FOLDER/local-common.sh
fi

phase "status:"
git status

phase "Add?"
select yn in "Add" "Cancel"; do
    case $yn in
        Add ) phase "added status:"; git add .; git status; break;;
        Cancel ) exit;;
    esac
done

phase "Commit?"
select yn in "Commit" "Cancel"; do
    case $yn in
        Commit ) phase "committing"; git commit -a -m "auto push"; break;;
        Cancel ) exit;;
    esac
done

VAR_BRANCH=$(git branch | grep -o 'm.\+')

phase "Push? (detected: $VAR_BRANCH )"
select yn in "$VAR_BRANCH" "Cancel"; do
    case $yn in
        $VAR_BRANCH ) phase "pushing"; git push origin $VAR_BRANCH; break;;
        Cancel ) exit;;
    esac
done

phase "done"
