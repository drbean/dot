cd
for p in dot edit ttb curriculum; do svn co http://github.com/drbean/$p/trunk $p --depth=empty ; done
for u in bash screen chocolatey cygwin browser irc; do svn up dot/$u ; done
# svn up edit/joyce
for ext in rc _profile ; do cp dot/bash/bash$ext ~/.bash$ext ; done
cd ~/dot && svn up alternatives.sh && . alternatives.sh && cd -
cp ~/dot/screen/screen.rc ~/.screenrc
cp ~/dot/browser/lynx{-site.cfg,.lss} /etc/
for i in znc weechat ; do svn co http://github.com/drbean/dot/trunk/irc/$i ~/.$i ; done
for p in pages ; do svn up curriculum/$p ; done
for p in pandoc-templates ; do svn co http://github.com/drbean/$p/trunk ~/curriculum/pages/$p ; done
