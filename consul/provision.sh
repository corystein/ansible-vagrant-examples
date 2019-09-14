#!/bin/bash

# update and unzip
dpkg -s unzip &>/dev/null || {
    apt-get -y update && apt-get install -y unzip curl jq dnsutils
}

echo "Determining Consul version to install ..."
CHECKPOINT_URL="https://checkpoint-api.hashicorp.com/v1/check"
if [ -z "$CONSUL_DEMO_VERSION" ]; then
    CONSUL_DEMO_VERSION=$(curl -s "${CHECKPOINT_URL}"/consul | jq .current_version | tr -d '"')
fi

# install consul
if [ ! -f /usr/local/bin/consul ]; then
    cd /usr/local/bin

    #version='0.8.0'
    wget https://releases.hashicorp.com/consul/${CONSUL_DEMO_VERSION}/consul_${CONSUL_DEMO_VERSION}_linux_amd64.zip -O consul.zip
    unzip consul.zip
    rm consul.zip

    chmod +x consul
fi

if [ ! -f /etc/systemd/system/consul.service ]; then
    cp /vagrant/consul.service /etc/systemd/system/consul.service
fi

if [ ! -d /etc/systemd/system/consul.d ]; then
    mkdir -p /etc/systemd/system/consul.d
fi
