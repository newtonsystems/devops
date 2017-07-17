#!/bin/bash
curl https://releases.rancher.com/install-docker/1.12.6.sh | sh
sudo usermod -aG docker ubuntu
sudo service docker start
sudo docker run -d --restart=unless-stopped --name=rancher-server -v /vol/mysql:/var/lib/mysql -p 8080:8080 rancher/server:stable
sudo docker run --restart=unless-stopped --link rancher-server:webserver \
-p 80:80 -p 443:443 \
-v /vol/nginx-rev-proxy/letsencrypt:/etc/letsencrypt \
-v /vol/nginx-rev-proxy/pki:/etc/pki/nginx \
-v /vol/nginx-rev-proxy/logs/app:/var/log/app \
--env ENFORCE_HTTPS=TRUE \
--env DOMAIN_NAME=rancher.jtarball.co.uk \
--env MATTERMOST_WEBHOOK_URL=https://mattermost.jtarball.co.uk/hooks/9eypzzfrrjy9dyptf6s6otchie \
-d newtonsystems/docker-nginx-reverse-proxy:0.1.0
