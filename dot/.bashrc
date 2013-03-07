# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias web="cd; screen -dR web; cd -"
alias surf="cd ~/sr; screen -dR surfraw; cd -"
alias dic="cd ~/dic; screen -dR dic; cd -"
alias beans="cd ~/class/beans; screen -dR beans; cd -"
alias swiss="cd ~/swiss; screen -dR swiss; cd -"
alias comp="cd ~/comp; screen -dR comp; cd -"
alias tennis="cd ~/tennis; screen -dR tennis; cd -"
alias bett="cd ~/bett; screen -dR bett; cd -"
alias hpaste="cd ~/hpaste; screen -dR hpaste; cd -"

alias vim="cd ~/vim; screen -dR vim; cd -"

alias dot="cd ~/dot; screen -c /home/drbean/.screen/dotrc -dR dot; cd -"
alias weechat="cd ~; screen -c /home/drbean/.screen/weechatrc -dR weechat; cd -"

alias csfp="cd ~/class/csfp; screen -c /home/drbean/.screen/csfprc -dR csfp; cd -"
alias nlp="cd ~/nlp; screen -dR nlp; cd -"

alias pagestranscripts="cd ~/class/pagestranscripts; screen -dR pagestranscripts; cd -"
alias soundfiles="cd ~/soundfiles; screen -dR soundfiles; cd -"

alias class="cd ~/class; screen -dR class; cd -"
alias business="cd ~/class/business; screen -c /home/drbean/.screen/businessrc -dR business; cd -"
alias conversation="cd ~/class/conversation; screen -dR conversation; cd -"
alias grammar="cd ~/class/curriculum/grammar; screen -dR grammar; cd -"
alias media="cd ~/class/curriculum/media; screen -dR media; cd -"
alias writing="cd ~/class/curriculum/writingreading; screen -dR writing; cd -"
alias speaking="cd ~/class/curriculum/speaking; screen -dR speaking; cd -"
alias reading="cd ~/class/curriculum/reading; screen -dR reading; cd -"
alias friends="cd ~/class/friends; screen -dR friends; cd -"
alias pop="cd ~/class/curriculum/pop; screen -dR pop; cd -"
alias ko="cd ~/class/curriculum/ko; screen -dR ko; cd -"
alias magazine="cd ~/class/magazine; screen -dR magazine; cd -"
alias intercultural="cd ~/class/intercultural; screen -dR intercultural; cd -"
alias literature="cd ~/class/literature; screen -dR literature; cd -"

alias 012="cd ~/012; screen -dR s012; cd -"
alias BMA0035="cd ~/012/BMA0035; screen -dR BMA0035; cd -"
alias BMA0041="cd ~/012/BMA0041; screen -c /home/drbean/dot/.screen/BMA0041.rc -dR BMA0041; cd -"
alias MIA0009="cd ~/012/MIA0009; screen -dR MIA0009; cd -"
alias FIA0046="cd ~/012/FIA0046; screen -dR FIA0046; cd -"
alias FLA0037="cd ~/012/FLA0037; screen -dR FLA0037; cd -"
alias 00037155="cd ~/012/00037155; screen -dR 00037155; cd -"
alias 00037589="cd ~/012/00037589; screen -dR 00037589; cd -"
alias AFN231="cd ~/012/AFN231; screen -dR AFN231; cd -"

alias GL00003="cd ~/001/GL00003; screen -dR GL00003; cd -"
alias GL00016="cd ~/001/GL00016; screen -dR GL00016; cd -"

alias contest="cd ~/001/contest; screen -dR contest; cd -"

alias job="cd ~/job; screen -dR job; cd -"
