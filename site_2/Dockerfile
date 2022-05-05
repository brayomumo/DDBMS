FROM mcr.microsoft.com/mssql/server:2019-latest

COPY ./setup.sql  /docker-entrypoint-initdb.d/
COPY ./createdb.sh  /docker-entrypoint-initdb.d/
