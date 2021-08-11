# https://formulae.brew.sh/formula/watch  $ brew install watch
# $ brew install griprep

# [[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
# copy line to import .profile to bash or zsh

#########################################################
#########################################################
################## Comandline Alias #####################
#########################################################
#########################################################

# filters cmd history
# hs git commit

function hs() {
  cat ~/.zsh_history | rg $1
}

# some shorthands for terminal
alias dir='ls -la'
alias ls='ls -GFh -l'
alias cls='clear'
alias del='rm -rf'

#########################################################
#########################################################
########################## NVM ##########################
#########################################################
#########################################################

# if using bash, uncomment
# if using zsh, copy to .zscrc file

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

##########################################################
##########################################################
#### Run 'nvm use' automatically every time there's   ####
#### file in the directory. Also, revert to default   ####
#### version when entering a directory without .nvmrc ####
##########################################################
##########################################################

if [[ $PWD == $PREV_PWD ]]; then
  return
fi

PREV_PWD=$PWD
if [[ -f ".nvmrc" ]]; then
  VERSION=$(cat .nvmrc);
  nvm use $VERSION
  NVM_DIRTY=true
elif [[ $NVM_DIRTY = true ]]; then
  nvm use default
  NVM_DIRTY=false
fi

#########################################################
#########################################################
############## Custom Shorthand Commands ################
############### some shorthands for git #################
#########################################################
#########################################################


alias co='git checkout'
alias st='git status'
alias mrg='git merge'
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ba='git branch -a'
alias cob='git checkout -b'
alias gbr='git for-each-ref --format="%(committerdate) %09 %(authorname) %09 %(refname)" --sort=committerdate'
alias gbm='git for-each-ref --format="%(committerdate) %09 %(authorname) %09 %(refname)" --sort=committerdate | egrep "(^\*|Mário)"'
alias gcls='git fetch --all && git pull && git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

alias git:branch='function _f() { git for-each-ref --format="%(committerdate) %09 %(authorname) %09 %(refname)"  | egrep "(^\*|\"$1\")"; } ; _f'

#########################################################
#########################################################
############## Custom Shorthand Commands ################
############# some shorthands for Docker ################
#########################################################
#########################################################

alias dc:ls='docker ps'
alias dc:-ls='docker ps -a'
alias dc:bash='docker-compose exec app bash'
alias dc:docs='docker exec -it docs bash'
alias dc:down='docker-compose down'
alias dc:up='docker-compose up'
alias dc:build='docker-compose up --build'
alias dc:stop='docker stop $(docker ps -q)'
alias dc:clean='docker rm $(docker ps -a -q)'
alias dc:vol='docker volume ls'
alias dc:rmvol='docker volume rm $(docker volume ls -qf dangling=true)'
alias dc:restart='docker-compose down && docker-compose up'
alias dc:rebuild='docker-compose down && docker-compose up --build'

alias dc:start='yarn down && yarn start'
alias dc:stop='yarn down'


#########################################################
#########################################################
############## Custom Shorthand Commands ################
############# some shorthands for Zendesk ###############
#########################################################
#########################################################

alias zat:up='zat theme preview'
alias zat:kill='killall -9 ruby'


#########################################################
#########################################################
############## Custom Shorthand Commands ################
############ some shorthands for CREAC App ##############
#########################################################
#########################################################

alias app:start='sh ./scripts/start.sh'
alias app:serve='sh ./scripts/serve.sh'
alias app:install='sh ./scripts/install.sh'
alias app:docker='sh ./scripts/docker.sh'

#########################################################
#########################################################
######## Terminal colouring and git active branch #######
################ Git branch in prompt. ##################
#########################################################
#########################################################

# parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
# export PS1="\[\033[3;31m\]\u\[\033[m\]@\[\033[33;1m\]\h:\[\033[32m\]\w\[\033[31;21m\]\$(parse_git_branch)\[\033[m\]\n% "
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad
