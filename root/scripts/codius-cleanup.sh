# Stop services
systemctl daemon-reload
systemctl stop codiusd.service
systemctl stop moneyd-xrp
systemctl stop hyperd
systemctl stop nginx

# Take down interfaces for Codius/Hyperd before cleaning.
ifconfig codius0 down
ifconfig hyper0 down

# Unmount all stuff
for mount in `cat /proc/mounts | grep /run/hyper | awk '{ print $2 }'`; do umount $mount; done
for mount in `cat /proc/mounts | grep /var/lib/hyper/hosts | awk '{ print $2 }'`; do umount $mount; done
umount /var/lib/hyper/hosts/*
umount /run/hyper/vm*/share_dir/*

# cleanup
rm -rf /var/lib/hyper/hosts/*
rm -rf /var/lib/hyper/containers/*
rm -rf /run/hyper/*
rm -rf /var/log/hyper/qemu/*.log

# Start everything again
systemctl start nginx
systemctl start hyperd
systemctl start moneyd-xrp
sleep 30
systemctl start codiusd.service
