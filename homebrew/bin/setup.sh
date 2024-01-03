#!/usr/bin/env bash

if [ $(uname) = Darwin ]; then
    if ! type brew &> /dev/null ; then
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Since Homebrew is already installed, skip this phase and proceed."
    fi
    brew bundle install --file=homebrew/Brewfile
fi
