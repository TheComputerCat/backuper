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

## Dotfiles

With these scripts some dotfiles can be saved and loaded.

To save:

```
    ./backupDotfiles.sh
```

This will save the current files in a folder in `~/Dotfiles/YYYY-MM-DD`.
Note that some other like ssh and gpg key should be saved manually.

To load:

```
    ./loadDotfiles [pathToDotfilesFolder]
```
This command will try to load:

- Obsidian/.obsidian folder
- .ssh (must be saved in folder manually)
- .gitconfig
- .profile
- .zshrc
- background image
- gpg key for GitHub
- dconf configuration file

## Folders
Folders can be transferred using:

```
    ./transferFolders [-u|-l] [folderBackUp]
```
Where:
- -u: Save folders back up in [folderBackUp]
- -l: Get back up from [folderBackUp]