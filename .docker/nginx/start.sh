#!/bin/sh

set -e

# Replace variables $ENV{<environment varname>}
function ReplaceEnvironmentVariable() {
    grep -rl "\$ENV{\"$1\"}" $3|xargs -r \
        sed -i "s|\\\$ENV{\"$1\"}|$2|g"
}

# Replace all variables
for _curVar in `env | awk -F = '{print $1}'`;
do
    _curVarName=$(eval "echo \$$_curVar")
    # awk has split them by the equals sign
    # Pass the name and value to our function
    ReplaceEnvironmentVariable ${_curVar} ${_curVarName} /etc/nginx/conf.d/*
done

exec "$@"