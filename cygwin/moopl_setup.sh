svn up ~/ttb/moodle
cd ~/ttb/moodle
perl -MCPAN -e "CPAN->shell->notest('install', 'App::Cmd')"
perl -MCPAN -e "CPAN->shell->notest('install', 'Grades')"
perl -MCPAN -e "CPAN->shell->notest('install', 'App::Ack')"
cyg_pack -p perl-ExtUtils-MakeMaker
perl Makefile.PL INST_SCRIPT=script
make
make install
