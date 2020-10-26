svn up ~/ttb/moodle
cyg_pack -p perl-ExtUtils-MakeMaker,make
for m in moodle yaml4moodle
	do cd ~/ttb/$m
	perl Makefile.PL INST_SCRIPT=script
	make
	make install
done
rm /usr/local/share/perl5/site_perl/5.30/Moodle/Command/question_import.pm
cd ~/ttb
