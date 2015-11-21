#!/usr/bin/env bash

# The output of all these installation steps is noisy.
# With this utility the progress report is nice and concise.
function install {
    # if $# gt; 1
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo 'Updating package information'
apt-get -y update > /dev/null 2>&1
install Git git-core
install Gtk libgtk-3-0
install Libnss3 libnss3
install Libgconf libgconf-2-4
install Libxss1 libxss1
install Xvfb Xvfb
install Libasound libasound2

curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -  > /dev/null 2>&1
install nodeJS nodejs
install npm npm

echo 'Installing adapter dependencies'
cd /adapter
npm install
npm install jscs -g

echo 'Adapting bashrc file'
cp /vagrant/bashrc /home/vagrant/.bashrc
source ~/.bashrc

echo 'Box ready for webRTC adapter development'
