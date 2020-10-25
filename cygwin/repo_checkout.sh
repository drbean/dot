cd
for p in dot edit ttb curriculum ; do svn co http://github.com/drbean/$p/trunk $p --depth=empty ; done

cd ~/dot

for u in chocolatey cygwin ; do svn up $u ; done
svn up alternatives.sh && . alternatives.sh
svn up bash/bashrc bash/bash_profile --parents
svn up screen/{dot,screen,course,moodle,cygwin,utility,web,irc,pagestranscripts}.rc --parents
svn up vim/{vimrc.cygwin,coc-settings.json} --parents
svn up postgres/populate.sql --parents
svn up browser/lynx{-site.cfg,.lss} --parents

for ext in rc _profile ; do cp ~/dot/bash/bash$ext ~/.bash$ext ; done
cp ~/dot/vim/vimrc.cygwin ~/.vimrc
mkdir ~/.vim/ && cp ~/dot/vim/coc-settings.json ~/.vim/
cp ~/dot/screen/screen.rc ~/.screenrc
cp ~/dot/browser/lynx{-site.cfg,.lss} /etc/
for i in znc weechat ; do svn co http://github.com/drbean/dot/trunk/irc/$i ~/.$i ; done

cd ~/curriculum

for p in online; do svn up curriculum/$p ; done
svn up ~/curriculum/pages/homepage/markdown --parents
svn up ~/curriculum/speaking/test/{online,information/cards.yaml} --parents
for p in pandoc-templates ; do svn co http://github.com/drbean/$p/trunk ~/curriculum/pages/$p --depth=empty && svn up ~/curriculum/pages/$p/{styles.html,homepagePost.html5} ; done

cd 

svn co http://github.com/drbean/yaml4moodle/trunk ttb/yaml4moodle --depth=empty
for p in moodle yaml4moodle ; do svn up ttb/$p/{lib,Makefile.PL} ; done
znc
git clone --depth 2 --no-single-branch http://github.com/drbean/moosh ~/moosh
mkdir --parent /srv/www/cgi-bin && git clone --depth 2 --no-single-branch http://github.com/drbean/moodle /srv/www/cgi-bin/moodle && mkdir /var/lib/moodle/ && chmod 777 /var/lib/moodle


# curl -sL install-node.now.sh | sh
mkdir -p ~/.vim/pack/git-plugins/start
for v in delimitMate vim-surround ale ultisnips coc.nvim ; do git clone --depth 1 https://github.com/drbean/$v.git ~/.vim/pack/git-plugins/start/$v ; done
cd /cygdrive/c/Program\ Files/nodejs/ && npm install yarn && cd -
ln -s /cygdrive/c/tools/cygwin/home /cygdrive/c/home # not working? try in pshell:
# New-Item -Path C:\home -ItemType SymbolicLink -Value C:\tools\cygwin\home
# cmd /c mklink /D c:\home c:\tools\cygwin\home
cd /cygdrive/c/Users/AppData/Roaming/npm && npm install bash-language-server && cd -
