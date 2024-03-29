# Nextcloud docker web service for Queerreferat Aachen
## Usage
Access this service at `cloud.queerreferat.ac`. You find all important user
documentation in the app `Collectives` from within the Nextcloud.

## Deploy
To deploy Nextcloud, make sure the Traefik reverse proxy is already running.
Then simply run
```
chmod +x ./startup.sh
./startup.sh
```
To run CRON jobs, run `crontab -e` on the host system and paste the following
line:
```
*/5 * * * * docker exec -u www-data nextcloud-app php /var/www/html/cron.php
```

If the Nextcloud is set up from the ground up also go through these steps:
- Access the Nextcloud URL and run through the steps of creating an admin
  account
- Connect to Authentik. Therefore, after setting up Authentik, this guide needs
  to be followed: [Setup Nextcloud with
  Authentik](https://goauthentik.io/integrations/services/nextcloud/).
- Set up email in `Administration settings -> Basic settings` to be able to
  automatically notify other users (might be added to the
  `additional.config.php`, be cautios beause of SMTP auth configuration, if not
  be more verbal here @todo)
- Create a new text file `Welcome.md` from the `Files` app and copy the content
  from `./files/Welcome.md` in there. 
- Adjust the settings at `Administration settings -> Theming`:
  - Under `Theming``:
    - Set `Name` to `Queerreferat Aachen Cloud`
    - Set `Web link` to `Queerreferat.ac`
    - Set `Slogan` to `Powered by Nextcloud`
    - Set `Color` to `#8855a8`
  - Under `Advanced Options`:
    - Set `Legal Notice Link` to `https://queerreferat.ac/impressum`
    - Set `Privacy Policy Link` to `https://queerreferat.ac/datenschutz`
    - Upload `Header Logo` and `Favicon` from the `custom_assets` folder of the
      `queerreferat_ac` repository
    - Turn on `Disable user theming`
  - Under `Welcome widget`:
    - Set `Markdown content file` to the previously created `Welcome.md`
    - Set `Widget title` to `Willkommen :)`
    - Set `Support contact` to a user that has voluntarily agreeed to provide
      support 
    - Set `Support text` to `Kontaktiere {name} für technische Hilfe :)`
      support
    - Set `Support text` to `Kontaktiere {name} für technische Hilfe :)`

## Notes
The startup script automatically forwards users that are not logged into the Nextcloud to the SSO. To access the Nextcloud's admin interface, append `/login?direct=1` to the nextcloud URL. You can then login as usual with the admin user account.

---

From the logs on initial startup:

```
=> Searching for scripts (*.sh) to run, located in the folder: /docker-entrypoint-hooks.d/before-starting
```

Could this be a hook to start other scripts? like the install script?

---

Only after the Admin account has been set by the user interactively on first startup, the nc application is created by `entrypoint.sh`. That means when we mount the config files directly into the container, the `config` folder is created by docker and set to be owned by root. the entrypoint script can then no longer access the config folder and fails. To be precise the script fails even earlier: you can't declare the admin account data.