#!/usr/bin/env bash

set -eu

source bin/utils.sh
readonly working_dir=$(pwd)/fish
readonly fish_base_dir=$XDG_CONFIG_HOME/fish

mkdir -p $fish_base_dir/functions
mkdir -p $fish_base_dir/completions

# install plugins
symbolicLink $working_dir/fish_plugins $fish_base_dir/.
echo "install plugins with fisher..."
fish -c "cd ${working_dir} && curl -sL git.io/fisher | source && fisher update"

# setup functions
symbolicLink $working_dir/functions/fish_greeting.fish $fish_base_dir/functions/.
symbolicLink $working_dir/functions/fish_mode_prompt.fish $fish_base_dir/functions/.
symbolicLink $working_dir/functions/fish_prompt.fish $fish_base_dir/functions/.

# setup completions
echo "Completion: orbstack"
if test -f "$fish_base_dir/completions/orbstack.fish"; then
  echo "orbstack completion already exists."
else
  orbctl completion fish > $fish_base_dir/completions/orbstack.fish
fi

# setup base config
symbolicLink $working_dir/config.fish $fish_base_dir/.
