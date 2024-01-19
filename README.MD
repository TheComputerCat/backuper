# Backuper

A series of scripts that make my installation simpler.

## How to use
There are multiple stages in this installation.
### First stage
As root user and in a tty independent of `gdm` execute:

```bash
    $ ./firstStage.sh
```

This will change the repositories to testing and update the system. This require a reboot.

### Second stage

In a graphical terminal with [user], run:
Here [user] is the normal user of the system.

```
    $ ./secondStage [user]
```

This will install all the essential programs and configure the DNS, special commands and install extensions.

### Pop-shell

This extension allow to have a tiling mode in gnome. Run:

```
    cd \extensions
    ./pop-shell.sh
```

This will ask for the root password.

With these commands all the system will be ready to use.

