# dotfiles

Clone into `~/dotfiles`.

Create backups in `~/dotfiles/backups/` and create symlinks. Won't override backups, aborts instead.
```sh
make install
```

Delete backups to allow new `make install`.
```sh
make delete
```
