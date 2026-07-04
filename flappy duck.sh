#!/bin/sh
printf '\033c\033]0;%s\a' flappy duck
base_path="$(dirname "$(realpath "$0")")"
"$base_path/flappy duck.x86_64" "$@"
