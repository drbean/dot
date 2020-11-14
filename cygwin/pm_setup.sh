svn up ~/ttb/moodle
cd ~/ttb/moodle
perl -MCPAN -e "CPAN::Shell->notest('install', 'App::Cmd')"
perl -MCPAN -e "CPAN::Shell->notest('install', 'Grades')"
perl -MCPAN -e "CPAN::Shell->notest('install', 'App::Ack')"
cyg_pack perl-ExtUtils-MakeMaker
perl Makefile.PL INST_SCRIPT=script
make
make install
rm /usr/local/share/perl5/site_perl/5.30/Moodle/Command/question_import.pm
