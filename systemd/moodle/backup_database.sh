#!/bin/bash
cd /var/www/cgi-bin/moodle && sudo -u drbean /usr/local/bin/Moosh -n sql-dump > ~drbean/dot/postgres/moodle$SEMESTER.sql
FTP_PASSWORD=$1 PASSPHRASE=$2 duplicity ~drbean/dot/postgres/moodle$SEMESTER.sql ftp://greg@web.nuu.edu.tw/duplicity/moodle$SEMESTER.sql
FTP_PASSWORD=$1 PASSPHRASE=$2 duplicity /var/lib/moodle ftp://greg@web.nuu.edu.tw/duplicity/sac_moodle_var_lib_fedora25
