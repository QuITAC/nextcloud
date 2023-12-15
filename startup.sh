#!/bin/bash
docker compose up -d

# install and enable apps
appsToInstall=("collectives" "cospend" "deck" "extract" "forms" "passwords" "polls" "side_menu" "unroundedcorners" "richdocuments" "richdocumentscode" "user_oidc")
for t in ${appsToInstall[@]}; do
  docker exec -u www-data nextcloud-app php /var/www/html/occ app:install $t
  docker exec -u www-data nextcloud-app php /var/www/html/occ app:enable $t
done

# disable apps that are unnecessary but come preinstalled
appsToDisable=("nextcloud_announcements" "photos")
for t in ${appsToDisable[@]}; do
  docker exec -u www-data nextcloud-app php /var/www/html/occ app:disable $t
done

# set the default dashboard layout for new users
docker exec -u www-data nextcloud-app php /var/www/html/occ config:app:set dashboard layout --value="welcome,calendar,spreed,recommendations"

# redirect users to sso automatically (see README on how to circumvent this)
docker exec -u www-data nextcloud-app php /var/www/html/occ config:app:set user_oidc allow_multiple_user_backends --value=0