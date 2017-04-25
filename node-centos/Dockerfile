FROM centos:7

# Install sshd
RUN yum -y update; yum clean all
RUN yum -y install python openssh-server sudo && \
    yum clean all

EXPOSE "22"

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e"]
