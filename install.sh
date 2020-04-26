#!/bin/bash

wget https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb -O tmp/vagrant.deb
sudo apt-get install ./tmp/vagrant.deb
sudo chown -R $USER ~/.vagrant.d/

vagrant plugin install vagrant-disksize