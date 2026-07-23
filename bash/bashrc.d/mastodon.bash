# functions, vars etc instantiated in bashrc for mastodon use
# other script files in curriculum/pages/mastodon,posse

declare -xA instance=( [soc]=mastodon.social [ja]=mstdn.jp [ko]=duk.space [zh]=g0v.social [math]=mathstodon.xyz [sec]=infosec.exchange [hack]=hachyderm.io)

declare -x instanceS="${!instance[@]}"

for i in $instanceS ; do declare -x ${i}_instance=${instance[$i]} ; done

for i in $instanceS ; do
    eval "function $i.toot () { toot --as drbean@${instance[$i]} \"\$@\" ; }"
done

for i in $instanceS; do
    eval "alias ${i}_toot_tui=\"$i.toot tui -m cygstart\""
done

for i in $instanceS; do
    eval "function $i.pub () { pub -i $i \"\$@\" ; }"
done

function unfollow_follow () { account=$1 ; preinstance=$2 ; postinstance=$3 ;  $preinstance.toot unfollow $account &&  $postinstance.toot follow  $account ;  }

function mastodon () {
    OPTIND=0
    local arg ACCOUNT
    while getopts 'a:' arg
    do
        case ${arg} in
            a) ACCOUNT=${OPTARG};;
        esac
    done
    export ACCOUNT
    cd ~/curriculum/pages/mastodon
    screen -c /home/$USER/dot/screen/toot.rc -dR mastodon
    cd -
}

function conitzer () {
	i=$1
	status=status-$i.json
	conitzers=~/curriculum/pages/mastodon/math/conitzer
	story=$M/ConitzerFail.md
	enterline=$(( $(wc -l < $story) - 11 ))
	mv $(pwd)/$status $conitzers
	url=$(yq .url $conitzers/$status | sed -nE 's/^"(.*)"$/\[\1]\(\1\)/')
	ai="$url
\
	###### Making of the sausage:\
\
	###### Sausage prophylactic:\
\
	"
	echo $ai
	sed -E "${enterline}a\ 
	$ai"

}
