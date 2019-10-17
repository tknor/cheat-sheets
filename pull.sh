#!/bin/bash

set -e
set -u
set -x

git pull

read -n 1 -s -r -p "Press any key to continue"
