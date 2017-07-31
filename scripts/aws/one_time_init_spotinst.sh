## Example only  - look in docker custom for specific env to get correct code

#!/bin/bash
curl https://releases.rancher.com/install-docker/1.12.sh | sh
sudo docker run -e CATTLE_HOST_LABELS="spotinst.instanceId=`curl http://169.254.169.254/latest/meta-data/instance-id`" --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.5 https://rancher.jtarball.co.uk/v1/scripts/CE4CF15FB65D3DF5E5D1:1483142400000:ZOFIpTPRU4DP5lhc3o4RmXAeg

wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
sudo chmod +x ./jq-linux64
sudo cp jq-linux64 /usr/bin/jq

sudo apt-get -y install nfs-common

INSTANCE_NAME=`curl http://169.254.169.254/latest/meta-data/instance-id | egrep -o '.{1,4}$'`
INSTANCE_NAME="kube-$INSTANCE_NAME.dev.jtarball"
sudo bash -c "echo $INSTANCE_NAME  > /etc/hostname"
sudo bash -c "echo -e '127.0.0.1 $INSTANCE_NAME' >> /etc/hosts"
sudo bash -c "echo '34.206.12.4:/backups/ /var/etcd/backups nfs     rsize=8192,wsize=8192,timeo=14,intr' >> /etc/fstab "
sudo mount -a
sudo reboot

curl -fsSL http://s3.amazonaws.com/spotinst-labs/spotinst-agent/agent-init.sh | sudo SPOTINST_TOKEN=3f4d5e6baccc5bc57b6c157676fea4b0b03fd18bc9b8c639d64e451f47ea1596 bash


