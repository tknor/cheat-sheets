#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

phase "cheat-sheets"

if [ -d "$ffc" ]; then
    cd $ffc
    git pull
fi

phase "jvm-lab"

if [ -d "$ffjl" ]; then
    cd $ffjl
    git pull
fi

phase "nodejs-lab"

if [ -d "$ffnl" ]; then
    cd $ffnl
    git pull
fi

phase "spring-lab"

if [ -d "$ffsl" ]; then
    cd $ffsl
    git pull
fi

phase "ConBank"

if [ -d "$ffcb" ]; then
    cd $ffcb
    git pull
fi

phase "ConBankUI"

if [ -d "$ffcbu" ]; then
    cd $ffcbu
    git pull
fi
