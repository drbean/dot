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
alias comp="cd ~/comp; APP=comp COURSE=business STORY=adventure screen -c /home/drbean/dot/.screen/project.rc -dR comp; cd -"
alias dic="cd ~/dic; APP=dic COURSE=literature STORY=swiss SCRIPT=create_exercise.pl screen -c /home/drbean/dot/.screen/project.rc -dR dic; cd -"
alias bett="cd ~/bett; APP=bett screen -c /home/drbean/dot/.screen/project.rc -dR bett; cd -"
alias hpaste="cd ~/hpaste; screen -dR hpaste; cd -"

alias vim="cd ~/vim; screen -dR vim; cd -"

alias dot="cd ~/dot; screen -c /home/drbean/dot/.screen/dotrc -dR dot; cd -"
alias weechat="cd ~; screen -c /home/drbean/dot/.screen/weechatrc -dR weechat; cd -"

alias csfp="cd ~/class/csfp; screen -c /home/drbean/.screen/csfprc -dR csfp; cd -"
alias nlp="cd ~/nlp; screen -dR nlp; cd -"

alias pagestranscripts="cd ~/class/pagestranscripts; COURSE=literature STORY=frankenstein screen -c /home/drbean/dot/.screen/pagestranscripts.rc -dR pagestranscripts; cd -"
alias soundfiles="cd ~/soundfiles; COURSE=intercultural screen -c /home/drbean/dot/.screen/soundfiles.rc -dR soundfiles; cd -"

alias class="cd ~/class; screen -dR class; cd -"
alias business="cd ~/class/business; VIEW=marketing TOPIC=marketing STORY=drbean FORM=3 screen -c /home/drbean/dot/.screen/course.rc -dR business; cd -"
alias intercultural="cd ~/class/intercultural; VIEW=intercultural TOPIC= screen -c /home/drbean/dot/.screen/course.rc -dR intercultural; cd -"
alias literature="cd ~/class/literature; VIEW=literature TOPIC= STORY=robin-hood FORM=2 screen -c /home/drbean/dot/.screen/course.rc -dR literature; cd -"
alias media="cd ~/class/media; VIEW=media TOPIC= STORY=hacking FORM=0 screen -c /home/drbean/dot/.screen/course.rc -dR media; cd -"
alias conversation="cd ~/class/conversation; screen -dR conversation; cd -"
alias grammar="cd ~/class/curriculum/grammar; screen -dR grammar; cd -"
alias writing="cd ~/class/curriculum/writingreading; screen -dR writing; cd -"
alias speaking="cd ~/class/curriculum/speaking; screen -dR speaking; cd -"
alias reading="cd ~/class/curriculum/reading; screen -dR reading; cd -"
alias friends="cd ~/class/friends; screen -dR friends; cd -"
alias pop="cd ~/class/curriculum/pop; screen -dR pop; cd -"
alias ko="cd ~/class/curriculum/ko; screen -dR ko; cd -"
alias magazine="cd ~/class/magazine; screen -dR magazine; cd -"

alias 012="cd ~/012; screen -dR s012; cd -"
alias BMA0035="cd ~/012/BMA0035; screen -c /home/drbean/dot/.screen/class.rc -dR BMA0035; cd -"
alias BMA0041="cd ~/012/BMA0041; screen -c /home/drbean/dot/.screen/class.rc -dR BMA0041; cd -"
alias MIA0009="cd ~/012/MIA0009; screen -c /home/drbean/dot/.screen/class.rc -dR MIA0009; cd -"
alias FIA0046="cd ~/012/FIA0046; screen -c /home/drbean/dot/.screen/class.rc -dR FIA0046; cd -"
alias FLA0037="cd ~/012/FLA0037; screen -c /home/drbean/dot/.screen/class.rc -dR FLA0037; cd -"
alias 00037155="cd ~/012/00037155; screen -c /home/drbean/dot/.screen/class.rc -dR 00037155; cd -"
alias 00037589="cd ~/012/00037589; screen -c /home/drbean/dot/.screen/class.rc -dR 00037589; cd -"
alias AFN231="cd ~/012/AFN231; screen -c /home/drbean/dot/.screen/class.rc -dR AFN231; cd -"

alias GL00003="cd ~/001/GL00003; screen -dR GL00003; cd -"
alias GL00016="cd ~/001/GL00016; screen -dR GL00016; cd -"

alias contest="cd ~/001/contest; screen -dR contest; cd -"

alias job="cd ~/job; screen -dR job; cd -"

alias q=exit
