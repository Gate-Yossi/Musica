#!/bin/bash

# Install nginx if not installed
nginx -v
if [ "$?" -ne 0 ]; then
  sudo amazon-linux-extras install -y nginx1
  sudo systemctl enable nginx
  sudo systemctl start nginx
fi
