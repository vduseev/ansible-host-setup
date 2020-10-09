# Set up my SSH user

This is an ansible playbook that deploys a set of necessities I need to manage a linux server.

## Usage

### Install your usual tools

Installs `tmux`, `vim`, `jq`, `net-tools`, `nmap`, `ncdu`, `less`, `git`, `mosh`.

```shell
# All tools
ansible-playbook -i '<host>,' packages.yml 

# Skip mosh
ansible-playbook -i '<host>,' packages.yml --skip-tags mosh

```

### Install configs

#### Bash

* Bash aliases for `ls -la`, `kubectl`, `docker`, `docker-compose`, `git`.
* Custom Bash promt
* Default `SHELL`, `EDITOR`, and `VISUAL` variables

#### Tmux

* Prefix mapped to `Ctrl-a`
* base-index = 1
* center tabs
* history = 50k

```shell
ansible-playbook -i '<host>,' configs.yml
```

