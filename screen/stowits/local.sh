# local

cd ~/stow/
echo pwd: $(pwd)

echo ls -al
ls -al
echo

declare -a cmd=( "active_tooter" "blog.sh" "common.sh" "easyblogger" "get_story_out.sh" "masto_master_messter" "post.sh" "pub" "toot" "trurl" "webcaster.sh")
echo /usr/local/bin command="( ${cmd[@]} )"

declare -A key_cmd=(
    [mastodon]="{active_tooter,masto_master_messter,webcaster.sh}"
    [posse]="{blog.sh,common.sh,pub}" [.]="post.sh"
    [homepage/markdown]="get_story_out.sh"
    [posse/easyblogger/.venv39/bin]="easyblogger"
    [../../dot/browser/toot/.venv.39/bin]="toot"
    [../../edit/email/trurl]="trurl.exe"
)
echo /usr/local/bin command package directories="( ${!key_cmd[@]} )"
echo

echo "Checking pages, etc, ~/stow diffs"
for dir in ${!key_cmd[*]} ; do
    for app in $(eval echo ${key_cmd[$dir]}) ; do
        echo $dir: $app ; diff -u ~/curriculum/pages/$dir/$app ~/stow/local/bin/$app
    done
done
echo

#for dir in ${!key_cmd[@]} ; do for app in ${!key_cmd[$dir]} ; do diff -u ~/curriculum/pages/$dir/$app ~/stow/local/bin/$app ; done ; done
#for app in ${cmd[@]} ; do diff -u  ~/stow/local/bin/$app /usr/local/bin/$app ; done

echo "Removing stow dir links"
for app in ${cmd[@]} ; do rm ~/stow/local/bin/$app ; done
echo

#for app in ${cmd[@]} ; do ln ~/curriculum/pages/homepage/markdown/$app ~/stow/local/bin/$app ; done
#for dir in \${!key_cmd[@]} ; do
#    for appl in \${key_cmd[\$dir]} ; do
#        echo appl: \${appl[@]} ; for app in \$(eval echo \$appl) ; do
#            echo app: \$app
#            diff -u ~/curriculum/pages/\$dir/\$app ~/stow/local/bin/\$app
#        done
#    done
#done

echo "Linking pages commands <- ~/stow/local/bin"
for dir in ${!key_cmd[@]} ; do 
    for app in $(eval echo ${key_cmd[$dir]}) ; do
        ln ~/curriculum/pages/$dir/$app ~/stow/local/bin/$app
    done ; done
echo

#stow -n --verbose=2 -t /usr/local -d ~drbean/stow -R local
#
## root Azy4476

ssh root

exec bash -l
