#!env bash

# When going git's tough, subversion gets it going
function gitwrap_svn () {
    OPTIND=3
    local arg repo logmess
    while getopts 'r:m:' arg
    do
        case ${arg} in
            r) repo=${OPTARG};;
            m) logmess=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    subcommand=$1
    change=$2
    basename=${change##*/}
    if [[ $change =~ / ]] ; then
        subdir=${change%/$basename}
        else subdir=.
    fi
    pwd=$(pwd)
    project=${pwd#/home/drbean/}
    dev_dir=~/$project

    case $subcommand in
	ci)
	    vcs=svn
	    wc="$dev_dir/$vcs.$project"
	    if ! [[ -d $wc/$subdir ]] ; then
		$vcs mkdir $wc/$subdir
	    fi
	    cp $dev_dir/$change $wc/$change
	    cd $wc
	    repo_file=$(sed -n 1p <<<$($vcs info $change))
	    if ! [[ $repo_file == "Path: $change"  ]] ; then
		$vcs add $wc/$change
	    fi
	    echo "$vcs $wc/$change status:"
	    $vcs status $wc/$change
	    read -p "$wc/$change $vcs status OK? y/n " status
	    if [[ $status == 'n' ]] ; then
		echo "Fix $change in $dev_dir!"
		cd -
		return 0
	    fi
	    echo "$vcs diff $wc/$change:"
	    $vcs diff $wc/$change
	    echo
	    read -p "$wc/$change $vcs diff looks good? y/n " diff
	    if [[ $diff == 'n' ]] ; then
		echo "Fix $change in $dev_dir!"
		cd -
		return 0
	    fi
	    read -p  \
	"Commit $wc/$change as '$logmess' to $vcs repo? y/n " commit
	    if [[ $commit =~ ^y ]] ; then
		subdir_status=$(sed -n 8p <<<$($vcs info $subdir))
	    if [[ $subdir_status == "Schedule: add"  ]] ; then
		echo "Committing '$wc/$change'"
		$vcs commit $wc/$subdir -m "$logmess"
	    else
		echo "Committing '$wc/$change'"
		$vcs commit $wc/$change -m "$logmess"
	    fi
	    else
		echo "Fix $change in $dev_dir!"
		cd -
		return 0
	    fi
	    cd -

	    vcs=git
	    repo="$dev_dir/$vcs.$project"
	    if ! [[ -d $repo/$subdir ]] ; then
		mkdir $repo/$subdir
	    fi
	    cp $dev_dir/$change $repo/$change
	    cd $repo
	    echo "$vcs status:"
	    $vcs status
	    read -p "$repo/$change $vcs status OK? y/n " status
	    if [[ $status == 'n' ]] ; then
		echo "Fix $chane in $dev_dir!"
		cd -
		return 0
	    fi
	    echo "$vcs diff $change:"
	    $vcs diff $change
	    echo
	    read -p "$repo/$change $vcs diff looks good? y/n " diff
	    if [[ $diff == 'n' ]] ; then
		echo "Fix $change in $dev_dir!"
		cd -
		return 0
	    fi
	    $vcs add $repo/$change
	    read -p  \
	"Commit $repo/$change as '$logmess' to $vcs repo? y/n " commit
	    if [[ $commit =~ ^y ]] ; then
		$vcs commit -m "$logmess"
		$vcs pull
		$vcs push
	    else
		echo "Fix $change in $dev_dir!"
		cd -
		return 0
	    fi
	    cd -
	    cd $dev_dir
	;;

	*)
	    echo "No $subcommand subcommand"
	    return 1
	;;
    esac
}

