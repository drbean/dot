svn up ~/emoeco
cyg_pack perl-ExtUtils-MakeMaker,make,gcc-g++,libcrypt-devel,libnsl-devel,perl-Module-Build,perl-Module-Build-Tiny,perl-Net-SSLeay,openssl,libssl-devel,perl-JSON-MaybeXS,perl-Mozilla-CA,perl-Test-Warnings,perl-Test-Deep,perl-Params-Util,perl-Sub-Install,perl-Package-Stash,perl-Sub-Exporter-Progressive,perl-Eval-Closure,perl-Scalar-List-Utils,perl-File-pushd,perl-Variable-Magic,perl-Data-Dump,perl-Class-Tiny,perl-File-HomeDir,perl-Params-Validate,perl-Path-Tiny,perl-Class-Inspector,perl-IO-String,perl-File-Listing,perl-Net-HTTP,perl-CGI,perl-File-Slurper,perl-Font-AFM,perl-Types-Serialiser,perl-JSON-XS
#for m in AnyEvent::Twitter::Stream Twitter::API Devel::REPL
for m in AnyEvent::HTTP
	do cd ~/emoeco
	perl -MCPAN -e "CPAN::Shell->notest('install', $m)"
done
