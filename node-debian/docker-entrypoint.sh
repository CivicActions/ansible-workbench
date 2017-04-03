#!/usr/bin/env bash
set -e

# Check KEYS variable
if [ ! "${AUTHORIZED_KEYS}" ]; then
  echo "You must provide a pub ssh key in the AUTHORIZED_KEYS variable"
fi

echo -e "Adding the following key:\n${AUTHORIZED_KEYS}"

# Add key to root user
mkdir -p /root/.ssh/
mkdir -p /var/run/sshd
echo "${AUTHORIZED_KEYS}" > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

# Create new user
USERNAME=admin
useradd -ms /bin/bash -G sudo ${USERNAME}
id ${USERNAME}

# Add key to new user
mkdir -p /home/${USERNAME}/.ssh/
echo "${AUTHORIZED_KEYS}" > /home/${USERNAME}/.ssh/authorized_keys
chmod 600 /home/${USERNAME}/.ssh/authorized_keys
chown ${USERNAME}: /home/${USERNAME}/.ssh/authorized_keys

echo "${USERNAME} ALL=(ALL)	NOPASSWD: ALL" >> /etc/sudoers

/usr/bin/ssh-keygen -A

exec "$@"
