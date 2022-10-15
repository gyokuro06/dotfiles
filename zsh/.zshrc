# Use color on terminal
autoload -Uz colors && colors

# Setting history
export HISTFILE="$XDG_STATE_HOME/.zsh_history"
export HISTSIZE=12000
export SAVEHIST=10000

# Prompt
## setting git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
## setting prompt
PS1='[%B%F{red}%n@%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '

# Completion
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit && compinit -u
fi

# Match lower and upper letter
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# refresh for new installed command
zstyle ':completion:*:commands' rehash 1

# vim
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/.vimrc

# Alias
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias mkdir="mkdir -p"
alias sudo="sudo "
alias pdf="open -a Preview"
alias finda="open ."

# Use Japanese file name
setopt print_eight_bit
# Use '#' as command symbol
setopt interactive_comments
# Excute cd only directory name
setopt auto_cd
# Synchronize zsh_history
setopt share_history

# 3rd party tools
## asdf
. /usr/local/opt/asdf/libexec/asdf.sh
## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
## sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
## colima
export DOCKER_HOST=unix:///Users/yuya/.colima/default/docker.sock
## mysql-client
export PATH=$PATH:/usr/local/opt/mysql-client/bin

# functions
## tarball without mac specified files
tgz() {
    env COPYFILE_DISABLE=1 tar zcvf $1 --exclude=".DS_Store" ${@:2}
}