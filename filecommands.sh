#!/usr/bin/env bash
# File: filecommands.#!/bin/sh


#helpme command-> apropos replacement
function helpme {

    echo "Hello, I am here to help you"
    echo "Enter the task, and I'll try to find the command"
    read response
    let ind=1
    if [[ ${response,,} =~ "directory" || ${response,,} =~ "create" || ${response,,} =~ "make" || ${response,,} =~ "folder" || ${response,,} =~ "all" ]]
    then
        echo "$ind- createD     Creates a directory. Arguments>1"
        let ind=$(expr $ind + 1)
    fi

    if [[ ${response,,} =~ "directory" || ${response,,} =~ "delete" || ${response,,} =~ "remove" || ${response,,} =~ "trash" || ${response,,} =~ "folder" || ${response,,} =~ "all" ]]
    then
        echo "$ind- removeD     Deletes a directory. Arguments>1"
        let ind=$(expr $ind + 1)
    fi

    if [[ ${response,,} =~ "directory" || ${response,,} =~ "file" || ${response,,} =~ "info" || ${response,,} =~ "folder" || ${response,,} =~ "content" || ${response,,} =~ "list" || ${response,,} =~ "all" ]]
    then
        echo "$ind- listAll     reads the current directory and lists all elements present except hidden files. Arguments=NULL"
        let ind=$(expr $ind + 1)
    fi

    if [[ ${response,,} =~ "file" || ${response,,} =~ "create" || ${response,,} =~ "make" || ${response,,} =~ "regular" || ${response,,} =~ "all" ]]
    then
        echo "$ind- createF     Creates a file. Arguments>1"
        let ind=$(expr $ind + 1)
    fi

    if [[ ${response,,} =~ "file" || ${response,,} =~ "delete" || ${response,,} =~ "remove" || ${response,,} =~ "trash" || ${response,,} =~ "regular" || ${response,,} =~ "all" ]]
    then
        echo "$ind- removeF     Deletes a file. Arguments>1"
        let ind=$(expr $ind + 1)
    fi

    if [[ ${response,,} =~ "file" || ${response,,} =~ "folder" || ${response,,} =~ "directory" || ${response,,} =~ "propert" || ${response,,} =~ "regular" || ${response,,} =~ "size" || ${response,,} =~ "permission" || ${response,,} =~ "user" || ${response,,} =~ "group" || ${response,,} =~ "path" || ${response,,} =~ "all" ]]
    then
        echo "$ind- fileProp    Tells file properties. Arguments=1"
        let ind=$(expr $ind + 1)
    fi

    if [[ ${response,,} =~ "copy" || ${response,,} =~ "file" || ${response,,} =~ "regular" || ${response,,} =~ "all" ]]
    then
        echo "$ind- copyF       Copies a file. Arguments=2"
        let ind=$(expr $ind + 1)
    fi

    if [[ ${response,,} =~ "cut" || ${response,,} =~ "file" || ${response,,} =~ "regular" || ${response,,} =~ "all" ]]
    then
        echo "$ind- cutF        Moves a file.Can we used to delete by moving to trash. Arguments=2"
        let ind=$(expr $ind + 1)
    fi

    if [[ ${response,,} =~ "open" || ${response,,} =~ "editor" || ${response,,} =~ "directory" || ${response,,} =~ "folder" || ${response,,} =~ "view" || ${response,,} =~ "all" ]]
    then
        echo "$ind- viewD       Views the specified folder using a package manager or an editor. Depending on your choice. Arguments=1"
        let ind=$(expr $ind + 1)
    fi

    if [[ ${response,,} =~ "open" || ${response,,} =~ "editor" || ${response,,} =~ "regular" || ${response,,} =~ "file" || ${response,,} =~ "view" || ${response,,} =~ "all" ]]
    then
        echo "$ind- viewF       Views the specified file using an editor of your choice. Arguments=1"
        let ind=$(expr $ind + 1)
    fi

    if [[ $ind -eq 1 ]]
    then
        echo "Sorry, Couldn't find what you were looking for"
    fi


}

#This command is used to open Dolphin or Atom to view contents of directory. You can change it in accordance to your systems package manager
function viewD {
    if [[ $# -eq 1 ]]
    then
        echo "How do you want to view the folder-> 1. Using Dolphin 2. Atom"
        read response
        if [[ $response -eq 1 ]]
        then
            dolphin $1
        elif [[ $response -eq 2 ]]
        then
            atom $1
        else
            echo "Wrong input"
        fi
    else
        echo "Wrong number of arguments"
    fi
}

#This command is used for accesing my two fav text editors, Kate and Atom
function viewF {
    if [[ $# -eq 1 ]]
    then
        echo "Which editor do you want to use-> 1. Kate  2. Atom"
        read response
        if [[ $response -eq 1 ]]
        then
            kate $1
        elif [[ $response -eq 2 ]]
        then
            atom $1
        else
            echo "Wrong input"
        fi
    else
        echo "Wrong number of arguments"
    fi
}

#Creates Regular Files
function createF {
    ~/fileSystemProject/rfc $@
    if [[ $# -eq 1 ]]
    then
        echo "Do you want to open the file you created in an editor?"
        read response
        if [[ ${response,,} =~ "y" ]]
        then
            viewF $1
        fi
    else
        echo "Is there any file you created that you want to open?"
        read response
        if [[ ${response,,} =~ "y" ]]
        then
            echo "Enter which file you want to open"
            read response
            declare -a v=("$@")
            if [[ $response -gt 0 && $response -le $# ]]
            then
                let response=$(expr $response - 1)
                echo $response
                viewF ${v[$response]}
            else
                echo "Wrong Input Detected"
            fi
        fi
    fi

}

#creates Directory
function createD {
    ~/fileSystemProject/cd $@
    if [[ $# -eq 1 ]]
    then
        echo "Do you want to open the folder you created in an editor?"
        read response
        if [[ ${response,,} =~ "y" ]]
        then
            viewD $1
        fi
    else
        echo "Is there any folder you created that you want to open?"
        read response
        if [[ ${response,,} =~ "y" ]]
        then
            echo "Enter which folder you want to open"
            read response
            declare -a v=("$@")
            if [[ $response -gt 0 && $response -le $# ]]
            then
                let response=$(expr $response - 1)
                echo $response
                viewD ${v[$response]}
            else
                echo "Wrong Input Detected"
            fi
        fi
    fi

}

#removes directory
function removeD {
    echo "Are you sure about deleting these folders?"
    read response
    if [[ $response =~ "y" ]]
    then
        ~/fileSystemProject/dd $@
    fi
}


#removes files
function removeF {
    echo "Are you sure about deleting these files?"
    read response
    if [[ $response =~ "y" ]]
    then
        ~/fileSystemProject/rmfile $@
    fi
}

#Lists everything in current directory
function listAll {
    ~/fileSystemProject/rd
}


#Gives the file properties
function fileProp {
    if [[ $# -eq 1 ]]
    then
        ~/fileSystemProject/fileprop $@
    fi
}

#Copies regular file
function copyF {
    ~/fileSystemProject/copy $@
}

#Copies regular file
function cutF {
    ~/fileSystemProject/cut $@
}
