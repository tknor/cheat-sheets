#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

phase "cheat-sheets"

if [ -d "$ffc" ]; then
    $ffs/./git-push-specific.sh $ffc
fi

phase "jvm-lab"

if [ -d "$ffjl" ]; then
    $ffs/./git-push-specific.sh $ffjl
fi

phase "nodejs-lab"

if [ -d "$ffnl" ]; then
    $ffs/./git-push-specific.sh $ffnl
fi

phase "spring-lab"

if [ -d "$ffsl" ]; then
    $ffs/./git-push-specific.sh $ffsl
fi

phase "ConBank"

if [ -d "$ffcb" ]; then
    $ffs/./git-push-specific.sh $ffcb
fi

phase "ConBankUI"

if [ -d "$ffcbu" ]; then
    $ffs/./git-push-specific.sh $ffcbu
fi

phase "undead"

if [ -d "$ffud" ]; then
    $ffs/./git-push-specific.sh $ffud
fi
