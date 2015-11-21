
A Virtual Machine for WebRTC testing

## Introduction

This project automates the development environment setup for working on WebRTC adapter. It's very handy to develop and test new features before launching a PR to the [adapter project](https://github.com/webrtc/adapter/tree/master/test).

As described in [adapter project](https://github.com/webrtc/adapter/tree/master/test) documentation, a Debian based Linux distribution is required for using travis-multirunner.

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

## How To Build The Virtual Machine

    host $ git clone https://github.com/juandebravo/webrtc-box.git
    host $ cd webrtc-box
    host $ vagrant up

That's it.

## What's In The Box

* **Note**: You can choose either clone the [adapter](https://github.com/webrtc/adapter) at the same root folder as this repository or let the bootstrap script clone the repository for you. *adapter* repo will be available in */adapter* folder in the vagrant box.
* [WebRTC adapter dependencies](https://github.com/webrtc/adapter/blob/master/package.json)
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

