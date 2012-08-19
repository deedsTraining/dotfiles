#!/bin/bash
# wget aliases
alias wget='wget -c '
alias wgetpics='wget -nh -np --mirror --level=1 --convert-links'
alias wgetjpeg='wget -nh -np --recursive --level=1 --convert-links --accept=jpg,JPG,jpeg,JPEG'
alias wgetmpeg='wget -nh -np --recursive --level=1 --convert-links --accept=mpg,MPG,mpeg,MPEG'
alias wgetrm='wget -nh -np --recursive --level=1 --convert-links --accept=rm,RM'
alias wgetfast='wget -T6 -w1'
alias wgetslow='wget -T20 -w1'
