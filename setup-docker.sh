docker network create --driver=bridge --subnet=172.25.0.0/16 --opt com.docker.network.bridge.name=cybernetwork cybernetwork

docker build -t services services/
