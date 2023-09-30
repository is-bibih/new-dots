# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'l:|=* r:|=*' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/vivi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install

# set prompt
prompt='%F{#ffa1ca}%n%F{#ffe9aa} ♥  %F{#b1a1ff}%2~ %F{#ffe9aa}%#%f '
# git status on right
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{#b1a1ff}%b  %r%f'
zstyle ':vcs_info:*' enable git

# nvim instead of vi
alias vi='nvim'
# vim as editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# vim as sudo text editor
alias suvim='SUDO_EDITOR=vim sudoedit'

# default terminal
export TERMINAL='alacritty'
alias xterm='alacritty'

# colored outputs 
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
export LESS='-R --use-color -Dd+r$Du+b'

# alias for dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# remove latex compilation files
alias latexclean='rm -r ./*.nav ./*.snm ./*.synctex.gz ./*_minted*'
# add folder for custom classes/packages
export TEXINPUTS=:$HOME/gits/latex-templates//

# todo.txt alias
alias t='todo.sh -t -N -a -d .config/todo/todo.cfg'
alias vt='nvim ~/grive/todo/todo.txt'
alias vtf='nvim ~/grive/todo/future.todo.txt'

# load nnn config
. ~/.config/nnn/config.sh
. ~/.config/nnn/quit-cd.sh

# add local binaries to path
export PATH=/home/vivi/.local/bin:$PATH
export PATH=/home/vivi/.cargo/bin:$PATH

# matlab to path
export PATH=/home/vivi/MATLAB/R2022a/bin:$PATH
export LD_PRELOAD=/lib64/libfreetype.so
# cli matlab
alias matcli="matlab -nodesktop -nosplash -softwareopengl"

## set pyenv root
#export PYENV_ROOT="$HOME/.pyenv"
## autoninit pyenv
#eval "$(pyenv init -)"
## make pipenv respect pyenv
#export PIPENV_PYTHON=$PYENV_ROOT/shims/python

# node version manager (with faster custom startup)
. ~/scripts/nvm-lazy-load.sh

