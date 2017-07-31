
One click launch:
https://aws.amazon.com/marketplace/fulfillment?productId=fe8020db-5343-4c43-9e65-5ed4a825c931&launch=oneClickLaunch

Follow instructions
http://docs.openvpn.net/how-to-tutorialsguides/virtual-platforms/amazon-ec2-appliance-ami-quick-start-guide

- o*****n
- g***********2

- push DNS 
Pushing DNS servers to clients is optional, unless clients' Internet traffic is to be routed through the VPN

Do not alter clients' DNS server settings

set this --->  Have clients use the same DNS servers as the Access Server host

Have clients use these DNS servers:





- set elastic ip (https://<IP>:943/admin/server_network_settings - make sure hostname is correct ip if so)
- Remember to disable src/dest check
- run installation twice (if update after first)

Get to the admin:
:943/admin



ok all need to do is add vpc subnet IPV4 CIDR

openvpn MENU
Allow Access To these Networks:

http://sysextra.blogspot.co.uk/2011/01/creating-virtual-private-cluster-with.html



-------------------

- create 53 zone on aws (PRIVATE HOST ZONE)
- rancher route 53 