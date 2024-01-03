# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

# abbr
abbr -a lla 'ls -la'
abbr -a uuid 'uuidgen | tr "[:upper:]" "[:lower:]"'

abbr -a gst 'git status'
abbr -a ga 'git add'
abbr -a gap 'git add -p'
abbr -a giff 'git diff'
abbr -a giffc 'git diff --cached'
abbr -a gcm 'git commit -m'
abbr -a gul 'git pull --rebase --autostash'
abbr -a gsh 'git push'
abbr -a gco 'git checkout'
abbr -a ggraph 'git log --graph --color --oneline --all'
abbr -a grss 'git restore --staged'
abbr -a gpatch 'git add -A && git diff --cached > ~/tmp/diff/diff_$(date +%Y_%m_%d_%H%M%S).patch && echo "Created: ~/tmp/diff_$(date +%Y_%m_%d_%H%M%S).patch" && git restore --staged $(git rev-parse --show-toplevel)'

abbr -a lnsock 'sudo ln -s ~/.colima/default/docker.sock /var/run/.'
abbr -a dctx 'docker context'
abbr -a k 'kubectl'
abbr -a kx 'kubeswitch'
abbr -a kns 'kubeswitch ns'
abbr -a kc 'kubeswitch colima'
abbr -a kk 'kubeswitch kind-kind'
abbr -a ko 'kubeswitch orbstack'
abbr -a crestart 'colima stop && colima start'
abbr -a lnsock 'sudo ln -s -F ~/.colima/default/docker.sock /var/run/docker.sock'

abbr -a aconn '~/sources/personal/bin/anyconnect connect'
abbr -a adisconn '~/sources/personal/bin/anyconnect disconnect'
abbr -a ast '~/sources/personal/bin/anyconnect status'

abbr -a opening 'colima stop && colima start; ~/sources/personal/bin/anyconnect connect'
abbr -a fin 'colima stop && ~/sources/personal/bin/anyconnect disconnect'

abbr -a restclient 'code ~/sources/personal/rest_client'

# key bindings
## fzf
bind ç __fzf_cd

# envrionment variables
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH "$PATH":"$HOME/.pub-cache/bin"

# asdf
source /usr/local/opt/asdf/libexec/asdf.fish
switch (uname)
case Darwin
    source /usr/local/opt/asdf/libexec/asdf.fish
case Linux
    source $HOME/.asdf/asdf.fish
end

# kubeswitch
switcher init fish | source
