FROM ubuntu:22.04

WORKDIR /usr/src/app

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip openssh-server
RUN echo 'root:CyberUnipa23!?' | chpasswd && \
	sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' \
	/etc/ssh/sshd_config && \
	service ssh start

COPY . .

RUN pip3 install -r requirements.txt

EXPOSE 9876
CMD [ "python3", "app.py" ]
