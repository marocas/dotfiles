################################################
################################################
##################### NVM ######################
################################################
################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Run 'nvm use' automatically every time there's
# file in the directory. Also, revert to default
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
######### Custom Shorthand Commands ############
########## some shorthands for git #############
################################################
################################################

alias install='npm i && bower i'
alias del='rm -rf'
alias git:cl='git clone --depth=1'
alias git:co='git checkout'
alias git:st='git status'
alias git:m='git merge'
alias git:l="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias git:ba='git branch -a'
alias git:br='git for-each-ref --format="%(committerdate) %09 %(authorname) %09 %(refname)" --sort=committerdate'
alias git:bm='git for-each-ref --format="%(committerdate) %09 %(authorname) %09 %(refname)" --sort=committerdate | egrep "(^\*|Mário)"'
alias git:cls='git fetch --all && git pull && git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

alias git:branch='function _f() { git for-each-ref --format="%(committerdate) %09 %(authorname) %09 %(refname)"  | egrep "(^\*|\"$1\")"; } ; _f'

# some shorthands for terminal
alias ..='cd ..'
alias dir='ls -la'
alias ls='ls -GFh -l'
alias cls='clear'

# Projects dir
alias cd:com='cd ~/talkdesk/institutional/talkdesk-com'
alias cd:assets='cd ~/talkdesk/cdn/talkdesk-com-assets'
alias cd:creac='cd ~/talkdesk/institutional/creac'
alias cd:creacapp='cd ~/talkdesk/institutional/creac-app'
alias cd:crs='cd ~/talkdesk/institutional/talkdesk-com-careers'
alias cd:tdx='cd ~/talkdesk/institutional/td-creative-app'
alias cd:bk='cd ~/talkdesk/institutional/td-creative-benchmark'
alias cd:cts='cd ~/talkdesk/institutional/td-creative-customers'
alias cd:dr='cd ~/talkdesk/institutional/td-creative-democenter'
alias cd:es='cd ~/talkdesk/institutional/td-creative-events'
alias cd:gh='cd ~/talkdesk/institutional/td-creative-globalsearch'
alias cd:ot='cd ~/talkdesk/institutional/td-creative-opentalkmedia'

################################################
################################################
######### Custom Shorthand Commands ############
######## some shorthands for Docker ############
################################################
################################################

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
