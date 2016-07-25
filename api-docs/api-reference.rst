.. _api-reference:

===================
**API Reference**
===================

Learn about the available Cloud Networks API resources and methods and see request and 
response examples.

The Rackspace Cloud Networks API v2 (Neutron) serves the following functions:

- Provides virtual networking services among devices that are managed by the Rackspace Cloud Servers service.

- Combines the API v1.1 (Quantam) functionality with some essential Internet Protocol Address 
  Management (IPAM) functionality by introducing the subnet entity.

- When you create a port on the network, an available fixed IP address is allocated to it 
  from one of the designated subnets for each IP version (IPv4 or IPv6). When you delete the 
  port, the allocated addresses return to the pool of available IP addresses on the subnet.

- Enables users to associate IP address blocks and other network configuration settings. 
  You can choose a specific IP address from the block or let the Cloud Networks service choose 
  the first available IP address.

The neutron API is accessible by using cURL commands, the neutron client, a browser plug-in 
for REST, and various programming languages and tools.

	..  note::

		The neutron API is in Unlimited Availability and is available for all Managed 
		Infrastructure and Managed Operations customers except for RackConnect v3 customers. 
		The Security Groups API is currently in Limited Availability, and the Floating IP Address
		API is in Early Access. They are available only 
		to Managed Infrastructure customers and not to RackConnect or Managed Operations 
		customers. To use the security groups or floating IP address features, contact 
		Rackspace Support.
