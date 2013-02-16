#!/usr/bin/env bash
#
# Common functions

__err() {
    local app
    local err
    app="$1"
    err="$2"
    printf "\n\b\e[01;37m\e[04;37m$app error:\n\e[00m\t\t\e[01;31m$err\e[00m\n"
    exit -1
}

__msg() {
    local msg
    msg="$1"
    __bullet
    printf "\e[1;35m$msg\e[00m\n"
}

__prog_msg() {
    local status
    local script
    status="$1"
    script="$2"
    printf "\e[1;36m$status: \e[1;32m$script\e[00m\n\n"
}

__title(){
    __prog_msg "Started" "$1"
}

__done(){
    __prog_msg "Completed" "$1"
}

__continue(){
    local question
    question=$1
    __bullet
    printf "\t\e[1;34m$1"
    read -p "[enter] or [ctrl+c]"
}

__bullet(){
    printf "\e[1;31m * "
}