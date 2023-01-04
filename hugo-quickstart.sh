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
#cp -r ~/hugo/layouts/staticpage.html ~/hugo-site/quickstart/themes/hugo-w3-simple/layouts/_default/staticpage.html
#cp -r ~/hugo/layouts/shortcodes/rawhtml.html ~/hugo-site/quickstart/themes/hugo-w3-simple/layouts/shortcodes/rawhtml.html
#cp -r ~/hugo/content/test.md ~/hugo-site/quickstart/content/english/test.md
#cp -r ~/hugo/content/test.html ~/hugo-site/quickstart/layouts/_defaults/test.html
#cp -r ~/hugo/search/* ~/hugo-site/quickstart/
#cp -r ~/hugo/gen ~/hugo-site/quickstart/static
#cp -r ~/hugo/layouts/example.html ~/hugo-site/quickstart/static/example2.html

cat <<'EOF' >> ~/hugo-site/quickstart/config.toml
[outputs]
home = ["JSON", "HTML", "RSS"]
EOF

cp -r ~/hugo/layouts ~/hugo-site/quickstart
rm -dr ~/hugo-site/quickstart/content/english/search
cp -r ~/hugo/content/search ~/hugo-site/quickstart/content/english/
cp -r ~/hugo/static/js ~/hugo-site/quickstart/static/

#sudo chmod 777 ~/hugo-site/quickstart/generate.sh
#cd ~/hugo/search && npm install
#cd ~/hugo-site/quickstart/ && ./generate.sh
echo
echo "-------------"
#cat ~/hugo-site/quickstart/static/gen/search-index.json
echo "-------------"
echo

cp ~/hugo/index.json ~/hugo-site/quickstart/layouts/

(cd ~/hugo-site/quickstart  && hugo serve -d -t hugo-w3-simple --bind "0.0.0.0" --baseURL http://18.144.14.97:1313)
