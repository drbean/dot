# functions, vars etc instantiated in bashrc for mastodon use
# other script files in curriculum/pages/mastodon,posse

declare -xA instance=( [burn]=burningboard.net [soc]=mastodon.social [ja]=mstdn.jp [ko]=duk.space [zh]=g0v.social [math]=mathstodon.xyz [sec]=infosec.exchange [hack]=hachyderm.io)

declare -x instanceS="${!instance[@]}"

for i in $instanceS ; do declare -x ${i}_instance=${instance[$i]} ; done

for i in $instanceS ; do
    eval "function $i.toot () { toot --as drbean@${instance[$i]} \"\$@\" ; }"
done

for i in $instanceS; do
    eval "function ${i}_toot_tui () { $i.toot tui -m cygstart ; }"
done

echo "for i in \$instanceS ; do screen bash -lic \${i}_toot_tui ; done" > ~/curriculum/pages/mastodon/toot_instance

alias mastodon_-o="mastodon -o"

for i in $instanceS; do
    eval "function $i.pub () { pub -i $i \"\$@\" ; }"
done

function unfollow_follow () { account=$1 ; preinstance=$2 ; postinstance=$3 ;  $preinstance.toot unfollow $account &&  $postinstance.toot follow  $account ;  }

function conitzer () {
    i=$1
    status=status-$i.json
    conitzers=~/curriculum/pages/mastodon/math/conitzer
    story=$M/ConitzerFail.md
    enterline=$(( $(wc -l < $story) - 11 ))
    if [[ -f $(pwd)/$status ]] ; then mv $(pwd)/$status $conitzers ; fi
    url=$(yq -r .url $conitzers/$status)
    link=$(sed -nE 's/^(.*)$/\[\1]\(\1\)/p' <<< $url)
    content=$(yq -r .content $conitzers/$status | sed -nE 's/"/\\"/gp')
    echo url = "$url" , link = "$link" , spoiler = "$spoiler"
    echo content = $content
    ai="### $link\\
\\
###### Conitzer toot content:\\
\\
$content\\
\\
###### Dr Bean response:\\
\\
###### Making of the sausage:\\
\\
###### Sausage prophylactic:\\
\\
"
    echo ai = $ai
    echo enterline = $enterline
    sed -i.BAK -E "${enterline}a\\
$ai" $story
    cygstart $url
    tt ::pages -t AIFail -s ConitzerFail
}

function mjd () {
    i=$1
    status=status-$i.json
    mjds=~/curriculum/pages/mastodon/math/mjd
    story=$M/MJDFailUp.md
    enterline=$(( $(wc -l < $story) - 10 ))
    if [[ -f $(pwd)/$status ]] ; then mv $(pwd)/$status $mjds ; fi
    url=$(yq -r .url $mjds/$status)
    link=$(sed -nE 's/^(.*)$/\[\1]\(\1\)/p' <<< $url)
    spoiler=$(yq -r .spoiler_text $mjds/$status)
    content=$(yq -r .content $mjds/$status)
    echo url = "$url" , link = "$link" , spoiler = "$spoiler"
    preamble="\\
### $link\\
\\
###### MJD toot content:\\
\\
$spoiler\\
\\
"
    echo content = $content
    ai="$preamble\\
$content\\
\\
###### MJD evaluation:\\
\\
+ AI-positive\\
\\
+ AI-neutral\\
\\
+ AI-negative\\
\\
###### Dr Bean evaluation:\\
\\
"
    echo ai = $ai
    echo enterline = $enterline
    echo preamble = $preamble
#     sed -i.BAK -E "${enterline}i\\
# $preamble" $story
    sed -i.BAK -E "${enterline}a\\
$ai" $story
# echo $ai >> $story
    cygstart $url
    tt ::pages -t AIFail -s MJDFailUp
}
