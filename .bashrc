# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# ingydotnet/git-hub
source ~/dot/git/git-hub/init

alias web="cd; screen -c /home/$USER/dot/.screen/web.rc -dR web; cd -"
alias surf="cd ~/sr; screen -dR surfraw; cd -"
alias tennis="cd ~/tennis; screen -dR tennis; cd -"
alias beans="cd ~/class/beans; APP=beans COURSE= screen -c /home/$USER/dot/.screen/project.rc -dR beans; cd -"
alias swiss="cd ~/swiss; APP=swiss COURSE=business screen -c /home/$USER/dot/.screen/project.rc -dR swiss; cd -"
alias comp="cd ~/comp; APP=comp COURSE=conversation STORY=trinka screen -c /home/$USER/dot/.screen/project.rc -dR comp; cd -"
alias rdf="cd ~/rdf; screen -c /home/$USER/dot/.screen/rdf.rc -dR rdf; cd -"

function edit () {
    OPTIND=1
    local arg source
    while getopts 's:' arg
    do
        case ${arg} in
            s) source=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/edit/$source
    SOURCE=$source screen -c /home/$USER/dot/.screen/edit.rc -dR edit
    cd -
}

function aca () {
    OPTIND=1
    local arg app=aca course topic story old_story round league script_arg
    while getopts 'c:t:s:o:r:l:x:' arg
    do
        case ${arg} in
            c) course=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            o) old_story=${OPTARG};;
	    r) round=${OPTARG};;
            l) league=${OPTARG};;
            x) script_arg=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/$app
    APP=$app COURSE=$course TOPIC=$topic STORY=$story OLD_STORY=$old_story BASE=${old_story/-*/} ROUND=$round LEAGUE=$league SCRIPT_ARG=$script_arg screen -c /home/$USER/dot/.screen/$app.rc -dR ${app}_$course
    cd -
}

function dic () {
    OPTIND=1
    local arg app=dic course topic story old_story round league script_arg
    while getopts 'c:t:s:o:r:l:x:' arg
    do
        case ${arg} in
            c) course=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            o) old_story=${OPTARG};;
	    r) round=${OPTARG};;
            l) league=${OPTARG};;
            x) script_arg=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/$app
    APP=$app MOD=${app^} COURSE=$course TOPIC=$topic STORY=$story OLD_STORY=$old_story ROUND=$round LEAGUE=$league SCRIPT_ARG=$script_arg screen -c /home/$USER/dot/.screen/app.rc -dR dic_$course
    cd -
}

function bett () {
    OPTIND=1
    local arg app=bett course topic story old_story round league script_arg
    while getopts 'c:s:o:r:l:x:' arg
    do
        case ${arg} in
            c) course=${OPTARG};;
            s) story=${OPTARG};;
            o) old_story=${OPTARG};;
	    r) round=${OPTARG};;
            l) league=${OPTARG};;
            x) script_arg=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/bett
    APP=bett \
    MOD=${app^} \
    COURSE=$course \
    STORY=$story \
    OLD_STORY=$old_story \
    ROUND=$round \
    LEAGUE=$league \
    SCRIPT_ARG="-t Non-competitive -g $course -i $story -d \"$script_arg\"" \
    screen -c /home/$USER/dot/.screen/app.rc -dR bett
    cd -
}

alias hpaste="cd ~/hpaste; screen -dR hpaste; cd -"

alias dot="cd ~/dot; screen -c /home/$USER/dot/.screen/dotrc -dR dot; cd -"
alias irc="cd ~/znc; screen -c /home/$USER/dot/.screen/irc.rc -dR irc; cd -"

alias csfp="cd ~/class/csfp; screen -c /home/$USER/dot/.screen/csfprc -dR csfp; cd -"

alias nlp="cd ~/nlp; screen -dR nlp; cd -"

function GF () {
    OPTIND=1
    local module
    while getopts 'c:t:s:' arg
    do
        case ${arg} in
	    c) course=${OPTARG};;
	    t) topic=${OPTARG};;
	    s) story=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/GF
    COURSE=$course \
    TOPIC=$topic \
    STORY=$story \
    MOD=${story^} \
    screen -c /home/$USER/dot/.screen/gf.rc -dR GF_$story
    cd -
}

function pages () {
    OPTIND=1
    local arg course story
    while getopts 'c:t:s:o:l:x:' arg
    do
        case ${arg} in
            c) course=${OPTARG};;
            s) story=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/class/pagestranscripts
    COURSE=$course \
    STORY=$story \
    screen -c /home/$USER/dot/.screen/pagestranscripts.rc -dR pages_$course
    cd -
}

function sound () {
    OPTIND=1
    local arg course
    while getopts 'c:d:' arg
    do
        case ${arg} in
            c) course=${OPTARG};;
            d) directory=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/下載/soundfiles
    COURSE=$course \
    DIRECTORY=$directory \
    screen -c /home/$USER/dot/.screen/soundfiles.rc -dR sound_$course
    cd -
}

alias class="cd ~/class; screen -c /home/$USER/dot/.screen/utility.rc -dR class; cd -"
alias forms="cd ~/class/forms; screen -dR forms; cd -"
alias tmpl="cd ~/class/tmpl; screen -c /home/$USER/dot/.screen/utility.rc -dR tmpl; cd -"
alias rc="cd ~/041/rc; screen -c /home/$USER/dot/.screen/utility.rc -dR rc; cd -"

function pres () {
    OPTIND=1
    local arg course=presentation topic story
    while getopts 't:s:' arg
    do
        case ${arg} in
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/presentation
	COURSE=$course \
	VIEW=$course \
	TOPIC=$topic \
	STORY=$story \
	FORM=0 \
	screen -c /home/$USER/dot/.screen/course.rc -dR pres_$topic
	cd -
}

function speaking () {
    OPTIND=1
    local arg course=speaking topic story
    while getopts 'v:t:s:' arg
    do
        case ${arg} in
            v) view=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/speaking
	COURSE=$course \
	VIEW=$view \
	TOPIC=$topic \
	STORY=$story \
	FORM=0 \
	screen -c /home/$USER/dot/.screen/course.rc -dR speaking
	cd -
}

function top () {
    OPTIND=1
    local arg course=topics view topic story form
    while getopts 't:s:f:' arg
    do
        case ${arg} in
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            f) form=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/$course
	COURSE=$course \
	VIEW="topics" \
	TOPIC=$topic \
	STORY=$story \
	FORM=$form \
	screen -c /home/$USER/dot/.screen/course.rc -dR topics_$topic
	cd -
}

function college () {
    OPTIND=1
    local arg course=college view topic story form
    while getopts 'c:v:t:s:f:' arg
    do
        case ${arg} in
            v) view=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            f) form=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/$course
	COURSE=$course \
	VIEW=$view \
	TOPIC=$topic \
	STORY=$story \
	FORM=$form \
	screen -c /home/$USER/dot/.screen/course.rc -dR $course
	cd -
}

function biz () {
    OPTIND=1
    local arg course=business view topic story form
    while getopts 'c:v:t:s:f:' arg
    do
        case ${arg} in
            v) view=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            f) form=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/$course
	COURSE=$course \
	VIEW=$view \
	TOPIC=$topic \
	STORY=$story \
	FORM=$form \
	screen -c /home/$USER/dot/.screen/course.rc -dR $course
	cd -
}

function cnv () {
    OPTIND=1
    local arg course=conversation view topic story form
    while getopts 'v:t:s:f:' arg
    do
        case ${arg} in
            v) view=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            f) form=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/$course
	COURSE=$course \
	VIEW=$view \
	TOPIC=$topic \
	STORY=$story \
	FORM=$form \
	screen -c /home/$USER/dot/.screen/course.rc -dR $course
	cd -
}

function intm () {
    OPTIND=1
    local arg course=intm view topic story form
    while getopts 'c:v:t:s:f:' arg
    do
        case ${arg} in
            v) view=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            f) form=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/$course
	COURSE=$course \
	VIEW=$view \
	TOPIC=$topic \
	STORY=$story \
	FORM=$form \
	screen -c /home/$USER/dot/.screen/course.rc -dR $course
	cd -
}

function call () {
    OPTIND=1
    local arg course=call view topic story form
    while getopts 'c:v:t:s:f:' arg
    do
        case ${arg} in
            v) view=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            f) form=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/$course
	COURSE=$course \
	VIEW=$view \
	TOPIC=$topic \
	STORY=$story \
	FORM=$form \
	screen -c /home/$USER/dot/.screen/course.rc -dR $course
	cd -
}

function tech () {
    OPTIND=1
    local arg course=tech view topic story form
    while getopts 'c:v:t:s:f:' arg
    do
        case ${arg} in
            v) view=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            f) form=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/$course
	COURSE=$course \
	VIEW=$view \
	TOPIC=$topic \
	STORY=$story \
	FORM=$form \
	screen -c /home/$USER/dot/.screen/course.rc -dR $course
	cd -
}

function m () {
    OPTIND=1
    local arg course=media view topic story form
    while getopts 'c:v:t:s:f:' arg
    do
        case ${arg} in
            v) view=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            f) form=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/$course
	COURSE=$course \
	VIEW=$view \
	TOPIC=$topic \
	STORY=$story \
	FORM=$form \
	screen -c /home/$USER/dot/.screen/course.rc -dR $course
	cd -
}

function tour () {
    OPTIND=1
    local arg course=tourism view topic story form
    while getopts 'v:t:s:f:' arg
    do
        case ${arg} in
            v) view=${OPTARG};;
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            f) form=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/$course
	COURSE=$course \
	VIEW=$view \
	TOPIC=$topic \
	STORY=$story \
	FORM=$form \
	screen -c /home/$USER/dot/.screen/course.rc -dR $course
	cd -
}

function ex () {
    local arg course round topic story form
    case $1 in
	conversation) course=$1;;
	speaking) course=$1;;
	media) course=$1;;
	business) course=$1;;
	college) course=$1;;
	*) return 1 # illegal league
    esac
    OPTIND=2
    while getopts 'c:t:s:f:' arg
    do
        case ${arg} in
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            f) form=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    cd ~/class/$course
    COURSE=$course \
    VIEW=${topic:-$course} \
    TOPIC=$topic \
    STORY=$story \
    FORM=$form \
    screen -c /home/$USER/dot/.screen/exam_prep.rc -dR exam_$course
    cd -
}

function gr () {
    local arg league round topic n
    case $1 in
	FLA0003) league=$1;;
	FLA0008) league=$1;;
	FLA0011) league=$1;;
	FLA0024) league=$1;;
	2L1) league=$1;;
	KB1) league=$1;;
	MB1) league=$1;;
	*) return 1 # illegal league
    esac
    OPTIND=2
    while getopts 'r:t:n:' arg
    do
        case ${arg} in
            r) round=${OPTARG};;
            t) topic=${OPTARG};;
            n) n=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    if [[ -z "$n" ]]
	then n=3
    fi
    cd ~/041/$league
    LEAGUE=$league \
    ROUND=$round \
    NEXTROUND=$(($round+1)) \
    PREVROUND=$(($round-1)) \
    TOPIC=$topic \
    N=$n \
    screen -c /home/$USER/dot/.screen/grading.rc -dR s_$league
    cd -
}

function new () {
    local arg league n
    case $1 in
	FLA0003) league=$1;;
	FLA0008) league=$1;;
	FLA0011) league=$1;;
	FLA0024) league=$1;;
	2L1) league=$1;;
	KB1) league=$1;;
	MB1) league=$1;;
	*) return 1 # illegal league
    esac
    OPTIND=2
    while getopts 'r:t:n:' arg
    do
        case ${arg} in
            n) n=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    if [[ -z "$n" ]]
	then n=3
    fi
    cd ~/041/
    LEAGUE=$league \
    N=$n \
    SESSION=1 \
    PREVSESSION=$(($SESSION-1)) \
    screen -c /home/$USER/dot/.screen/setup.rc -dR s_$league
    cd -
}

alias intercultural="cd ~/class/intercultural; VIEW=intercultural TOPIC= screen -c /home/$USER/dot/.screen/course.rc -dR intercultural; cd -"
alias literature="cd ~/class/literature; VIEW=literature TOPIC= STORY=robin-hood FORM=2 screen -c /home/$USER/dot/.screen/course.rc -dR literature; cd -"

alias grammar="cd ~/class/curriculum/grammar; screen -dR grammar; cd -"
alias writing="cd ~/class/curriculum/writingreading; screen -dR writing; cd -"
alias reading="cd ~/class/curriculum/reading; screen -dR reading; cd -"
alias friends="cd ~/class/friends; screen -dR friends; cd -"
alias pop="cd ~/class/curriculum/pop; screen -dR pop; cd -"
alias ko="cd ~/class/curriculum/ko; screen -dR ko; cd -"
alias magazine="cd ~/class/magazine; screen -dR magazine; cd -"

alias 041="cd ~/041; screen -dR s041; cd -"

function session () {
    local league week
    league=$1
    week=$2
    case ${league} in
	2L1)
	    if (($week <= 3)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 12)); then session=3
	    elif (($week <= 13)); then session=4
	    elif (($week <= 18)); then session=5
	    else return 1 # illegal week
	    fi;;
	KB1)
	    if (($week <= 5)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 13)); then session=3
	    elif (($week <= 18)); then session=4
	    else return 1 # illegal week
	    fi;;
	MB1)
	    if (($week <= 5)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 13)); then session=3
	    elif (($week <= 18)); then session=4
	    else return 1 # illegal week
	    fi;;
	FLA0003)
	    if (($week <= 5)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 13)); then session=3
	    elif (($week <= 18)); then session=4
	    else return 1 # illegal week
	    fi;;
	FLA0008)
	    if (($week <= 5)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 13)); then session=3
	    elif (($week <= 18)); then session=4
	    else return 1 # illegal week
	    fi;;
	FLA0011)
	    if (($week <= 5)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 13)); then session=3
	    elif (($week <= 18)); then session=4
	    else return 1 # illegal week
	    fi;;
	FLA0024)
	    if (($week <= 5)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 13)); then session=3
	    elif (($week <= 18)); then session=4
	    else return 1 # illegal week
	    fi;;
	*) return 1 # illegal league
    esac
}

function tables () {
    local league letter
    league=$1
    letter=$2
    case ${league} in
		# 16 groups
	2L1)
	    case ${letter} in
		X) tables="1-1,1-2,2-1,2-2,3-1,3-2,4-1,4-2,5-1,5-2";;
		*) return 1 # illegal option
	    esac;;
	KB1)
	    case ${letter} in
		X) tables="1-1,1-2,2-1,2-2,3-1,3-2,4-1,4-2";;
		*) return 1 # illegal option
	    esac;;
	MB1)
	    case ${letter} in
		X) tables="1-1,1-2,2-1,2-2,3-1,3-2,4-1,4-2";;
		*) return 1 # illegal letter
	    esac;;
	FLA0003)
	    case ${letter} in
		X) tables="1-1,1-2,1-3,1-4,1-5,2-1,2-2,2-3,2-4,2-5,2-6,3-1,3-2,3-3,3-4,3-5,4-1,4-2,4-3,4-4,4-5";;
		*) return 1 # illegal option
	    esac;;
	FLA0008)
	    case ${letter} in
		X) tables="1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-5,2-6,3-1,3-2,3-3,3-4";;
		*) return 1 # illegal option
	    esac;;
	FLA0011)
	    case ${letter} in
		A) tables="1-1,1-2::1-3,1-4::2-1,2-2::2-3,2-4::3-1,3-2";;
		X) tables="1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2";;
		*) return 1 # illegal option
	    esac;;
	FLA0024)
	    case ${letter} in
		X) tables="1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3";;
		*) return 1 # illegal option
	    esac;;
	*) return 1 # illegal league
    esac
}

function w () {
    local arg league session week letter topic tables
    case $1 in
	FLA0003) league=$1;;
	FLA0008) league=$1;;
	FLA0011) league=$1;;
	FLA0024) league=$1;;
	2L1) league=$1;;
	KB1) league=$1;;
	MB1) league=$1;;
	*) return 1 # illegal league
    esac
    week=$2
    OPTIND=3
    while getopts 'w:l:t:' arg
    do
        case ${arg} in
            l) letter=${OPTARG};;
            t) topic=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    session $league $week
    tables $league $letter
    cd ~/041/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/$USER/dot/.screen/class.rc -dR w_${league}_$week
    cd -
}

function FLA0003 () {
    OPTIND=1
    local arg league=FLA0003 session week letter topic tables
    while getopts 's:w:l:t:' arg
    do
        case ${arg} in
            s) session=${OPTARG};;
            w) week=${OPTARG};;
            l) letter=${OPTARG};;
            t) topic=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    case ${letter} in
	A) tables="Black::Blue,Brown::Gray,Orange::Pink,Purple::Red";;
	B) tables="Green::Black,Blue::Charcoal,Chocolate::Purple,White::Orange,Pink::Yellow";;
	C) tables="Black::Blue,Chocolate::Charcoal,Green::Orange,Pink::Purple,Yellow::White";;
	X) tables="Green::Black,Blue::Charcoal,Chocolate::Purple,White::Orange,Pink::Yellow";;
	*) return 1 # illegal option
    esac
    cd ~/041/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/$USER/dot/.screen/class.rc -dR ${league}_w_$week
    cd -
}

function FLA0008 () {
    OPTIND=1
    local arg league=FLA0008 session week letter topic tables
    while getopts 's:w:l:t:' arg
    do
        case ${arg} in
            s) session=${OPTARG};;
            w) week=${OPTARG};;
            l) letter=${OPTARG};;
            t) topic=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    case ${letter} in
	A) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White,Beige::Golden";;
	B) tables="Green::Black,Blue::Brown,Gray::Beige,Charcoal::Chocolate,White::Orange,Pink::Purple,Golden::Violet,Silver::Yellow,Khaki::Red";;
	C) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White,Beige::Golden";;
	B) tables="Green::Black,Blue::Brown,Gray::Beige,Charcoal::Chocolate,White::Orange,Pink::Purple,Golden::Violet,Silver::Yellow,Khaki::Red";;
	*) return 1 # illegal option
    esac
    cd ~/041/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/$USER/dot/.screen/class.rc -dR ${league}_w_$week
    cd -
}

function FLA0011 () {
    OPTIND=1
    local arg league=FLA0011 session week letter topic tables
    while getopts 's:w:l:t:' arg
    do
        case ${arg} in
            s) session=${OPTARG};;
            w) week=${OPTARG};;
            l) letter=${OPTARG};;
            t) topic=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    case ${letter} in
	A) tables="Black::,Blue::Brown,Red::Purple,Orange::Pink";;
	B) tables="Orange::,Black::Blue,Brown::Red,Purple::Pink";;
	C) tables="Black::,Blue::Brown,Red::Purple,Orange::Pink";;
	X) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White,Beige::Golden,Turquoise::";;
	*) return 1 # illegal option
    esac
    cd ~/041/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/$USER/dot/.screen/class.rc -dR ${league}_w_$week
    cd -
}

function FLA0024 () {
    OPTIND=1
    local arg league=FLA0024 session week letter topic tables
    while getopts 's:w:l:t:' arg
    do
        case ${arg} in
            s) session=${OPTARG};;
            w) week=${OPTARG};;
            l) letter=${OPTARG};;
            t) topic=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    case ${letter} in
	A) tables="Black::,Blue::Brown,Red::Purple,Orange::Pink";;
	B) tables="Orange::,Black::Blue,Brown::Red,Purple::Pink";;
	C) tables="Black::,Blue::Brown,Red::Purple,Orange::Pink";;
	X) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White,Beige::Golden,Turquoise::";;
	*) return 1 # illegal option
    esac
    cd ~/041/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/$USER/dot/.screen/class.rc -dR ${league}_w_$week
    cd -
}

function GL00019 () {
    OPTIND=1
    local arg league=GL00019 session week letter topic tables
    while getopts 's:w:l:t:' arg
    do
        case ${arg} in
            s) session=${OPTARG};;
            w) week=${OPTARG};;
            l) letter=${OPTARG};;
            t) topic=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    case ${letter} in
	A) tables="Black::Green,Orange::Charcoal,Pink::";;
	B) tables="Black::Blue,Yellow::Green,Orange::Brown,Gray::";;
	C) tables="Black::Gray,Orange::Green,Blue::Brown,Yellow::";;
	X) tables="Black::Blue,Yellow::Green,Orange::Brown,Gray::";;
	*) return 1 # illegal option
    esac
    cd ~/041/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/$USER/dot/.screen/class.rc -dR ${league}_w_$week
    cd -
}

alias contest="cd ~/001/contest; screen -dR contest; cd -"

alias job="cd ~/job; screen -c /home/$USER/dot/.screen/job.rc -dR job; cd -"

alias q=exit

# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-3

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func

# vim: set ts=8 sts=4 sw=4 noet:

