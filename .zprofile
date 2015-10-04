umask 077

export XDG_CONFIG_HOME="${HOME}/.config"
# workaround for bug in vcsh on ubuntu 14.04...
export XDH_CONFIG_HOME="${XDG_CONFIG_HOME}"

export XDG_DATA_HOME="${HOME}/.local/share"

typeset -U path
path=("${HOME}/Programs/bin" $path)
path=("${HOME}/Programs/base/bin" $path)
path=("${HOME}/.cabal/bin" $path)
path=("${HOME}/.local/bin" $path)

export MANPATH="${HOME}/Programs/base/man:${HOME}/Programs/base/share/man:$(man -w)"

export EDITOR="vim"
export SVN_EDITOR="vim"
export BROWSER="firefox"
export TERMINAL="urxvtcd"
export BIBINPUTS=".:${HOME}/Academia/biblio"

export HISTFILE="${HOME}/.zhistory"
export HISTSIZE=1000
export SAVEHIST=800

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
export GOROOT=${HOME}/Programs/base/apps/go
path+="${HOME}/Projects/go/bin"
