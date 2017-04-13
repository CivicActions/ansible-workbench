FROM python:2

# Install ansible with pip.
RUN pip install --upgrade pip && pip install ansible

RUN mkdir -p /opt/ansible
WORKDIR /opt/ansible

# SSH config
RUN mkdir -p /root/.ssh && echo "StrictHostKeyChecking no" > /root/.ssh/config

# Show version.
RUN ansible --version

CMD ["/bin/bash"]
