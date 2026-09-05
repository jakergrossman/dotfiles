for rc in  ~/.bashrc.d/* ; do
    [ -f "$rc" ] && . "$rc"
done
unset rc

export PATH="$PATH:/tools/local/bin"
export PATH="$PATH:$HOME/go/bin"
. "$HOME/.cargo/env"
