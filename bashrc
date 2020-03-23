# set .bash_profile to read:

# if [ -f ~/.bashrc ]; then
# source ~/.bashrc
# fi

# set bashrc to read:

# if [ -f ~/.bashrc_colors ]; then
# source ~/.bashrc_colors
# fi

# set bashrc to read:
# if [ -f ~/.bashrc_alias]; then
# source ~/.bashrc_alias
# fi

# if [ -f ~/.bashrc_functions]; then
# source ~/.bashrc_functions
# fi

# create symlink so that .bashrc is linked to your bashrc file installed by hombrew
# ln -s /usr/local/bin/bashrc ~/.bashrc

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

<<<<<<< HEAD
=======
# shopt
# shopt -s globstar

# new aliases
alias ll='ls -lahG'
alias ls='ls -1'
alias home='cd ~'
alias up='cd ..'
alias h='history'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# command option aliases
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
alias sublime='open -a "Sublime Text"'
alias textedit='open -a TextEdit'
alias diffy='diff -y --suppress-common-lines --width=250'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias brewUp='brew update && brew upgrade && brew doctor'
alias treeL='tree -RapugD --si --du'

# typo aliases
alias sulbime='sublime'

# functions
	# brew install HEAD nmaahcmm
function nmaahcmm () {
	brew install --HEAD nmaahcmm
}
export -f nmaahcmm

# functions
	# brew install HEAD bashrc
function nmaahcbashrc () {
	brew install --HEAD bashrc
}
export -f nmaahcbashrc

	# make directories named after files
function makedirfile () {
	for file in *.*; do
    mkdir -p "${file%.*}";
done
}
export -f makedirfile

	# rsync transfer for DAMS uploads
function rsyncDAMS () {
	rsync -avvPhi --no-p --stats "${@}"
}
export -f rsyncDAMS

	# general rsync transfer
function rsyncT () {
	rsync -avvPhi --stats "${@}"
}
export -f rsyncT

	# general rsync transfer with deletion of source files
function rsyncD () {
	rsync -avvPhi --remove-source-files --stats "${@}"
}
export -f rsyncD

	# remove hidden files from a location
function removehidden () {
	if [ -z "${1}" ] ; then
		cowsay "no argument provided. tootles."
	else
		find "${1}" -name ".*" -exec rm -vfr {} \;
		cowsay "hidden files removed. tootles."
	fi
}
export -f removehidden

	# sort text in a file by column 2 and overwrite file ; column separator is a space.
function sortk2 () {
	if [ -z "${1}" ]; then
		cowsay "no argument provided. tootles."
	else
		sort -k 2 -o "${1}" "${1}"
		cowsay "file sorting is done. tootles."
	fi
}
export -f sortk2


function shortinfo() {
   mediainfo --Inform="General;FileName=%FileNameExtension%\nFileSize=%FileSize%\nDuration=%Duration%" "${@}";
   mediainfo --Inform="Video;Resolution=Codec=%CodecID%" "${@}";
}

export -f shortinfo
>>>>>>> 3c4e6df8975835ef5e973c3b393f17e9a9213ed8
