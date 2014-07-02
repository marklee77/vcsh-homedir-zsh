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

export PATH="${HOME}/.cabal/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/Programs/base/bin:${PATH}"
export PATH="${HOME}/Programs/bin:${PATH}"

# load rc files
ZSHRCDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/config.d
if [ -d "${ZSHRCDIR}" ]; then
  for RCFILE in ${ZSHRCDIR}/*; do
    source ${RCFILE}
  done
fi

export EDITOR="vim"
export SVN_EDITOR="vim"
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

# Set ruby-info parameters.
zstyle ':prezto:module:ruby:info:version' format ' %F{white}%v%f'
export RPROMPT='${ruby_info[version]}${vcs_info_msg_0_}'

#source ~/.pyenv/versions/2.7.6/bin/aws_zsh_completer.sh
