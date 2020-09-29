svn up ~/ttb/moodle
cd ~/ttb/moodle
perl -MCPAN -e "CPAN->shell->notest('install', 'App::Cmd')"
perl -MCPAN -e "CPAN->shell->notest('install', 'Grades')"
cyg_pack -p perl-ExtUtils-MakeMaker
perl Makefile.PL INST_SCRIPT=script
make
make install
