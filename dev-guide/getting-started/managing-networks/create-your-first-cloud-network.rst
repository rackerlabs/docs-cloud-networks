.. _create-your-first-cloud-network:

===============================
Create your first cloud network
===============================

The following flow chart shows the steps for creating a network.
Detailed steps are provided in this section.

**Figure: Steps to create a network**

|Steps to create a network|


The sections are also organized by example type. To simplify your path
through this chapter, decide whether you prefer neutron-client or cURL
examples.

.. note::
   **Network Limitations:**

   -  The isolated network must exist in the same region as the cloud
      server.

   -  You can create up to 10 isolated networks with up to 250 servers
      attached to each one.

**Next step:** Choose one of the following methods:

-  `Create network with neutron client <cfn_neutron_neutron.html>`__

-  `Create network with cURL <cfn_neutron_curl.html>`__

Create network with neutron client
----------------------------------

These sections walk you through creating your network and subnet and
then listing them by using the neutron client.

**Start here:** \ `Create a network (neutron client) <neutron_create_network_neutron.html>`__

Create a network (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create a network, you specify a name for your network. After you
create a network, copy its network ID. You use this ID to create a
subnet and attach it to a port.

#. Issue the following neutron command.

   **Positional arguments:**

   -  The network name. In this example, the name is ``amp``.

   .. code::  

      $ neutron net-create <amp>

   **Output:**

   The command returns the response, as shown in the following output:

   .. code::  

       +----------------+--------------------------------------+
       | Field          | Value                                |
       +----------------+--------------------------------------+
       | admin_state_up | True                                 |
       | id             | 29f52c7e-6efd-4335-a14a-db77d32a2555 |
       | name           | amp                                  |
       | shared         | False                                |
       | status         | ACTIVE                               |
       | subnets        |                                      |
       | tenant_id      | 53501b3c25d34f8ea293c03298caed60     |
       +----------------+--------------------------------------+

#. Copy the ID value from the output. You will use this value when you
   create a subnet, provision your server, or perform other related
   activities. In this example, the ID is
   ``29f52c7e-6efd-4335-a14a-db77d32a2555``, but use the *``id``* from
   your response.

**Next step:** \ `Create a subnet (neutron
client) <neutron_create_subnet_neutron.html>`__

Create a subnet (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create a subnet, you specify a network, an IP address, and a name for
your subnet. After you create a subnet, copy its subnet ID for future
reference.

**Procedure: To create a subnet**

#. Issue the following neutron command.

   -  **name** The subnet name. In this example, the name is ``Subamp``.

   -  **ip-version** The version of the subnet IP. In this example, the
      version is ``4``.

   -  The network ID or name. In this example, we used the network ID
      ``29f52c7e-6efd-4335-a14a-db77d32a2555``.

   -  The network CIDR. In this example, the CIDR is ``120.1.2.0/24``.

   .. code::  

      $ neutron subnet-create --name <Subamp> --ip-version <4> <29f52c7e-6efd-4335-a14a-db77d32a2555> <120.1.2.0/24>

   **Positional arguments:**

   **Output:**

   The command returns the response, as shown in the following output:

   .. code::  

       +------------------+----------------------------------------------+
       | Field            | Value                                        |
       +------------------+----------------------------------------------+
       | allocation_pools | {"start": "120.1.2.1", "end": "120.1.2.254"} |
       | cidr             | 120.1.2.0/24                                 |
       | dns_nameservers  |                                              |
       | enable_dhcp      |                                              |
       | gateway_ip       |                                              |
       | host_routes      |                                              |
       | id               | 23e3059e-4f39-4f7f-8cf2-c326e5de6c37         |
       | ip_version       | 4                                            |
       | name             | Subamp                                       |
       | network_id       | 29f52c7e-6efd-4335-a14a-db77d32a2555         |
       | tenant_id        | 53501b3c25d34f8ea293c03298caed60             |
       +------------------+----------------------------------------------+

#. Copy the id value from the output for future reference. In this
   example, the id is ``23e3059e-4f39-4f7f-8cf2-c326e5de6c37``, but use
   the *``id``* from your response.

**Next step:** `List networks (neutron
client) <neutron_list_networks_neutron.html>`__

List networks (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Issue the following neutron client command:

   .. code::  

      $ neutron net-list 

   **Output:**

   For each network, the command returns the result as shown in the
   following output

   .. code::  

       +--------------------------------------+------+---------------------------------------------------+
       | id                                   | name | subnets                                           |
       +--------------------------------------+------+---------------------------------------------------+
       | 29f52c7e-6efd-4335-a14a-db77d32a2555 | amp  | 23e3059e-4f39-4f7f-8cf2-c326e5de6c37 120.1.2.0/24 |
       +--------------------------------------+------+---------------------------------------------------+

**Next step:** `List subnets (neutron
client) <neutron_list_subnets_neutron.html>`__

List subnets (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to list subnets using the neutron
client.

-  Issue the following neutron client command:

   .. code::

      $ neutron subnet-list 

   **Output:**

   For each subnet, the command returns the result as shown in the
   following output

   .. code::

       +--------------------------------------+--------+--------------+----------------------------------------------+
       | id                                   | name   | cidr         | allocation_pools                             |
       +--------------------------------------+--------+--------------+----------------------------------------------+
       | 23e3059e-4f39-4f7f-8cf2-c326e5de6c37 | Subamp | 120.1.2.0/24 | {"start": "120.1.2.1", "end": "120.1.2.254"} |
       +--------------------------------------+--------+--------------+----------------------------------------------+

**Next step:** `Boot a new server with your cloud
network <boot_new_server.html>`__

