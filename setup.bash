#!/bin/bash

sudo apt update && sudo apt full-upgrade -y

sudo apt install -y curl git python3-pip
sudo apt install -y docker.io docker-compose-v2

sudo sysctl -w fs.aio-max-nr=2097152

git clone https://github.com/DnyyGzd/ForcAD

pip3 install -r ForcAD/cli/requirements.txt --break-system-packages
chmod +x ForcAD/control.py

chmod +x ForcAD/checkers/flags_shop/checker.py
chmod +x ForcAD/checkers/cyberuni-examnotes/checker.py
chmod +x ForcAD/checkers/cyberuni-encryptednotes/checker.py
chmod +x ForcAD/checkers/cyberuni-examportal/checker.py

sudo usermod -aG docker $USER
newgrp docker
