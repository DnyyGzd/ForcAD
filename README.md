# Initial premise
ForcAD was not designed and created by me. I used [ForcAD](https://github.com/pomo-mondreganto/ForcAD) made available by [pomo-mondreganto](https://github.com/pomo-mondreganto). The sole purpose of this repository is to speed up the setup of ForcAD with Docker-in-Docker vulnboxes containing services written by me or sourced from other AD competitions.

In this setup, the entire system is configured starting from a clean Ubuntu 22.04 installation, utilizing Docker for the network infrastructure.

Services available:
* Flags Shop (service and checker by me)
* CyberUni (service and checker made by [Cybersecurity National Lab](https://github.com/CybersecNatLab), checker adapted by me)

<br/>

# Game Master

## Setup
From a clean Ubuntu 22.04:
```shell
wget https://raw.githubusercontent.com/DnyyGzd/ForcAD/main/setup.bash
bash setup.bash
```

## ForcAD Configuration
* Open `config.yml` file
  * Change admin `username` and `password`
  * Delete or add teams
    * `10.80.<team>.1`
      * $1 \leq team \leq 255$
  * Change `timezone` and `start_time` (optional)

## VPN Configuration
Install Wireguard.
```shell
sudo apt install wireguard resolvconf
```

Run `wireguard_keygen.bash` to generate the server and team configuration files.

For example, if your server uses network interface `enp0s3`, ip `192.168.1.100`, port `51820` and you need `20` teams with `5` clients per team:
```shell
bash wireguard_keygen.bash enp0s3 192.168.1.100 51820 20 5
```

Move wg0.conf to wireguard directory.
```shell
sudo mv wg0.conf /etc/wireguard/wg0.conf
```

Start server wireguard.
```shell
sudo wg-quick up wg0
```

Share to team clients configuration files.

<br/>

# Team Client
Install Wireguard.
```shell
sudo apt install wireguard resolvconf
```

Get a client configuration file from the Game Master and move to your configuration file place.
```shell
sudo mv <conf_file>.conf /etc/wireguard/<conf_file>.conf
```

Start client wireguard.
```shell
sudo wg-quick up <conf_file>
```

<br/>

# Run ForcAD
* Start vulnboxes from ForcAD/cyber_network directory
  * `docker compose up --build -d && docker compose logs -f`
* As soon as the vulnboxes are ready, start ForcAD from ForcAD directory
  * `./control.py setup && ./control.py start`
* Print team tokens and send to each team correspondingly
  * `./control.py print_tokens`
* When you want to stop ForcAD and clean the leaderboard
  * `./control.py reset && sudo rm -rf docker_volumes`

<br/>

# Info
* Scoreboard
  * `http://10.10.0.1`
* Admin panel
  * `http://10.10.0.1/admin`
* Flag ids
  * `http://10.10.0.1/api/client/attack_data`
* Submit flags
  * `http://10.10.0.1/flags`
* Flag format
  * `[A-Z0-9]{31}=`

<br/>

# Code to submit flags
```python
#!/usr/bin/python3

import requests

def submit_flags(team_token, flags):
	print(requests.put(f'http://10.10.0.1/flags', headers={'X-Team-Token': team_token}, json=flags).text)
```
Please note: `flags` must be a list.
