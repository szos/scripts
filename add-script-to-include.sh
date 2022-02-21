#!/bin/sh

script=""
function=""
link=""

while getopts "s:l:f:" opt;
do
    case "$opt" in
        s) script="$OPTARG"
           ;;
        l) link="$OPTARG"
           ;;
        f) function="$OPTARG"
           ;;
    esac
done

if [ "$script" = "" ]; then
    echo "Script argument (-s) is missing"
    exit 1
fi

if [ "$function" != "" ]; then
    cmdstr='    command "${make_shell_script_include_dir}/'
    fstr="${script}\""
    argstr='"$@"'
    
    echo "${function}() {" >> include.sh
    echo "${cmdstr}${fstr} ${argstr}" >> include.sh
    echo "}" >> include.sh
    echo "" >> include.sh
fi

if [ "$link" != "" ]; then
    echo "${script} ${link}" >> link-scripts-links 
fi

# script="$1"

# function="$2"

# linked_name="$3"



# if [ linked_name = "" ]; then
#     echo "not linking script"
# else
#     echo "${script} ${linked_name}" >> link-scripts-links 
# fi
