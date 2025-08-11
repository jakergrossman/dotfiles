# dotfiles
my system configuration files

## packages
- shell: shell environment
  - minimal `bash`
  - git

- tmux: terminal multiplexer
- vim: [neovim](https://github.com/neovim/neovim) and [vim](https://github.com/vim/vim)
- emacs: [emacs](https://www.gnu.org/software/emacs/) configuration

## submodules
Some configuration options depend on git submodules. Either use `--recursive` when cloning
or run `git submodule init && git submodule update` in the root of the repository after cloning.

## installation using gnu stow
```console
$ stow package1 package2 ...
```

## license
public domain with MIT fallback (see [LICENSE](/LICENSE))
