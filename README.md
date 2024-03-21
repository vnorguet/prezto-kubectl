# prezto-kubectl

Handy module for kubectl

## Features

* Completion
* Aliases
* kube-info (Work in Progress)

## Setup

1. Clone this repository in `contrib` folder `git clone https://github.com/vnorguet/prezto-kubectl.git ${ZDOTDIR:-$HOME}"/.zprezto/contrib/kubectl`
2. Enable into `~/.zpreztorc`

    ```shell
    zstyle ':prezto:load' pmodule \
      ... \
      kubectl
    ```

3. Reload your shell
