#!/bin/bash
set -euxo pipefail

USER_TO_ADD=hostmit
USER_PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAmu3u9JJ1GTCj3B7UMfGhyxwcfIMk/4JtKeYLIuj2m+C3JW/Y1LkQrjMO8etOiVMX+iSn3k75wA0Zv2Yafc+fU5EasUtnJ/HTaq/sQOICMsUjdkCvjmGvyxekGI88eR0e+IH0uiBOzmHMhCd3WimkQrHKxRP7vo8rUGcPAK9C0f4ABPov9gO1dwCY679OwapGCwz1KrkFiTYf0akSaKDPIRRUtKTW/0L5AW0/v7wH+rCFmN6rXgS7XwmDTKesHdGlfHLTifExo5t+Lq4A7Of+YRKI0YgazifJ0+2TGMEJ/BgRF0mTFewypTwYZ4imMCbIkWaYw9Fw25J672L/vpKheQ=="


sudo useradd --create-home ${USER_TO_ADD}
sudo -u ${USER_TO_ADD} mkdir -p /home/${USER_TO_ADD}/.ssh
echo ${USER_PUBLIC_KEY} | sudo -u ${USER_TO_ADD} tee -a /home/${USER_TO_ADD}/.ssh/authorized_keys
sudo -u ${USER_TO_ADD} chmod 600 /home/${USER_TO_ADD}/.ssh/authorized_keys
sudo -u ${USER_TO_ADD} chmod 700 /home/${USER_TO_ADD}/.ssh
sudo usermod -a -G sudo ${USER_TO_ADD}
echo "${USER_TO_ADD} ALL=(ALL) NOPASSWD:ALL"| sudo tee -a /etc/sudoers
sudo chsh -s /bin/bash ${USER_TO_ADD}