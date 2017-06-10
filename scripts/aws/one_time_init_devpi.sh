#!/bin/bash
curl https://releases.rancher.com/install-docker/1.13.sh | sh
sudo usermod -aG docker ubuntu
sudo service docker start
sudo docker run -d  --restart=unless-stopped -p 3141:3141 -v /vol/devpi:/devpi --name devpi-server lordgaav/devpi:latest --outside-url https://devpi.newtonsystems.co.uk
sudo docker run --restart=unless-stopped --link devpi-server:webserver -p 80:80 -p 443:443 -v /vol/nginx-rev-proxy/letsencrypt:/etc/letsencrypt -v /vol/nginx-rev-proxy/pki:/etc/pki/nginx -v /vol/nginx-rev-proxy/logs/app:/var/log/app --env ENFORCE_HTTPS=TRUE --env DOMAIN_NAME=devpi.newtonsystems.co.uk --env WEB_SERVER_PORT=3141 --env MATTERMOST_WEBHOOK_URL=https://mattermost.newtonsystems.co.uk/hooks/9eypzzfrrjy9dyptf6s6otchie -d newtonsystems/docker-nginx-reverse-proxy:0.1.1