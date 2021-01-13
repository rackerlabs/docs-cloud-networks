.. _booting-server-with-neutron:

Booting server with neutron client
----------------------------------

These sections walk you through creating a port for your network, listing the
ports and showing the port details by using the neutron API. They also show the
steps for provisioning a server with an attached port and for listing servers
by using the nova-network API.

.. _bns-listing-networks-neutron:

Listing networks (neutron client)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps detail how to list networks. You need to identify the right
network from this listing to boot your server.

#. **List networks with neutron request**

   .. code::

       $ neutron net-list

   **List networks with neutron response**

   .. code::

       +--------------------------------------+-------+---------------------------------------------------+
       | id                                   | name  | subnets                                           |
       +--------------------------------------+-------+---------------------------------------------------+
       | 03f240c5-6fb8-47a0-860a-c7ba83be519f | mynet | 1d18d76b-a04a-4147-a04c-151630ec80d0 fc01::7      |
       +--------------------------------------+-------+---------------------------------------------------+

#. Copy the network ID value from the output. You will use this value when you
   provision your server. In this example, the network ID is
   ``03f240c5-6fb8-47a0-860a-c7ba83be519f``.


.. _bns-creating-port-neutron:

Creating a port (neutron client)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Before you can attach port and network to a server, you need to create the
port.

To create a network, you specify a name for your port and the network name.
After you create a port, copy its port ID. Use this ID to attach it to a new
server.

#. Issue the following neutron command, substituting your own values for the
   ones shown.

   **Create port with neutron request**

   .. code::

       $ neutron port-create --name port1 03f240c5-6fb8-47a0-860a-c7ba83be519f

   **Positional arguments:**

   -  ``name``. The port name. In this example, the port name is ``port1``.

   -  The network ID or name. In this example, the ID is ``03f240c5-6fb8-47a0-860a-c7ba83be519f``.

   **Create port with neutron response**

   .. code::

       +-----------------------+----------------------------------------------------------------------------------+
       | Field                 | Value                                                                            |
       +-----------------------+----------------------------------------------------------------------------------+
       | admin_state_up        | True                                                                             |
       | allowed_address_pairs |                                                                                  |
       | device_id             |                                                                                  |
       | device_owner          |                                                                                  |
       | fixed_ips             | {"subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0", "ip_address": "fc01::7"}   |
       | id                    | 79bf47e2-5107-4d93-b9c3-b78ddbc94c93                                             |
       | mac_address           | AA:BB:CC:00:01:4A                                                                |
       | name                  | port1                                                                            |
       | network_id            | 03f240c5-6fb8-47a0-860a-c7ba83be519f                                             |
       | security_groups       |                                                                                  |
       | status                | ACTIVE                                                                           |
       | tenant_id             | 53501b3c25d34f8ea293c03298caed60                                                 |
       +-----------------------+----------------------------------------------------------------------------------+

#. Copy the id value from the output. You will use this value when you
   provision your server. In this example, the port id is
   ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``.


.. _bns-listing-ports-neutron:

Listing ports (neutron client)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After you create a port, you may want to list ports to confirm creation.

**List ports with neutron request**

.. code::

   $ neutron port-list

**List ports with neutron response**

.. code::

   +--------------------------------------+---------+-------------------+----------------------------------------------------------------------------------+
   | id                                   | name    | mac_address       | fixed_ips                                                                        |
   +--------------------------------------+---------+-------------------+----------------------------------------------------------------------------------+
   | 79bf47e2-5107-4d93-b9c3-b78ddbc94c93 | port1   | AA:BB:CC:00:01:4A | {"subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0", "ip_address": "fc01::7"}   |
   +--------------------------------------+---------+-------------------+----------------------------------------------------------------------------------+


.. _bns-booting-server-nova:

Provisioning a server with a port and an isolated network (nova client)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Create your new server and attach a port with an isolated network.

.. note::

	To create your new server and attach a port with an isolated network, you
	need the following information:

   -  The name of the new server. Use a name of your choice.
   -  The image ID.
   -  The flavor ID.
   -  The port ID or network ID of your isolated network.
   -  The network ID of PublicNet, which is
      ``00000000-0000-0000-0000-000000000000``, and ServiceNet, which is
      ``11111111-1111-1111-1111-111111111111``.

Issue the following nova client command, substituting your own values for the
ones shown.

**Boot server with nova request**

.. code::

   $ nova boot ServerAmp --image 82e72de5-6366-4217-8c87-a570a9b17e73 \
     --nic port-id=79bf47e2-5107-4d93-b9c3-b78ddbc94c93 --flavor 1

**Positional arguments:**

-  The server name. In this example, the name is ``ServerAmp``.
-  ``image``.  The image ID. In this example, the ID is
   ``82e72de5-6366-4217-8c87-a570a9b17e73``.
-  ``nic port-id``. The port ID. In this example, the ID is
   ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``.
- ``flavor``. The flavor id. In this example, the ID is ``1``.

**Boot server with nova response**

.. code::

   +-------------------------+-----------------------------------------------------------------+
   | Property                | Value                                                           |
   +-------------------------+-----------------------------------------------------------------+
   | OS-DCF:diskConfig       | AUTO                                                            |
   | OS-EXT-STS:power_state  | 0                                                               |
   | OS-EXT-STS:task_state   | scheduling                                                      |
   | OS-EXT-STS:vm_state     | building                                                        |
   | accessIPv4              |                                                                 |
   | accessIPv6              |                                                                 |
   | adminPass               | K3kviaHwhKqS                                                    |
   | created                 | 2014-02-06T20:05:12Z                                            |
   | flavor                  | m1.tiny (1)                                                     |
   | hostId                  |                                                                 |
   | id                      | fbcebd8c-5b4f-4087-a778-f5a6ffc4530f                            |
   | image                   | cirros-0.3.0-x86_64-disk (82e72de5-6366-4217-8c87-a570a9b17e73) |
   | metadata                | {}                                                              |
   | name                    | ServerAmp                                                       |
   | progress                | 0                                                               |
   | security_groups         | default                                                         |
   | status                  | BUILD                                                           |
   | tenant_id               | 53501b3c25d34f8ea293c03298caed60                                |
   | updated                 | 2014-02-06T20:05:12Z                                            |
   | user_id                 | 28be72f8fc5b45589c93f55274e459ce                                |
   +-------------------------+-----------------------------------------------------------------+


.. _bns-showing-port-neutron:

Showing port details (neutron client)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following procedure shows you how to view details for a port.

**Show port with neutron request**

.. code::

   $ neutron port-show 79bf47e2-5107-4d93-b9c3-b78ddbc94c93

**Positional argument:**

-  The ID of the port for which you want to show information. In this example,
   the ID is ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``

**Show port with neutron response**

.. code::

   +-----------------------+----------------------------------------------------------------------------------+
   | Field                 | Value                                                                            |
   +-----------------------+----------------------------------------------------------------------------------+
   | admin_state_up        | True                                                                             |
   | allowed_address_pairs |                                                                                  |
   | device_id             | 537805b0-7a04-4bbc-8040-812527b024bc                                             |
   | device_owner          | compute:None                                                                     |
   | extra_dhcp_opts       |                                                                                  |
   | fixed_ips             | {"subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0", "ip_address": "fc01::7"}   |
   | id                    | 79bf47e2-5107-4d93-b9c3-b78ddbc94c93                                             |
   | mac_address           | AA:BB:CC:00:01:4A                                                                |
   | name                  | port1                                                                            |
   | network_id            | 03f240c5-6fb8-47a0-860a-c7ba83be519f                                             |
   | security_groups       |                                                                                  |
   | status                | ACTIVE                                                                           |
   | tenant_id             | 53501b3c25d34f8ea293c03298caed60                                                 |
   +-----------------------+----------------------------------------------------------------------------------+

.. _bns-listing-servers-nova:

Listing servers (nova client)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After you provision your server, list servers to make sure the server and
attached network are listed.


#. **List servers with nova request**

   .. code::

       $ nova list

   For each server, the operation returns the server ID, name, status, and
   addresses for any attached networks, as shown in the following output.

   **List servers with nova response**

   .. code::

       +--------------------------------------+----------------+--------+---------------------------------------------------------------------------------------+
       | ID                                   | Name           | Status | Networks                                                                              |
       +--------------------------------------+----------------+--------+---------------------------------------------------------------------------------------+
       | fbcebd8c-5b4f-4087-a778-f5a6ffc4530f | ServerAmp      | ACTIVE | public=2001:4800:780e:0510:d87b:9cbc:ff04:3e81, 120.1.2.0; private=10.180.13.75       |
       +--------------------------------------+----------------+--------+---------------------------------------------------------------------------------------+

   The networks include any isolated networks that you have created and
   Rackspace public and private networks.

#. Servers are listed by server ID, and the addresses for any attached networks
   are displayed. Copy the server ID for your server in case you need to update
   or delete your server.

   Use the public IP address when you log into your server.

**Next topic:** :ref:`Deleting your cloud network<removing-network>`