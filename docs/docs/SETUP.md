# INITIAL SETUP
[back to README](../README.md)

* Add your public key to your Acquia account, and be on the team
* Add your public key to your Github account, and be on the team [(?)](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)
* Download or update your Acquia aliases [(?)](https://docs.acquia.com/acquia-cloud/manage/ssh/drush/aliases/)

**Install VirtualBox (5.1.28 or higher)**

VirtualBox is available for Mac, PC and Linux and can be [installed manually](https://www.virtualbox.org/wiki/Downloads) on your platform. If necessary, you can update to a new version or manage your virtual machines using VirtualBox Manager GUI.

The VirtualBox Manager GUI will periodically alert you to new versions; as a general rule it is good practice to keep VirtualBox up-to-date.

**Generate your BLT alias:**

```
composer run-script blt-alias
```

NOTE: If you have already installed BLT for another project you can skip this step. This generates an alias for the ```blt``` command in your ```~/.bash_profile``` and is necessary in order to run the ```blt``` commands below.  You will need to restart your terminal or source your .bash_profile in order for the ```blt``` command to work. See troubleshooting below for more information.


**Install Docksal (One-time setup)**

Follow the [one-time setup instructions](https://docs.docksal.io/en/master/getting-started/env-setup/) for your platform.

**Be sure to set your default project folder**

Docksal is opinionated, and will not work if you attempt to start a container from outside your defined project folder. By default (on Mac), Docksal sets /Users/*[username]*/Projects as its default project folder.  You can change this to another location during setup, but be sure to clone all of your projects into the folder you define.

**Post install**

Docksal sometimes is unable to detect its own projects folder. Once you have installed Docksal edit your global docksal.env file and define your path to your project folder:

Open ```~/.docksal/docksal.env``` in an editor and add the following line:

 ``` DOCKSAL_NFS_PATH="/Users/<your-username>/<your-projects-folder>" ```

 or to the actual path of your Projects folder if it is different.

You are now finished with initial onboarding process and can [get started](../README.md) for this and any future Docksal projects.

[back to README](../README.md)

*<small>This is an auto-generated document. Keep any custom documents in the ```custom``` folder.</small>*
