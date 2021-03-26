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
    xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\W '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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



GIT_PROMPT_ONLY_IN_REPO=1 # Use the default prompt when not in a git repo.
GIT_PROMPT_FETCH_REMOTE_STATUS=0 # Avoid fetching remote status
# GIT_PROMPT_SHOW_UPSTREAM=0 # Don't display upstream tracking branch
# GIT_SHOW_UNTRACKED_FILES=no # Don't count untracked files (no, normal, all)
# GIT_PROMPT="{PathShort}{Branch}{Remote}{Modified}{Staged}{Clean}"
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1 # Use the default prompt when not in a git repo.
    # GIT_PROMPT_FETCH_REMOTE_STATUS=0 # Avoid fetching remote status
    # GIT_PROMPT_SHOW_UPSTREAM=0 # Don't display upstream tracking branch
    # GIT_SHOW_UNTRACKED_FILES=no # Don't count untracked files (no, normal, all)
    # GIT_PROMPT="{PathShort}{Branch}{Remote}{Modified}{Staged}{Clean}"
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

# Cuda

# in file python runing: 
# os.environ['CUDA_VISIBLE_DEVICES'] = '0'
export CUDA_HOME="/usr/local/cuda-10.1"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$LD_LIBRARY_PATH"
export PATH="$CUDA_HOME/bin:$PATH"

# tensorRT
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/media/data/Dowload/TensorRT-6.0.1.5/lib

# Robotics
# alias kill_ros="pgrep -f gzserver | xargs kill -9 & pgrep -f gzclient | xargs kill -9 & killall -9 rosmaster & killall -9 roscore & killall -9 rviz"
# alias kill_gazebo="killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient"
#source /opt/ros/melodic/setup.bash
# source ~/catkin_ws/devel/setup.bash

# export TURTLEBOT3_MODEL=burger
#source /media/data/catkin_ws/beetlebot_simulation/devel/setup.bash


alias cdd="cd /media/data"
alias cddc="cd /media/data/catkin_ws"
alias project='cd /media/data/project'

alias venv3="source /media/data/venv3/bin/activate"
alias KYC='source /media/data/project/KYC/KYC/bin/activate'
alias tfx-env="source ~/tfx-env/bin/activate"
alias CAP='source /media/data/project/CAP/CAP/bin/activate'
alias aichan='source /media/data/project/AIC_gov/aichan/bin/activate'
alias tf2='source /media/data/tf2/bin/activate'
alias yolo='source venv_yolo/bin/activate'
# for project FSA-Net
# KERAS_BACKEND=tensorflow
# export PYTHONPATH=$PYTHONPATH:'/media/data/project/ad_dy/src/person'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
