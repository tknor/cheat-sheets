#!/bin/bash

# shellcheck source=./local-common.sh
. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

header1 "cheat-sheets"

if [[ -v ffc ]]; then
    $ffs/./git-push-specific.sh $ffc
fi

header1 "jvm-lab (java, kotlin, groovy, with tools)"

if [[ -v ffjl ]]; then
    $ffs/./git-push-specific.sh $ffjl
fi

header1 "nodejs-lab (typescript, javascript, with tools)"

if [[ -v ffnl ]]; then
    $ffs/./git-push-specific.sh $ffnl
fi

header1 "spring-lab (spring, kotlin)"

if [[ -v ffsl ]]; then
    $ffs/./git-push-specific.sh $ffsl
fi

header1 "celeri (spring, kotlin, for vps)"

if [[ -v ffcel ]]; then
    $ffs/./git-push-specific.sh $ffcel
fi

header1 "aranea (spring, java, for framework testing)"

if [[ -v ffara ]]; then
    $ffs/./git-push-specific.sh $ffara
fi

header1 "ankylos (typescript, angular, for vps)"

if [[ -v ffank ]]; then
    $ffs/./git-push-specific.sh $ffank
fi

header1 "nok"

if [[ -v ffnok ]]; then
    $ffs/./git-push-specific.sh $ffnok
fi
