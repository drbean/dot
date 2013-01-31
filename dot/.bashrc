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

alias csfp="cd ~/class/csfp; screen -c /home/drbean/.screen/csfprc -dR csfp; cd -"

alias pagestranscripts="cd ~/class/pagestranscripts; screen -dR pagestranscripts; cd -"
alias soundfiles="cd ~/soundfiles; screen -dR soundfiles; cd -"

alias class="cd ~/class; screen -dR class; cd -"
alias business="cd ~/class/business; screen -c /home/drbean/.screen/businessrc -dR business; cd -"
alias conversation="cd ~/class/conversation; screen -dR conversation; cd -"
alias media="cd ~/class/curriculum/media; screen -dR media; cd -"
alias writing="cd ~/class/curriculum/writingreading; screen -dR writing; cd -"
alias speaking="cd ~/class/curriculum/speaking; screen -dR speaking; cd -"
alias reading="cd ~/class/curriculum/reading; screen -dR reading; cd -"
alias friends="cd ~/class/friends; screen -dR friends; cd -"
alias pop="cd ~/class/curriculum/pop; screen -dR pop; cd -"
alias intercultural="cd ~/class/intercultural; screen -dR intercultural; cd -"

alias 001="cd ~/001; screen -dR s001; cd -"
alias FLA0015="cd ~/001/FLA0015; screen -dR FLA0015; cd -"
alias FLA0019="cd ~/001/FLA0019; screen -dR FLA0019; cd -"
alias FLA0023="cd ~/001/FLA0023; screen -dR FLA0023; cd -"
alias FLA0028="cd ~/001/FLA0028; screen -dR FLA0028; cd -"

alias GL00003="cd ~/001/GL00003; screen -dR GL00003; cd -"
alias GL00016="cd ~/001/GL00016; screen -dR GL00016; cd -"

alias BMA0031="cd ~/001/BMA0031; screen -dR BMA0031; cd -"
alias MIA0015="cd ~/001/MIA0015; screen -dR MIA0015; cd -"
alias FIA0012="cd ~/001/FIA0012; screen -dR FIA0012; cd -"
alias contest="cd ~/001/contest; screen -dR contest; cd -"
