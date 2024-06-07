Welcome to my dotfiles.

Things are still in progress, will update this with a proper tour soon.

Keyboard configuration is located in `./extras/minivan-kb`

Installation of programs:
```bash
$ ssh-keygen -t ed25519 -C "<EMAIL>"
$ cat ~/.ssh/id_ed25519.pub  # Add to https://github.com/settings/ssh/new
$ git clone git@github.com:BlakeJC94/.dots.git ~/.dots
$ cd ~/.dots
$ sudo bash prepare.sh
$ bash install.sh
```
