################################################
################################################
##################### NVM ######################
################################################
################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Run 'nvm use' automatically every time there's
# a .nvmrc file in the directory. Also, revert to default
# version when entering a directory without .nvmrc

enter_directory() {
    if [[ $PWD == $PREV_PWD ]]; then
        return
    fi

    PREV_PWD=$PWD
    if [[ -f ".nvmrc" ]]; then
        # if windows
        # VERSION=$(cat .nvmrc);
        # nvm use $VERSION
        # NVM_DIRTY=true

        # if Mac OS
        nvm use
        NVM_DIRTY=true
    elif [[ $NVM_DIRTY = true ]]; then
        nvm use default
        NVM_DIRTY=false
    fi
}

export PROMPT_COMMAND=enter_directory

################################################
################################################
################################################
################ .zsh plugins ##################
################################################
################################################
################################################

plugin=(git docker k)

################################################
######### Custom Shorthand Commands ############
########## some shorthands for git #############
################################################
################################################

alias clone='git clone --depth=1'
alias gstat='git status'
alias gcho='git checkout'
alias gmg='git merge'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias install='npm i && bower i'
alias del='rm -rf'
alias gbranches='git branch -a'
alias git:cleanlocal='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

# some shorthands for terminal
alias ls='ls -GFh -l'
alias cls='clear'
alias ..='cd ..'
alias dir='ls -la'

################################################
################################################
######### Custom Shorthand Commands ############
######## some shorthands for Docker ############
################################################
################################################

alias dc:ls='docker ps'
alias dc:-ls='docker ps -a'
alias dc:bash='docker-compose exec app bash'
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


################################################
################################################
######### Custom Shorthand Commands ############
######## some shorthands for Zendesk ###########
################################################
################################################

alias zat:up='zat theme preview'
alias zat:kill='killall -9 ruby'

################################################
################################################
### Terminal colouring and git active branch ###
########### Git branch in prompt. ##############
################################################
################################################

parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[3;31m\]\u\[\033[m\]@\[\033[33;1m\]\h:\[\033[32m\]\w\[\033[31;21m\]\$(parse_git_branch)\[\033[m\]\n% "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
