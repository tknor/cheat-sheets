#!/bin/bash

# shellcheck source=./local-common.sh
. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

header1 "cheat-sheets"

if [[ -v ffc ]]; then
    $ffs/./git-push-specific.sh $ffc
fi

header1 "jvm-lab"

if [[ -v ffjl ]]; then
    $ffs/./git-push-specific.sh $ffjl
fi

header1 "nodejs-lab"

if [[ -v ffnl ]]; then
    $ffs/./git-push-specific.sh $ffnl
fi

header1 "spring-lab"

if [[ -v ffsl ]]; then
    $ffs/./git-push-specific.sh $ffsl
fi

header1 "aranea (spring)"

if [[ -v ffara ]]; then
    $ffs/./git-push-specific.sh $ffara
fi

header1 "ankylos (angular)"

if [[ -v ffank ]]; then
    $ffs/./git-push-specific.sh $ffank
fi

header1 "nok"

if [[ -v ffnok ]]; then
    $ffs/./git-push-specific.sh $ffnok
fi
