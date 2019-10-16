#!/bin/bash

set -e
set -u
set -x

git add .
git commit -m "-"
git push origin master

read -p "Press ENTER to continue"
