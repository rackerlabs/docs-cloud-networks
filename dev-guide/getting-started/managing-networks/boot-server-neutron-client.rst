.. _boot-server-with-neutron-client:

Boot server with neutron client
-------------------------------

These sections walk you through creating a port for your network,
listing the ports and showing the port details by using the neutron API.
They also show the steps for provisioning a server with an attached port
and for listing servers by using the nova-network API.

List networks (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following steps detail how to list networks. You need to identify
the right network from this listing to boot your server.

#. Issue the following neutron command:

   .. code::  

       $ neutron net-list

   **Output:**

   The command returns the response, as shown in the following output:

   .. code::  

       +--------------------------------------+-------+---------------------------------------------------+
       | id                                   | name  | subnets                                           |
       +--------------------------------------+-------+---------------------------------------------------+
       | 03f240c5-6fb8-47a0-860a-c7ba83be519f | mynet | 1d18d76b-a04a-4147-a04c-151630ec80d0 fc01::7      |
       +--------------------------------------+-------+---------------------------------------------------+

#. Copy the network ID value from the output. You will use this value
   when you provision your server. In this example, the network ID is
   ``03f240c5-6fb8-47a0-860a-c7ba83be519f``.

**Next step:** `Create a port (neutron
client) <neutron_create_port_neutron.html>`__

Create a port (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before you can attach port and network to a server, you need to create
the port.

To create a network, you specify a name for your port and the network
name. After you create a port, copy its port ID. Use this ID to attach
it to a new server.

#. Issue the following neutron command.

   -  The port name. In this example, the port name is ``port1``.

   -  The network ID or name. In this example, the ID is
      ``03f240c5-6fb8-47a0-860a-c7ba83be519f``.

   .. code::  

       $ neutron port-create --name <port1> <03f240c5-6fb8-47a0-860a-c7ba83be519f>

   **Positional arguments:**

   **Output:**

   The command returns the response, as shown in the following output:

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

**Next step:** `List ports (neutron
client) <neutron_list_ports_neutron.html>`__

List ports (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

After you create a port, you may want to list ports to confirm creation.

-  Issue the following neutron client command:

   .. code::  

       $ neutron port-list 

   **Output:**

   For each port, the command returns the result as shown in the
   following output

   .. code::  

       +--------------------------------------+---------+-------------------+----------------------------------------------------------------------------------+
       | id                                   | name    | mac_address       | fixed_ips                                                                        |
       +--------------------------------------+---------+-------------------+----------------------------------------------------------------------------------+
       | 79bf47e2-5107-4d93-b9c3-b78ddbc94c93 | port1   | AA:BB:CC:00:01:4A | {"subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0", "ip_address": "fc01::7"}   |
       +--------------------------------------+---------+-------------------+----------------------------------------------------------------------------------+


**Next step:** `Provision a server by attaching a port with an isolated
network (nova client) <neutron_create_server_nova.html>`__
