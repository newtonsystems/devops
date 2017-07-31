#!/bin/bash

RANCHER_URL=rancher.jtarball.co.uk
RANCHER_ACCESS_KEY=FA099DD06912297A451F
RANCHER_SECRET_KEY=ug6edAfYeMpZ3cCXULTuUSUr57UMPr5qiWbQrU95

# get project ID easily from the URL when you're in dashboard
PROJECT_ID=1a4891

# get all disconnected hosts (YELLOW)
curl -u "${RANCHER_ACCESS_KEY}:${RANCHER_SECRET_KEY}"  -s "https://${RANCHER_URL}/v2-beta/projects/${PROJECT_ID}/hosts" \
         | jq '.data[] |  select(.state | contains("disconnected"))'  | jq -r .id > disconnected_list

# deactivate, before they can be deleted  (make YELLOW to RED)
while read ID ; do
curl  -u "${RANCHER_ACCESS_KEY}:${RANCHER_SECRET_KEY}" \
-X POST -d '{}'  "https://${RANCHER_URL}/v2-beta/projects/${PROJECT_ID}/hosts/${ID}/?action=deactivate"
sleep 1
done < disconnected_list

# allow some time to transition state of all nodes in case rancher overloaded and slow right now
sleep 30

################ HERE I SUGGEST TO MAKE CHANGES LIKE COUNTER ..... 
###########
#############################################################

# get all inactive (RED)
curl -u "${RANCHER_ACCESS_KEY}:${RANCHER_SECRET_KEY}"  -s "https://${RANCHER_URL}/v2-beta/projects/${PROJECT_ID}/hosts" \
         | jq '.data[] |  select(.state | contains("inactive"))'  | jq -r .id > inactive_list

# delete all inactive hosts
while read ID ; do
curl -u "${RANCHER_ACCESS_KEY}:${RANCHER_SECRET_KEY}" \
-X DELETE "https://${RANCHER_URL}/v2-beta/projects/${PROJECT_ID}/hosts/${ID}"
sleep 1
done < inactive_list