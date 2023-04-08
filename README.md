Nextcloud docker web service for Queerreferat Aachen

## Deploy

1. open `docker-compose.yml`
   i. enter a valid email behind `LETSENCRYPT_EMAIL`
   ii. choose a root password for the database at `MYSQL_ROOT_PASSWORD=`
2. choose a password for the database user nextcloud in `db.env` behind `MYSQL_PASSWORD=`
3. run `docker-compose build --pull` to pull the most recent base images and build the custom dockerfiles
4. start everything with `docker-compose up -d`
5. visit `cloud.queerreferat.ac` to set up the nextcloud

### Update

repeat steps 3 and 4 of the deployment
