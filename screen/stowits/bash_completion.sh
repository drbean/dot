# bash_completion

cd ~/stow/bash_completion
echo pwd: $(pwd)

declare -a command=( $( ls ~/dot/bash/bash_completion/ --hide=*~ ) )
echo bash_completion command="( ${command[@]} )"

echo "Checking ~/dot, ~/stow diffs"
for c in ${command[@]} ; do diff -u ~/dot/bash/bash_completion/$c ~/stow/bash_completion/$c ; done
echo

echo "Checking ~/dot/ /etc/bash_completion.d diffs"
for c in ${command[@]} ; do diff -u ~/dot/bash/bash_completion/$c /etc/bash_completion.d/$c ; done
echo

echo "Removing stow/bash_completion/*"
# rm ~/.local/share/bash-completion/completions/*

echo

echo "Linking ~/dot/bash_completion/* <- ~/stow/bash_completion/*"
for c in ${command[@]} ; do ln --symbolic ../../dot/bash/bash_completion/$c ~/stow/bash_completion ; done
echo

echo "Stowing bash_completion files in ~/.local/share/bash-completion/completions"
# stow -n  --verbose=2 -t ~/.local/share/bash-completion/completions -d ~drbean/stow -R bash_completion
# stow -n  --verbose=2 -t ~/.local/share/bash-completion/completions -d ~drbean/stow -R bash_completion --adopt

echo "Checking ~/dot/bash/bash_completion files"
ls -al ~/dot/bash/bash_completion

echo "Checking  ~/stow/bash_completion files"
ls -al ~/stow/bash_completion

echo "Checking  ~/.local/share/bash-completion/completions files"
ls -al ~/.local/share/bash-completion/completions 

exec bash -l
