
Files read by zsh when starting:

    1. `/etc/zsh/zshenv` used for environment variables for all users.
    2. `~/.zshenv` used for settings user's environment variables
    3. `/etc/zsh/zprofile` used for excuting commands at start for all users and will be read wher running a *login shell* 
    4. `~/.zporfile` used for excuting user's commands at start for all users and will be read when running a *login shell* 
    5. `/etc/zsh/zshrc` used for settings *intractive shell* configration and excuting commands for all users.
    6. `~/.zshrc` used for settings *interactive shell* configration and excuting commands for that user
    7. `/etc/zsh/zlogin` used for settings initial configratins for all users in *login shell* 
    8. `~/.zlogin` user for settings initial configrations for that user in *login shell* 
    9. `/etc/zsh/zlogout` and `~/.zlogout` same as above two but for logout settings.
    10. if we enable autocompletion from `.zshrc` then we can press tab twice and choose between the files and we can use that as well with `-optoin`.


