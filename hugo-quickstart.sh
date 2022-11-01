#!/bin/bash

#***
sudo rm -dr ~/hugo-site/
#***
sudo ufw allow 1313
sudo ufw allow 22
sudo ufw allow 80
echo "yes" | sudo ufw enable
mkdir ~/hugo-site/ && cd ~/hugo-site && hugo new site quickstart && cd ~/hugo-site/quickstart/themes && git clone https://github.com/jesselau76/hugo-w3-simple.git
cp -r ~/hugo-site/quickstart/themes/hugo-w3-simple/exampleSite/* ~/hugo-site/quickstart/ && cd ~/hugo-site/quickstart/
cp -r ~/hugo/layouts/staticpage.html ~/hugo-site/quickstart/themes/hugo-w3-simple/layouts/_default/staticpage.html
cp -r ~/hugo/layouts/shortcodes/rawhtml.html ~/hugo-site/quickstart/themes/hugo-w3-simple/layouts/shortcodes/rawhtml.html
cp -r ~/hugo/content/test.md ~/hugo-site/quickstart/content/english/test.md


hugo serve -d -t hugo-w3-simple --bind "0.0.0.0"
