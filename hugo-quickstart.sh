#!/bin/bash

#***
sudo rm -dr ~/hugo-site/
#***
mkdir ~/hugo-site/ && cd ~/hugo-site && hugo new site quickstart && cd ~/hugo-site/quickstart/themes && git clone https://github.com/jesselau76/hugo-w3-simple.git && cp -r ~/hugo-site/quickstart/themes/hugo-w3-simple/exampleSite/config.toml ~/hugo-site/quickstart/ && cd ~/hugo-site/quickstart/ && hugo serve --bind "0.0.0.0"
