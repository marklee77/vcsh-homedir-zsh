#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
# load rc files
ZSHRCDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/config.d
if [ -d "${ZSHRCDIR}" ]; then
  for RCFILE in ${ZSHRCDIR}/*; do
    source ${RCFILE}
  done
fi

# FIXME: move to tmux repo...
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

export EDITOR="vim"
export BROWSER="firefox"
export TERMINAL="urxvtcd"
export BIBINPUTS=".:${HOME}/Academia/biblio"

# needed for Xdbus for some reason
if [ -f ~/.Xdbus ]; then
    . ~/.Xdbus
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

bindkey "^R" history-incremental-search-backward

#source ~/.pyenv/versions/2.7.6/bin/aws_zsh_completer.sh
