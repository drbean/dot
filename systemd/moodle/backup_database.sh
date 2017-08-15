#!/bin/bash

PGHOST='127.0.0.1' PGUSER='apache' PGPASSWORD=$1 PGPORT=5433 pg_dump $2 > ~drbean/dot/postgres/moodle$SEMESTER.sql
FTP_PASSWORD=$3 PASSPHRASE=$4 duplicity ~drbean/dot/postgres/moodle$SEMESTER.sql ftp://greg@web.nuu.edu.tw/duplicity/moodle$SEMESTER.sql
FTP_PASSWORD=$3 PASSPHRASE=$4 duplicity /var/lib/moodle ftp://greg@web.nuu.edu.tw/duplicity/sac_moodle_var_lib_fedora25
