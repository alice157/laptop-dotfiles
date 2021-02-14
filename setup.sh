#!/usr/bin/env bash

base=(
    zsh
)

useronly=(
    zsh 
)

stowit() {
    usr=$1
    app=$2
    # -v verbose
    # -R recursive
    # -t target
    stow -v -R -t "${usr}" "${app}"
}

echo ""
echo "Stowing apps for user: ${whoami}"

# install apps for local users and root

for app in ${base[@]}; do
    stowit "${HOME}" $app
done

# non-root
for app in ${useronly[@]}; do
    if [[ ! `whoami` = *"root"* ]]; then
        stowit "${HOME}" $app
    fi
done

echo ""
echo "Done stowing"
