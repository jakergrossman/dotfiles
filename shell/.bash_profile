for rc in /etc/bashrc /etc/bash.bashrc ~/.bashrc ; do
    [ -f "$rc" ] && . "$rc"
done
unset rc
. "$HOME/.cargo/env"
