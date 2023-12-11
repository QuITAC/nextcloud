# Nextcloud docker web service for Queerreferat Aachen
The Nextcloud should be accessible at `cloud.queerreferat.ac`.

## Deploy
To deploy Nextcloud, make sure the Traefik reverse proxy is already running.
Then simply run
```
sh startup.sh
```
To run CRON jobs, run `crontab -e` on the host system and paste the following
line:
```
*/5 * * * * docker exec -u www-data nextcloud php /var/www/html/cron.php
```
Additionally, a few settings need to be adjusted within the Nextcloud interface
on new installations. This includes the email configuration (may be added to
`additional.config.php` - be cautios because of SMTP authentication), apps that
need to be installed or uninstalled (add to install script in the future) and
the connection to Authentik. Therefore, after setting up Authentik, this guide
needs to be followed: [Setup Nextcloud with
Authentik](https://goauthentik.io/integrations/services/nextcloud/).

## Notes
The startup script automatically forwards users that are not logged into the
Nextcloud to the SSO. To access the Nextcloud's admin interface, append
`?direct=1` to the nextcloud login URL. You can then login as usual with the
admin user account.