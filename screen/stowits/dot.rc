# dot

echo "sourcing bashrc, bash_profile"
source ~/.bashrc
source ~/.bash_profile

cd ~/stow/dot
echo pwd: $(pwd)

declare -a bashes=( "inputrc" "bash_profile" "bashrc" )
# declare -a bashes=( $( ls ~/dot/bash/{*rc,bash_profile} --hide=*~ ) )

echo "Checking ~/dot, ~/stow diffs"
for rc in ${bashes[@]} ; do diff -u ~/dot/bash/$rc ~/stow/dot/.$rc ; done
for rc in vim ; do diff -u ~/dot/vim/${rc}rc ~/stow/dot/.${rc}rc ; done
echo

declare -a dotties=( "${bashes[@]}" )
dotties+=( "vimrc" )
echo dotties="( ${dotties[@]} )"

echo "Checking ~/stow, ~/.* diffs"
for rc in ${dotties[@]} ; do diff -u ~/stow/dot/.$rc ~/.$rc ; done
echo
rm ~/stow/dot/.* ; echo "Removing ~/stow/dot/.*"

echo "Linking ~/dot/dotties <- ~/stow/dot/.dotted"
for rc in ${bashes[@]} ; do ln ../../dot/bash/$rc ~/stow/dot/.$rc ; done
for rc in vimrc ; do ln ../../dot/vim/$rc ~/stow/dot/.$rc ; done
echo
# https://stackoverflow.com/questions/6426143/how-to-append-a-string-to-each-element-of-a-bash-array
dotted=( "${dotties[@]/#/~/.}" )

echo "Stowing dotted files in ~"
# stow -n --verbose=2 -t ~drbean/ -d ~drbean/stow -R dot
# stow --verbose=2 -t ~drbean/ -d ~drbean/stow -R dot
stow --verbose=2 -t ~drbean/ -d ~drbean/stow -R dot --adopt

echo "Checking dot/dotties files"
ls -al ~/dot/{bash/{*rc,bash_profile},vim/vimrc}
echo

echo "Checking stow/dot/dotted files"
ls -al ~/stow/dot
echo

echo "Checking ~/dotted files"
ls -al ${dotted[@]}

exec bash -l
