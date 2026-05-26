# functions, vars etc instantiated in bashrc for prof paper editing

alias jasoncclu='tt ::edit -s jasoncclu -f expand -w ed -w vcs'
alias huichiehli='tt ::edit -s huichiehli -f delivery -w ed -w vcs'
function edit () {
    OPTIND=1
    local arg SOURCE REPO FILE SCREEN
    while getopts 's:r:f:w:a' arg
    do
	SCREENRC=$HOME/dot/screen/edit.rc
        case ${arg} in
            s) SOURCE=${OPTARG};;
            r) REPO=${OPTARG};;
            f) FILE=${OPTARG};;
            w) SCREEN+=( "${OPTARG}" ) ;;
            a) SCREEN=( "all" ) ;;
	    *) echo "opts: -s -r -f -w -a" ; exit 0 # illegal option
        esac
    done
    shift $(( OPTIND - 1 ))
    if [[ $SCREEN == *all* ]] ; then
	cat $HOME/dot/screen/edits/*.rc > $SCREENRC
    else
	if [[ -f $SCREENRC ]] ; then rm $SCREENRC ; fi
	for s in ${SCREEN[@]} ; do
	    echo w=$s
	    cat $HOME/dot/screen/edits/$s.rc >> $SCREENRC
	done
    fi
    echo ${SCREEN[*]} $SCREENRC
    export SCREEN SCREENRC
    sessionname=
    for (( i=0; i<${#SCREEN[@]}; i++ )) ; do
	sessionname+="${SCREEN[$i]},"
    done
    # svn mkdir ~/edit/branches/$source
    # svn up ~/edit/branches/$source --depth empty
    # svn up ~/edit/branches/$source/$file.md
    # svn up ~/edit/branches/$source/issues.md
    cd ~/profedit/$SOURCE
    # cd ~/edit/trunk/$source
    #if [[ ! -e ~/edit/gitedit ]] ; then
    #    git clone http://github.com/drbean/edit ~/edit/gitedit
    #elif [[ ! -e ~/edit/gitedit/$source ]] ; then
    #    cd ~/edit/gitedit
    #    git checkout $source
    #else
    #    cd ~/edit/gitedit/$source
    #    git checkout $source
    #fi
    #cd ~/edit/gitedit/$source
    #git status
    REPO=${REPO:-'.'}
    F=$HOME/profedit/$SOURCE/$FILE.md
    R1=$(svn log -q -r 1:HEAD --limit 1 $F | sed -nE '2s/^r([[:digit:]]+) .*$/\1/p')
    R=$(svn info $F | sed -nE '5s/^.*(\^.*$)/\1/p')
    PREV=$(ci 1)
    export SOURCE REPO FILE F R1 R PREV
    screen -c $SCREENRC -dR ${SOURCE#*/}.$FILE.${sessionname%,}
}

# returns previous \$FILE commit/ci message parameterized on number before
function ci () { n=$1 ; svn log $F | head -n $((4 * $n)) | tail -n 1 ; }

export edit ci
