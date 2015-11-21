# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'debian/jessie64'

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # You should have checked out the `adapter` repository from
  # https://www.github.com/webrtc/adapter
  config.vm.synced_folder '../adapter', '/adapter'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '2048'
  end

  config.vm.provision 'shell',
                      path: 'bootstrap.sh',
                      keep_color: true
end
