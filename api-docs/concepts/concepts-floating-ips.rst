.. _concepts-floating-ips:

=========================
Floating IP addresses
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

In general, floating IPs enhance the flexibility of the Rackspace Public Cloud by removing
the need to manage the networking changes associated with constantly changing IP
addresses.

.. _concepts-floating-ip-caveats:

Floating IP address caveats
---------------------------

With the Early Access (EA) launch of floating IP addresses, take note of the
following caveats.

- Floating IP addresses are compatible with only virtual Cloud Servers.
- Floating IP addresses are not compatible with RackConnect V3.
- You are limited to five floating IP addresses per account during the EA period.
- When associating a floating IP address with a Cloud Server, we recommend that you
  disassociate the current associated fixed public IP address from the Cloud
  Server. Before doing this,  make sure you are willing to relinquish the fixed
  public IP address. If you prefer to maintain the fixed IP address, you must manually
  add default routes to the instance.
- You must provision a new floating IP address instead of using an existing IP address,
  because current public IPv4 addresses cannot be converted to a floating IP address.
- Floating IP addresses may be only IPv4. IPv6 is not supported.
