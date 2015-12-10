.. _provision-port-ips-with-neutron:

Provision a port with additional IP and dual-stack IPs with neutron
-------------------------------------------------------------------

These sections walk you through provisioning an additional IP and dual-stack (v4 and v6) 
IP addresses on an isolated network port by using the neutron client.

.. _ppi-show-port-neutron:

Show a port with an IPv6 address (neutron)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, look at your port with an IPv6 IP address. In this example, note the fixed_ips 
ip_address of ``fc01::7``, which is an IPv6 address in hexadecimal format.

#. **List ports with neutron request**

   .. code::  

      $ neutron port-list

   **List ports with neutron response**

   .. code::  

       +--------------------------------------+-------+-------------------+--------------------------------------------------------------------------------+
       | id                                   | name  | mac_address       | fixed_ips                                                                      |
       +--------------------------------------+-------+-------------------+--------------------------------------------------------------------------------+
       | 79bf47e2-5107-4d93-b9c3-b78ddbc94c93 | port1 | AA:BB:CC:00:01:4A | {"subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0", "ip_address": "fc01::7"} |
       +--------------------------------------+-------+-------------------+--------------------------------------------------------------------------------+

#. Note the id value for future reference. In this example, the ID is
   ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``), but use the ID from your response.

.. _ppi-get-cidr-neutron:

Get the IPv4 CIDR for the network (neutron)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now, note the IPv4 CIDR on the same network as the IPv6 CIDR. You should have already 
created this subnet on the same network. If you have not done so, create an IPv4 subnet 
(**POST /subnets**) on the same network. Because this example assumes that the subnet has 
already been created, run the following command and note the CIDR to identify the IPv4 address.

#. **List subnets with neutron request**
 
   .. code::  

      $ neutron subnet-list

   **List subnets with neutron response**

   .. code::  

       +--------------------------------------+------+----------------+----------------------------------------------------+
       | id                                   | name | cidr           | allocation_pools                                   |
       +--------------------------------------+------+----------------+----------------------------------------------------+
       | 03f240c5-6fb8-47a0-860a-c7ba83be519f |      | 192.168.7.0/24 | {"start": "192.168.7.1", "end": "192.168.7.254"}   |
       +--------------------------------------+------+----------------+----------------------------------------------------+

                          

#. Note the network_id and CIDR values for future reference. In this example, the 
   network_id is ``03f240c5-6fb8-47a0-860a-c7ba83be519f`` and the CIDR is 
   ``192.168.7.0/24``, but use the values from your response.

.. _ppi-add-ip-to-port-neutron:

Add an IPv4 address on the same port (neutron)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To add an IPv4 address on the same port, update the IPv6 port with the existing IPv6 IP 
address, the subnet's IPv4 ID, and the IP address from the subnet's IPv4 CIDR. In this 
example, the IPv4 IP address is ``192.168.7.250`` and the subnet_id is 
``321caa1c-2105-4186-b53b-366fa623c09a``.

Issue the following neutron client command, using the port ID from the preceding step.

**Update port with neutron request**

.. code::  

  $ neutron port-update \
      --fixed-ip subnet_id=1d18d76b-a04a-4147-a04c-151630ec80d0,ip_address=fc01::7 \
      --fixed-ip subnet_id=03f240c5-6fb8-47a0-860a-c7ba83be519f,ip_address=192.168.7.250 \
      79bf47e2-5107-4d93-b9c3-b78ddbc94c93
           
**Positional arguments:**

-  ``fixed-ip`` The subnet IDs and IP addresses. In this example, there are two:
   ``subnet_id=1d18d76b-a04a-4147-a04c-151630ec80d0,ip_address=fc01::7`` and
   ``subnet_id=03f240c5-6fb8-47a0-860a-c7ba83be519f,ip_address=192.168.7.250``.
-  The port ID. In this example, we used the port ID ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``.

**Update port with neutron response**

.. code::  

   +-----------------------+----------------------------------------------------------------------------------------+
   | Field                 | Value                                                                                  |
   +-----------------------+----------------------------------------------------------------------------------------+
   | admin_state_up        | True                                                                                   |
   | allowed_address_pairs |                                                                                        |
   | device_id             |                                                                                        |
   | device_owner          |                                                                                        |
   | fixed_ips             | {"subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0", "ip_address": "fc01::7"},        |
   |                       | {"subnet_id": "321caa1c-2105-4186-b53b-366fa623c09a", "ip_address": "192.168.7.250"}   |
   | id                    | 79bf47e2-5107-4d93-b9c3-b78ddbc94c93                                                   |
   | mac_address           | AA:BB:CC:00:01:4A                                                                      |
   | name                  | port1                                                                                  |
   | network_id            | 03f240c5-6fb8-47a0-860a-c7ba83be519f                                                   |
   | security_groups       |                                                                                        |
   | status                | ACTIVE                                                                                 |
   | tenant_id             | 53501b3c25d34f8ea293c03298caed60                                                       |
   +-----------------------+----------------------------------------------------------------------------------------+                            

.. _ppi-show-port-again-neutron:

Show the port with both IP addresses (neutron)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to show port details to verify that both IPv4 and IPv6 IP 
addresses are configured by using the neutron client.


Issue the following neutron client command, substituting your own values for the ones shown.

**Show port details with neutron request**

.. code::  

   $ neutron port 79bf47e2-5107-4d93-b9c3-b78ddbc94c93
   
**Positional argument:**

   -  The port ID. In this example, we used the port ID ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``.

**Show port details with neutron response**

.. code::  

   +-----------------------+----------------------------------------------------------------------------------------+
   | Field                 | Value                                                                                  |
   +-----------------------+----------------------------------------------------------------------------------------+
   | admin_state_up        | True                                                                                   |
   | allowed_address_pairs |                                                                                        |
   | device_id             |                                                                                        |
   | device_owner          |                                                                                        |
   | fixed_ips             | {"subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0", "ip_address": "fc01::7"},        |
   |                       | {"subnet_id": "321caa1c-2105-4186-b53b-366fa623c09a", "ip_address": "192.168.7.250"}   |
   | id                    | 79bf47e2-5107-4d93-b9c3-b78ddbc94c93                                                   |
   | mac_address           | AA:BB:CC:00:01:4A                                                                      |
   | name                  | port1                                                                                  |
   | network_id            | 03f240c5-6fb8-47a0-860a-c7ba83be519f                                                   |
   | security_groups       |                                                                                        |
   | status                | ACTIVE                                                                                 |
   | tenant_id             | 53501b3c25d34f8ea293c03298caed60                                                       |
   +-----------------------+----------------------------------------------------------------------------------------+
                           
.. _ppi-boot-server-nova:

Boot a Server (nova)
~~~~~~~~~~~~~~~~~~~~

The following step shows you how to boot a server by using the port ID of the port that 
you configured with dual-stack IP addresses in the second step of this procedure.

.. note::

	To create your new server, you need the following information:
	
   -  The name of the new server. Use a name of your choice.
   -  The image ID. 
   -  The flavor ID. 
   -  The network ID of the network, which is ``net-id=79bf47e2-5107-4d93-b9c3-b78ddbc94c93``.


#. Issue the following nova client command.

   **Boot server with nova request**

   .. code::  

       $ nova boot ata --image c63e20ad-6e3b-4e0b-943c-95cf3ba6c3a6 /
                   --flavor 2 --nic port-id=79bf47e2-5107-4d93-b9c3-b78ddbc94c93
                   
   **Positional arguments**
   
   - The server name. In this example, the name is ``ata``.
   - ``image``.  The image ID. In this example, the ID is ``c63e20ad-6e3b-4e0b-943c-95cf3ba6c3a6``.
   - ``flavor``. The flavor ID.  In this example, the ID is ``2``
   - ``nic port-id``.  The port ID. In this example, the ID is ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``.

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
       | adminPass               | LuXD49ijFf3D                                                    |
       | created                 | 2014-02-06T20:05:12Z                                            |
       | flavor                  | m1.mid (2)                                                      |
       | hostId                  |                                                                 |
       | id                      | 1ed5bc31-153d-4570-a361-92d5a02fd428                            |
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

#. Copy the server id value from the output for future reference. In this example, the ID 
   is ``1ed5bc31-153d-4570-a361-92d5a02fd428``, but use the ID from your response.

.. _ppi-verify-ips-nova:

Verify IP addresses on the server port (nova)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to verify the IP addresses on the server port. In this 
case, the IP addresses should be ``192.168.7.250`` and ``fc01::7``.

Issue the following nova client command, substituting your value for the one shown.

**Show server details with nova request**

.. code::  

   $ nova list 1ed5bc31-153d-4570-a361-92d5a02fd428

**Positional arguments:**

-  The server ID. In this example, the ID is ``1ed5bc31-153d-4570-a361-92d5a02fd428``.

**Show server details with nova response**

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
   | flavor                  | m1.mid (2)                                                                         |
   | hostId                  | 0488142a8f859cb4020234cc235f8cd8a22bee126726025d70c0b9ba                           |
   | id                      | 1ed5bc31-153d-4570-a361-92d5a02fd428                                               |
   | image                   | cirros-0.3.0-x86_64-disk (82e72de5-6366-4217-8c87-a570a9b17e73)                    |
   | metadata                | {}                                                                                 |
   | name                    | ata                                                                                |
   | Rack-4                  | fc01::7, 192.168.7.250,                                                            |
   | private network         | 10.181.208.27                                                                      |
   | progress                | 100                                                                                |
   | public network          | 2001:db8:0:1:a8bb:ccff:fe00:12f, 10.13.20.20                                       |
   | status                  | ACTIVE                                                                             |
   | tenant_id               | 5831008                                                                            |
   | updated                 | 2014-02-06T20:05:12Z                                                               |
   | user_id                 | 207638                                                                             |
   +-------------------------+------------------------------------------------------------------------------------+
                               

**Next topic:** :ref:`Controlling Network Access<controlling-access-intro>`
