docker network create --driver=bridge --subnet=172.25.0.0/16 --opt com.docker.network.bridge.name=cyber_network cyber_network

sudo iptables -I DOCKER-USER -i cyber_network -o forcad_network -j ACCEPT
sudo iptables -I DOCKER-USER -i forcad_network -o cyber_network -j ACCEPT

docker build -t services services/
