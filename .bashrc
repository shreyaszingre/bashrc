# include lines between ### exclusive into ~/.bashrc to link this file
# ###
# include .bashrc if it exists
# if [ -f $HOME/.bash_runtime/.bashrc ]; then
#    . $HOME/.bash_runtime/.bashrc
#    echo "~/.bash_runtime/.bashrc loaded"
# fi
# ###

#ssh-pageant
eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME")

export HISTSIZE=1000000
export HISTFILESIZE=1000000000
