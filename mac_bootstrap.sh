#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

# Install XCode Command Line Tools

touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" -v;

# install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew-cask
brew install caskroom/cask/brew-cask

# install chefDK
brew cask install chefdk
