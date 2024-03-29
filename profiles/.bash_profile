# BASH PROMPT CUSTOMIZER TOOL OBTAINED FROM THIS SITE
# http://ezprompt.net/

# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

export PS1="\[\e[36m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\]: \[\e[31m\]\D{%a %b %d %Y %H:%M:%S}\[\e[m\] \[\e[33m\]\w\[\e[m\] \[\e[35m\]\`parse_git_branch\`\[\e[m\]\n\[\e[37m\]\\$\[\e[m\] "

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# if [ -f ~/.bash_runtime/.git-completion.bash ]; then
#   . ~/.bash_runtime/.git-completion.bash
# fi

alias ls='ls -laGFh --color=auto'
alias gitfs='git fetch; git status'
alias tr='tree -L 3'

echo "Welcome, Shreyas!"

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi
