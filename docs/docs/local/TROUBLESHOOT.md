# Troubleshooting
[back to README](../../README.md)

Sometimes Docksal, Docker, and/or VirtualBox can get out sync and stop working as intended. Often it may help to:

* Restart Docker (via UI)
* Reset "docksal" machine VirtualBox (or via command below)

and then to try one of or more of the following commands depending on your error. For additional commands, try:

```fin vm help```

```fin system help```

```fin project help```

**```fin up``` or ```fin reset``` fails to start your services**

Make sure that your project was cloned into your defined Docksal project folder. By default this is ~/Projects unless you set up a different folder during initial setup.

**Cannot connect to the Docker daemon at tcp://192.168.64.100:2376. Is the docker daemon running?**

```fin vm restart```

**It looks like 'docksal' docker machine is not running.**
Run 'fin vm start' to start it now? [y/n]: y
Starting "docksal"...
(docksal) Waiting for an IP...

Reset your Virtualbox host (docksal) either in the Virtualbox Manager gui or by running this command:

```VBoxManage controlvm "docksal" reset```

**Cannot start your vm or unexplained Docker daemon errors**

Sometimes Docker and Virtualbox can get out of whack. In order you might try:

1. Manually reset Docker via the Docker UI

2. Run ```fin system reset```

3. If all else fails, a simple system reboot will often fix any errors.

**Cannot mount NFS error**

or "docker: Error response from daemon:" errors.

```fin vim mount```

This can be caused by conflicting entries in your ```/etc/exports``` file and often happens if you have had another Virtualbox instancesuch as DrupalVM running.

One method for fixing this problem:

1. Make a backup of your existing ```/etc/exports``` file

2. Delete the original ```/etc/exports``` file

3. Run ```fin system reset```

[back to README](../../README.md)
