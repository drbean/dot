svn up ~/ttb/moodle
cd ~/ttb/moodle
cyg_pack -p perl-ExtUtils-MakeMaker
perl Makefile.PL INST_SCRIPT=script
make
make install
rm /usr/local/share/perl5/site_perl/5.30/Moodle/Command/question_import.pm
