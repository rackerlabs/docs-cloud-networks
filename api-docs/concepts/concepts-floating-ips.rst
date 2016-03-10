.. _concepts-floating-ips:

=========================
Floating IP Addresses
=========================

Floating IPs provide public access to servers on private networks.  Unlike fixed IP 
addresses, which are are assigned to instances upon creation, floating IP addresses may be
assigned any time after creation and are used to allow the server to accept traffic from 
the internet through routers.

First create a pool of floating IPs, your network, and server, and your router. Then, what?
Add a router to server? A floating IP to router or to server?  What's the relationship?!