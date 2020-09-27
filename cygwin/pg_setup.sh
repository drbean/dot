#!/usr/bin/bash

for p in postgresql libpq5 libpq-devel libpgtypes3 postgresql-client postgresql-devel ; do cyg_pack -p \$p ; done
sed -iBAK -r -e \"s/\^INITDB_ARGS=.*$/INITDB_ARGS=\\\"-E UTF8 --locale=en_US.UTF-8 -D \\\$PGDATA\\\"/\" /etc/rc.d/init.d/postgresql
cygserver-config
cygrunsrv --start cygserver
for a in initdb install start ; do  /etc/rc.d/init.d/postgresql \$a ; done
psql -U SYSTEM postgres
-- \i ~/dot/postgres/populate.sql

