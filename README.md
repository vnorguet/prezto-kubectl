# prezto-kubectl

> Inspired from : <https://github.com/prezto-contributions/prezto-kubectl>

[Kubectl](https://github.com/kubernetes/kubectl) module for the
[Prezto](https://github.com/sorin-ionescu/prezto) Zsh configuration framework.

## Installation

1. Set the module directory using `:prezto:load:pmodule-dirs` setting in `~/.zpreztorc`:

    ```shell
    zstyle ':prezto:load' pmodule-dirs $HOME/.zprezto-contrib
    ```

2. Clone this repository:

    ```shell
    git clone https://github.com/vnorguet/prezto-kubectl.git ~/.zprezto-contrib/kubectl
    ```

3. Add the module to the Prezto modules to load in your `~/.zpreztorc`:

    ```shell
    zstyle ':prezto:load' pmodule \
      kubectl
    ```

## Improvements

1. Add all aliases from: <https://github.com/ahmetb/kubectl-aliases>
2. Add completions
3. Add kube-info
