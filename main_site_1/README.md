## Main Site

This the main site for the whole project. It performs Global Schema reconstruction from all other sites.

### Local DBMS

Site uses `Postgresql` as its local DBMS.
It uses dbLink as its gateway to communicate with other fragments


### SETUP 

**Prerequsites**  
* Docker
* docker-compose

- git clone the repo:
 `git clone https://github.com/brayomumo/ddbs`
- cd to the project folder: 
`cd ddbs/main_site_1`   
- start up the container:
    `docker-compose up`
