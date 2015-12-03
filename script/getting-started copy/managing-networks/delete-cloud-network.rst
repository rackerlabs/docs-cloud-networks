.. _delete-cloud-network:

=========================
Delete your cloud network
=========================

When you no longer need your cloud network, delete it.

.. note::
   You cannot delete a network while its port is still attached to a
   server. Also, you cannot delete the PublicNet and ServiceNet networks .

The following flow chart shows the steps for deleting an isolated
network. Detailed steps are provided in this section.

**Figure: Steps to delete a network**

|Steps to delete a network|

The sections are also organized by example type. To simplify your path
through this chapter, decide whether you prefer neutron-client or cURL
examples.

**Next step:** Choose one of the following methods:

-  `Delete your network with neutron client <dn_neutron_neutron.html>`__

-  `Delete your network with cURL <dn_neutron_curl.html>`__

Delete your network with neutron client
---------------------------------------

These sections walk you through deleting your subnet and network by
using the neutron client.

**Start here:** `Delete a subnet (neutron
client) <neutron_delete_subnet_neutron.html>`__

Delete a subnet (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To delete a subnet, specify the subnet ID.

**Procedure: To delete a specified subnet**

-  **Delete the subnet**

   Issue the following neutron client command.

   **Positional argument:**

   -  The subnet ID of the subnet that you want to delete. In this
      example, the subnet ID is
      ``23e3059e-4f39-4f7f-8cf2-c326e5de6c37``.

   .. code::

                               $ neutron subnet-delete <23e3059e-4f39-4f7f-8cf2-c326e5de6c37>

   **Output:**

   Successful deletion returns an Accepted (204) response code.

**Next step:** `Delete a network (neutron
client) <neutron_delete_network_neutron.html>`__

Delete a network (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To delete a network, specify the network ID.

-  **Delete the network**

   Issue the following neutron client command.

   **Positional argument:**

   -  The network ID of the network that you want to delete. In this
      example, the network ID is
      ``29f52c7e-6efd-4335-a14a-db77d32a2555``.

   .. code::  

      $ neutron net-delete <29f52c7e-6efd-4335-a14a-db77d32a2555>

   **Output:**

   Successful deletion returns an Accepted (204) response code.

**Next topic:** `Use allocation pools to control dynamic IP address
allocation <use_alloc_pools.html>`__

.. toctree::
   :maxdepth: 2

   Delete your network with neutron client <ch07.xhtml#dn_neutron_neutron>`__
   Delete a subnet (neutron client) <ch07.xhtml#neutron_delete_subnet_neutron>`__
   Delete a network (neutron
client) <ch07.xhtml#neutron_delete_network_neutron>`__
   Delete your network with cURL <ch07s02.xhtml>`__
   Delete a subnet (cURL) <ch07s02.xhtml#neutron_delete_subnet_curl>`__
   Delete a network (cURL) <ch07s02.xhtml#neutron_delete_network_curl>`__

