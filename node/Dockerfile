FROM python:2

# Install sshd
RUN apt-get update && apt-get -y upgrade && apt-get -y install openssh-server sudo
RUN apt-get autoclean && apt-get autoremove

EXPOSE "22"

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e"]
