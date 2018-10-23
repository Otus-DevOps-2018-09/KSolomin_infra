#!/bin/bash
set -e

git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
sudo cp /home/appuser/puma.service /etc/systemd/system
sudo systemctl enable puma
sudo systemctl start puma
