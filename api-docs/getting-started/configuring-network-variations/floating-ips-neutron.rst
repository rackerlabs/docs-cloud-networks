.. _floating-ip-with-neutron:

Using Floating IP Adresses with  with neutron - UNDEVELOPED
-----------------------------------------------------------

These sections walk you through creating a shared IP address and attaching it to two
existing servers or two new servers by using cURL.

Once the steps are completed, there will be a shared IP address common to 2 servers in the
control plane. However, you will still need to configure the guest on the servers, perhaps
an application like Linux-HA to take advantage of the shared IP during a failover.

**If you already have two active servers, start here:** `Verifying servers share ``publicIPZoneId`` (neutron) <si-verifying-servers-zone-nova>`
**If you need to create servers, start here:** `Creating server A (neutron) <si-creating-serverA-nova>`

.. _fi-creating-network-nova:

Creating network (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create the network.

#. Issue the following nova client command, substituting your values for the
   ones shown.

   **Create network with neutron request**

   .. code::

      $ neutron net-create FLIPnet

   **Positional arguments:**

   -  The server name. In this example, we used ``serverA``.

   -  The image id. In this example, we used ``2f85a777-9ffd-4b49-a60e-1155ceb93a5e``.

   -  `The flavor id. In this example, we used ``4``.

   **Create network with neutron response**

   .. code::

       +----------------+--------------------------------------+
       | Field          | Value                                |
       +----------------+--------------------------------------+
       | admin_state_up | True                                 |
       | id             | 29f52c7e-6efd-4335-a14a-db77d32a2555 |
       | name           | FLIPnet                              |
       | shared         | False                                |
       | status         | ACTIVE                               |
       | subnets        |                                      |
       | tenant_id      | 53501b3c25d34f8ea293c03298caed60     |
       +----------------+--------------------------------------+


#. Copy the ``id`` value from the output. You will need this value when you
   performing other related activities. In this example, the ID is
   ``29f52c7e-6efd-4335-a14a-db77d32a2555``, but use the ID from your response.

.. _fi-creating-subnet-neutron:

Creating subnet (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create the subnet for the network with a ``gateway_ip`` and an
``allocation pool`` with ``start`` and ``end`` values for the pool. The gateway
IP address is not within the allocation pool. Remember that ``x.x.x.0`` and
``x.x.x.255`` are reserved subnet addresses.

#. Issue the following cURL command, substituting your own values for the ones
   shown.

   **Create subnet with neutron request**

   .. code::

      $ neutron subnet-create --name FLIPnet_sn /
        --ip-version 4 29f52c7e-6efd-4335-a14a-db77d32a2555 192.168.33.0/24 /
        --allocation-pool start=192.168.33.2,end=192.168.33.254 /
        ---gateway 192.168.33.1

   **Positional arguments:**

   -  ``name`` The subnet name. In this example, the name is ``FLIPnet_sn``.

   -  ``ip-version`` The version of the subnet IP. In this example, the version
      is ``4``.

   -  The network ID or name. In this example, we used the network ID
      ``29f52c7e-6efd-4335-a14a-db77d32a2555``.

   -  The network CIDR. In this example, the CIDR is ``192.168.33.0/24``.

   -  ``allocation-pool`` The starting and ending IP addresses for the
      allocation pool, indicated by ``start` and ``end```.

   -  ``gateway`` The gateway IP address.  In this example, the gateway IP
      address is ``192.168.33.1``.

   **Create subnet with neutron response**

   .. code::

       +------------------+----------------------------------------------------+
       | Field            | Value                                              |
       +------------------+----------------------------------------------------+
       | allocation_pools | {"start": "192.168.33.2", "end": "192.168.33.254"} |
       | cidr             | 192.168.33.0/24                                    |
       | dns_nameservers  |                                                    |
       | enable_dhcp      |                                                    |
       | gateway_ip       |192.168.33.1                                        |
       | host_routes      |                                                    |
       | id               | 23e3059e-4f39-4f7f-8cf2-c326e5de6c37               |
       | ip_version       | 4                                                  |
       | name             | FLIPnet_sn                                         |
       | network_id       | 29f52c7e-6efd-4335-a14a-db77d32a2555               |
       | tenant_id        | 53501b3c25d34f8ea293c03298caed60                   |
       +------------------+----------------------------------------------------+

#. Copy the id value from the output for future reference. In this example, the
   id is ``23e3059e-4f39-4f7f-8cf2-c326e5de6c37``, but use the ``id`` from your
   response.

.. _fi-creating-port-neutron:

Creating a port (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create a port on the network you created previously.

#. Issue the following neutron command, substituting your own values for the
   ones shown.

Issue the following nova client command, substituting your values for the ones shown.

**Create port with neutron request**

.. code::

   $ (TBD)

**Positional arguments:**

-  The server name for the new server. In this example, we used ``serverB``.

-  ``hint public_ip_zone:near``. The server id of the old server (near to which you want
   the new server built). In this example, we used ``079f53a4-6947-4895-b9b4-df81e534840b``.

-  The image id. In this example, we used ``2f85a777-9ffd-4b49-a60e-1155ceb93a5e``.

-  The flavor id. In this example, we used ``4``.

**Create port with neutron response**

.. code::

   (TBD)

.. _fi-creating-server-nova:

Creating or preparing a server (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you already have a server, remove the public interface as shown in step 1.
If you do not have a server, create one without a public interface as shown in
step 2.

#. For an existing server, issue the following nova command to remove the
   public interface, substituting your own values for the ones shown.

   **Remove public interface from existing server with nova request**

   **Positional arguments:**

   -  The server ID. In this example, we used the server ID
      ``5fe1fcf9-f7b2-4b94-b36f-f154a3075f8e``.

   **Remove public interface with nova response**

   .. code::

      (TBD)

#. If you don't already have a server, issue the following cURL command to
   create one without a public interface, substituting your own values for the
   ones shown.

   **Boot a server without a public interface with nova request**



   .. code::

       $ nova boot ata --image c63e20ad-6e3b-4e0b-943c-95cf3ba6c3a6 /
                   --flavor 2 --nic port-id=79bf47e2-5107-4d93-b9c3-b78ddbc94c93

   **Positional arguments:**

   -  The server name for the new server. In this example, we used ``serverB``.

   -  ``hint public_ip_zone:near``. The server id of the old server (near to which you want
      the new server built). In this example, we used ``079f53a4-6947-4895-b9b4-df81e534840b``.

   -  The image id. In this example, we used ``2f85a777-9ffd-4b49-a60e-1155ceb93a5e``.

   -  The flavor id. In this example, we used ``4``.

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

.. _fi-allocate-floating-ip-neutron:

Allocate floating IP address (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to allocate a Floating IP and associate it
with the port on the Cloud Server instance connected to the Cloud Network.


#. Issue the following neutron command, substituting your own Server B id for
   the server id in the command.

   **Allocate floating IP address with neutron request**

   .. code::

      $ (TBD)

   **Positional argument:**

   -  The server id for server A. In this example, we used
      ``85013d5f5100b7b903bc99c3a333d9af01ecd4b4f0df970a2c27a796``.

   **Allocate floating IP address with neutron response**

   .. code::

       (TBD)


**Next topic:** :ref:`Control Network Access<control-access-intro>`
