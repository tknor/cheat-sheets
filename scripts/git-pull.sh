#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

phase "cheat-sheets"

if [[ -v ffc ]]; then
    cd $ffc
    git pull
fi

phase "jvm-lab"

if [[ -v ffjl ]]; then
    cd $ffjl
    git pull
fi

phase "nodejs-lab"

if [[ -v ffnl ]]; then
    cd $ffnl
    git pull
fi

phase "spring-lab"

if [[ -v ffsl ]]; then
    cd $ffsl
    git pull
fi

phase "aranea (spring)"

if [[ -v ffara ]]; then
    cd $ffara
    git pull
fi

phase "ankylos (angular)"

if [[ -v ffank ]]; then
    cd $ffank
    git pull
fi

phase "nok"

if [[ -v ffnok ]]; then
    cd $ffnok
    git pull
fi
