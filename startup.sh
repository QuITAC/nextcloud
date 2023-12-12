docker compose up -d
docker exec -u www-data nextcloud-app php /var/www/html/occ config:app:set --value=0 user_oidc allow_multiple_user_backends