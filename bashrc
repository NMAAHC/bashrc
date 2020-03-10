# set .bash_profile to read:
# if [ -f ~/.bashrc ]; then
# source ~/.bashrc
# fi

# ln -s /usr/local/bin/bashrc ~/.bashrc

Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

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
