#
# Provides Kubectl aliases and functions.
#
# Authors:
#   Vincent Norguet <vincent.norguet@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[kubectl] )); then
  return 1
fi

# Load dependencies.
pmodload 'helper'

# Load 'run-help' function.
# autoload -Uz run-help-git

# Source module files.
source "${0:h}/alias.zsh"

# Load the kubectl completion code for zsh[1] into the current shell
source <(kubectl completion zsh)
# Set the kubectl completion code for zsh[1] to autoload on startup
kubectl completion zsh > "${fpath[1]}/_kubectl"
