#!/bin/bash

# shellcheck source=./local-common.sh
. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

cd "$1" # moving to pushed folder

VAR_PUSHED_FOLDER=$(pwd)

function commit_ufr() {

  cd "$CONST_UFR_FOLDER"

	VAR_UNSTAGED_OUTPUT=$(git diff)
  VAR_STAGED_OUTPUT=$(git diff --staged)

  if [[ ($VAR_UNSTAGED_OUTPUT == "") && ($VAR_STAGED_OUTPUT == "") ]]; then
    header2 "no changes in UFR detected"
  else
    header2 "changes in UFR detected"
    git add .
    git commit -m "auto push"
  fi

  cd "$VAR_PUSHED_FOLDER"
}

VAR_CHEATS="cheat-sheets"
VAR_NOK="nok-20201124"
VAR_MSG_UNVERSIONED="copying unversioned files to UFR"

if [[ $VAR_PUSHED_FOLDER =~ Git/cheat-sheets$ ]]; then
  header2 "$VAR_CHEATS :: $VAR_MSG_UNVERSIONED"
  mkdir -p "$CONST_UFR_FOLDER/$VAR_CHEATS/scripts/scripts-local"
  cp -r scripts/scripts-local "$CONST_UFR_FOLDER/$VAR_CHEATS/scripts/scripts-local"
  cp scripts/local-common.sh "$CONST_UFR_FOLDER/$VAR_CHEATS/scripts/local-common.sh"
  commit_ufr

elif [[ $VAR_PUSHED_FOLDER =~ Git/nok-20201124$ ]]; then
  header2 "$VAR_NOK :: $VAR_MSG_UNVERSIONED"
  mkdir -p "$CONST_UFR_FOLDER/$VAR_NOK/unversioned"
  cp -r unversioned "$CONST_UFR_FOLDER/$VAR_NOK/unversioned"
  commit_ufr
fi

VAR_UNSTAGED_OUTPUT=$(git diff)
VAR_STAGED_OUTPUT=$(git diff --staged)

if [[ ($VAR_UNSTAGED_OUTPUT == "") && ($VAR_STAGED_OUTPUT == "") ]]; then
  header2 "no changes in pushed folder detected"
  exit
else
  header2 "changes in pushed folder detected"
fi

header2 "status:"
git status

header2 "Add?"
select yn in "Add" "Cancel"; do
    case $yn in
        Add ) header2 "added status:"; git add .; git status; break;;
        Cancel ) exit;;
    esac
done

header2 "Commit?"
select yn in "Commit" "Cancel"; do
    case $yn in
        Commit ) header2 "committing"; git commit -a -m "auto push"; break;;
        Cancel ) exit;;
    esac
done

VAR_BRANCH=$(git branch | grep -o 'm.\+')

header2 "Push? (detected: $VAR_BRANCH )"
select yn in "Push" "Cancel"; do
    case $yn in
        Push ) header2 "pushing"; git push origin $VAR_BRANCH; break;;
        Cancel ) exit;;
    esac
done

header2 "done"
