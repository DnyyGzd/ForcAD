docker network create --driver=bridge --subnet=172.25.0.0/24 cybernetwork

docker build -t flags_shop services/flags_shop/
