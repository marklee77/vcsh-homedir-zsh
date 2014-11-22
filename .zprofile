umask 077

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"

typeset -U path
path=("${HOME}/Programs/base/bin" $path)
path=("${HOME}/.local/bin" $path)
path=("${HOME}/.cabal/bin" $path)
path+="/usr/local/heroku/bin"

export EDITOR="vim"
export SVN_EDITOR="vim"
export BROWSER="firefox"
export TERMINAL="urxvtcd"
export BIBINPUTS=".:${HOME}/Academia/biblio"

export HISTFILE="${HOME}/.zhistory"
export HISTSIZE=1000
export SAVEHIST=800

# load profile files
ZSHPROFILEDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/profile.d
if [ -d "${ZSHPROFILEDIR}" ]; then
    for RCFILE in ${ZSHPROFILEDIR}/*; do
        source ${RCFILE}
    done
fi
