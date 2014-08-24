# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias web="cd; screen -c /home/drbean/dot/.screen/web.rc -dR web; cd -"
alias surf="cd ~/sr; screen -dR surfraw; cd -"
alias tennis="cd ~/tennis; screen -dR tennis; cd -"
alias beans="cd ~/class/beans; APP=beans COURSE= screen -c /home/drbean/dot/.screen/project.rc -dR beans; cd -"
alias swiss="cd ~/swiss; APP=swiss COURSE=business screen -c /home/drbean/dot/.screen/project.rc -dR swiss; cd -"
alias comp="cd ~/comp; APP=comp COURSE=conversation STORY=trinka screen -c /home/drbean/dot/.screen/project.rc -dR comp; cd -"
alias rdf="cd ~/rdf; screen -c /home/drbean/dot/.screen/rdf.rc -dR rdf; cd -"

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
    SOURCE=$source screen -c /home/drbean/dot/.screen/edit.rc -dR edit
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
    APP=$app COURSE=$course TOPIC=$topic STORY=$story OLD_STORY=$old_story ROUND=$round LEAGUE=$league SCRIPT_ARG=$script_arg screen -c /home/drbean/dot/.screen/app.rc -dR aca_$course
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
    APP=$app MOD=${app^} COURSE=$course TOPIC=$topic STORY=$story OLD_STORY=$old_story ROUND=$round LEAGUE=$league SCRIPT_ARG=$script_arg screen -c /home/drbean/dot/.screen/app.rc -dR dic_$course
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
    screen -c /home/drbean/dot/.screen/app.rc -dR bett
    cd -
}

alias hpaste="cd ~/hpaste; screen -dR hpaste; cd -"

alias dot="cd ~/dot; screen -c /home/drbean/dot/.screen/dotrc -dR dot; cd -"
alias irc="cd ~/znc; screen -c /home/drbean/dot/.screen/irc.rc -dR irc; cd -"

alias csfp="cd ~/class/csfp; screen -c /home/drbean/dot/.screen/csfprc -dR csfp; cd -"

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
    screen -c /home/drbean/dot/.screen/gf.rc -dR GF_$story
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
    screen -c /home/drbean/dot/.screen/pagestranscripts.rc -dR pages_$course
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
    cd ~/soundfiles
    COURSE=$course \
    DIRECTORY=$directory \
    screen -c /home/drbean/dot/.screen/soundfiles.rc -dR sound_$course
    cd -
}

alias class="cd ~/class; screen -dR class; cd -"
alias forms="cd ~/class/forms; screen -dR forms; cd -"
alias tmpl="cd ~/class/tmpl; screen -c /home/drbean/dot/.screen/utility.rc -dR tmpl; cd -"
alias rc="cd ~/031/rc; screen -c /home/drbean/dot/.screen/utility.rc -dR rc; cd -"

function topics () {
    OPTIND=1
    local arg course=topics topic
    while getopts 'c:v:t:s:f:' arg
    do
        case ${arg} in
            t) topic=${OPTARG};;
            s) story=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
	cd ~/class/$course
	COURSE=$course \
	VIEW=$course \
	TOPIC=$topic \
	STORY=$story \
	FORM=0 \
	screen -c /home/drbean/dot/.screen/course.rc -dR topics_$topic
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
	screen -c /home/drbean/dot/.screen/course.rc -dR $course
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
	screen -c /home/drbean/dot/.screen/course.rc -dR $course
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
	screen -c /home/drbean/dot/.screen/course.rc -dR $course
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
	screen -c /home/drbean/dot/.screen/course.rc -dR $course
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
	screen -c /home/drbean/dot/.screen/course.rc -dR $course
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
	screen -c /home/drbean/dot/.screen/course.rc -dR $course
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
	screen -c /home/drbean/dot/.screen/course.rc -dR $course
	cd -
}

function ex () {
    local arg course round topic story form
    case $1 in
	conversation) course=$1;;
	business) course=$1;;
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
    TOPIC=$topic \
    STORY=$story \
    FORM=$form \
    screen -c /home/drbean/dot/.screen/exam_prep.rc -dR exam_$course
    cd -
}

function gr () {
    local arg league round topic n
    case $1 in
	2040) league=$1;;
	3024) league=$1;;
	GL00019) league=$1;;
	2L1) league=$1;;
	MB1) league=$1;;
	3K0) league=$1;;
	B32) league=$1;;
	FLA0018) league=$1;;
	FLA0021) league=$1;;
	FLA0027) league=$1;;
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
    cd ~/031/$league
    LEAGUE=$league \
    ROUND=$round \
    NEXTROUND=$(($round+1)) \
    TOPIC=$topic \
    N=$n \
    screen -c /home/drbean/dot/.screen/grading.rc -dR s_$league
    cd -
}

alias intercultural="cd ~/class/intercultural; VIEW=intercultural TOPIC= screen -c /home/drbean/dot/.screen/course.rc -dR intercultural; cd -"
alias literature="cd ~/class/literature; VIEW=literature TOPIC= STORY=robin-hood FORM=2 screen -c /home/drbean/dot/.screen/course.rc -dR literature; cd -"

alias grammar="cd ~/class/curriculum/grammar; screen -dR grammar; cd -"
alias writing="cd ~/class/curriculum/writingreading; screen -dR writing; cd -"
alias speaking="cd ~/class/curriculum/speaking; screen -dR speaking; cd -"
alias reading="cd ~/class/curriculum/reading; screen -dR reading; cd -"
alias friends="cd ~/class/friends; screen -dR friends; cd -"
alias pop="cd ~/class/curriculum/pop; screen -dR pop; cd -"
alias ko="cd ~/class/curriculum/ko; screen -dR ko; cd -"
alias magazine="cd ~/class/magazine; screen -dR magazine; cd -"

alias 031="cd ~/031; screen -dR s031; cd -"

function session () {
    local league week
    league=$1
    week=$2
    case ${league} in
	2040)
	    if (($week <= 5)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 13)); then session=3
	    elif (($week <= 18)); then session=4
	    else return 1 # illegal week
	    fi;;
	3024)
	    if (($week <= 5)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 13)); then session=3
	    elif (($week <= 18)); then session=4
	    else return 1 # illegal week
	    fi;;
	GL00019)
	    if (($week <= 5)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 13)); then session=3
	    elif (($week <= 18)); then session=4
	    else return 1 # illegal week
	    fi;;
	2L1)
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
	3K0)
	    if (($week <= 5)); then session=1
	    elif (($week <= 9)); then session=2
	    elif (($week <= 13)); then session=3
	    elif (($week <= 18)); then session=4
	    else return 1 # illegal week
	    fi;;
	FLA0021)
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
	2040)
	    case ${letter} in
		A) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White";;
		B) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White";;
		C) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White";;
		# A) tables="Green::Black,Blue::Brown,Gray::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Violet,Silver::Yellow";;
		# B) tables="Green::Black,Blue::Brown,Gray::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Violet,Silver::Yellow";;
		# C) tables="Green::Black,Blue::Brown,Gray::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Violet,Silver::Yellow";;
		# C) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White";;
		X) tables="Green::Black,Blue::Brown,Gray::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Violet,Silver::Yellow";;
		*) return 1 # illegal letter
	    esac;;
		# 19 groups
	2L1)
	    case ${letter} in
		# A) tables="Black::Blue,Brown::Gray,Green::Charcoal,Chocolate::Khaki,Orange::Pink,Purple::Red,White::Yellow,Silver::Violet,Beige::Golden,Turquoise::Window";;
		# B) tables="Black::Blue,Brown::Gray,Green::Charcoal,Chocolate::Khaki,Orange::Pink,Purple::Red,White::Yellow,Silver::Violet,Beige::Golden,Turquoise::Window";;
		# C) tables="Black::Blue,Brown::Gray,Green::Charcoal,Chocolate::Khaki,Orange::Pink,Purple::Red,White::Yellow,Silver::Violet,Beige::Golden,Turquoise::Window";;
		A) tables="Green::Black,Blue::Brown,Gray::Beige,Turquoise::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Golden,Violet::Window,Silver::Yellow,";;
		B) tables="Green::Black,Blue::Brown,Gray::Beige,Turquoise::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Golden,Violet::Window,Silver::Yellow,";;
		C) tables="Green::Black,Blue::Brown,Gray::Beige,Turquoise::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Golden,Violet::Window,Silver::Yellow,";;
		# C) tables="Black::Charcoal,Green::Blue,Brown::Khaki,Chocolate::Gray,Orange::Red,Pink::Purple,White::Yellow,Silver::Violet,Beige::Turquoise,Golden::Window";;
		X) tables="Green::Black,Blue::Brown,Gray::Beige,Turquoise::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Golden,Violet::Window,Silver::Yellow,";;
		Y) tables="Green::Black,Charcoal::Blue,Chocolate::Brown,Khaki::Gray,White::Orange,Pink::Purple,Red::Yellow";;
		Z) tables="Green::Black,Charcoal::Blue,Chocolate::Brown,Khaki::Gray,Orange::Purple,Pink::Red,White::Yellow";;
		*) return 1 # illegal option
	    esac;;
	MB1)
	    case ${letter} in
		A) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White,Beige::Golden";;
		B) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White,Beige::Golden";;
		C) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White,Beige::Golden";;
		# B) tables="Green::Black,Blue::Brown,Gray::Beige,Charcoal::Chocolate,White::Orange,Pink::Purple,Golden::Violet,Silver::Yellow,Khaki::Red";;
		# C) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White,Beige::Golden";;
		X) tables="Green::Black,Blue::Brown,Gray::Beige,Charcoal::Chocolate,White::Orange,Pink::Purple,Golden::Violet,Silver::Yellow,Khaki::Red";;
		*) return 1 # illegal option
	    esac;;
	3K0)
	    case ${letter} in
		A) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White,Beige::Golden,Turquoise::";;
		B) tables="Green::Black,Blue::Brown,Gray::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Violet,Silver::Yellow";;
		C) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White";;
		X) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White,Beige::Golden,Turquoise::";;
		*) return 1 # illegal letter
	    esac;;
	3024)
	    case ${letter} in
		# A) tables="Black::Blue,Charcoal::Green,Orange::Pink,Purple::Chocolate,Yellow::White";;
		# B) tables="Black::Blue,Charcoal::Green,Orange::Pink,Purple::Chocolate,Yellow::White";;
		# C) tables="Black::Blue,Charcoal::Green,Orange::Pink,Purple::Chocolate,Yellow::White";;
		A) tables="Green::Black,Charcoal::Blue,White::Orange,Yellow::Pink,Purple::Chocolate,Silver::Brown";;
		B) tables="Green::Black,Charcoal::Blue,White::Orange,Yellow::Pink,Purple::Chocolate,Silver::Brown";;
		C) tables="Green::Black,Charcoal::Blue,White::Orange,Yellow::Pink,Purple::Chocolate,Silver::Brown";;
		# C) tables="Black::Blue,Brown::Chocolate,Charcoal::Green,Orange::Pink,Purple::Silver,Yellow::White";;
		X) tables="Green::Black,Charcoal::Blue,Chocolate::Brown,Orange::White,Pink::Yellow,Purple::Silver";;
		*) return 1 # illegal option
	    esac;;
	GL00019)
	    case ${letter} in
		A) tables="2-1::2-2,3-1::3-2";;
		B) tables="2-1::3-2,2-2::3-1";;
		C) tables="2-1::2-2,3-1::3-2";;
		X) tables="2-1::3-1,2-2::3-2";;
		*) return 1 # illegal option
	    esac;;
	AFB1J0)
	    case ${letter} in
		A) tables="2-1::2-2,3-1::3-2,4-1::,";;
		B) tables="2-1::2-2,3-1::3-2,4-1::,";;
		C) tables="2-1::2-2,3-1::3-2,4-1::,";;
		X) tables="Black::Blue,Charcoal::Green,Orange::Pink,White::Yellow";;
		*) return 1 # illegal option
	    esac;;
	FLA0018)
	    case ${letter} in
		# A) tables="Black::Blue,Brown::Purple,Pink::Orange";;
		A) tables="1-1::1-2,2-1::2-2,3-1::3-2,4-1::4-2";;
		B) tables="1-1::1-2,2-1::2-2,3-1::3-2,4-1::4-2";;
		C) tables="1-1::1-2,2-1::2-2,3-1::3-2,4-1::4-2";;
		# A) tables="2-1::1-1,1-2::2-2,4-1::3-1,3-2::4-2";;
		# B) tables="2-1::1-1,1-2::2-2,4-1::3-1,3-2::4-2";;
		# C) tables="2-1::1-1,1-2::2-2,4-1::3-1,3-2::4-2";;
		# C) tables="Black::Blue,Brown::Purple,Pink::Orange";;
		X) tables="Orange::Black,Blue::Brown,Gray::Red,Purple::Pink";;
		*) return 1 # illegal option
	    esac;;
	*) return 1 # illegal league
    esac
}

function w () {
    local arg league session week letter topic tables
    case $1 in
	2040) league=$1;;
	3024) league=$1;;
	GL00019) league=$1;;
	2L1) league=$1;;
	2MB1) league=$1;;
	3K0) league=$1;;
	B32) league=$1;;
	FLA0018) league=$1;;
	FLA0021) league=$1;;
	FLA0027) league=$1;;
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
    cd ~/031/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/drbean/dot/.screen/class.rc -dR w_${league}_$week
    cd -
}

function yd2040 () {
    OPTIND=1
    local arg league=2040 session week letter topic tables
    while getopts 'w:l:t:' arg
    do
        case ${arg} in
            w) week=${OPTARG};;
            l) letter=${OPTARG};;
            t) topic=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    if (($week <= 5)); then session=1
    elif (($week <= 9)); then session=2
    elif (($week <= 13)); then session=3
    elif (($week <= 18)); then session=4
    else session=NONE
    fi
    case ${letter} in
	A) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White";;
	B) tables="Green::Black,Blue::Brown,Gray::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Violet,Silver::Yellow";;
	C) tables="Black::Blue,Brown::Gray,Khaki::Chocolate,Charcoal::Green,Orange::Pink,Purple::Red,Violet::Silver,Yellow::White";;
	X) tables="Green::Black,Blue::Brown,Gray::Khaki,Chocolate::Charcoal,White::Orange,Pink::Purple,Red::Violet,Silver::Yellow";;
	*) return 1 # illegal option
    esac
    cd ~/031/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/drbean/dot/.screen/class.rc -dR ${league}_w_$week
    cd -
}

function yd40113024 () {
    OPTIND=1
    local arg league=40113024 session week letter topic tables
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
	A) tables="Black::Blue,Brown::Chocolate,Charcoal::Green,Orange::Pink,Purple::Yellow,White::";;
	B) tables="Green::Black,Charcoal::Blue,Chocolate::Brown,Orange::White,Pink::Yellow,Purple::";;
	C) tables="Black::Blue,Brown::Chocolate,Charcoal::Green,Orange::Pink,Purple::Yellow,White::";;
	X) tables="Green::Black,Charcoal::Blue,Chocolate::Brown,Orange::White,Pink::Yellow,Purple::";;
	*) return 1 # illegal option
    esac
    cd ~/031/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/drbean/dot/.screen/class.rc -dR ${league}_w_$week
    cd -
}

function FLA0018 () {
    OPTIND=1
    local arg league=FLA0018 session week letter topic tables
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
    cd ~/031/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/drbean/dot/.screen/class.rc -dR ${league}_w_$week
    cd -
}

function FLA0021 () {
    OPTIND=1
    local arg league=FLA0021 session week letter topic tables
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
    cd ~/031/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/drbean/dot/.screen/class.rc -dR ${league}_w_$week
    cd -
}

function FLA0027 () {
    OPTIND=1
    local arg league=FLA0027 session week letter topic tables
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
    cd ~/031/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/drbean/dot/.screen/class.rc -dR ${league}_w_$week
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
    cd ~/031/$league
    SESSION=$session \
    WEEK=$week \
    LASTWEEK=$(($week-1)) \
    LEAGUE=$league \
    TOPIC=$topic \
    LETTER=$letter \
    TABLES=$tables \
    screen -c /home/drbean/dot/.screen/class.rc -dR ${league}_w_$week
    cd -
}

alias contest="cd ~/001/contest; screen -dR contest; cd -"

alias job="cd ~/job; screen -c /home/drbean/dot/.screen/job.rc -dR job; cd -"

alias q=exit

# vim: set ts=8 sts=4 sw=4 noet:
