#!/usr/bin/bash

# addresses on pages

function e () {
    URL=${1:-http://$DEPARTMENT.$SCHOOL.ac.kr}
    SCHEME=http*//
    URI=${URL#$SCHEME}
    DOMAIN=$SCHOOL.ac.kr
    PATHINFO=${URL#*$DOMAIN}
    HOST=${URI%.$DOMAIN$PATHINFO}
    if ! [[ -t 0 ]] ; then
        declare -a faculty
        readarray -t faculty
        if [[ $# -eq 1 ]]; then DEPARTMENT=$1
        else URL=${faculty[0]}
            URI=${URL#$SCHEME}
            PATHINFO=${URL#*$DOMAIN}
            HOST=${URI%.$DOMAIN$PATHINFO}
            DEPARTMENT=$HOST
        fi
        rm cache_url.txt
        total=${#faculty[*]}
        rm email.txt
        for (( i=0; i<$total; i++ )); do
            if (( $i==$total-1 )) ; then echo -e "\\nLAST PAGE!!" ; fi
            url=${faculty[$i]}
            echo -e "\\nGetting prof page $((i+1)) of $total from file list:\\n
            ${faculty[$i]}↓
        URL=$url↓
SCHEME=$SCHEME, HOST=$HOST, DOMAIN=$DOMAIN, PATHINFO=$PATHINFO\\n"
            echo $url >> cache_url.txt
            echo "# $url" >> $AREA/$COUNTY/$SCHOOL/address.txt
            dump_cookies > cookies.txt
            curl -b cookies.txt -c cookies.txt -kL $url |
                sed -f address.sed | sed -f cleanup.sed |
                    tee -a email.txt
        done
	< email.txt uniq | vipe >> $AREA/$COUNTY/$SCHOOL/address.txt
        exec 3<&0
        exec 0< /dev/tty
        address_page="n"
        while ! [[ $address_page =~ ^y ]] ; do
            vim $AREA/$COUNTY/$SCHOOL/address.txt ;
            svn diff $AREA/$COUNTY/$SCHOOL/address.txt ;
            echo
            read -p "$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
        done
        read -p  "commit with cache_url.txt='$(echo ; cat cache_url.txt)' " commit
        if [[ $commit =~ ^y ]]
            then svn ci $AREA/$COUNTY/$SCHOOL/address.txt -F cache_url.txt
        fi
        exec 0<&3
    elif [[ $# -le 2 ]]; then
        if [[ $# -eq 2 ]]; then DEPARTMENT=$2 ; else DEPARTMENT=$HOST ; fi
        echo -e "\\n# $URL" >> $AREA/$COUNTY/$SCHOOL/address.txt ;
        echo -e "\\nGetting prof address page from \$1:\\n
            $1↓
        URL=$URL↓\\n
SCHEME=$SCHEME, HOST=$HOST, DOMAIN=$DOMAIN, PATHINFO=$PATHINFO\\n"
        dump_cookies > cookies.txt
        curl -b cookies.txt -c cookies.txt -kL $URL |
            sed -f address.sed | sed -f cleanup.sed |
                vipe >> $AREA/$COUNTY/$SCHOOL/address.txt
                exec 3<&0
                exec 0< /dev/tty
        address_page="n"
        while ! [[ $address_page =~ ^y ]] ; do
            vim $AREA/$COUNTY/$SCHOOL/address.txt ;
            svn diff $AREA/$COUNTY/$SCHOOL/address.txt ;
            echo
            read -p "$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
        done
        read -p  "Commit as '$URL'? y/n " commit
        if [[ $commit =~ ^y ]]
            then exec svn ci $AREA/$COUNTY/$SCHOOL/address.txt -q \
                -m "$URL" > /dev/null 2>&1 &
        fi
        exec 0<&3
    elif [[ $# -le 4 ]]; then
        PRE_TOP=$2
        TOP_INDEX=$3
        IFS=' ' read -a top_index <<< $(eval echo "$TOP_INDEX")
        POST_TOP=${URL#$PRE_TOP${top_index[0]}}
        if [[ $# -eq 4 ]]; then DEPARTMENT=$4 ; else DEPARTMENT=$HOST ; fi
        echo -e "\\n# $PRE_TOP '$TOP_INDEX' $POST_TOP" >> $AREA/$COUNTY/$SCHOOL/address.txt ;
        declare -i n=0
        total=${#top_index[@]}
        rm email.txt
        for ix in ${TOP_INDEX[@]:0} ; do
            echo -e "\\nGetting prof page $((++n)) of $total from \$1~\$3:\\n
            $1
        PRE_TOP=$PRE_TOP, top_index=$ix, POST_TOP=$POST_TOP\\n
             URL=$PRE_TOP$ix$POST_TOP↓\\n"
            dump_cookies > cookies.txt
            curl -b cookies.txt -c cookies.txt -kL $PRE_TOP$ix$POST_TOP |
                    sed -f address.sed | sed -f cleanup.sed | uniq | tee -a email.txt
        done
        cat email.txt >> $AREA/$COUNTY/$SCHOOL/address.txt
        address_page="n"
        while ! [[ $address_page =~ ^y ]] ; do
            vim $AREA/$COUNTY/$SCHOOL/address.txt ;
            svn diff $AREA/$COUNTY/$SCHOOL/address.txt ;
            echo
            read -p "$AREA/$COUNTY/$SCHOOL/address.txt looks good? y/n " address_page
        done
        read -p  "Commit as \"$PRE_TOP '$TOP_INDEX' $POST_TOP\"? y/n " commit
        if [[ $commit =~ ^y ]]
            then svn ci $AREA/$COUNTY/$SCHOOL/address.txt -m "$PRE_TOP '$TOP_INDEX' $POST_TOP"
        fi
    fi
}

