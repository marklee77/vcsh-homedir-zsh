umask 077

typeset -U path
path=("${HOME}/Programs/base/bin" $path)
path=("${HOME}/.local/bin" $path)

# load profile files
ZSHPROFILEDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/profile.d
if [ -d "${ZSHPROFILEDIR}" ]; then
    for RCFILE in ${ZSHPROFILEDIR}/*; do
        source ${RCFILE}
    done
fi
