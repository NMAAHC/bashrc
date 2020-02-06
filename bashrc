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

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
n_Purple='\e[45m'       # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

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

export PATH="~/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin"
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
	# brew reinstall --HEAD nmaahcmm
function nmaahcmm () {
	brew reinstall nmaahcmm
}
export -f nmaahcmm

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
