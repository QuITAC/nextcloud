# docker setup

docker setup for the new digital infrastructure of Queerreferat Aachen
containing the whole setup for nextcloud and the proxy server right now. additional services (like nextcloud office and other non-nextcloud-related web services) still need to be added

## deploy

1. open `docker-compose.yml`
   \_i. insert nextcloud domain behind `VIRTUAL_HOST=` and `LETSENCRYPT_HOST=`
   \_ii. enter a valid email behind `LETSENCRYPT_EMAIL`
   \_iii. choose a root password for the database at `MYSQL_ROOT_PASSWORD=`
2. choose a password for the database user nextcloud in `db.env` behind `MYSQL_PASSWORD=`
3. run `docker-compose build --pull` to pull the most recent base images and build the custom dockerfiles
4. start everything with `docker-compose up -d`
