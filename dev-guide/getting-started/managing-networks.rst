=================
Managing Networks
=================

This overview introduces the types of Cloud Networks API operations,
Cloud Networks service limits, a comparison between the Neutron API and
the Nova-Network API, the available networks, which networks are
attached to a server (based on the provisioning method), and a
discussion about the consequences of choosing not to attach to Rackspace
PublicNet and ServiceNet networks.

You can use the Cloud Networks service Neutron API to perform the
following tasks:

-  List *networks* to which the specified tenant has access.

-  Create isolated networks.

-  Show details for isolated networks.

-  Delete an isolated network, if it is not associated with any server.

.. note::

   To detach a network from a server, you must use the Cloud Networks
   virtual interface extension to delete the virtual interface for the
   network from the server. For more information, see the `Next
   Generation Cloud Servers Developer
   Guide <http://docs.rackspace.com/servers/api/v2/cs-devguide/content/section_virt_ext.html>`__.

-  Manage *subnets*.

-  Manage *ports*.

-  Manage security groups and security group rules.

What are the Cloud Networks service limits?
-------------------------------------------

The following limits exist within the Cloud Networks service:

**Cloud networks per region:**
    10

**Subnets per network:**
    2 (one IPv4 and one IPv6)

**DNS nameservers per subnet:**
    2

**Host Routes per subnet:**
    3

**Allocation pools per subnet:**
    5

**Number of fixed IP addresses per port:**
    4

**Ports (hosts) per network:**
    250

**Security groups per port:**
    5

**Security group rules per security group:**
    20

**Security group rules per user:**
    100


