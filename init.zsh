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

# Source module files.
source "${0:h}/alias.zsh"

# Load the kubectl completion code for zsh[1] into the current shell
source <(kubectl completion zsh)
