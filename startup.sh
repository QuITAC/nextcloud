docker compose up -d
docker exec -u www-data nextcloud-app php /var/www/html/occ config:app:set dashboard layout --value="welcome,calendar,spreed,recommendations"
docker exec -u www-data nextcloud-app php /var/www/html/occ config:app:set user_oidc allow_multiple_user_backends --value=0