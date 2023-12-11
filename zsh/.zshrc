# Plugin Manager
## load
source $ZPLUG_HOME/init.zsh

# color
autoload -Uz colors && colors

# Use Japanese file name
setopt print_eight_bit
# Use '#' as command symbol
setopt interactive_comments
# Excute cd only directory name
setopt auto_cd
# Synchronize zsh_history
setopt share_history

# Prompt
## setting git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
## setting k8s
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
## setting prompt
PS1='[%B%F{red}%n@%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f$(kube_ps1)
%F{yellow}$%f '

# Completions
## zsh-completions
if type brew &>/dev/null; then
    readonly brewpath=$(brew --prefix)
    # Completion
    FPATH=$brewpath/share/zsh-completions:$FPATH
    autoload -Uz compinit && compinit -u

    # auto suggest
    source $brewpath/share/zsh-autosuggestions/zsh-autosuggestions.zsh

    # sysntax highlight
    source $brewpath/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
FPATH=$HOME/.config/zsh/completions:$FPATH
## Match lower and upper letter
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## refresh for new installed command
zstyle ':completion:*:commands' rehash 1

# Alias
source /usr/local/share/zsh-abbr/zsh-abbr.zsh
alias ls='ls -FG'
abbr -S -q la='ls -a'
abbr -S -q ll='ls -l'
abbr -S -q lla='ls -la'
abbr -S -q mkdir='mkdir -p'
abbr -S -q uuid='uuidgen | tr "[:upper:]" "[:lower:]"'

abbr -S -q gst='git status'
abbr -S -q ga='git add'
abbr -S -q gap='git add -p'
abbr -S -q giffc='git diff --cached'
abbr -S -q gcm='git commit -m'
abbr -S -q gul='git pull --rebase --autostash'
abbr -S -q gsh='git push'
abbr -S -q gco='git checkout'
abbr -S -q ggraph='git log --graph --color --oneline --all'
abbr -S -q grss='git restore --staged'

abbr -S -q dctx='docker context'
abbr -S -q k='kubectl'
abbr -S -q kx='switch'
abbr -S -q crestart='colima stop && colima start'
abbr -S -q lnsock='sudo ln -s -F /Users/yuya.yagai/.colima/default/docker.sock /var/run/docker.sock'

abbr -S -q aconn='/Users/yuya.yagai/sources/personal/bin/anyconnect connect'
abbr -S -q adisconn='/Users/yuya.yagai/sources/personal/bin/anyconnect disconnect'
abbr -S -q ast='/Users/yuya.yagai/sources/personal/bin/anyconnect status'
abbr -S -q opening='colima stop && colima start; /Users/yuya.yagai/sources/personal/bin/anyconnect connect'
abbr -S -q fin='colima stop && /Users/yuya.yagai/sources/personal/bin/anyconnect disconnect'

# 3rd party tools
## sdkman
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
## colima
export DOCKER_HOST=unix://$HOME/.colima/default/docker.sock
## mysql-client
export PATH=$PATH:/usr/local/opt/mysql-client/bin
## asdf
. /usr/local/opt/asdf/libexec/asdf.sh
## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
## rbenv
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"
## k8s switch
INSTALLATION_PATH=$(brew --prefix switch) && source $INSTALLATION_PATH/switch.sh


# Functions
## tarball without mac specified files
tgz() {
    env COPYFILE_DISABLE=1 tar zcvf $1 --exclude=".DS_Store" ${@:2}
}
