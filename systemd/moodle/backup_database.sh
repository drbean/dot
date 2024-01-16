#!/bin/bash
# sudo -u postgres pg_dump -p 5433 mood$SEMESTER > ~drbean/dot/postgres/moodle$SEMESTER.sql
FTP_PASSWORD=$1 duplicity --no-encryption ~drbean/dot/postgres/moodle$SEMESTER.sql ftp://drbean@sdf.org/duplicity/moodle$SEMESTER.sql
FTP_PASSWORD=$1 duplicity --no-encryption /var/lib/moodle ftp://drbean@sdf.org/duplicity/sac_moodle_var_lib_fedora31
