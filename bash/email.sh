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
function f () { sed -f email.sed >> $COUNTY/$SCHOOL/address.txt; }
function l () { sed -f address.sed >> $COUNTY/$SCHOOL/address.txt; }
function a () {
    URL=${1:-http://$DEPARTMENT.$SCHOOL.ac.kr}
    if ! [[ -f ~/edit/trunk/email/$AREA/$COUNTY/$SCHOOL/address.txt ]] 
        then echo "COUNTY? SCHOOL?" && sleep 1 && exit 1
    fi
    if ! [[ -t 0 ]] ; then
        declare -a faculty
        readarray -t faculty
        total=${#faculty[*]}
        for (( i=0; i<$total; i++ )); do
            URL=${faculty[$i]}
            echo >> $AREA/$COUNTY/$SCHOOL/address.txt
            echo "# $URL">> $AREA/$COUNTY/$SCHOOL/address.txt ;
            if (( $i==$total-1 )) ; then echo -e "\\nLAST FACULTY PAGE!!" ; fi
            echo -e "\\nPreparing faculty listing $((i+1))th of $total from file pages:\\n
            $URL\\n"
            exec 3<&0
            exec 0< /dev/tty
            declare -i j=0
            read -p "list $((i+1)).${roman[$j]} at $URL ready? y/n " next_list
            while [[ $next_list =~ ^y ]] ; do
                    echo "$(</dev/clipboard)" | sed -f address.sed | uniq | vipe \
                            >> $AREA/$COUNTY/$SCHOOL/address.txt
                    address_page="n"
                    while ! [[ $address_page =~ ^y ]] ; do
                        vim $AREA/$COUNTY/$SCHOOL/address.txt ;
                        svn diff $AREA/$COUNTY/$SCHOOL/address.txt ;
                        echo
                        read -p "$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
                    done
                    read -p "Commit as URL=${faculty[$i]}? y/n " commit
                    if [[ $commit =~ ^y ]]
                        then exec svn ci $AREA/$COUNTY/$SCHOOL/address.txt -q \
                            -m "$URL" > /dev/null 2>&1 &
    fi
                    read -p "Another list, $((i+1)).${roman[$((++j))]} ready at ${faculty[$i]}? y/n " next_list
            done
        done
else
    next_list=y
while [[ $next_list =~ ^y ]] ; do
    echo "$(</dev/clipboard)" | sed -f address.sed | uniq | vipe > email.txt
    echo >> $AREA/$COUNTY/$SCHOOL/address.txt
    read -p "Enter title, real URL=$URL " new_url
    echo "# ${new_url:=$URL}" | tr -d "\\n" >> $AREA/$COUNTY/$SCHOOL/address.txt ;
    echo \
         " Now new_url='$new_url',
         URL='$URL',
new_url:=URL=${new_url:=$URL}"
    echo >> $AREA/$COUNTY/$SCHOOL/address.txt
    cat email.txt >> $AREA/$COUNTY/$SCHOOL/address.txt
    address_page="n"
    while ! [[ $address_page =~ ^y ]] ; do
        vim $AREA/$COUNTY/$SCHOOL/address.txt ;
        svn diff $AREA/$COUNTY/$SCHOOL/address.txt ;
        echo
        read -p "$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
    done
    read -p "Commit as URL=$new_url? y/n " commit 
    if [[ $commit =~ ^y ]]
        then svn ci $AREA/$COUNTY/$SCHOOL/address.txt -m "$new_url"
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
        echo -e "\\n# $TOP" >> $AREA/$COUNTY/$SCHOOL/address.txt ;
        mv {,orig_}prof_page.html
        total=${#faculty[*]}
        for (( i=0; i<$total; i++ )); do
            if (( $i==$total-1 )) ; then echo -e "\\nLAST PAGE!!" ; fi
            url="${faculty[$i]%$'\r\n'}"
            uri=${url#$SCHEME}
            pathinfo=${uri#*$DOMAIN}
            host=${uri%.$DOMAIN$pathinfo}
            echo -e "\\nGetting faculty page $i of $total from file list:\\n
            ${faculty[$i]}↓
        URL=$url↓
SCHEME=$SCHEME, HOST=$host, DOMAIN=$DOMAIN, PATHINFO=$pathinfo\\n"
            dump_cookies > cookies.txt
            curl -b cookies.txt -c cookies.txt -kL "$url" |
                sed -f page.sed | uniq | vipe >> prof_page.html
        done
        exec 3<&0
        exec 0< /dev/tty
        page="n"
        while ! [[ $page =~ ^y ]] ; do
            vim prof_page.html
            echo
            read -p "Prof page looks good? y/n " page
            if [[ $page =~ ^y ]] ; then 
                rm email.txt
                dump_cookies > cookies.txt
                declare -i i=0
                echo >> $AREA/$COUNTY/$SCHOOL/address.txt
                while read p ; do
                    echo -e "\\n\\nReading page $((++i)) from prof_page.html\\n\\t\\t$p\\n"
                    echo $p >> cache_url.txt
                    echo "# $p" >> $AREA/$COUNTY/$SCHOOL/address.txt
                    curl -b cookies.txt -c cookies.txt -kL "${p%$'\r'}" |
                        sed -f address.sed | tee -a email.txt
                done < prof_page.html
            fi
        done
        if [[ $# -eq 3 ]]; then DEPARTMENT=$3 ; else DEPARTMENT=$HOST ; fi
        cat email.txt | uniq | vipe >> $AREA/$COUNTY/$SCHOOL/address.txt
        address_page="n"
        while ! [[ $address_page =~ ^y ]] ; do
            vim $AREA/$COUNTY/$SCHOOL/address.txt
            svn diff $AREA/$COUNTY/$SCHOOL/address.txt ;
            echo
            read -p "$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
        done
        read -p  "Commit as '$URL'? y/n " commit
        if [[ $commit =~ ^y ]]
            then svn ci $AREA/$COUNTY/$SCHOOL/address.txt -f cache_url.txt
        fi
        exec 0<&3
    elif [[ $# -le 3 ]]; then
        url=$TOP
        echo -e "\\nGetting faculty page from \$1:\\n
            $1↓
        URL=$url↓\\n
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
                        sed -f address.sed | tee -a email.txt
                done < prof_page.html
            fi
        done
        if [[ $# -eq 3 ]]; then DEPARTMENT=$3 ; else DEPARTMENT=$HOST ; fi
        echo -e "\\n# $URL" >> $AREA/$COUNTY/$SCHOOL/address.txt ;
        cat email.txt | uniq | vipe >> $AREA/$COUNTY/$SCHOOL/address.txt
        address_page="n"
        while ! [[ $address_page =~ ^y ]] ; do
            vim $AREA/$COUNTY/$SCHOOL/address.txt
            svn diff $AREA/$COUNTY/$SCHOOL/address.txt ;
            echo
            read -p "$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
        done
        read -p "Enter new URL=$URL " new_url
        read -p "Commit as URL=${new_url:=$URL}? y/n " commit 
        if [[ $commit =~ ^y ]]
            then svn ci $AREA/$COUNTY/$SCHOOL/address.txt -m "$new_url"
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
                    curl -b cook -kL "${p%$'\r'}" | sed -f address.sed | tee -a email.txt
                done < prof_page.html
            fi
        done
        exec 3>&-
        if [[ $# -eq 5 ]]; then DEPARTMENT=$5 ; else DEPARTMENT=$HOST ; fi
        echo -e "\\n# http://$DEPARTMENT.$SCHOOL.ac.kr" >> $AREA/$COUNTY/$SCHOOL/address.txt ;
        cat email.txt | uniq | vipe >> $AREA/$COUNTY/$SCHOOL/address.txt
        address_page="n"
        while ! [[ $address_page =~ ^y ]] ; do
            svn diff $AREA/$COUNTY/$SCHOOL/address.txt ;
            echo
            read -p "$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
        done
        read -p  "Commit as 'http://$DEPARTMENT.$SCHOOL.ac.kr'? y/n " commit
        if [[ $commit =~ ^y ]]
            then svn ci $AREA/$COUNTY/$SCHOOL/address.txt -m "http://$DEPARTMENT.$SCHOOL.ac.kr"
        fi
    fi
}
function p () {
    TOP=$1
    PROF_INDEX=$2
    EMAIL_INDEX=$3
    curl -kL "$TOP" | sed -e "/$PROF_INDEX/!d" -f page.sed | uniq | vipe > prof_page.html
    prof_page="n"
    while ! [[ $prof_page =~ ^y ]] ; do
        cat prof_page.html
        read -p "Prof page looks good? y/n " prof_page
        if [[ $prof_page =~ ^y ]] ; then 
            # rm email_page.html
            while read p ; do
                curl -kL "${p%$'\r'}" | sed -e "/$EMAIL_INDEX/!d" -f page.sed
            done < prof_page.html > email_page.html
        fi
    done
    email_page="n"
    while ! [[ $email_page =~ ^y ]] ; do
        vipe <> email_page.html
        read -p "Email page looks good? y/n " email_page
    done
    while read p ; do
        curl -kL "${p%$'\r'}" | sed -f address.sed
    done < email_page.html > email.txt
    if [[ $# -eq 4 ]]; then DEPARTMENT=$4 ; fi
    echo -e "\\n# http://$DEPARTMENT.$SCHOOL.ac.kr" >> $COUNTY/$SCHOOL/address.txt ;
    cat email.txt | uniq | vipe >> $AREA/$COUNTY/$SCHOOL/address.txt
    address_page="n"
    while ! [[ $address_page =~ ^y ]] ; do
        svn diff $AREA/$COUNTY/$SCHOOL/address.txt ;
        echo
        read -p "$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
    done
    read -p  "Commit as 'http://$DEPARTMENT.$SCHOOL.ac.kr'? y/n " commit
    if [[ $commit =~ ^y ]]
        then svn ci $AREA/$COUNTY/$SCHOOL -m "http://$DEPARTMENT.$SCHOOL.ac.kr"
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
    cd ~/edit/trunk/email || exit 1
    SCHOOL=$school DEPARTMENT=$department screen -c /home/$USER/dot/screen/scrape.rc -dR scrape_$school
    cd -
}

function pp () {
    if [[ $# -gt 2 ]]; then
        echo "$@: Too many args" >&2
        return 2
    elif [[ $# -eq 2 ]]; then
        prof_edit $@
    elif [[ $# -eq 1 ]]; then
        prof_remove $@
    else
        echo "$@: No args" >&2
        return 2
    fi
}

function prof_remove () {
    if [[ -v 1 ]] ; then
        echo "$@: No args" >&2
        return 2
    fi
    AREA=${AREA%/}
    address=$(grep -l "^$1" $AREA/*/*/address.txt)
    echo $address | xargs sed -i.BAK -e "s/^\($1\)\(\s\|$\)/# \1/"
    svn diff $AREA/*/*/address.txt;
    echo -ne "\nCommit? y/n "
    read proceed
    if [[ $proceed =~ ^y ]]
        then svn ci $AREA/*/*/address.txt -m "$1: User unknown"
    fi
}

alias pf='prof_find'
function prof_find () {
    address_list=$(eval echo $AREA/*/*/address.txt)
    address=$1
    file=$(grep -l "$address" $address_list)
    v $file +/$address
}

function prof_edit () {
    if [[ -v 1 ]] ; then
        echo "$@: No args" >&2
        return 2
    fi
    AREA=${AREA%/}
    address=$(grep -l "^$1" $AREA/*/*/address.txt)
    echo $address | xargs sed -i.BAK -e "s/^\($1\)\(\s\|$\)/$2 # \1/"
    sed -i.BAK -e "$ a\
        $2" requeue
    svn diff $AREA/*/*/address.txt requeue
    echo -ne "\nTry \"$2\" again? y/n "
    read send
    if [[ $send =~ ^y ]]
        then screen -p 1 -X stuff \
            "echo $2 | /sdf/udd/d/drbean/job/send.sh^M"
        echo "Sending to $2 via send.sh on sdf."
        svn revert requeue
    fi
    svn st $AREA | sed -e '/^M/!d'
    echo -ne "\nCommit with message:
$1: Edited
$2? y/n "
    read commit
    if [[ $commit =~ ^y ]]
        then svn ci $AREA/*/*/address.txt requeue \
           -m "$1: Edited
$2"
    fi
}

function premail () {
    OPTIND=1
    local arg school department url
    while getopts 's:d:u:' arg
    do
        case ${arg} in
            s) school=${OPTARG};;
            d) department=${OPTARG};;
            u) url=$OPTARG;;
            *) return 1 # illegal option
        esac
    done
    cd ~/edit/trunk/email || exit 1
    AREA=${AREA:-kyengsang}; COUNTY=${COUNTY:-pukto}
    SCHOOL=${school:-kmu}; DEPARTMENT=$department; URL=$url
    A="$HOME/edit/trunk/email/$AREA/$COUNTY/$SCHOOL/address.txt" 
    export A AREA COUNTY SCHOOL DEPARTMENT URL
    screen -c /home/$USER/dot/screen/premail.rc -dR premail.$school
    cd -
}

function email () {
    OPTIND=1
    local arg area county
    while getopts 'a:c:' arg
    do
        case ${arg} in
            a) area=${OPTARG};;
            c) county=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/edit/trunk/email || exit 1
    AREA=${area:-south} COUNTY=${county:-*} screen -c /home/$USER/dot/screen/email.rc -dR email.${area%/}
    cd -
}

function old_address () { sed -i.BAK -E 's/^([^#]+)#.*$/\1/' south/$COUNTY/*/address.txt ; } 
function eol_space () { sed -i.BAK -e 's/\s*$//' $AREA/*/*/address.txt ; }
function wrong_char () { sed -e '/^#/d' $AREA/$COUNTY/*/address.txt | grep -r -P '[^-_.a-zA-Z0-9@]' - ; }
function unescaped_uri () { grep -e '[^-_.a-zA-Z0-9@#/:?&=% ]' $AREA/$COUNTY/*/address.txt ; }
function in_addr_space () { sed -n -e '/#/d' -e '/\s.*@/p' -e '/@.*\s/p' $AREA/$COUNTY/*/address.txt ; }
function no_at_mark () { sed -e '/^#/d' -e '/^$/d' -e '/@/d' ${AREA}/$COUNTY/*/address.txt ; }

function postmail () {
    OPTIND=1
    local arg area county
    while getopts 'a:c:' arg
    do
        case ${arg} in
            a) area=${OPTARG};;
            c) county=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/edit/trunk/email || exit 1
    AREA=${area:-midsouth} COUNTY=${county:-*} screen -c /home/$USER/dot/screen/postmail.rc -dR postmail.${area%/}
}
