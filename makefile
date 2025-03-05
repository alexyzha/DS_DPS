# MUST RUN IN CONDA ENV/ENV WITH POSTGRES ETC INSTALLED
CONDA_ENV = DS_GMAIL
PGDATA = $(CONDA_PREFIX)/var/postgres
DB_NAME = DGM
DB_USER = aly
DB_PASS = PASSWORD
DB_PORT = 5432

start:
	pg_ctl -D $(PGDATA) start

stop:
	pg_ctl -D $(PGDATA) stop

restart:
	$(MAKE) stop
	$(MAKE) start

init:
	initdb -D $(PGDATA)

uninit:
	rm -rf /home/aly/anaconda3/envs/DS_GMAIL/var/postgres

create_db:
	createdb $(DB_NAME)

drop_db:
	dropdb $(DB_NAME)

psql:
	psql $(DB_NAME)

status:
	pg_ctl -D $(PGDATA) status
