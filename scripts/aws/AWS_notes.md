- create an inbound all tcps for vpc (so all internal basically)

- create route 53 in racher



-- How to set up spotinst
-----------------------------
- follow rancher spotinst integration guide
- create elasticgroup 
- use one_time_init_spotinst.sh and spotinst_shutdown.sh for the user data and shutdown script

This should be able to create hosts on rancher thro spotinst. The shutdown script
should be able to deactivate and delete hosts


dns
-----
how to add a search vpc -> dhcp options - create new 

then efit dhcp options