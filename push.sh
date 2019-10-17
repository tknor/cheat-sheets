#!/bin/bash

set -e
set -u
set -x

git add .
git commit -m "auto push"
git push origin master

read -n 1 -s -r -p "Press any key to continue"
