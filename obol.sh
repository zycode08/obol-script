#!/bin/bash

wget -O get-docker.sh https://get.docker.com
sudo bash get-docker.sh

git clone https://github.com/ObolNetwork/charon-distributed-validator-node.git
cd charon-distributed-validator-node
mkdir .charon
sudo chmod -R 777 .charon

sudo docker run --rm -v "$(pwd):/opt/charon" obolnetwork/charon:v0.13.0 create enr | tee $HOME/keys.txt
private_key=$(sudo cat .charon/charon-enr-private-key)
sed -i -e "s/^Created ENR private key:.*/Created ENR private key: $private_key/g" $HOME/keys.txt
