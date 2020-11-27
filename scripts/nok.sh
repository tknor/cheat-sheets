#!/bin/bash

# shellcheck source=./local-common.sh
. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

  if [[ $1 == "dist" ]]; then
    header2 "distribution of nodejs-lab/util"
    cp -r $ffnl/src/util $ffnok/src

  elif [[ $1 == "rnd" ]]; then
    header2 "running notok in development mode"
    cd $ffnok
    tsc
    node compiled/notok/main.js dev

  elif [[ $1 == "rnt" ]]; then
    header2 "running notok in token mode"
    cd $ffnok
    tsc
    node compiled/notok/main.js token

  elif [[ $1 == "rnp" ]]; then
    header2 "running notok in production mode"
    cd $ffnok
    tsc
    node compiled/notok/main.js

  elif [[ $1 == "rns" ]]; then
    header2 "running notok/scratch.ts"
    cd $ffnok
    tsc
    node compiled/notok/scratch.js

  elif [[ $1 == "rls" ]]; then
    header2 "running nodejs-lab/scratch.ts"
    cd $ffnl
    tsc
    node compiled/scratch.js

  elif [[ $1 == "deploy" ]]; then
    header2 "deploying nok to VPS"
    header2 "NOT IMPLEMENTED"

  else
    header2 "what with it?"
    exit 1
  fi
