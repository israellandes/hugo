#!/bin/bash

#***
sudo rm -dr ~/hugo-site/
#***
mkdir ~/hugo-site/ && cd ~/hugo-site && hugo new site quickstart && cd ~/hugo-site/quickstart/themes && git clone https://github.com/jesselau76/hugo-w3-simple.git && cd ~/hugo-site/quickstart && echo theme = \"Hugo W3 Simple\" >> config.toml && hugo serve
