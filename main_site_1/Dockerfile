FROM postgres:14.0

RUN apt-get update && apt-get install -y postgresql-14-tds-fdw postgresql-14-mysql-fdw
COPY ./server_setup.sql  /docker-entrypoint-initdb.d/