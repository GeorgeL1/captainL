Kickstart installation
===================


This repository contains scripts that will deploy the Ubuntu 14.04 (Trusty Tahr) into a physical or virtual machine, also the base packages will be installed during deployment, 

This script is based on the [official Ubuntu documentation](https://help.ubuntu.com/lts/installation-guide/i386/ch04s06.html).

----------

Look through the script for any changes you want to do.

-------------

You may want to change the initial admin user, or enable root user to login. current
user name is openstack and password is openStack2015, also you may want to change the
list of installed packages. tried to keep it as minimal as possible.

Place this somewhere that the machine will be able to see, Web server on LAN would be best.

People setting up in VMware the kernel has support for VMXNET3 compiled in so you can use
it for initial installation.

> **Usage:**

> - Boot up from Ubuntu ISO
> - Press **F6** and hit escape so you can edit the boot line, add the following at the end before **"--"**.  for example, if you did include the **"--"**, the end of boot line would be: 
  ks=http://your-server/projects/captainL/ubuntu/ks-trusty.cfg --

> - That's it!, it will grab an IP via DHCP server on eth0 and setup the system.  