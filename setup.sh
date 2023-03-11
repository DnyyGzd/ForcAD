sudo apt update -y && sudo apt full-upgrade -y

sudo apt install git -y
sudo apt install python3-pip -y

sudo apt install docker.io -y
sudo systemctl enable docker --now
curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -
chmod +x docker-compose-linux-x86_64
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
rm docker-compose-linux-x86_64.sha256
sudo groupadd docker
sudo usermod -aG docker $USER

git clone https://github.com/DnyyGzd/ForcAD
cd ForcAD
pip3 install -r cli/requirements.txt
chmod +x control.py

chmod o+rx checkers/flags_shop/checker.py
