#!/bin/bash

# shellcheck source=./local-common.sh
. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

header1 "cheat-sheets"

if [[ -v ffc ]]; then
    cd $ffc
    git pull
fi

header1 "jvm-lab"

if [[ -v ffjl ]]; then
    cd $ffjl
    git pull
fi

header1 "nodejs-lab"

if [[ -v ffnl ]]; then
    cd $ffnl
    git pull
fi

header1 "spring-lab"

if [[ -v ffsl ]]; then
    cd $ffsl
    git pull
fi

header1 "aranea (spring)"

if [[ -v ffara ]]; then
    cd $ffara
    git pull
fi

header1 "ankylos (angular)"

if [[ -v ffank ]]; then
    cd $ffank
    git pull
fi

header1 "nok"

if [[ -v ffnok ]]; then
    cd $ffnok
    git pull
fi
