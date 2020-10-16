#!/usr/bin/bash

p=postgresql,libpq5,libpq-devel,libpgtypes3,postgresql-client,postgresql-devel
cyg_pack -p $p 
sed -iBAK -r -e "s/^INITDB_ARGS=.*$/INITDB_ARGS=\"-E UTF8 --locale=en_US.UTF-8 -D \$PGDATA\"/" /etc/rc.d/init.d/postgresql
cygserver-config --yes
cygrunsrv --start cygserver
for a in initdb install start ; do  /etc/rc.d/init.d/postgresql $a ; done
sed -iBAK -r -e \
	"/host    all *all *127.0.0.1\/32 */s/trust/password/" -e \
	"/host    all *all *::1\/128 */s/trust/password/"\
	/usr/share/postgresql/data/pg_hba.conf
psql -U SYSTEM postgres
-- \i ~/dot/postgres/populate.sql

