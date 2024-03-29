# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

display_time() {
    date --rfc-3339=ns | cut -b1-11 --complement | cut -b 13- --complement
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\n\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[0m\]\w \$(parse_git_branch)\[\033[00m\] \n$ '
else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='\n\[\033]0;:/home/Mike\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]\[\033[0m\]\n$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    PS1='\n\[\033]0;:/home/Mike\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]\[\033[0m\]\n$ '
    ;;
*)
    ;;
esac

PROMPT_COMMAND=prompt_update

function prompt_update() {
    NIX_BIT=$([ -n "$IN_NIX_SHELL" ] && echo " NIX-SHELL" || echo "")
    export PS1="\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[35m\]$(parse_git_branch)\[\033[36m\] $(display_time)$NIX_BIT\n\[\033[00m\]\$ "
}



###### fancy bash git prompt

# GIT_PROMPT_ONLY_IN_REPO=1
# source ~/.bash-git-prompt/gitprompt.sh

# thanks @archlinux/tmux
# TODO: have a global session to be attached to on login
if [[ -z "$MIKE_NO_TERMUX" ]]; then
    if hash tmux 2>/dev/null; then
        [[ $- != *i* ]] && return
        if [[ -z "$TMUX" && -z "$MIKE_VS_JS_DEBUG_TERMINAL" ]]; then
            # if no tmux session detected, start tmux
            exec tmux
            # TODO: unset the tmux variable on startup shell
        fi
    fi
fi

# don't next tmux over ssh
alias ssh='ssh -o SendEnv=TMUX'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -FGh --color=auto --hyperlink=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# disable ctrl-s default behavior
# TODO: setup ctrl-shift-r for forward-reverse-history-search
stty -ixon


# export PYTHONSTARTUP=$HOME/.pythonrc

# multiple shell history
export HISTCONTROL=ignoredups:erasedups
# shopt -s histappend
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# end multiple shell history


# utility for grepping git status output
alias gsg='git status --porcelain | cut -b 1-3 --complement | grep'
# utility for grepping git branch output
alias gbg='git branch | cut -b 1-2 --complement | grep'
# use these like so:
# g checkout $(gbg keyword); g add $(gsg file-keyword)

alias quote='sed '\''s/^/"/; s/$/"/'\'' '
alias unquote='sed '\''s/^"//; s/"$//'\'' '
alias linefy='tr " " "\n"'
alias despace="sed 's/ /\\\\ /g'"


######### aliases

alias g='git'
alias ggrep='git grep -n'
# TODO: make cross-platform with msys2
source /usr/share/bash-completion/completions/git
__git_complete g __git_main # turns out my stupid alias has been making me type more rather than less until now
alias s='sudo'

######### functions

function calc {
    python3 -c "print($*)"
}

function sys_name {
    return $(uname -s)
}

function bak {
    mv $(realpath $1) "$(realpath $1).bak"
}

function gbat {
    git show $1:$2 | bat --language ${2##*.}
}


######## Per-Platform Config?

# NOTE: if windows specific config gets too big, move to separate file and source
# NOTE: add machine-specific rc file

OS_NAME="$(uname -s)"
# NOTE: do I still need this on my msys2 machine?
if [ "${OS_NAME:1:5}" == "MINGW" ] || [ "${OS_NAME:1:4}" == "MSYS" ]; then
    alias getclip='cat /dev/clipboard'
    alias putclip='tee /dev/clipboard'
    # use winpty to correctly use interactive windows tools from mintty
    alias python3='winpty /d/programs/Python/Python36-32/python'
    alias prolog='winpty /d/programs/swipl/bin'
elif [ "${OS_NAME}" = "Darwin" ]; then
    # nothing
    alias getclip='pbpaste'
    alias putclip='pbcopy'
else
    alias getclip='xclip -selection c -o'
    alias putclip='xclip -selection c -i'
fi

set -o vi
export EDITOR=/usr/bin/vim

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DO_NOT_TRACK=1

# or \a
export BELL=$'\x07'

alias rmr=/usr/bin/rm
alias rm=trash
alias files=nautilus


