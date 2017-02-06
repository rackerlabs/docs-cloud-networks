.. _api-reference:

=============
API reference
=============

Learn about the available |apiservice| resources and operations, and
see request and response examples. You can use the |apiservice| operations
to interact directly with the service.

The Rackspace Cloud Networks API v2 (Neutron) serves the following functions:

- Provides virtual networking services among devices that are managed by the
  Rackspace Cloud Servers service.

- Combines the API v1.1 (Quantam) functionality with some essential Internet
  Protocol Address Management (IPAM) functionality by introducing the subnet
  entity.

- When you create a port on the network, an available fixed IP address is
  allocated to it from one of the designated subnets for each IP version (IPv4
  or IPv6). When you delete the port, the allocated addresses return to the
  pool of available IP addresses on the subnet.

- Enables users to associate IP address blocks and other network configuration
  settings. You can choose a specific IP address from the block or let the
  |product name| service choose the first available IP address.

The neutron API is accessible by using cURL commands, the neutron client, a
browser plug-in for REST, and various programming languages and tools.

	..  important::

		- The neutron API is in Unlimited Availability and is available for all
		  Managed Infrastructure and Managed Operations customers except for
		  RackConnect v3 customers.
		- The Security Groups API and Shared IP API are currently in Limited
		  Availability.
		- The Security Groups API and Shared IP API are available for
		  Managed Infrastructure customers and Managed Operations customers
		  and are not available for RackConnect customers. To use these features,
		  contact Rackspace Support.

.. note::

     You can also perform operations by using the
     :rax-devdocs:`Rackspace Command Line Interface (rack CLI) <#sdks>`, one
     of the language-specific :rax-devdocs:`software development kits <#sdks>`,
     or the `Cloud Control Panel <https://mycloud.rackspace.com/>`_.


.. toctree::
   :maxdepth: 2

   network-operations
   subnet-operations
   port-operations
   sec-group-operations
   shared-ip-address-operations
