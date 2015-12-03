=============================================================
Use allocation pools to control dynamic IP address allocation
=============================================================

Allocation pools are a property of the subnets resource and can be used
to control dynamic address allocation within a CIDR. An allocation pool
is a subset of the CIDR. Any addresses that are not part of the
allocation pool are not dynamically assigned to ports or Cloud Server
instances. However, addresses that are not part of the allocation pool,
but that are within the CIDR, can still be assigned statically when a
port is created by using the fixed\_ips attribute of the ports resource.
The port ID can then be passed to the server at boot time as shown in
the example.

The following flow chart shows the steps for using allocation pools to
control dynamic IP address allocation. Detailed steps are provided in
this section.

**Figure: Steps to use allocation pools to control dynamic IP
address allocation**

|Steps to use allocation pools to control dynamic IP address allocation|

The sections are also organized by example type. To simplify your path
through this chapter, decide whether you prefer neutron-client or cURL
examples.

**Next step:**Choose one of the following methods:

-  `Use allocation pools to control dynamic IP address allocation with
   neutron client <uap_neutron_neutron.html>`__

-  `Use allocation pools to control dynamic IP address allocation with
   cURL <uap_neutron_curl.html>`__

Use allocation pools to control dynamic IP address allocation with neutron client
---------------------------------------------------------------------------------

These sections walk you through using allocation pools to control
dynamic IP address allocation by using the neutron client.

**Start here:** `Create a network (neutron
client) <neutron_create_network_uap_neutron.html>`__

Create a network (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After you create a network, copy its network ID. You use this ID to
create a subnet and boot the server.

#. Issue the following neutron client command, substituting your own
   values for the ones shown.

   **Positional argument:**

   -  The network name. In this example, the network name is
      ``Rackernet``.

   .. code::  

      $ neutron net-create <Rackernet>

   **Output:**

   The command returns the response, as shown in the following output:

   .. code::  

       +----------------+--------------------------------------+
       | Field          | Value                                |
       +----------------+--------------------------------------+
       | admin_state_up | True                                 |
       | id             | a8fde776-e80f-47bb-a050-0c057d89afc3 |
       | name           | Rackernet                            |
       | shared         | False                                |
       | status         | ACTIVE                               |
       | subnets        |                                      |
       | tenant_id      | 5831008                              |
       +----------------+--------------------------------------+

#. Copy the ``id`` value from the output. You will use this value when
   you create a subnet, provision your server, or perform other related
   activities. In this example, the ID is
   ``a8fde776-e80f-47bb-a050-0c057d89afc3``, but use the ID from your
   response.

**Next step:** `Create a subnet with allocation pools (neutron
client) <neutron_create_subnet_uap_neutron.html>`__

Create a subnet with allocation pools (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create a subnet with allocation pools, you specify a network, an IP
address and version, allocation pools, and host routes for your subnet.

**Procedure 9.2. To create a subnet with allocation pools**

#. Issue the following neutron client command, substituting your own
   values for the ones shown.

   **Positional argument:**

   -  **ip-version** The version of the subnet IP. In this example, the
      version is ``4``.

   -  **allocation-pool** The start and end addresses for one or more
      allocation pools. In this example, there are two pools
      ``start=192.168.5.3,end=192.168.5.100`` and
      ``start=192.168.5.103,end=192.168.5.254``.

   -  **host-route** A list of host route dictionaries for the subnet.
      In this example, we used
      ``destination=1.1.1.0/24,nexthop=192.168.5.254``.

   -  **tenant-id** The tenant ID. In this example, we used the tenant
      ID ``5831008``.

   -  The network ID or name. In this example, we used the network ID
      ``a8fde776-e80f-47bb-a050-0c057d89afc3``.

   -  The network CIDR. In this example, the CIDR is ``192.168.5.0/24``.

   .. code::  

      $ neutron subnet-create \
           --ip-version <4> \
           --allocation-pool start=<192.168.5.3>,end=<192.168.5.100> \
           --allocation-pool start=<192.168.5.103>,end=<192.168.5.254> \
           --host-route destination=<1.1.1.0/24>,nexthop=<192.168.5.254> \
           --tenant-id <5831008> \
           <a8fde776-e80f-47bb-a050-0c057d89afc3> <192.168.5.0/24>

   **Output:**

   The command returns the response, as shown in the following output:

   .. code::  

       +------------------+-----------------------------------------------------------+
       | Field            | Value                                                     |
       +------------------+-----------------------------------------------------------+
       | allocation_pools | {"start": "192.168.5.3", "end": "192.168.5.100"}          |
       |                  | {"start": "192.168.5.103", "end": "192.168.5.254"}        |
       | cidr             | 192.168.5.0/24                                            |
       | dns_nameservers  |                                                           |
       | enable_dhcp      |                                                           |
       | gateway_ip       |                                                           |
       | host_routes      | {"destination": "1.1.1.0/24", "nexthop": "192.168.5.254"} |
       | id               | 98c1af30-05c9-4502-8b1f-9bffde843cba                      |
       | ip_version       | 4                                                         |
       | name             |                                                           |
       | network_id       | a8fde776-e80f-47bb-a050-0c057d89afc3                      |
       | tenant_id        | 5831008                                                   |
       +------------------+-----------------------------------------------------------+

#. Copy the ID value from the output for future reference. In this
   example, the ID is ``98c1af30-05c9-4502-8b1f-9bffde843cba``, but use
   the ID from your response.

**Next step:** `Boot server (nova
client) <neutron_boot_server_uap_nova.html>`__

Boot server (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to boot server with the nova client,
using the network ID of the network you created in the first step of
this procedure. You need the following information:

-  The name of the new server. Use a name of your choice.

-  **image** The image ID.

-  **flavor** The flavor ID.

-  **nic**The network ID of the network, which is
   ``net-id=a8fde776-e80f-47bb-a050-0c057d89afc3``.

**Procedure: To provision a server with a network**

#. Issue the following nova client command:

   .. code::  

       $ nova boot <ata> --image <ffa476b1-9b14-46bd-99a8-862d1d94eb7a> --flavor <2> --nic net-id=<a8fde776-e80f-47bb-a050-0c057d89afc3>

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
       | adminPass               | ugZmn5Le6S8y                                                    |
       | created                 | 2014-02-06T20:05:12Z                                            |
       | flavor                  | m1.mid (2)                                                      |
       | hostId                  |                                                                 |
       | id                      | a1061a57-0136-4c29-aac1-8b1a646a3001                            |
       | image                   | cirros-0.3.0-x86_64-disk (82e72de5-6366-4217-8c87-a570a9b17e73) |
       | metadata                | {}                                                              |
       | name                    | ata                                                             |
       | progress                | 0                                                               |
       | security_groups         | default                                                         |
       | status                  | BUILD                                                           |
       | tenant_id               | 5831008                                                         |
       | updated                 | 2014-02-06T20:05:12Z                                            |
       | user_id                 | 28be72f8fc5b45589c93f55274e459ce                                |
       +-------------------------+-----------------------------------------------------------------+

#. Copy the ``id`` value from the output for future reference. In this
   example, the ID is ``a1061a57-0136-4c29-aac1-8b1a646a3001``, but use
   the ID from your response.

**Next step:** `Verify IP on server port (nova
client) <neutron_verify_ip_nova.html>`__

Verify IP on server port (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to verify the IP address on the server
port. In this case, the IP address should be ``192.168.5.3`` from the
start of the allocation pool.

**Procedure 9.4. To verify the port on the server**

-  Issue the following nova command:

   .. code::  

       $ nova list <a1061a57-0136-4c29-aac1-8b1a646a3001>

   **Positional arguments:**

   -  The server ID. In this example, the ID is
      ``a1061a57-0136-4c29-aac1-8b1a646a3001``.

   **Output:**

   The command returns the response, as shown in the following output:

   .. code::  

       +-------------------------+------------------------------------------------------------------------------------+
       | Property                | Value                                                                              |
       +-------------------------+------------------------------------------------------------------------------------+
       | OS-DCF:diskConfig       | AUTO                                                                               |
       | OS-EXT-STS:power_state  | 1                                                                                  |
       | OS-EXT-STS:task_state   | None                                                                               |
       | OS-EXT-STS:vm_state     | active                                                                             |
       | accessIPv4              | 10.23.233.124                                                                      |
       | accessIPv6              | 2001:4801:787f:205:bccb:feff:fe00:189                                              |
       | created                 | 2012-08-16T16:28:18Z                                                               |
       | flavor                  | 8GB Standard Instance (6)                                                          |
       | hostId                  | 0488142a8f859cb4020234cc235f8cd8a22bee126726025d70c0b9ba                           |
       | id                      | a1061a57-0136-4c29-aac1-8b1a646a3001                                               |
       | image                   | cirros-0.3.0-x86_64-disk (82e72de5-6366-4217-8c87-a570a9b17e73)                    |
       | metadata                | {}                                                                                 |
       | name                    | ata                                                                                |
       | Rackernet               | 192.168.5.3                                                                        |
       | private network         | 10.181.192.114                                                                     |
       | progress                | 100                                                                                |
       | public network          | 2001:4801:787f:205:bccb:feff:fe00:189, 10.23.233.124                               |
       | status                  | ACTIVE                                                                             |
       | tenant_id               | 5831008                                                                            |
       | updated                 | 2014-02-06T20:05:12Z                                                               |
       | user_id                 | 28be72f8fc5b45589c93f55274e459ce                                                   |
       +-------------------------+------------------------------------------------------------------------------------+

**Next step:** `Create a port (neutron
client) <neutron_create_port_uap_neutron.html>`__

Create a port outside the allocation pool (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before you can attach port and network to a server, you need to create
the port.

The following step shows you create a port outside of the allocation
pool using cURL. Do this by using the fixed\_ips attribute and assigning
the new IP address to the port. In this case, the allocation pool IP
addresses range from ``192.168.5.3`` to ``192.168.5.100`` and the IP
address for the new port is ``192.168.5.1``.

-  Issue the following neutron command.

   **Positional arguments:**

   -  **name** The port name. In this example, the port name is
      ``Rackerport``.

   -  **fixed-ip** The subnet id and IP address. In this example, the
      fixed IP is
      ``subnet_id=98c1af30-05c9-4502-8b1f-9bffde843cba,ip_address=192.168.5.1``.

   -  The network ID or name. In this example, the ID is
      ``a8fde776-e80f-47bb-a050-0c057d89afc3``.

   .. code::  

       $ neutron port-create \
           --name <Rackerport> \
           --fixed-ip subnet_id=<98c1af30-05c9-4502-8b1f-9bffde843cba>,ip_address=<192.168.5.1> \
           <a8fde776-e80f-47bb-a050-0c057d89afc3>

   **Output:**

   The command returns the response, as shown in the following output:

   .. code::  

       +-----------------+------------------------------------------------------------------------------------+
       | Field           | Value                                                                              |
       +-----------------+------------------------------------------------------------------------------------+
       | admin_state_up  | True                                                                               |
       | device_id       |                                                                                    |
       | device_owner    |                                                                                    |
       | fixed_ips       | {"subnet_id": "98c1af30-05c9-4502-8b1f-9bffde843cba", "ip_address": "192.168.5.1"} |
       | id              | e84fb78e-fc92-45aa-90b3-8786c82b5112                                               |
       | mac_address     | BE:CB:FE:00:01:69                                                                  |
       | name            | Rackerport                                                                         |
       | network_id      | a8fde776-e80f-47bb-a050-0c057d89afc3                                               |
       | security_groups |                                                                                    |
       | status          | ACTIVE                                                                             |
       | tenant_id       | 5831008                                                                            |
       +-----------------+------------------------------------------------------------------------------------+

**Next topic:** `Configure host routes <configure_host_routes.html>`__
