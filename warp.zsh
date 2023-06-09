# Path to your oh-my-zsh installation.
export ZSH="/Users/timothybryant/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

###################USER CONFIGURATIONS##################

#########WARP ONLY#########
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
ZSH_THEME_RANDOM_QUIET=true # disable zsh theme loading
eval "$(starship init zsh)"
#########WARP ONLY#########

#########SOURCES#########
source "$HOME/.config/zsh/alias.zsh"
source <(kubectl completion zsh)
source /Users/timothybryant/.config/broot/launcher/bash/br
source "$HOME/scripts/pyinfra-complete.zsh"
source "$HOME/.config/sysbox-commands/sysbox-completion.zsh"
#########SOURCES#########

#########EXPORTS#########
export VAGRANT_DEFAULT_PROVIDER="parallels" # options: docker, hyperv, virtualbox, parallels, vmware_desktop, vmware_fusion
export KUBE_EDITOR="nano"
export EDITOR="nano"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/DevOps-Personal/go
export PATH=$PATH:$HOME/DevOps-Personal/go/bin/
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"   #For compilers to find openssl@1.1
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"   #For compilers to find openssl@1.1
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig" #For pkg-config to find openssl@1.1
export KUBECONFIG="/Users/timothybryant/.kube/config_k3s:/Users/timothybryant/.kube/config"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=/Users/timothybryant/.groundcover/bin:${PATH}
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
#########EXPORTS#########

#########EVALS#########
# eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
eval "$(register-python-argcomplete pipx)"
eval "$(direnv hook zsh)"
eval "$(rbenv init - zsh)"
#########EVALS#########

#########OTHER#########
# Added by nvm install -TAB
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added for pyenv/pyenv-virtualenv -TAB
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=~/.zfunc # for poetry completions
autoload -U +X bashcompinit && bashcompinit # 'bash' part removed on work mac -- could use `autoload -Uz compinit && compinit`
complete -o nospace -C /opt/homebrew/bin/bit bit
[ -f ~/.forgit/forgit.plugin.zsh ] && source ~/.forgit/forgit.plugin.zsh
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# Add my keys to the ssh agent; passwords are pulled from the keychain.
# The --apple-load-keychain option is unique to MacOS.
ssh-add --apple-load-keychain
ulimit -n 1048576 1048576 # for sapling source control (causes issues with Vagrant - use `ulimit -f unlimited` if needed)
ulimit -f unlimited # to overwrite the previous line limit of 1048576
# add-zsh-hook -Uz chpwd(){ source <(tea -Eds) }  # tea magic
export PATH="$HOME/.basher/bin:$PATH"   ## basher5ea843
eval "$(basher init - zsh)"             ## basher5ea843
#########OTHER#########

###################USER CONFIGURATIONS##################



