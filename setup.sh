sudo apt update -y && sudo apt full-upgrade -y

sudo apt install git -y
sudo apt install python3-pip -y
sudo apt install curl -y
sudo apt install docker.io docker-compose-v2

sudo groupadd docker
sudo usermod -aG docker $USER

git clone https://github.com/DnyyGzd/ForcAD
cd ForcAD
pip3 install -r cli/requirements.txt
chmod +x control.py

chmod o+rx checkers/flags_shop/checker.py
