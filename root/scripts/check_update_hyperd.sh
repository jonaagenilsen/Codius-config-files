#!/bin/bash
#
# (c) jonaagenilsen@gmail.com / https://twitter.com/jonaagenilsen
#
# Check if Hyperd has any updates. If true, download, and give tips on upgrading.


echo -e -n "Checking if new versions are available for Hyperd: "
HYPERD_LATEST="`curl --silent "https://api.github.com/repos/hyperhq/hyperd/releases/latest" | grep -Po '"tag_name": "v\K.*?(?=")'`"
HYPERD_INSTALLED="`rpm -qa | grep -Po 'hyperstart-\K.*?(?=-.*)'`"

if [[ "$HYPERD_LATEST" ==  "$HYPERD_INSTALLED" ]]; then
  echo -e "OK. Latest (\e[0;32m$HYPERD_LATEST\e[0m) already installed."
else
  echo -e "new version available: \e[0;32m$HYPERD_LATEST\e[0m. Currently installed: \e[31m$HYPERD_INSTALLED\e[0m"
  echo -e -n ".. Downloading \e[0;32m$HYPERD_LATEST\e[0m "
  echo -n "."
  wget https://hypercontainer-download.s3-us-west-1.amazonaws.com/1.1/centos/hyperstart-${HYPERD_LATEST}-1.el7.x86_64.rpm -P /tmp/ -q
  echo -n "."
  wget https://hypercontainer-download.s3-us-west-1.amazonaws.com/1.1/centos/hyper-container-${HYPERD_LATEST}-1.el7.x86_64.rpm -P /tmp/ -q
  echo " Done!"
  echo
  echo -e "Update with: \e[0;32mrpm -Uvh /tmp/hyperstart-${HYPERD_LATEST}-1.el7.x86_64.rpm /tmp/hyper-container-${HYPERD_LATEST}-1.el7.x86_64.rpm\e[0m"
  echo -e "After update: \e[0;32mnano /etc/hyper/config\e[0m and edit config to include the following:"
  echo
  echo -e "\e[0;32mHypervisor=kvm\e[0m"
  echo -e "\e[0;32mBridgeIP=10.0.0.0/19\e[0m"
  echo
  echo -e "Then restart Hyperd: \e[0;32msystemct restart hyperd\e[0m"
fi
