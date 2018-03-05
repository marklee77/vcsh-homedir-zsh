[ -f /etc/profile ] && source /etc/profile

umask 077

export XDG_CONFIG_HOME="${HOME}/.config"

# workaround for bug in vcsh on ubuntu 14.04...
export XDH_CONFIG_HOME="${XDG_CONFIG_HOME}"

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_DATA_DIRS="${XDG_DATA_HOME}:${XDG_DATA_DIRS}"

typeset -U path
path=("${HOME}/Programs/bin" $path)
path=("${HOME}/Programs/base/bin" $path)
path=("${HOME}/Programs/base/sbin" $path)
path=("${HOME}/.cabal/bin" $path)
path=("${HOME}/.local/bin" $path)

fpath=(${HOME}/Programs/base/share/zsh/site-functions ${HOME}/.config/zsh/completion.d $fpath)

export MANPATH="${HOME}/Programs/base/man:${HOME}/Programs/base/share/man:$(man -w)"

export LD_LIBRARY_PATH="${HOME}/Programs/base/lib"

export EDITOR="vi"
export SVN_EDITOR="${EDITOR}"
export VISUAL="${EDITOR}"
export BROWSER="firefox"
export TERMINAL="urxvtcd"
export BIBINPUTS=".:${HOME}/Academia/biblio"

export HISTFILE="${HOME}/.zhistory"
export HISTSIZE=5000
export SAVEHIST=5000

export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# load profile files
ZSHPROFILEDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/profile.d
if [ -d "${ZSHPROFILEDIR}" ]; then
    for RCFILE in ${ZSHPROFILEDIR}/*; do
        source ${RCFILE}
    done
fi

# this should probably be in its own project...
export GOPATH=${HOME}/Projects/go
path=("${GOPATH}/bin" $path)
