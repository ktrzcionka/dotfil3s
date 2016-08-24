#!/bin/bash

command_exists () {
    type "$1" &> /dev/null ;
}

if ! command_exists ag ; then
  echo "installing silversearcher-ag"
  sudo apt-get install -y silversearcher-ag &> /dev/null
else
  echo "ag already installed"
fi
