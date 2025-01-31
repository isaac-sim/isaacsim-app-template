#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -n "$ZSH_VERSION" ]; then
    SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
    export BASH_SOURCE=$SCRIPT_DIR/setup_python_env.sh
fi
MY_DIR="$(realpath -s "$SCRIPT_DIR")"
# path=$SCRIPT_DIR
# while [[ $path != / ]];
# do
    
#     if ! find "$path" -maxdepth 1 -mindepth 1 -iname "_build" -exec false {} +
#     then
#         break
#     fi
#     # Note: if you want to ignore symlinks, use "$(realpath -s "$path"/..)"
#     path="$(readlink -f "$path"/..)"
    
# done
# build_path=$path/_build
export CARB_APP_PATH=$SCRIPT_DIR/kit
export EXP_PATH=$MY_DIR/apps
export ISAAC_PATH=$MY_DIR
. ${MY_DIR}/setup_python_env.sh
