#!/usr/bin/env bash
# File: filecommands.#!/bin/sh

function helpme {

    echo "Hello, I am here to help you"
    echo "Enter the task, and I'll try to find the command"
    read response
    let ind=1
    if [[ $response =~ "directory" || $response =~ "create" || $response =~ "make" || $response =~ "folder" ]]
    then
        echo "$ind- createD     Creates a directory. Arguments>1"
        let ind=$(expr $ind + 1)
    fi

    if [[ $response =~ "directory" || $response =~ "delete" || $response =~ "remove" || $response =~ "trash" || $response =~ "folder" ]]
    then
        echo "$ind- removeD     Deletes a directory. Arguments>1"
        let ind=$(expr $ind + 1)
    fi


}

function createD {
    ~/fileSystemProject/cd $@
}
