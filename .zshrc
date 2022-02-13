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
prompt='%F{#ffa1ca}%n%F{#ffe9aa} ♥ %F{#b1a1ff}%2~ %F{#ffe9aa}%#%f '
# git status on right
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{#b1a1ff}%b  %r%f'
zstyle ':vcs_info:*' enable git

# vim instead of vi
alias vi='vim'
# vim as editor
export VISUAL=vim
export EDITOR="$VISUAL"

# vim as sudo text editor
alias suvim='SUDO_EDITOR=vim sudoedit'

# default terminal
export TERMINAL='urxvt'
alias xterm='urxvt'

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
export TEXINPUTS=:$HOME/.latex-packages//

# todo.txt alias
alias todo='todo.sh -c'

# load nnn config
. ~/.config/nnn/config.sh
. ~/.config/nnn/quit-cd.sh

# add local binaries to path
export PATH=/home/vivi/.local/bin:$PATH
export PATH=/home/vivi/.cargo/bin:$PATH

# matlab to path
export PATH=/home/vivi/MATLAB/R2021b/bin:$PATH
# cli matlab
alias matcli="matlab -nodesktop -nosplash"

# peaclock with decent config location
alias peaclock="peaclock --config-dir ~/.config/peaclock"

# set pyenv root
export PYENV_ROOT="$HOME/.pyenv"
# autoninit pyenv
eval "$(pyenv init -)"
# make pipenv respect pyenv
export PIPENV_PYTHON=$PYENV_ROOT/shims/python

#------------------------------
# Window title
#------------------------------
autoload -Uz vcs_info
case $TERM in
  termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd () {
      vcs_info
      print -Pn "\e]0;%n%~\a"
    } 
    preexec () { print -Pn "\e]0;%n%~ ($1)\a" }
    ;;
  screen|screen-256color)
    precmd () { 
      vcs_info
      print -Pn "\e]83;title \"$1\"\a" 
      print -Pn "\e]0;$TERM - (%L) %n%~\a" 
    }
    preexec () { 
      print -Pn "\e]83;title \"$1\"\a" 
      print -Pn "\e]0;$TERM - (%L) %n%~ ($1)\a" 
    }
    ;; 
esac
