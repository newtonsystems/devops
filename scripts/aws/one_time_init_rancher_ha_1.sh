#!/bin/bash
curl https://releases.rancher.com/install-docker/1.12.6.sh | sh
sudo usermod -aG docker ubuntu
sudo service docker start
sudo docker run -d --restart=unless-stopped --name=rancher-server -v /vol/mysql:/var/lib/mysql -p 8080:8080 rancher/server:stable



sudo docker run -d --restart=unless-stopped -p 8080:8080 -p 9345:9345 rancher/server \
     --db-host rancher.newtonsystems.co.uk --db-port 3306 --db-user username --db-pass password --db-name cattle \
     --advertise-address 34.197.85.67