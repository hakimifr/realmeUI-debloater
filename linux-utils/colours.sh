#!/bin/false
# shellcheck shell=bash

if command -v tput &>/dev/null; then
    enable_colour=true
fi

if [ "$enable_colour" = true ]; then
    # bold colours
    bold_cyan=$(tput bold; tput setaf 6)
    bold_green=$(tput bold; tput setaf 2)
    bold_red=$(tput bold; tput setaf 1)
    bold_yellow=$(tput bold; tput setaf 3)
    bold_white=$(tput bold; tput setaf 7)

    # regular colours
    cyan=$(tput setaf 6)
    green=$(tput setaf 2)
    red=$(tput setaf 1)
    yellow=$(tput setaf 3)

    # reset
    reset=$(tput sgr0)
fi
