docker network create --driver=bridge --subnet=172.25.0.0/24 cybernetwork

docker build -t services services/
