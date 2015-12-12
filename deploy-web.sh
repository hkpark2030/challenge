#!/bin/bash

# Download tar.gz, build, and install them to each server
  sudo apt-get update
  sudo apt-get install -y build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip
  sudo apt-get install -y asciidoc xmlto docbook2x
  wget https://github.com/git/git/archive/v2.6.3.zip -O git.zip
  unzip git.zip
  cd git-*
  make prefix=/usr/local all
  sudo make prefix=/usr/local install
