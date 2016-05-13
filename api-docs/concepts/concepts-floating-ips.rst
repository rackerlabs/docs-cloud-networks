.. _concepts-floating-ips:

=========================
Floating IP Addresses
=========================

A floating IP address is a static IP address that has the ability to move or “float” 
between cloud resources, primarily Cloud Servers. Unlike fixed or shared IP addresses, 
floating IP addresses are associated at the tenant level rather than at the instance level 
(for example, a Cloud Server). Furthermore, floating IP addresses differ because they can 
be created without having to provision any compute, networking or storage infrastructure.

Floating IPs solves the following two problems.

#. Constantly changing IP addresses

   Creating and removing cloud resources is a common exercise. However, the default IP 
   address provided for a resource changes each time you create a new resource, which 
   requires configuration file updates, DNS entry modifications, and so on. Leveraging 
   floating IPs allows eliminates this problem by keeping the same IP addresses, no matter 
   how many times resources are created and removed.
   
#. IP Reputation 

   Believe it or not, an IP address can have a reputation. Some IP addresses have good 
   reputations and become whitelisted by trusting sources across the Internet. More 
   importantly, however, some IP addresses have bad reputations and get blacklisted. If you 
   happen to get a “bad IP”, your infrastructure can become unreachable by certain areas of 
   the Internet. Leveraging a Floating IP allows one to build up an IP’s reputation and keep 
   it. 
   
In general, Floating IPs enhance the flexibility of the Rackspace Public Cloud by removing 
the need to manage necessary the networking changes associated with constantly changing IP 
addresses.