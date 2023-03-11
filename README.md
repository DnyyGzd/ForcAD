# ForcAD



## Initial premise
ForcAD was not designed and created by me. I used the [ForcAD](https://github.com/pomo-mondreganto/ForcAD) made available by [pomo-mondreganto](https://github.com/pomo-mondreganto).
This repository has the sole purpose of speeding up the setup of ForcAD with services and checkers written by me and my team.

In this case the whole system is configured starting from a clean Ubuntu 22.04 and using the potential of docker for the network infrastructure.



## Game Master

### 1st step Setup
```shell
wget https://raw.githubusercontent.com/DnyyGzd/ForcAD/main/setup.sh
bash setup.sh
```

**_Re-login the user or reboot and move to ForcAD directory before configuring_**



### 2st step Setup
```shell
bash setup-docker.sh
```



### Configuration
* If you have **ufw** installed
  * `sudo ufw route allow from <local_network>/24 to 172.25.0.0/24`
* Open `config.yml` file
  * Change admin `username` and `password`
  * Delete team example and add teams
    * Range 172.25.0.2 - 172.25.0.254
  * Change `timezone` and `start_time` (optional)
* Run team vulnboxes
  * `docker run -d --network=cybernetwork flags_shop`
* Print team tokens and pause
  * Run `./control.py setup && ./control.py start && ./control.py print_tokens && ./control.py pause`
  * Send them to each team correspondingly
* To resume
  * Run `./control.py resume`

### Stop Game
* Run `./control.py reset`

### Info
* Scoreboard: `http://127.0.0.1:8080/`
* Admin panel: `http://127.0.0.1:8080/admin/`
* Flag ids: `http://127.0.0.1/api/client/attack_data/`
* Flag format: `[A-Z0-9]{31}=`



## Team clients
* Add cybernetwork to ip route
  * `sudo ip route add 172.25.0.0/24 via <server_ip>`
