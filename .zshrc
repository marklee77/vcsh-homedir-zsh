ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

plugins=(battery command-not-found compleat git git-extras python svn vi-mode)

source $ZSH/oh-my-zsh.sh

# spawn a new tmux session and reconnect to any accidentally unattached
# sessions...
if [ -z "${TMUX}" ] && which tmux >/dev/null; then
    TMUX_FIRST_UNATTACHED=$(tmux ls | grep -v "(attached)" | cut -d: -f1)
    if [ -n "${TMUX_FIRST_UNATTACHED}" ]; then
        exec tmux attach -t ${TMUX_FIRST_UNATTACHED}
    else
        exec tmux
    fi
fi

export PATH="/usr/local/cuda-5.5/bin:${PATH}"
export LD_LIBRARY_PATH="/usr/lib/nvidia-current:/usr/lib/nvidia-current/vdpau:/usr/lib32/nvidia-current:/usr/lib32/nvidia-current/vdpau:/usr/local/cuda-5.5/lib64:${LD_LIBRARY_PATH}"

export PATH="${HOME}/.cabal/bin:${HOME}/.pyenv/bin:${HOME}/.rbenv/bin:${HOME}/.nodenv/bin:${PATH}"
export PATH="${HOME}/Programs/bin:${HOME}/Programs/base/bin:${HOME}/.local/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/Programs/base/lib:${LD_LIBRARY_PATH}"

export GRB_LICENSE_FILE="/home/marklee/.config/gurobi/gurobi.lic"

unsetopt correct_all

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"

export EDITOR="vim"
export BROWSER="firefox"
export TERMINAL="urxvtcd"

export BIBINPUTS=".:${HOME}/Academia/biblio"

# ruby env
eval "$(rbenv init -)"

# python env
export WORKON_HOME="${HOME}/.pyenv/versions"
export VIRTUAL_ENV_DISABLE_PROMPT="y"
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
} 
eval "$(pyenv init -)"
pyenv virtualenvwrapper

eval "$(nodenv init -)"

# needed for Xdbus for some reason
if [ -f ~/.Xdbus ]; then
    . ~/.Xdbus
fi

alias mame='/usr/games/mame -rp ${HOME}/Mame -audiodriver alsa'

# prompt changes to add virtualenv info
export PS1='%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%I:%M:%S]} %{$fg[white]%}[%~]%{$reset_color%} %{$fg[magenta]%}$(virtualenv_info)%{$reset_color%}$(git_prompt_info) %{$fg[blue]%}->%{$fg_bold[blue]%} 
%#%{$reset_color%} '

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

bindkey "^R" history-incremental-search-backward

#source ~/.pyenv/versions/2.7.6/bin/aws_zsh_completer.sh
