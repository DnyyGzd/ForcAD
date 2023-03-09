# ForcAD

## Initial premise
ForcAD was not designed and created by me. I used the [ForcAD](https://github.com/pomo-mondreganto/ForcAD) made available by [pomo-mondreganto](https://github.com/pomo-mondreganto).
This repository has the sole purpose of speeding up the setup of ForcAD with services and checkers written by me and my team.


## Game Master

### Prerequisites
* Update your system
```shell
sudo apt update && sudo apt full-upgrade
```
* `git`
```shell
sudo apt install git
```
* `pip3`
```shell
sudo apt install python3-pip
```
* `docker`
```shell
sudo apt install docker.io
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
```
* `docker-compose`
```shell
curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -
chmod +x docker-compose-linux-x86_64
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
rm docker-compose-linux-x86_64.sha256
sudo usermod -aG docker $USER
newgrp docker
```

### Setup
* Clone this repository
  * `git clone https://github.com/DnyyGzd/ForcAD`
* Open `config.yml` file
  * Change admin `username` and `password`
  * Delete team example and add teams
  * Change `timezone` and `start_time` (optional)
* Install `cli/requirements.txt`
  * `pip3 install -r cli/requirements.txt`
* Make `control.py` runnable
  * `chmod +x control.py`
* Run `./control.py setup`
* Run `./control.py start`
* Run `./control.py print_tokens` and send them to each team correspondingly

### Stop Game
* Run `./control.py reset`

### Info
* Scoreboard: `http://127.0.0.1:8080/`
* Admin panel: `http://127.0.0.1:8080/admin/`
* Flag ids: `http://127.0.0.1/api/client/attack_data/`
* Flag format: `[A-Z0-9]{31}=`


## VulnBox

### Prerequisites
* Update your system
```shell
sudo apt update && sudo apt full-upgrade
```
* `pip3`
```shell
sudo apt install python3-pip
```
* Install `requirements.txt`
```shell
pip3 install -r requirements.txt
```
* Run service
```shell
python3 flags_shop/app.py
