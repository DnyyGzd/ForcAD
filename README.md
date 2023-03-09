# ForcAD

## Initial premise
ForcAD was not designed and created by me. I used the [ForcAD](https://github.com/pomo-mondreganto/ForcAD) made available by [pomo-mondreganto](https://github.com/pomo-mondreganto).
This repository has the sole purpose of speeding up the setup of ForcAD with services and checkers written by me and my team.


## Game Master

### Prerequisites
* `git` installed
   * `sudo apt install git`
* `pip3` installed
   * `sudo apt install python3-pip`

### Setup
* Clone this repository
  * `git clone https://github.com/DnyyGzd/ForcAD`
* Open `config.yml` file
   * Change admin `username` and `password`
   * Delete team example and add teams
   * Change `timezone` and `start_time` (optional)
* Install `cli/requirements.txt`
  * `pip3 install -r cli/requirements.txt`
* Run `./control.py setup`
* Run `./control.py print_tokens` and send them to each team correspondingly
* Run `./control.py start`

### Dashboard
* Scoreboard: `http://127.0.0.1:8080/`
* Admin panel: `http://127.0.0.1:8080/admin/`

### Stop Game
* Run `./control.py reset`

### Info
* Flag format: `[A-Z0-9]{31}=`


## VulnBox

### Prerequisites
* `pip3` installed
   * `sudo apt install python3-pip`
* Install `requirements.txt`
  * `pip3 install -r requirements.txt`
