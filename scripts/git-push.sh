#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

phase "cheat-sheets"

if [[ -v ffc ]]; then
    $ffs/./git-push-specific.sh $ffc
fi

phase "jvm-lab"

if [[ -v ffjl ]]; then
    $ffs/./git-push-specific.sh $ffjl
fi

phase "nodejs-lab"

if [[ -v ffnl ]]; then
    $ffs/./git-push-specific.sh $ffnl
fi

phase "spring-lab"

if [[ -v ffsl ]]; then
    $ffs/./git-push-specific.sh $ffsl
fi

phase "ConBank"

if [[ -v ffcb ]]; then
    $ffs/./git-push-specific.sh $ffcb
fi

phase "ConBankUI"

if [[ -v ffcbu ]]; then
    $ffs/./git-push-specific.sh $ffcbu
fi

phase "undead"

if [[ -v ffud ]]; then
    $ffs/./git-push-specific.sh $ffud
fi
