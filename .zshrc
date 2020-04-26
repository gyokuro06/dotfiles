# Use color on terminal
autoload -Uz colors
colors

# Environmental valuable
export LANG=ja_JP.UTF-8

# Setting history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Prompt
PROMPT="%{$fg[green]%}%n%{$reset_color%}@%{$fg[red]%}%m %{$reset_color%}%1~ %#"

# Completion
autoload -Uz compinit
compinit

# Match lower and upper letter
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Complement after sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# Complement after ps
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# Use Japanese file name
setopt print_eight_bit

# Don't exit zsh with Ctrl+D
setopt ignore_eof

# Use '#' as command symbol
setopt interactive_comments

# Excute cd only directory name
setopt auto_cd

# Synchronize zsh_history
setopt share_history

# Alias
alias ls="ls -G"
alias la="ls -aG"
alias ll="ls -lG"
alias mkdir="mkdir -p"
alias sudo="sudo "
alias pdf="open -a Preview"
alias finda="open ."

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/Cellar/vim/8.0.0134_2/bin/vim:$PATH"

source ~/.bash_profile


## For Homebrew
typeset -U path cdpath fpath manpath

typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path

path=(~/bin(N-/) /usr/local/bin(N-/) ${path})

PATH="/Users/yuya/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/yuya/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/yuya/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/yuya/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/yuya/perl5"; export PERL_MM_OPT;

# nvm
#[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
#nvm use default
#npm_dir=${NVM_PATH}_modules
#export NODE_PATH=$npm_dir
#source ~/.nvm/nvm.sh
export PATH="/usr/local/opt/qt/bin:$PATH"
