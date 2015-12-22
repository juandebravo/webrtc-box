#!/usr/bin/env bash

# The output of all these installation steps is noisy.
# With this utility the progress report is nice and concise.
function install {
    echo installing $1

    # More than one argument means first argument is the
    # friendly name, rest of arguments are the packages to
    # be installed
    if [ $# -gt '1' ]; then
      shift
    fi

    apt-get -y install "$@" >/dev/null 2>&1
}

echo 'Updating package information'
apt-get -y update > /dev/null 2>&1

echo 'Installing required packages'
install git-core
install Gtk libgtk-3-0
install libnss3
install Libgconf libgconf-2-4
install libxss1
install Xvfb
install libasound2

echo 'Installing node'
curl -sL https://deb.nodesource.com/setup_5.x | bash - > /dev/null 2>&1
install nodejs
install npm

if [ ! -d '/adapter' ]; then
  # Clone adapter repository if it does not exist yet
  mkdir -p /adapter
  git clone https://github.com/webrtc/adapter.git /adapter
  chown -R vagrant:vagrant /adapter
fi

echo 'Installing adapter dependencies'
cd /adapter
npm install
npm install -g jscs

echo 'Adapting bashrc file'
cp /vagrant/bashrc /home/vagrant/.bashrc
source ~/.bashrc

echo 'Box ready for webRTC adapter development'
