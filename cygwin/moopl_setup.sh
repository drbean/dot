svn up ~/ttb/moodle
cd ~/ttb/moodle
cyg_pack -p perl-ExtUtils-MakeMaker
perl Makefile.PL INST_SCRIPT=script
make
make install
