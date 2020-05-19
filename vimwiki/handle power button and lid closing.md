* to handle power button and lid closing we have to use the built in settings in the desktop environment, otherwise we should use the `/etc/systemd/login.service` file to change the settings.
* to check the status of the suspend we can use `systemctl status suspend.target` 
