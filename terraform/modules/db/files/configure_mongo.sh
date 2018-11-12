#!/bin/bash
set -e

sudo mv /tmp/mongod.conf /etc/mongod.conf
sudo service mongod restart
