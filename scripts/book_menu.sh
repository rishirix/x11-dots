#!/bin/bash

BOOKS="$HOME/Books/"
CHOICE=$( ls $BOOKS | dmenu -l 10 -p "Select Book:")

[[ -z "$CHOICE" ]] && exit 0

zathura "$BOOKS/$CHOICE"
