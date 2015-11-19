
Provision a server with a port and an isolated network (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create your new server and attach a port with an isolated network,
you need the following information:

-  The name of the new server. Use a name of your choice.

-  The image ID. For instructions on how list images, see `List
   Images <http://docs.rackspace.com/servers/api/v2/cs-gettingstarted/content/list_images.html>`__.

-  The flavor ID. For instructions on how to list flavors, see `List
   Flavors <http://docs.rackspace.com/servers/api/v2/cs-gettingstarted/content/list_flavors.html>`__.

-  The port ID of your isolated network.

      style="margin-left: 0.5in; margin-right: 0.5in;">

.. note::
   Instead of the port ID, you can also pass the network ID of the
   isolated network.

-  The network ID of PublicNet, which is
   ``00000000-0000-0000-0000-000000000000``, and ServiceNet, which is
   ``11111111-1111-1111-1111-111111111111``.


-  Issue the following nova client command:

   .. code::  

       $ nova boot <ServerAmp> --image <82e72de5-6366-4217-8c87-a570a9b17e73> --nic port-id=<79bf47e2-5107-4d93-b9c3-b78ddbc94c93> --flavor <1>

   The operation returns information about the new server, as shown in
   the following example:

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

**Next step:** `Show port details (neutron
client) <neutron_show_port_neutron.html>`__

Show port details (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following procedure shows you how to view details for a port.

-  Issue the following neutron client command.

   **Positional argument:**

   -  The ID of the port for which you want to show information. In this
      example, the ID is ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``

   .. code::  

      $ neutron port-show <79bf47e2-5107-4d93-b9c3-b78ddbc94c93>

   **Output:**

   The command returns the result as shown in the following output:

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
                           

**Next step:** `List servers (nova
client) <neutron_list_server_nova.html>`__

List servers (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~

After you provision your server, list servers to make sure the server
and attached network are listed.

**Procedure 6.6. To list servers with the nova client**

#. Issue the following command:

   .. code::  

       $ nova list

   For each server, the command returns the server ID, name, status, and
   addresses for any attached networks, as shown in the following
   output:

   .. code::  

       +--------------------------------------+----------------+--------+---------------------------------------------------------------------------------------+
       | ID                                   | Name           | Status | Networks                                                                              |
       +--------------------------------------+----------------+--------+---------------------------------------------------------------------------------------+
       | fbcebd8c-5b4f-4087-a778-f5a6ffc4530f | ServerAmp      | ACTIVE | public=2001:4800:780e:0510:d87b:9cbc:ff04:3e81, 120.1.2.0; private=10.180.13.75       |
       +--------------------------------------+----------------+--------+---------------------------------------------------------------------------------------+

   The networks include any isolated networks that you have created and
   Rackspace public and private networks.

#. Servers are listed by server ID, and the addresses for any attached
   networks are displayed. Copy the server ID for your server in case
   you need to update or delete your server.

   Use the public IP address when you log into your server.

**Next step:** `Delete your cloud network <delete_net.html>`__