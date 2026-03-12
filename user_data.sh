#!/bin/bash

apt update -y
apt install docker.io -y

systemctl start docker
systemctl enable docker

# criar usuario
useradd -m sistema_a
usermod -aG docker sistema_a

echo "sistema_a ALL=(ALL) NOPASSWD: /usr/bin/docker" >> /etc/sudoers

# criar rede docker
docker network create bmt-rede-docker

# subir postgres
docker run -d \
  --name postgres \
  --network bmt-rede-docker \
  -e POSTGRES_DB=postgres-dev \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=sacadura10 \
  -p 5432:5432 \
  postgres:16