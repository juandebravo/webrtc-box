
A Virtual Machine for WebRTC testing.

## Introduction

This project automates the development environment setup for working on WebRTC adapter. It's very handy for:

- develop and test new features before launching a PR to the [adapter project](https://github.com/webrtc/adapter/tree/master/test).
- run the examples included in the [samples WebRTC repository](https://github.com/webrtc/samples/tree/master/test) locally.

As described in [adapter project](https://github.com/webrtc/adapter/tree/master/test) documentation, a Debian based Linux distribution is required for using travis-multirunner.

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

## How To Build The Virtual Machine

    host $ git clone https://github.com/juandebravo/webrtc-box.git
    host $ cd webrtc-box
    host $ vagrant up

That's it.

It might happen that you find out an issue while launching the box due to VirtualBox Guest Additions not being installed. If that's the case, please execute:

    host $ ./install_vbox_guest_additions.sh

## What's In The Box

* **Note**: You can choose either clone the [adapter](https://github.com/webrtc/adapter)
and [samples](https://github.com/webrtc/samples) repositories at the same root folder as this
repository or let the bootstrap script clone the repositories for you. *adapter*/*samples*
repos will be available in */adapter*/*/samples* folders respectively in the vagrant box.
* [WebRTC adapter dependencies](https://github.com/webrtc/adapter/blob/master/package.json)
* [WebRTC samples dependencies](https://github.com/webrtc/samples/blob/master/package.json)
* git
* ttk
* libnss3
* libgconf
* libxss1
* xvfb
* libasound2
* nodejs v5

## How To Use The Virtual Machine

After the installation has finished, you can access the virtual machine with:

    host $ vagrant ssh
    vagrant@debian $ cd /adapter
    vagrant@debian /adapter $ npm test
    vagrant@debian /adapter $   ...
    vagrant@debian /adapter $   1..147
    vagrant@debian /adapter $   # tests 147
    vagrant@debian /adapter $   # pass  147
    vagrant@debian /adapter $   # ok
    vagrant@debian $ cd /samples
    vagrant@debian /samples $ npm test
    vagrant@debian /samples $   ...
    vagrant@debian /samples $   1..66
    vagrant@debian /samples $   # tests 66
    vagrant@debian /samples $   # pass  66
    vagrant@debian /samples $   # ok

## License

Released under the MIT License, Copyright (c) 2015 – Juan de Bravo. See [the license file](LICENSE).
