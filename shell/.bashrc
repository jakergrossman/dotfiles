for rc in  ~/.bashrc.d/* ; do
    [ -f "$rc" ] && . "$rc"
done
unset rc
