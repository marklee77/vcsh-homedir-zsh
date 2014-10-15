# gnome keyring
for VARVAL in $(gnome-keyring-daemon --components=ssh,gpg,secrets,pkcs11 --start); do
    export ${VARVAL}
done

# for some reason this doesn't seem to take in .xsession...
if [ -n "${DISPLAY}" ]; then
    setxkbmap gb -option inet:evdev -option caps:escape -option compose:menu
fi
