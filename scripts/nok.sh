#!/bin/bash

# shellcheck source=./local-common.sh
. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

  if [[ $1 == "download" ]]; then
    header2 "nok/tools <- nodejs-lab/tools"
    rm -rf "$ffnok/src/tools/"
    cp -r "$ffnl/src/tools/" "$ffnok/src/"

  elif [[ $1 == "upload" ]]; then
    header2 "nok/tools -> nodejs-lab/tools"
    rm -rf "$ffnl/src/tools/"
    cp -r "$ffnok/src/tools/" "$ffnl/src/"

  elif [[ $1 == "rnws" ]]; then
    header2 "running nok web server"
    cd $ffnok
    tsc
    node bin/www

  elif [[ $1 == "rnn" ]]; then
    header2 "running notok in no mode"
    cd $ffnok
    tsc
    node compiled/notok/main.js

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
    node compiled/notok/main.js prod

  elif [[ $1 == "rns" ]]; then
    header2 "running nok/scratch.ts"
    cd $ffnok
    tsc
    node compiled/scratch.js

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
