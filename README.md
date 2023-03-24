# ForcAD

## Initial premise
ForcAD was not designed and created by me. I used the [ForcAD](https://github.com/pomo-mondreganto/ForcAD) made available by [pomo-mondreganto](https://github.com/pomo-mondreganto).
This repository has the sole purpose of speeding up the setup of ForcAD with services and checkers written by me and my team.

In this case the whole system is configured starting from a clean Ubuntu 22.04 and using the potential of docker for the network infrastructure.

<br/>

## Game Master

### 1st step Setup
```shell
wget https://raw.githubusercontent.com/DnyyGzd/ForcAD/main/setup.sh
bash setup.sh
```

**_Re-login the user (or reboot) and change to the ForcAD directory before continuing to the 2nd step_**

### 2nd step Setup
```shell
bash setup-docker.sh
```

### Configuration
* Set VPN if you have Game Master and Clients in different subnets
* If you have **ufw** installed
  * `sudo ufw route allow from <local_network>/24 to 172.25.0.0/16`
* Open `config.yml` file
  * Change admin `username` and `password`
  * Delete team example and add teams
    * Range 172.25.1.0 - 172.25.255.0
  * Change `timezone` and `start_time` (optional)
* Run team vulnboxes with cybernetwork
  * `docker run -d --network=cyber_network --ip 172.25.<x>.0 services`
* Start the AD
  * Run `./control.py setup && ./control.py start`
* Print team tokens and send to each team correspondingly
  * Run `./control.py print_tokens`

### Stop Game
* Run `./control.py reset`

### Info
* Scoreboard: `http://<server_ip>/`
* Admin panel: `http://<server_ip>/admin/`
* Flag ids: `http://<server_ip>/api/client/attack_data/`
* Flag format: `[A-Z0-9]{31}=`

<br/>

## Team Clients
* Add cybernetwork to ip route
  * `sudo ip route add 172.25.0.0/16 via <server_ip>`

<br/><br/>

# Wireguard VPN

## Game Master
Install Wireguard with automated script and create every client configuration file you want.
```shell
wget https://raw.githubusercontent.com/angristan/wireguard-install/master/wireguard-install.sh
sudo bash wireguard-install.sh
```
* Server Wireguard IPv4: 172.25.250.0
* Allowed IPs list: 172.25.0.0/16

Add these lines in `/etc/wireguard/wg0.conf`<br/>
* `PostUp = iptables -t nat -I POSTROUTING -o cyber_network -j MASQUERADE`
* `PostUp = iptables -I DOCKER-USER -i cyber_network -o forcad_network -j ACCEPT`
* `PostUp = iptables -I DOCKER-USER -i forcad_network -o cyber_network -j ACCEPT`

<br/>

## Team Clients
Get a client configuration file from the Game Master.
```shell
sudo apt install wireguard resolvconf
```
Move to your configuration file place.
```shell
sudo mv /etc/wireguard/client<x>.conf
wg-quick up client<x>
```
