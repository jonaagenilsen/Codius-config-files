# Codius-config-files
Just a collection of my (working) configs for my Codius host running the latest version.

## General stuff
My host is built on CentOS 7.5 and use default paths and commands for that system. Have that in mind if something is different on your system.

I always recommend [this excellent script for installing & maintaining your host](https://github.com/xrp-community/codius-install) made by [Baltazar](https://twitter.com/baltazar223)!

## Configs
[/etc/nginx/conf.d/codius.conf](https://raw.githubusercontent.com/jonaagenilsen/Codius-config-files/master/etc/nginx/conf.d/codius.conf)

[/etc/systemd/system/codiusd.service](https://raw.githubusercontent.com/jonaagenilsen/Codius-config-files/master/etc/systemd/system/codiusd.service)

[/etc/hyper/config](https://raw.githubusercontent.com/jonaagenilsen/Codius-config-files/master/etc/hyper/config)

## Tips
* This is not Windows. Rarely you resolve problems in Linux by rebooting.
* `nano` is easier to use than `vi` for editing files: `yum install nano -y -q`
* Remove junk and services not needed. For CentOS: `yum erase postfix` (mailserver).
* ALWAYS firewall your SSH port.
* DO NOT enable root login if you aren't properly firewalled.

## Urls
https://hodling-xrp.no/

https://hodling-xrp.no/info

https://hodling-xrp.no/version

https://hodling-xrp.no/memory
