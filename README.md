# Initial premise
ForcAD was not designed and created by me. I used the [ForcAD](https://github.com/pomo-mondreganto/ForcAD) made available by [pomo-mondreganto](https://github.com/pomo-mondreganto).
This repository has the sole purpose of speeding up the setup of ForcAD with services and checkers written by me and my team.

In this case the whole system is configured starting from a clean Ubuntu 22.04 and using the potential of docker for the network infrastructure.

<br/>

# Game Master

## 1st step Setup
```shell
wget https://raw.githubusercontent.com/DnyyGzd/ForcAD/main/setup.sh
bash setup.sh
```

**_Re-login the user (or reboot) and change to the ForcAD directory before continuing to the 2nd step_**

## 2nd step Setup
```shell
bash setup-docker.sh
```

## VPN Configuration
Install Wireguard with automated script.
```shell
wget https://raw.githubusercontent.com/angristan/wireguard-install/master/wireguard-install.sh
sudo bash wireguard-install.sh
```
* Server Wireguard IPv4: 172.25.250.1
* Allowed IPs list: 172.25.0.0/16

Create every client configuration file you want.

Add these lines in `/etc/wireguard/wg0.conf`
* `PostUp = iptables -t nat -I POSTROUTING -o cyber_network -j MASQUERADE`
* `PostUp = iptables -I DOCKER-USER -i cyber_network -o forcad_network -j ACCEPT`
* `PostUp = iptables -I DOCKER-USER -i forcad_network -o cyber_network -j ACCEPT`

Restart VPN
```shell
wg-quick down wg0
wg-quick up wg0
```

## ForcAD Configuration
* Open `config.yml` file
  * Change admin `username` and `password`
  * Delete or add teams
    * Range 172.25.1.0 - 172.25.249.0
  * Change `timezone` and `start_time` (optional)
* Run team vulnboxes with cybernetwork
  * `docker run -d --network=cyber_network --ip 172.25.<x>.0 services`

<br/>

# Team Clients
Get a client configuration file from the Game Master.
```shell
sudo apt install wireguard resolvconf
```
Move to your configuration file place.
```shell
sudo mv <conf_file>.conf /etc/wireguard/<conf_file>.conf
wg-quick up <conf_file>
```

<br/>

# Info

* Start the ForcAD competition
  * Run `./control.py setup && ./control.py start`
* Print team tokens and send to each team correspondingly
  * Run `./control.py print_tokens`
* Stop the ForcAD competition
  * Run `./control.py reset`
* Scoreboard
  * `http://172.25.250.1`
* Admin panel
  * `http://172.25.250.1/admin`
* Flag ids
  * `http://172.25.250.1/api/client/attack_data`
* Flag format
  * `[A-Z0-9]{31}=`
* Submit flags
  * `http://172.25.250.1/flags`

<br/>
