# gnome keyring --
for VARVAL in $(gnome-keyring-daemon --components=ssh,gpg,secrets,pkcs11 --start); do
    export ${VARVAL}
done
