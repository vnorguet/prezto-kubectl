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
# source "${0:h}/alias.zsh"

# Load the kubectl completion code for zsh[1] into the current shell
source <(kubectl completion zsh)

# Add krew to PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# add aliases collection like 'kgpo' for 'kubectl get pods` from https://github.com/ahmetb/kubectl-aliases
[ ! -f ${0:h}/aliases.sh ] && curl -fsSL "https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases" > ${0:h}/aliases.sh
alias k='kubectl'
source ${0:h}/aliases.sh

# set default namespace
alias kn='kubectl config set-context --current --namespace'
# get events sorted by last timestamp
alias kgel='kubectl get events --sort-by=.lastTimestamp'
# get events sorted by creation timestamp
alias kgec='kubectl get events --sort-by=.metadata.creationTimestamp'
# get pod's descending events
function kger() { kubectl get events --sort-by=.lastTimestamp --field-selector involvedObject.name="$@" }
# get 'real' all
alias kgworld='kubectl get $(kubectl api-resources --verbs=list --namespaced -o name | paste -sd ",")'
# display all nodes resources request and limits
alias kgnr="k get nodes --no-headers | awk '{print \$1}' | xargs -I {} sh -c 'echo {} ; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo '"
# start a debug pod (including lots of troubleshooting tools)
alias kdebug="kubectl -n default run debug-$USER --rm -it --tty --image leodotcloud/swiss-army-knife:v0.12 --image-pull-policy=IfNotPresent -- bash"
# get pod's containers list
function kgpc() { kubectl get pod -o jsonpath="{.spec.containers[*].name}" "$@" && echo "" }
# ping a service, ex: 'kping whoami:8080'
alias kping='kubectl run httping -it --image bretfisher/httping --image-pull-policy=IfNotPresent --rm=true --'
# get existing pod's yaml without forbidden fields, ex: 'kyaml pod whoami'
function kyaml() { kubectl get "$@" -o yaml | kubectl-neat }
# display and delete failed pods in current namespace
alias krmfailed='kubectl delete pods --field-selector=status.phase=Failed'

# Get contexts
alias kcgc='kubectl config get-contexts'
# Switch context
alias kcuc='kubectl config use-context'
