# functions, vars etc instantiated in bashrc for prof paper editing

alias jasoncclu='edit -s jasoncclu -f v2g -w ed -w vcs'
alias huichiehli='edit -s huichiehli -f ideas -w ed -w vcs'
alias jkliang='edit -s jkliang -f ai -w vcs -w ed'
alias yingchih='edit -s yingchih -f rev-hfr.supp -w vcs -w ed'
alias yschien='edit -s yschien -f comparison -w vcs -w ed'
alias product='edit -s yschien -f comparison -w pandoc -w cygstart -w lftp'
alias issues='edit -s huichiehli -f ideas -w issues'
function edit () {
    OPTIND=1
    local arg SOURCE REPO FILE SCREEN
    while getopts 's:r:f:w:a' arg
    do
	SESSIONSH=$HOME/dot/screen/edit.sh
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
	cat $HOME/dot/screen/edits/*.sh > $SESSIONSH
    else
	if [[ -f $SESSIONSH ]] ; then rm $SESSIONSH ; fi
	# echo -e '#!\n\n' > $SESSIONSH
	touch $SESSIONSH
	chmod 755 $SESSIONSH
	for s in ${SCREEN[@]} ; do
	    echo w=$s
	    echo "screen $HOME/dot/screen/edits/$s.sh" >> $SESSIONSH
	done
    fi
    echo ${SCREEN[*]} $SESSIONSH
    export SCREEN
    screenname=
    for (( i=0; i<${#SCREEN[@]}; i++ )) ; do
	screenname+="${SCREEN[$i]},"
    done
    cd ~/profedit/$SOURCE
    REPO=${REPO:-'.'}
    F=$HOME/profedit/$SOURCE/$FILE.md
    R1=$(svn log -q -r 1:HEAD --limit 1 $F | sed -nE '2s/^r([[:digit:]]+) .*$/\1/p')
    GIT_R1=$(git log --diff-filter=A -- $FILE.md | sed -nE '1s/^commit ([a-z0-9]*)$/\1/p')
    R=$(svn info $F | sed -nE '5s/^.*(\^.*$)/\1/p')
    PREV=$(ci 1)
    export SOURCE REPO FILE F R1 GIT_R1 R PREV
    screen -dR ${SOURCE#*/}.$FILE.${screenname%,} $SESSIONSH
}

# return previous \$FILE,issue log data, commit/ci message parameterized on number before
function log_FILE_data () { n=$1 ; svn log $F | head -n $((4 * $n)) | tail -n 4 ; }
function log_ISSUES_data () { n=$1 ; svn log issues.md | head -n $((4 * $n)) | tail -n 4 ; }
function ci () { n=$1 ; log_FILE_data $n | sed -nE '4p' ; }
function r () { n=$1 ; log_FILE_data $n | sed -nE '2s/^r([[:digit:]]+) .*$/\1/p' ; }

function package_product () {

	FILE=issues pandoc -o $FILE.docx --reference-doc=./$FILE.docx $FILE.md
	MINE=my_$FILE; pandoc -o $MINE.docx --reference-doc=./$FILE.docx $FILE.md
	cp {orig,their}_$FILE.docx
	cygstart $MINE.docx
	cygstart their_$FILE.docx
}

# rev-FILE png in media/diff/FILE#rev-
function generate_png_log () {
	PNG=$(ls $W/Pictures/mintty/$(date -I)*)
	magick $PNG -append media/diff/${FILE#rev-}/chargitdiff.png
	cygstart media/diff/${FILE#rev-}/chargitdiff.png
}

function upload_product () {
	cd ~/profedit/$SOURCE
	docx_upload
	png_upload
}
function docx_upload () {
	lftp -c "open sftp://drbean@freeshell.org && cd edit/$SOURCE && mput their_$FILE.docx issues.docx issues.md"
}
function png_upload () {
	lftp -c "open sftp://drbean@freeshell.org && lcd media/diff/${FILE#rev-}/ && cd edit/$SOURCE && mput diffchar.png gitdiff.png"
}

export edit ci package_product upload_product log_FILE_data log_ISSUES_dat

case "$1" in
    "") ;;
    log_FILE_data) "$@"; exit;;
    log_ISSUES_data) "$@"; exit;;
    *) echo "Unkown function: $1()"; exit 2;;
esac
