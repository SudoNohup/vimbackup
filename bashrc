# ~/.bashrc

## My customizations 

## My Mac Setup
if [[ $(hostname) =~ .*nanuk.* ]]; then
  export CLICOLOR=1
  export LSCOLORS=GxFxCxDxBxegedabagaced
fi


## Ronaldo Setup
if [[ $(hostname) =~ .*ronaldo.* ]]; then
  echo $(hostname)
  module load intel
  module load mkl
  module load openmpi
  module load matlab
  module list

  alias knn='cd /h1/jianyu/Projects/knn'
fi


## Stampede Setup
if [[ $(hostname) =~ .*stampede.* ]]; then
  echo $(hostname)
  module load fftw3
  module load cuda

  alias gpu='srun -A PADAS -p gpu -t 1:00:00 -n 32 --pty /bin/bash -l'
fi


## Maverick Setup
if [[ $(hostname) =~ .*maverick.* ]]; then
  echo $(hostname)
  module load cuda

  alias knn=' cd /work/03223/jianyu/Project/knn/src'
  alias gpu='srun -A PADAS -p gpu -t 1:00:00 -n 40 --pty /bin/bash -l'
fi




## Git command line display
function git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
  echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
  now=`date +%s`;
  last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
  seconds_since_last_commit=$((now-last_commit));
  minutes_since_last_commit=$((seconds_since_last_commit/60));
  hours_since_last_commit=$((minutes_since_last_commit/60));
  minutes_since_last_commit=$((minutes_since_last_commit%60));
  echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

PS1="[\[\033[1;32m\]\u@\h: \W\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ "


## Common alias

alias gitk='gitk --all &'
alias ml='module list'
alias ma='module avail'
alias rm='rm -i'
alias ..='cd ..'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'
alias ls='ls -h --color'
alias h='history'
alias j='jobs -l'
