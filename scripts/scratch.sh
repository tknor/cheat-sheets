#!/bin/bash

# shellcheck source=./local-common.sh
. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

#VAR_CUR_FOL=$(pwd)
#[[ $VAR_CUR_FOL =~ Git/cheat-sheets$ ]] && echo "we're in cheat sheets"

# echo $#
# echo $?

#read -p "Enter first string: " str1
#read -p "Enter second string: " str2
#if [ "$str1" == "$str2" ]; then

#if [ "$a" -eq "$b" ]
# -eq ne gt ge ... integer comparisons

# Command && echo "Command worked" || echo "Command Failed"

#$ false || echo "Oops, fail"
#Oops, fail

#$ true || echo "Will not be printed"

#$ true && echo "Things went well"
#Things went well

#$ false && echo "Will not be printed"

#$ false ; echo "This will always run"
#This will always run

# same thing
# echo `ls`
# echo $(ls)

#$ grep not_there /dev/null
#$ echo $?

#$ grep somestring file1 > /tmp/a
#$ grep somestring file2 > /tmp/b
#$ diff /tmp/a /tmp/b

#diff <(grep somestring file1) <(grep somestring file2)

#A='123'
#echo "$A"
#echo '$A'

#mkdir -p tmp
#cd tmp
#touch a
#echo "*"
#echo '*'

# !! – repeat last command

#!$
# repeats the last argument of the last command

#grep somestring /long/path/to/some/file/or/other.txt
#vi !$

#grep isthere /long/path/to/some/file/or/other.txt
#cd !$:h
