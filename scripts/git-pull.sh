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

phase "ConBank"

if [[ -v ffcb ]]; then
    cd $ffcb
    git pull
fi

phase "ConBankUI"

if [[ -v ffcbu ]]; then
    cd $ffcbu
    git pull
fi

phase "undead"

if [[ -v ffud ]]; then
    cd $ffud
    git pull
fi
