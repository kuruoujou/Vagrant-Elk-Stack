Vagrant Elk Stack
=================
Created April 1, 2015 by Spencer Julian

This is an ELK Stack Vagrant VM. It's configured with Salt, so you can pull the 
salt/roots/ directory and modify it if you're interested in using it in your own
salted environment.

Once vagrant is done provisioning, visit http://127.0.0.1:5601 in your browser to
finish the kibana configuration and use the example data.

You can run

    sudo salt-call state.highstate

in the VM to revert most of your configuration changes back to the default state.

Using Vagrant
-------------
If you're not familiar with [Vagrant](https://www.vagrantup.com), it's a quick 
development VM provisioning system. First, [Install the 
latest](https://www.vagrantup.com/downloads.html) version of vagrant for your OS
using either the previous link or your package manager. Then, clone this
repository and run

    vagrant up

in the repository directory. In about 15 minutes (depending on your internet 
connection speed and if the ubuntu servers are cooperating that day) you'll have
a complete VM provisioned with the ELK stack and with the example data imported.

In the same directory, you can run 

    vagrant ssh

to SSH into the VM and mess with it however you please. For this VM, you can run

    sudo salt-call state.highstate

to revert it to a mostly default state. When you're done playing with the VM,
close your SSH session (if you have one open) and run

    vagrant destroy

in the same directory you run the previous vagrant commands in. This will
shutdown the VM and delete it from your system. The base box that is downloaded
will remain if you want to quickly spin it back up for more testing.
