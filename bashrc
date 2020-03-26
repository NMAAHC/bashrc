# set .bash_profile to read:

# if [ -f ~/.bashrc ]; then
# source ~/.bashrc
# fi

# set bashrc to read:

if [ -f ~/.bashrc_colors ]; then
source ~/.bashrc_colors
fi

if [ -f ~/.bashrc_alias]; then
source ~/.bashrc_alias
fi

if [ -f ~/.bashrc_functions]; then
source ~/.bashrc_functions
fi

# create symlink so that .bashrc is linked to your bashrc file installed by hombrew
# ln -s /usr/local/bin/bashrc ~/.bashrc
# ln -s /usr/local/bin/bashrc_alias ~/.bashrc_alias
# ln -s /usr/local/bin/bashrc_colors ~/.bashrc_colors
# ln -s /usr/local/bin/bashrc_functions ~/.bashrc_functions

MYNAME='NMAAHC Media Conservation'
export MYNAME

printf "${BRed}Hello ${MYNAME}!\n"
printf "${BWhite}Be All That You Can Be Today!\n"
printf "${BBlue}Let's Go!${Color_Off}\n"

print_before_the_prompt () {
    printf "\n$BIYellow%s\n${Color_Off}" "$PWD"
}

PROMPT_COMMAND=print_before_the_prompt

export PS1="\[$BICyan\]≈:≈\[${Color_Off}\] "

export LESS='-MN'

# must use double quotes here so Unix expands ${PATH} and doesn't read it as a directory
# default OS X PATH: /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin

export PATH="/usr/local/bin:~/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin"
export EDITOR="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
# history modifications
export HISTSIZE=1000 #500 is default
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p ' # using strftime format
export HISTCONTROL=ignoreboth # ignoreups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll"

# ls colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# shopt
# shopt -s globstar