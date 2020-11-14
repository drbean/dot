cyg_pack gcc-g++,make,libcrypt-devel,libnsl-devel
# perl -MCPAN -e "CPAN::Shell->notest('install', 'Module::Build::XSUtil')"
# perl -MCPAN -e "CPAN::Shell->notest('install', 'Perl::LanguageServer')"
perl -MCPAN -e "CPAN::Shell->notest('install', 'App::Cmd')"
perl -MCPAN -e "CPAN::Shell->notest('install', 'Grades')"
perl -MCPAN -e "CPAN::Shell->notest('install', 'App::Ack')"
