cd
for p in dot edit ttb curriculum yaml4moodle; do svn co http://github.com/drbean/$p/trunk $p --depth=empty ; done
for u in bash screen vim chocolatey cygwin browser postgres ; do svn up dot/$u ; done
# svn up edit/joyce
for ext in rc _profile ; do cp dot/bash/bash$ext ~/.bash$ext ; done
cd ~/dot && svn up alternatives.sh && . alternatives.sh && cd -
cp ~/dot/vim/vimrc.cygwin ~/.vimrc
cp ~/dot/screen/screen.rc ~/.screenrc
cp ~/dot/browser/lynx{-site.cfg,.lss} /etc/
for i in znc weechat ; do svn co http://github.com/drbean/dot/trunk/irc/$i ~/.$i ; done
for p in pages speaking ; do svn up curriculum/$p ; done
for p in moodle ; do svn up ttb/$p ; done
for p in pandoc-templates ; do svn co http://github.com/drbean/$p/trunk ~/curriculum/pages/$p ; done
znc
for u in postgres ; do svn up ~/dot/$u ; done
git clone --depth 2 --no-single-branch http://github.com/drbean/moosh ~/moosh
mkdir --parent /srv/www/cgi-bin && git clone --depth 2 --no-single-branch http://github.com/drbean/moodle /srv/www/cgi-bin/moodle && mkdir /var/lib/moodle/ && chmod 777 /var/lib/moodle
cd 
svn up yaml4moodle
