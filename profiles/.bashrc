# Added for Cygwin that has ssh-pageant support via:
# https://github.com/cuviper/ssh-pageant
# ssh-pageant
# Works if keys are loaded in PAGEANT and PAGEANT is running
# eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME")

export HISTSIZE=1000000
export HISTFILESIZE=1000000000

# Added for git bash to start ssh-agent upon login
# Set up ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initializing new SSH agent..."
    touch $SSH_ENV
    chmod 600 "${SSH_ENV}"
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >> "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add ~/.ssh/id_rsa
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    # kill -0 $SSH_AGENT_PID 2>/dev/null || { # didn't work for Ubuntu for
    # Windows
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
