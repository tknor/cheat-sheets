#!/bin/bash

. common.sh

script_start

git add .
git commit -m "auto push"
git push origin master
