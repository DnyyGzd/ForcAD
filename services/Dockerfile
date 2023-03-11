FROM ubuntu:22.04

WORKDIR /usr/src/app

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip openssh-server
RUN echo 'root:CyberUnipa23!?' | chpasswd && \
	sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' \
	/etc/ssh/sshd_config

COPY . .

RUN pip3 install -r flags_shop/requirements.txt

EXPOSE 22
EXPOSE 9876

CMD [ "bash", "entrypoint.sh" ]
