FROM centos/systemd

MAINTAINER Oleg Snegirev <ol.snegirev@gmail.com>

# Install packages
RUN yum -y install openssh-server sudo nano epel-release openssl certmonger; systemctl enable sshd.service
RUN echo 'root:welcome' | chpasswd
RUN yum install iproute -y
RUN mkdir -p /var/run/sshd ; chmod -rx /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN mkdir /root/.ssh/ && \
	echo "ssh-rsa AAAAB3Nz4........l9Ns5p989oHLcSGJ" > ~/.ssh/authorized_keys && \
	chmod 700 ~/.ssh && \
	chmod 600 ~/.ssh/authorized_keys
RUN bash -c 'echo "pos ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)'
CMD ["/usr/sbin/init"]

