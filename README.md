# nextcloud_docker

Docker compose file for Nextcloud and Nextcloud (Collabora) Office for the new Queerreferat Aachen digital infrastructure

## deploy

1. open `docker-compose.yml`
   \_i. insert nextcloud domain behind `VIRTUAL_HOST=` and `LETSENCRYPT_HOST=`
   \_ii. enter a valid email behind `LETSENCRYPT_EMAIL`
   \_iii. choose a root password for the database at `MYSQL_ROOT_PASSWORD=`
2. choose a password for the database user nextcloud in `db.env` behind `MYSQL_PASSWORD=`
3. run `docker-compose build --pull` to pull the most recent base images and build the custom dockerfiles
4. start everything with `docker-compose up -d`
