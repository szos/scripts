#!/bin/sh

if [ -L "$0" ]; then
    make_shell_script_include_dir="$(dirname $(readlink -f $0))"
else
    make_shell_script_include_dir="$(dirname $0)"
fi

echo_stderr() {
    echo "$@" >&2
}

notify_swm() {
    command "${make_shell_script_include_dir}/notify-stump.sh" "$@"
}

