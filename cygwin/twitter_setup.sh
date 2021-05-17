svn up ~/emoeco
#
# perl + AnyEvent, AnyEvent::Twitter::Stream, Twitter::API
cyg_pack perl-ExtUtils-MakeMaker,make,gcc-g++,libcrypt-devel,libnsl-devel,perl-Module-Build,perl-Module-Build-Tiny,perl-Net-SSLeay,openssl,libssl-devel,perl-JSON,perl-JSON-XS,perl-JSON-MaybeXS,perl-Cpanel-JSON-XS,perl-Mozilla-CA,perl-Test-Warnings,perl-Test-Deep,perl-Test-Requires,Test-Needs,perl-Test-Fatal,perl-Test-Pod,perl-Params-Util,perl-Sub-Install,perl-Package-Stash,perl-Sub-Exporter,perl-Sub-Exporter-Progressive,perl-Sub-Identify,perl-Eval-Closure,perl-Scalar-List-Utils,perl-File-pushd,perl-Variable-Magic,perl-Data-Dump,perl-Class-Tiny,perl-File-HomeDir,perl-Params-Validate,perl-Path-Tiny,perl-Class-Inspector,perl-IO-String,perl-IO-Socket-SSL,perl-File-Listing,perl-Net-HTTP,perl-CGI,perl-File-Slurper,perl-Font-AFM,perl-Types-Serialiser,perl-Role-Tiny,perl-Data-Optlist,perl-Package-DeprecationManager,perl-namespace-clean,perl-namespace-autoclean,perl-B-Hooks-EndOfScope,perl-Devel-StackTrace,perl-MRO-Compat,perl-Devel-GlobalDestruction,perl-CPAN-Meta-Check,perl-Class-XSAccessor

# Devel::REPL
cyg_pack perl-Clone,perl-Test-Without-Module,perl-Path-Class,per-Algorithm-Diff,perl-Capture-Tiny,perl-PadWalker,perl-Test-Exception,perl-Sub-Uplevel,perl-HTTP-Daemon,perl-Module-Pluggable
# for m in AnyEvent::Twitter::Stream Twitter::API Devel::REPL
for m in Devel::REPL
# for m in Twitter::API
# for m in AnyEvent::Twitter::Stream
#for m in AnyEvent::HTTP
	do cd ~/emoeco
	perl -MCPAN -e "CPAN::Shell->notest('install', $m)"
done
