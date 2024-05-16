#!/usr/bin/bash

function dump_cookies ()  {
    echo '# Netscape HTTP Cookie File' # needed by youtube-dl
    # there's no attempt to url encode $1, but SQLite already handles
    # characters like spaces, so only ? % and # should cause issues
    sqlite3 -separator '	' "file:${1:-$HOMEDRIVE$HOMEPATH/AppData/Roaming/qutebrowser}/data/webengine/Cookies?nolock=1" '
    SELECT
        host_key,
        IIF(host_key LIKE ".%", "TRUE", "FALSE"),
        path,
        IIF(is_secure, "TRUE", "FALSE"),
        IIF(expires_utc == 0, 0, expires_utc / 1000000 - 11644473600),
        name,
        value
    FROM cookies;'
}

function log_clip () {
    while true
    do
        if [[ "$(</dev/clipboard)" == "${LastClip}" ]]
        then
            sleep 2
        else
            LastClip="$(</dev/clipboard)"
            < /dev/clipboard address.sed > /tmp/clip.txt
            # <<<$(tail -n 500 /tmp/clip.txt) address.sed > /tmp/clip.txt
            sleep 1
        fi
    done
}

function curler () {
	declare -a page
	readarray -t page
	total=${#page[*]}
	SCHEME=http*//
	for file in mess cache_url.txt ; do
		if [[ -f $file ]] ; then rm $file ; fi
	done
	for (( i=0; i<$total; i++ )); do
		echo ${page[$i]} >> cache_url.txt
		echo
		if (( $i==$total-1 )) ; then echo -e "\\nLAST PAGE!!"  >> mess 2>&1; fi
		echo -e "\\nGetting link page $((i+1)) of $total from STDIN\\n
		${page[$i]}⏎\\n" | tee -a mess 1>&2
		dump_cookies > cookies.txt
		curl -b cookies.txt -c cookies.txt -kL "${page[$i]}" 2>> mess
	done;
}

alias Tr="tr ' ' '\n'"
function cull () {
	while read line ; do
		if [[ $line == \#* ]] ; then
			continue
		fi
		echo $line
	done
}

function clip () {
	read p
	qutebrowser $p
	echo $p > cache_url.txt
	sleep 10
}

function paste () {
	< /dev/clipboard sed '/@/!d ; s/^M//'
}

function save () {
	echo | tee -a $A
	< cache_url.txt sed -E 's/^(.*)$/### \1/' | tee -a $A
	cat | tee -a $A
}

function commit () {
	address_page="n"
	while ! [[ $address_page =~ ^y ]] ; do
		v $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
		svn diff $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
		echo
		read -p "$LAND/$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
	done
	mess=$(< cache_url.txt)
	read -p  "Commit as '$mess'? y/n " commit
	if [[ $commit =~ ^y ]]
	then exec svn ci $LAND/$AREA/$COUNTY/$SCHOOL/address.txt -q \
		-m "$mess" > /dev/null 2>&1 &
	fi
}


function f () { sed -f email.sed >> $COUNTY/$SCHOOL/address.txt; }
function l () { address.sed >> $COUNTY/$SCHOOL/address.txt; }
function a () {
    URL=${URL:-${1:-"http://$DEPARTMENT.$SCHOOL.ac.kr"}}
    if ! [[ -f ~/edit/email/$LAND/$AREA/$COUNTY/$SCHOOL/address.txt ]] 
        then echo "COUNTY? SCHOOL?" && sleep 1 && exit 1
    fi
    if ! [[ -t 0 ]] ; then
        declare -a faculty
        readarray -t faculty
        total=${#faculty[*]}
        for (( i=0; i<$total; i++ )); do
            URL=${faculty[$i]}
            echo >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
            echo "# $URL">> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
            if (( $i==$total-1 )) ; then echo -e "\\nLAST FACULTY PAGE!!" ; fi
            echo -e "\\nPreparing faculty listing $((i+1))th of $total from file pages:\\n
            $URL\\n"
            exec 3<&0
            exec 0< /dev/tty
            declare -i j=0
            read -p "list $((i+1)).${roman[$j]} at $URL ready? y/n " next_list
            while [[ $next_list =~ ^y ]] ; do
                    echo "$(</dev/clipboard)" | address.sed | uniq | vipe \
                            >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
                    address_page="n"
                    while ! [[ $address_page =~ ^y ]] ; do
                        vim $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
                        svn diff $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
                        echo
                        read -p "$LAND/$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
                    done
                    read -p "Commit as URL=${faculty[$i]}? y/n " commit
                    if [[ $commit =~ ^y ]]
                        then exec svn ci $LAND/$AREA/$COUNTY/$SCHOOL/address.txt -q \
                            -m "$URL" > /dev/null 2>&1 &
    fi
                    read -p "Another list, $((i+1)).${roman[$((++j))]} ready at ${faculty[$i]}? y/n " next_list
            done
        done
else
    next_list=y
while [[ $next_list =~ ^y ]] ; do
    echo "$(</dev/clipboard)" | address.sed | uniq | vipe > email.txt
    echo >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
    read -p "Enter title, or accept real URL=$URL " new_url
    echo "# ${new_url:=$URL}" | tr -d "\\n" >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
    echo \
         " Now new_url='$new_url',
         URL='$URL',
new_url:=URL=${new_url:=$URL}"
    echo >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
    cat email.txt >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
    address_page="n"
    while ! [[ $address_page =~ ^y ]] ; do
        vim $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
        svn diff $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
        echo
        read -p "$LAND/$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
    done
    read -p "Commit as URL=$new_url? y/n " commit 
    if [[ $commit =~ ^y ]]
        then exec svn ci $LAND/$AREA/$COUNTY/$SCHOOL/address.txt -q \
    	-m "$new_url" > /dev/null 2>&1 &
    fi
    read -p "Next list ready? y/n " next_list
done
    ls -l /dev/fd/
fi
}
function h () {
    TOP=${1:-http://$DEPARTMENT.$SCHOOL.ac.kr}
    SCHEME=http*//
    URI=${TOP#$SCHEME}
    DOMAIN=$SCHOOL.ac.kr
    PATHINFO=${URI#*$DOMAIN}
    HOST=${URI%.$DOMAIN$PATHINFO}
    rm cache_url.txt
    INDEX=$2
    if ! [[ -t 0 ]] ; then
        declare -a faculty
        readarray -t faculty
        INDEX=$1
        TOP=${faculty[0]}
        URI=${TOP#$SCHEME}
        HOST=${URI%.$DOMAIN*}
        if [[ $# -eq 2 ]]; then DEPARTMENT=$2 ; else DEPARTMENT=$HOST ; fi
        echo -e "\\n# $TOP" >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
        mv {,orig_}link_list.html
        total=${#faculty[*]}
        for (( i=0; i<$total; i++ )); do
            if (( $i==$total-1 )) ; then echo -e "\\nLAST PAGE!!" ; fi
            url="${faculty[$i]%$'\r\n'}"
            uri=${url#$SCHEME}
            pathinfo=${uri#*$DOMAIN}
            host=${uri%.$DOMAIN$pathinfo}
            echo -e "\\nGetting faculty page $((i+1)) of $total from file list:\\n
            ${faculty[$i]}⏎
        URL=$url⏎
SCHEME=$SCHEME, HOST=$host, DOMAIN=$DOMAIN, PATHINFO=$pathinfo\\n"
            dump_cookies > cookies.txt
            curl -b cookies.txt -c cookies.txt -kL "$url" |
                sed -f page.sed | uniq | vipe >> link_list.html
        done
        exec 3<&0
        exec 0< /dev/tty
        page="n"
        while ! [[ $page =~ ^y ]] ; do
            vim link_list.html
            echo
            read -p "Prof page looks good? y/n " page
            if [[ $page =~ ^y ]] ; then 
                rm email.txt
                dump_cookies > cookies.txt
                declare -i i=0
                echo >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
                while read p ; do
                    echo -e "\\n\\nReading page $((++i)) from link_list.html\\n\\t\\t$p\\n"
                    echo $p >> cache_url.txt
                    echo "# $p" >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
                    curl -b cookies.txt -c cookies.txt -kL "${p%$'\r'}" |
                        address.sed | tee -a email.txt
                done < link_list.html
            fi
        done
        if [[ $# -eq 3 ]]; then DEPARTMENT=$3 ; else DEPARTMENT=$HOST ; fi
        cat email.txt | uniq | vipe >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
        address_page="n"
        while ! [[ $address_page =~ ^y ]] ; do
            vim $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
            svn diff $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
            echo
            read -p "$LAND/$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
        done
        read -p  "Commit as '$URL'? y/n " commit
        if [[ $commit =~ ^y ]]
            then svn ci $LAND/$AREA/$COUNTY/$SCHOOL/address.txt -f cache_url.txt
        fi
        exec 0<&3
    elif [[ $# -le 3 ]]; then
        url=$TOP
        echo -e "\\nGetting faculty page from \$1:\\n
            $1⏎
        URL=$url⏎\\n
SCHEME=$SCHEME, HOST=$HOST, DOMAIN=$DOMAIN, PATHINFO=$PATHINFO\\n"
        INDEX=$INDEX
        curl -b cookies.txt -c cookies.txt -kL "$url" |
            sed -e "/$INDEX/!d" -f page.sed | uniq | vipe > prof_page.html
        exec 3<&0
        exec 0< /dev/tty
        page="n"
        while ! [[ $page =~ ^y ]] ; do
            vim prof_page.html
            read -p "Prof page looks good? y/n " page
            if [[ $page =~ ^y ]] ; then 
                rm email.txt
                dump_cookies > cookies.txt
                declare -i i=0
                while read p ; do
                    echo -e "\\n\\nReading page $((++i)) from prof_page.html\\n\\t\\t$p\\n"
                    curl -b cookies.txt -c cookies.txt -kL "${p%$'\r'}" |
                        address.sed | tee -a email.txt
                done < prof_page.html
            fi
        done
        if [[ $# -eq 3 ]]; then DEPARTMENT=$3 ; else DEPARTMENT=$HOST ; fi
        echo -e "\\n# $URL" >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
        cat email.txt | uniq | vipe >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
        address_page="n"
        while ! [[ $address_page =~ ^y ]] ; do
            vim $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
            svn diff $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
            echo
            read -p "$LAND/$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
        done
        read -p "Enter new URL=$URL > " new_url
        read -p "Commit as URL=${new_url:=$URL}? y/n " commit 
        if [[ $commit =~ ^y ]]
            then svn ci $LAND/$AREA/$COUNTY/$SCHOOL/address.txt -m "$new_url"
        fi
        exec 0<&3
    elif [[ $# -le 4 ]]; then
        PRE_TOP=$2
        IFS=' ' read -a TOP_INDEX <<< "$3"
        POST_TOP=${TOP#$PRE_TOP${TOP_INDEX[0]}}
        PROF_PAGE_INDEX=$4
        mv {,orig_}prof_page.html
        dump_cookies > cookies.txt
        for i in ${TOP_INDEX[@]:0} ; do
            echo -e "\\nGetting $PRE_TOP$i$POST_TOP faculty page. TOP_INDEX=$i\\n"
            curl -b cookies.txt -c cookies.txt -kL "$PRE_TOP$i$POST_TOP" |
                sed -e "/$PROF_PAGE_INDEX/!d" -f page.sed |
                uniq | vipe >> prof_page.html
        done
        page="n"
        while ! [[ $page =~ ^y ]] ; do
            cat prof_page.html
            read -p "Prof page ready, can get email? y/n " page
            if [[ $page =~ ^y ]] ; then 
                rm email.txt
                while read p ; do
                    curl -b cook -kL "${p%$'\r'}" | address.sed | tee -a email.txt
                done < prof_page.html
            fi
        done
        exec 3>&-
        if [[ $# -eq 5 ]]; then DEPARTMENT=$5 ; else DEPARTMENT=$HOST ; fi
        echo -e "\\n# http://$DEPARTMENT.$SCHOOL.ac.kr" >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
        cat email.txt | uniq | vipe >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
        address_page="n"
        while ! [[ $address_page =~ ^y ]] ; do
            svn diff $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
            echo
            read -p "$LAND/$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
        done
        read -p  "Commit as 'http://$DEPARTMENT.$SCHOOL.ac.kr'? y/n " commit
        if [[ $commit =~ ^y ]]
            then svn ci $LAND/$AREA/$COUNTY/$SCHOOL/address.txt -m "http://$DEPARTMENT.$SCHOOL.ac.kr"
        fi
    fi
}
function p () {
    TOP=$1
    FIRST_LINK_KEYWORD=$2
    SECOND_LINK_KEYWORD=$3
    curl -kL "$TOP" | sed -e "/$FIRST_LINK_KEYWORD/!d" -f page.sed | uniq | vipe > link_list.html
    link_list="n"
    while ! [[ $link_list =~ ^y ]] ; do
        cat link_list.html
        read -p "Prof page looks good? y/n " link_list
        if [[ $link_list =~ ^y ]] ; then 
            # rm email_page_list.html
            while read p ; do
                curl -kL "${p%$'\r'}" | sed -e "/$SECOND_LINK_KEYWORD/!d" -f page.sed
            done < link_list.html > email_page_list.html
        fi
    done
    email_page_list="n"
    while ! [[ $email_page_list =~ ^y ]] ; do
        vipe <> email_page_list.html
        read -p "Email page looks good? y/n " email_page_list
    done
    while read p ; do
        curl -kL "${p%$'\r'}" | address.sed
    done < email_page_list.html > email.txt
    if [[ $# -eq 4 ]]; then DEPARTMENT=$4 ; fi
    echo -e "\\n# http://$DEPARTMENT.$SCHOOL.ac.kr" >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
    cat email.txt | uniq | vipe >> $LAND/$AREA/$COUNTY/$SCHOOL/address.txt
    address_page="n"
    while ! [[ $address_page =~ ^y ]] ; do
        svn diff $LAND/$AREA/$COUNTY/$SCHOOL/address.txt ;
        echo
        read -p "$LAND/$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
    done
    read -p  "Commit as 'http://$DEPARTMENT.$SCHOOL.ac.kr'? y/n " commit
    if [[ $commit =~ ^y ]]
        then svn ci $LAND/$LAND/$AREA/$COUNTY/$SCHOOL -m "http://$DEPARTMENT.$SCHOOL.ac.kr"
    fi
}

function scrape () {
    OPTIND=1
    local arg school department
    while getopts 's:d:' arg
    do
        case ${arg} in
            s) school=${OPTARG};;
            d) department=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/edit/email || exit 1
    SCHOOL=$school DEPARTMENT=$department screen -c /home/$USER/dot/screen/scrape.rc -dR scrape_$school
    cd -
}

function pp () {
    if [[ $# -gt 2 ]]; then
        echo "pp $@: Too many args" >&2
        return 2
    elif [[ $# -eq 2 ]]; then
        prof_edit $@
    elif [[ $# -eq 1 ]]; then
        prof_remove $@
    else
        echo "pp $@: No args" >&2
        return 2
    fi
}

function prof_remove () {
    if [[ $# -ne 1 ]] ; then
        echo "$@: No/too many args" >&2
        return 2
    fi
    AREA=${AREA%/}
    address=$(grep -l "^$1" $LAND/$AREA/*/*/address.txt)
    echo $address | xargs sed -i.BAK -e "s/^\($1\)\(\s\|$\)/# \1/"
    # svn diff $LAND/$AREA/*/*/address.txt;
    # echo -ne "\nCommit? y/n "
    # read proceed
    # if [[ $proceed =~ ^y ]]
    #     then svn ci $LAND/$AREA/*/*/address.txt -m "$1: User unknown"
    # fi
    svn ci $LAND/$AREA/*/*/address.txt -m "$1: User unknown"
}

alias pf='prof_find'
function prof_find () {
    address_list=$(eval echo $LAND/$AREA/*/*/address.txt)
    address=$1
    file=$(grep -l "$address" $address_list)
    v $file +/$address
}

function prof_edit () {
    if [[ $# -ne 2 ]] ; then
        echo "prof_edit $@: Less/More than 2 args" >&2
        return 2
    fi
    AREA=${AREA%/}
    address=$(grep -l "^$1" $LAND/$AREA/*/*/address.txt)
    echo $address | xargs sed -i.BAK -e "s/^\($1\)\(\s\|$\)/$2 # \1/"
    sed -i.BAK -e "$ a\
        $2" requeue
    svn diff $LAND/$AREA/*/*/address.txt requeue
    echo -ne "\nTry \"$2\" again? y/n "
    read send
    if [[ $send =~ ^y ]]
        then screen -p 1 -X stuff \
            "echo $2 | /sdf/udd/d/drbean/job/send.sh^M"
        echo "Sending to $2 via send.sh on sdf."
        svn revert requeue
    fi
    svn st $LAND/$AREA | sed -e '/^M/!d'
    echo -ne "\nCommit with message:
$1: Edited
$2? y/n "
    read commit
    if [[ $commit =~ ^y ]]
        then svn ci $LAND/$AREA/*/*/address.txt requeue \
           -m "$1: Edited
$2"
    fi
}

function int_in_path () {
    source_url=$1
    declare -A url
    declare -i int
    for part in 'host' 'path' ; do
        url[$part]=$(trurl --url "$source_url" --get [$part])
    done
    if [[ ${url[path]} =~ ^/(.*0)([1-9]{1,})(.*)$  ]]
    then int=${BASH_REMATCH[2]}
    else echo "no [0-9]{2,} in ${url[path]}
           in $source_url"
        return 2
    fi
    echo $int
}

function emulate_three_e_args () {
    source_url=$1
    alt_int=${@#$source_url}
    declare -A url
    declare -i int
    for part in 'scheme' 'host' 'path' 'query' ; do
        url[$part]=$(trurl --url "$source_url" --get [$part])
    done
    scheme_host=${url[scheme]}://${url[host]}
    path=${url[path]}
    int=$(int_in_path $source_url)
    pre_match_path=${path%$int*}
    e $source_url $scheme_host$pre_match_path "$int $alt_int"
}

function url_assemble () {
    OPTIND=0
    local arg host hostname domain path query url
    while getopts 's:h:n:d:p:q:u:' arg
    do
        case ${arg} in
            s) scheme=${OPTARG};;
            h) host=${OPTARG};;
            n) hostname=${OPTARG};;
            d) domain=${OPTARG};;
            p) path=${OPTARG};;
            q) query=${OPTARG};;
            u) url=$OPTARG;;
            *) return 1 # illegal option
        esac
    done
    scheme=${scheme:="https"}
    if [[ -v host ]] ; then
        fqdn=$host
    else fqdn="$hostname.$domain"
    fi
    trurl -s scheme=$scheme -s host=$fqdn \
	-s path=$path -s query:=$query
}

function path_assemble () {
    OPTIND=0
    local prefix infix suffix
    while getopts 'p:i:s:' arg
    do
        case ${arg} in
            p) prefix=${OPTARG};;
            i) infix=${OPTARG};;
            s) suffix=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    echo "$prefix/$infix/$suffix"
    
}

function permute_url () {
    old_url=$1
    declare -A url
    for part in 'host' 'path' ; do
        url[$part]=$(trurl --url "$old_url" --get [$part])
    done
    dept=${url[host]%%.*}
    domain=${url[host]#$dept.}
    host="dept.$domain"
    path="/$dept${url[path]}"
    trurl --url $old_url --set host=$host --set path=$path
}

alias Pr="premail -l kr -a west -c chwungchengpukto -s chungbuk -u http://www.chungbuk.ac.kr"
# assemble an address list for a school
function premail () {
    OPTIND=1
    local arg LAND area county SCHOOL DEPARTMENT URL
    while getopts 'l:a:c:s:d:u:' arg
    do
        case ${arg} in
            l) LAND=${OPTARG};;
            a) area=${OPTARG};;
            c) county=${OPTARG};;
            s) SCHOOL=${OPTARG};;
            d) DEPARTMENT=${OPTARG};;
            u) URL=$OPTARG;;
            *) return 1 # illegal option
        esac
    done
    cd ~/edit/email || exit 1
    AREA=${area:-$AREA} COUNTY="${county:-$COUNTY}"
    A="$HOME/edit/email/$LAND/$AREA/$COUNTY/$SCHOOL/address.txt"
    export A LAND AREA COUNTY SCHOOL DEPARTMENT URL
    screen -c /home/$USER/dot/screen/premail.rc -dR premail.$SCHOOL
    cd -
}

alias E="email -l tw -a SEis -c '*'"
# stage email batches from an area
function email () {
    OPTIND=1
    local arg land area county batch
    while getopts 'l:a:c:b:' arg
    do
        case ${arg} in
            l) land=${OPTARG};;
            a) area=${OPTARG};;
            c) county=${OPTARG};;
            b) batch=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/edit/email || exit 1
    export LAND=${land:-$LAND} AREA=${area:-$AREA} COUNTY="${county:-$COUNTY}"
    cache_batch=$(read_BATCH)
    export BATCH=${batch:-$cache_batch}
    export LA=$LAND/$AREA/
    screen -c /home/$USER/dot/screen/email.rc -dR email:${AREA%/}
    cd -
}

function commit_bag () {
    OPTIND=0
    local arg rev file bag
    # declare -i rev
    while getopts 'r:f:b:' arg
    do
        case ${arg} in
            r) rev=${OPTARG};;
            f) file=${OPTARG};;
            b) bag=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    declare -a list
    IFS=' ' read -a list <<< $(eval echo "$rev")
    n=${#list}
    last=$(svn info $file | sed -n '/Last Changed Rev: /s/^.*: //p')
    mess=$(svn log $file -r $last | sed -n '4p')
    file_txt="$file.txt"
    for i in ${list[@]} ; do
        rev=$(svn info $file | sed -n '/Last Changed Rev: /s/^.*: //p')
        mess=$(svn log $file -r $rev | sed -n '4p')
        svn cat ^/email/$file_txt -r $rev | vipe |
            tee $file_txt > $bag/$file.$i.txt
        svn ci $file_txt -m \"r$rev: $mess $i" > /dev/null 2>&1  ; done^M"
    done
}

function UP {
    file=$1
    lftp -c "open sftp://drbean@sdf.org && cd job/$LAND/$AREA && \
        mput $LAND/$AREA/$file && qui"
}

function PX {
    command="$*"
    screen -p 1 -X stuff "$*^M"
}

function write_BATCH () {
    new_batch=$1
    case $new_batch in
        ''|*[!0-9]*) echo "BATCH=$new_batch, not integer"; return 1 ;;
        *) file="$HOME/edit/email/$LAND/$AREA/batch.txt"
            if [[ $new_batch =~ ^(0*)([1-9]*)([0-9]*)(.)$  ]] ; then
                bare_batch=$(printf '%s' ${BASH_REMATCH[@]:2} )
                echo $bare_batch >$file
            fi;;
    esac
}

function read_BATCH () {
    # declare -i BATCH
    file="$HOME/edit/email/$LAND/$AREA/batch.txt"
    if [[ -f $file ]] 
    then BATCH=$(printf "%03d" $(< $file ))
    else echo "No batch.txt! BATCH=$BATCH?"; return 1
    fi
    echo $BATCH
}

function update_BATCH () {
    file="$HOME/edit/email/$LAND/$AREA/batch.txt"
    echo ${BATCH##*0} 1>$file

}
function incr_BATCH () {
    cache_batch=$(read_BATCH)
    declare -i bare_batch plus_batch
    case $cache_batch in
        ''|*[!0-9]*) echo "BATCH=$cache_batch, not integer"; return 1 ;;
        *) echo -n "BATCH was "
            if [[ $cache_batch =~ ^(0*)([1-9]*)([0-9]*)(.)$  ]] ; then
                bare_batch=$(printf '%s' ${BASH_REMATCH[@]:2} ) ; fi
            plus_batch=$(( bare_batch + 1 ))
            old_BATCH=$(printf "%03d" $bare_batch)
            new_BATCH=$(printf "%03d" $plus_batch)
            echo "$old_BATCH. Now BATCH=$new_BATCH"
            export BATCH=$new_BATCH
    esac
    read -p "Save good new $BATCH batch value? y/n " go
    if [[ $go =~ ^y ]] ; then write_BATCH $BATCH ;
    else echo "You can 'write_BATCH old_good_value' to file and try again."
    fi
}

function decr_BATCH () {
    BATCH=$(read_BATCH)
    export old_batch=$(( $(< $LAND/$AREA/batch.txt) -1  ))
    echo -n $(printf "%03d" $old_batch)
}

function prep_auth () {
    PX mosh drbean@sdf.org
    read -p "Bird is the word: " word
}

function sign_in () {
    PX $word
    PX "cd ~/job/$LAND/$AREA && tmux new-session -A -s $AREA"
}

function first_batch () {
    PX "if ! [[ -d ~/job/$LAND/$AREA ]] ; then mkdir ~/job/$LAND/$AREA ; fi"
    PX "if ! [[ -d ~/job/$LAND/$AREA/body ]] ; then mkdir ~/job/$LAND/$AREA/body ; fi"
    PX "if ! [[ -d ~/job/$LAND/$AREA/subject ]] ; then mkdir ~/job/$LAND/$AREA/subject ; fi"
    lftp -c "open drbean@sdf.org && cd ~/job/$LAND && glob -d echo * && \
	glob echo $AREA/* $AREA/*/* && \
	put -O $AREA/subject subject/title.txt && \
	put -O $AREA/body body/original.txt && \
	mrm $AREA/subject/* && \
	mrm $AREA/body/* && \
	qui"
    write_BATCH 000
    read_BATCH
    UP $BATCH\?
    PX tmux new-window -n $BATCH
}

function set_batch_up () {
    incr_BATCH
    UP $BATCH\?
    PX rm $(decr_BATCH)?
    PX ls
    PX tmux new-window -n $BATCH
}

function run_batch () {
    PX ../../run.sh $LAND/$AREA $BATCH
}

function old_address () { sed -E 's/^([^#]+)\s#.*$/\1/' ; } 
function line_ends_space () { sed -ne '/^\s\+/p' -e '/\s\+$/p' $LAND/$AREA/*/*/address.txt ; }
function wrong_char () { sed -e '/^#/d' $LAND/$AREA/$COUNTY/*/address.txt | old_address | grep -r -P '[^-_.a-zA-Z0-9@]' - ; }
function unescaped_uri () { grep -e '[^-_.a-zA-Z0-9@#/:?&=% ]' $LAND/$AREA/$COUNTY/*/address.txt ; }
function in_addr_space () { sed -n -e '/#/d' -e '/\s.*@/p' -e '/@.*\s/p' $LAND/$AREA/$COUNTY/*/address.txt ; }
function no_at_mark () { sed -e '/^#/d' -e '/^$/d' -e '/@/d' $LAND/${AREA}/$COUNTY/*/address.txt ; }

alias Po="postmail -l tw -a SEis -c '*'"
# cleanup post-batch posting
function postmail () {
    OPTIND=1
    local arg land area county
    while getopts 'l:a:c:' arg
    do
        case ${arg} in
            l) land=${OPTARG};;
            a) area=${OPTARG};;
            c) county=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/edit/email || exit 1
    LAND=${land:-$LAND} AREA=${area:-$AREA} COUNTY=${county:-$COUNTY} \
        screen -c /home/$USER/dot/screen/postmail.rc -dR postmail:${area%/}
}
