svn up ~/emoeco
cyg_pack perl-ExtUtils-MakeMaker,make,gcc-g++,libcrypt-devel,libnsl-devel,perl-Module-Build,perl-Module-Build-Tiny,perl-Net-SSLeay,openssl,libssl-devel
for m in AnyEvent::Twitter::Stream Twitter::API Devel::REPL
	do cd ~/emoeco
	perl -MCPAN -e "CPAN::Shell->notest('install', $m)"
done
