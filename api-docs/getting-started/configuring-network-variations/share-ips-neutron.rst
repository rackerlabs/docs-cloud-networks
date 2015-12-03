.. _share-ips-with-neutron:

Share IP Adresses with  with neutron
------------------------------------

These sections walk you through creating a shared IP address and attaching it to two 
existing servers or two new servers by using cURL.

Once the steps are completed, there will be a shared IP address common to 2 servers in the 
control plane. However, you will still need to configure the guest on the servers, perhaps 
an application like Linux-HA or VRRP, to take advantage of the shared IP during a failover.

**If you already have two active servers, start here:** `Verify servers share ``publicIPZoneId`` (neutron) <si-verify-servers-zone-nova>`
**If you need to create servers, start here:** `Create server A (neutron) <si-create-serverA-nova>`

.. _si-create-serverA-nova:

Create server A (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create the first server by using the standard Nova boot process.

#. Issue the following nova client command:

   .. code::  

      $ nova boot serverA --image 2f85a777-9ffd-4b49-a60e-1155ceb93a5e --flavor 4

   **Positional arguments:**

   -  The server name. In this example, we used ``serverA``.

   -  The image id. In this example, we used ``2f85a777-9ffd-4b49-a60e-1155ceb93a5e``.

   -  `The flavor id. In this example, we used ``4``.

   The operation returns information about the new server, as shown in the following example:

   .. code::  

       +------------------------+----------------------------------------------------------------------------+
       | Property               | Value                                                                      |
       +------------------------+----------------------------------------------------------------------------+
       | OS-DCF:diskConfig      | AUTO                                                                       |
       | OS-EXT-STS:power_state | 0                                                                          |
       | OS-EXT-STS:task_state  | scheduling                                                                 |
       | OS-EXT-STS:vm_state    | building                                                                   |
       | accessIPv4             |                                                                            |
       | accessIPv6             |                                                                            |
       | adminPass              | wfATkA6aGVnH                                                               |
       | config_drive           |                                                                            |
       | created                | 2015-10-05T14:38:47Z                                                       |
       | flavor                 | 2GB Standard Instance (4)                                                  |
       | hostId                 |                                                                            |
       | id                     | 079f53a4-6947-4895-b9b4-df81e534840b                                       |
       | image                  | Ubuntu 12.04 LTS (Precise Pangolin) (2f85a777-9ffd-4b49-a60e-1155ceb93a5e) |
       | key_name               | -                                                                          |
       | metadata               | {}                                                                         |
       | name                   | serverA                                                                    |
       | progress               | 0                                                                          |
       | status                 | BUILD                                                                      |
       | tenant_id              | 661919                                                                     |
       | updated                | 2015-10-05T14:38:48Z                                                       |
       | user_id                | 132156                                                                     |
       +------------------------+----------------------------------------------------------------------------+                        
                               

#. Copy the ``id`` value from the output. You will need this value when you performing 
   other related activities. In this example, the ID is ``079f53a4-6947-4895-b9b4-df81e534840b``, 
   but use the ID from your response.
   
.. _si-get-serverA-zone-nova:

Get server A publicIPZoneId (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to share a public IP address, the servers have to be in the same ``publicIPZoneId``. 
To determine the server's ``publicIPZoneId``, perform the GET server details operation and 
find the ``RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId`` attribute.

..  note:: 

    If you want to share a Cloud Networks (or isolated network) address, the servers do not 
    need to be in the same ``publicIPZoneId``.

1. Issue the following nova command:

   .. code::  

       $ nova show 079f53a4-6947-4895-b9b4-df81e534840b

   **Positional arguments:**

   -  The server ID. In this example, we used the server ID ``079f53a4-6947-4895-b9b4-df81e534840b``.

   The operation returns the response, as shown in the following output:

   .. code::  

       +--------------------------------------+----------------------------------------------------------------------------+
       | Property                             | Value                                                                      |
       +--------------------------------------+----------------------------------------------------------------------------+
       | OS-DCF:diskConfig                    | AUTO                                                                       |
       | OS-EXT-STS:power_state               | 1                                                                          |
       | OS-EXT-STS:task_state                | -                                                                          |
       | OS-EXT-STS:vm_state                  | active                                                                     |
       | RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId | 85013d5f5100b7b903bc99c3a333d9af01ecd4b4f0df970a2c27a796                   |
       | accessIPv4                           | 166.78.156.244                                                             |
       | accessIPv6                           | 2001:4800:7812:514:be76:4eff:fe05:ffa0                                     |
       | config_drive                         |                                                                            |
       | created                              | 2015-10-05T14:38:47Z                                                       |
       | flavor                               | 2GB Standard Instance (4)                                                  |
       | hostId                               | 2b5122d818de078026f57a10bafb456d754827d76ab77ac04fff9687                   |
       | id                                   | 079f53a4-6947-4895-b9b4-df81e534840b                                       |
       | image                                | Ubuntu 12.04 LTS (Precise Pangolin) (2f85a777-9ffd-4b49-a60e-1155ceb93a5e) |
       | key_name                             | -                                                                          |
       | metadata                             | {"rax_service_level_automation": "Complete"}                               |
       | name                                 | serverA                                                                    |
       | private network                      | 10.182.1.8                                                                 |
       | progress                             | 90                                                                         |
       | public network                       | 166.78.156.244, 2001:4800:7812:514:be76:4eff:fe05:ffa0                     |
       | status                               | ACTIVE                                                                     |
       | tenant_id                            | 661919                                                                     |
       | updated                              | 2015-10-05T14:41:18Z                                                       |
       | user_id                              | 132156                                                                     |
       +--------------------------------------+----------------------------------------------------------------------------+

2. Note both the server id, in this case ``079f53a4-6947-4895-b9b4-df81e534840b``, the
   ``RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId`` value, in this example
   ``85013d5f5100b7b903bc99c3a333d9af01ecd4b4f0df970a2c27a796``, and the
   ``public network`` IP address value, in this example ``166.78.156.244``.

.. _si-create-serverB-nova:

Create server B (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how create server B in the same ``publicIPZoneId`` as server 
A, by using a scheduler hint to direct the service to create server B near to server A.

Issue the following nova client command:

.. code::  

   $ nova boot serverB --hint public_ip_zone:near='079f53a4-6947-4895-b9b4-df81e534840b'--image 2f85a777-9ffd-4b49-a60e-1155ceb93a5e --flavor 4

**Positional arguments:**

-  The server name for the new server. In this example, we used ``serverB``.

-  The server id of the old server (near to which you want the new server built). In this 
   example, we used ``079f53a4-6947-4895-b9b4-df81e534840b``.

-  The image id. In this example, we used ``2f85a777-9ffd-4b49-a60e-1155ceb93a5e``.

-  The flavor id. In this example, we used ``4``.

For each network, the operation returns the result as shown in the following output:

.. code::  

   +------------------------+----------------------------------------------------------------------------+
   | OS-DCF:diskConfig      | AUTO                                                                       |
   | OS-EXT-STS:power_state | 0                                                                          |
   | OS-EXT-STS:task_state  | scheduling                                                                 |
   | OS-EXT-STS:vm_state    | building                                                                   |
   | accessIPv4             |                                                                            |
   | accessIPv6             |                                                                            |
   | adminPass              | dCjDFoE83UNk                                                               |
   | config_drive           |                                                                            |
   | created                | 2015-10-06T13:59:34Z                                                       |
   | flavor                 | 2GB Standard Instance (4)                                                  |
   | hostId                 |                                                                            |
   | id                     | 5fe1fcf9-f7b2-4b94-b36f-f154a3075f8e                                       |
   | image                  | Ubuntu 12.04 LTS (Precise Pangolin) (2f85a777-9ffd-4b49-a60e-1155ceb93a5e) |
   | key_name               | -                                                                          |
   | metadata               | {}                                                                         |
   | name                   | serverB                                                                    |
   | progress               | 0                                                                          |
   | status                 | BUILD                                                                      |
   | tenant_id              | 661919                                                                     |
   | updated                | 2015-10-06T13:59:35Z                                                       |
   | user_id                | 132156                                                                     |
   +------------------------+----------------------------------------------------------------------------+

.. _si-verify-servers-zone-nova:

Verify servers share publicIPZoneId (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following steps show you how to verify that both servers are in the same 
``publicIPZoneId`` using cURL.


1. You have already run this command for server A and noted the 
   ``RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId``. Now, issue the following nova command, 
   substituting your own Server B id for the server id in the command:

   .. code::  

       $ nova show 5fe1fcf9-f7b2-4b94-b36f-f154a3075f8e

   **Positional arguments:**

   -  The server ID. In this example, we used the server ID
      ``5fe1fcf9-f7b2-4b94-b36f-f154a3075f8e``.

   The operation returns the result as shown in the following output:

   .. code::  

       +--------------------------------------+----------------------------------------------------------------------------+
       | Property                             | Value                                                                      |
       +--------------------------------------+----------------------------------------------------------------------------+
       | OS-DCF:diskConfig                    | AUTO                                                                       |
       | OS-EXT-STS:power_state               | 0                                                                          |
       | OS-EXT-STS:task_state                | spawning                                                                   |
       | OS-EXT-STS:vm_state                  | building                                                                   |
       | RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId | 85013d5f5100b7b903bc99c3a333d9af01ecd4b4f0df970a2c27a796                   |
       | accessIPv4                           |                                                                            |
       | accessIPv6                           |                                                                            |
       | config_drive                         |                                                                            |
       | created                              | 2015-10-06T13:59:34Z                                                       |
       | flavor                               | 2GB Standard Instance (4)                                                  |
       | hostId                               | 327f0e52c1e09e7bb85a691f4dbeebc25e484f4e47ce28c82858281e                   |
       | id                                   | 5fe1fcf9-f7b2-4b94-b36f-f154a3075f8e                                       |
       | image                                | Ubuntu 12.04 LTS (Precise Pangolin) (2f85a777-9ffd-4b49-a60e-1155ceb93a5e) |
       | key_name                             | -                                                                          |
       | metadata                             | {}                                                                         |
       | name                                 | serverB                                                                    |
       | private network                      | 10.182.1.116                                                               |
       | progress                             | 30                                                                         |
       | public network                       | 2001:4800:7812:514:be76:4eff:fe05:ffc6, 166.78.156.196                     |
       | status                               | BUILD                                                                      |
       | tenant_id                            | 661919                                                                     |
       | updated                              | 2015-10-06T13:59:41Z                                                       |
       | user_id                              | 132156                                                                     |
       +--------------------------------------+----------------------------------------------------------------------------+

2. Make sure the ``RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId`` value is the same for both server 
   A and server B. Also, make note of the ``public network`` IP address, which is 
   ``166.78.156.196`` in this case.
                        
.. _si-show-server-ports-neutron:

Show server ports (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to boot a server by using the port ID of the port that 
you configured with dual-stack IP addresses in the second step of this procedure.

1. Issue the following neutron client command for server A:

   .. code::  

      $ neutron port-list --device-id=85013d5f5100b7b903bc99c3a333d9af01ecd4b4f0df970a2c27a796

   **Positional argument:**

   -  The server id for server A. In this example, we used
      ``85013d5f5100b7b903bc99c3a333d9af01ecd4b4f0df970a2c27a796``.

   The command returns the response, as shown in the following output:

   .. code::  

       +--------------------------------------+------+-------------------+---------------------------------------------------------------------------------------------------------------+
       | id                                   | name | mac_address       | fixed_ips                                                                                                     |
       +--------------------------------------+------+-------------------+---------------------------------------------------------------------------------------------------------------+
       | 7e504ba5-7802-4ae7-88a1-5b4bc03f2540 |      | BC:76:4E:05:FF:A0 | {"subnet_id": "02c09c2c-dad9-4fc2-baab-16d4ceb5696f", "ip_address": "166.78.156.244"}                         |
       |                                      |      |                   | {"subnet_id": "1a2d337d-c8ca-4bf1-9e91-b47efdee5ef9", "ip_address": "2001:4800:7812:514:be76:4eff:fe05:ffa0"} |
       | a1d290a3-77bc-4397-b73f-1f5fda3e5a52 |      | BC:76:4E:05:F9:C1 | {"subnet_id": "4707387f-e03d-4026-ab42-a44960e2c25e", "ip_address": "10.182.1.8"}                             |
       +--------------------------------------+------+-------------------+---------------------------------------------------------------------------------------------------------------+

.. _si-create-shared-ip-neutron:

Create shared IP address (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following steps show you how create shared IP address for the Server A and B public 
network ports identified in the previous step.

#. Issue the following neutron client command for server A:

   .. code::  

      $ neutron ip-address-create --port-id 7e504ba5-7802-4ae7-88a1-5b4bc03f2540 --port-id 7af9f379-1395-458c-aa55-9356156dab10 --tenant-id 661919 00000000-0000-0000-0000-000000000000 4

   **Positional arguments:**

   -  ``port-id``. This parameter occurs twice, once with server A's port ID and once with 
      server B's port ID. In this example, we used the port IDs 
      ``7e504ba5-7802-4ae7-88a1-5b4bc03f2540`` and ``7af9f379-1395-458c-aa55-9356156dab10``.

   -  The publicnet ID, which is always ``00000000-0000-0000-0000-000000000000``.

   -  The tenant-id. In this case, we used ``661919``.

   -  The IP version. In this case, we used ``4``.

   The operation returns the response, as shown in the following output:

   .. code::  

       +------------+--------------------------------------+
       | Field      | Value                                |
       +------------+--------------------------------------+
       | address    | 162.209.73.72                        |
       | id         | 25fce49c-955f-4ec4-944a-b03152540b74 |
       | network_id | 00000000-0000-0000-0000-000000000000 |
       | port_ids   | 7af9f379-1395-458c-aa55-9356156dab10 |
       |            | 7e504ba5-7802-4ae7-88a1-5b4bc03f2540 |
       | subnet_id  | 03fc5569-bc3a-44c9-ba9b-0ed2bf3f7517 |
       | tenant_id  | 661919                               |
       | type       | shared                               |
       | version    | 4                                    |
       +------------+--------------------------------------+

#. Note the new shared IP ID for future reference. In this example, the ID is 
   ``25fce49c-955f-4ec4-944a-b03152540b74``), but use the ID from your response.

.. _si-associate-shared-ip-nova:

Associate shared IP address to both servers (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following steps show you how to explicitly associate the new shared IP address to 
servers A and B.

1. Issue the following nova command, using your server A ID and shared IP address ID:

   .. code::  

      $ nova ip-association-create 079f53a4-6947-4895-b9b4-df81e534840b 25fce49c-955f-4ec4-944a-b03152540b74

   **Positional arguments:**

   -  The server A ID. In this example, we used ``079f53a4-6947-4895-b9b4-df81e534840b``.

   -  ``shared-ip-id``. The ID for shared IP address (not the IP address itself). In this 
      example, we used ``25fce49c-955f-4ec4-944a-b03152540b74``.

   The operation returns the response, as shown in the following output:

   .. code::  

       +----------+--------------------------------------+
       | Property | Value                                |
       +----------+--------------------------------------+
       | id       | 25fce49c-955f-4ec4-944a-b03152540b74 |
       | address  | 162.209.73.72                        |
       +----------+--------------------------------------+

2. Repeat the process for server B.

   Issue the following nova command, using your server B ID and shared IP address ID:

   .. code::  

      $ nova ip-association-create 5fe1fcf9-f7b2-4b94-b36f-f154a3075f8e 25fce49c-955f-4ec4-944a-b03152540b74

   **Positional arguments:**

   -  The server B ID. In this example, we used ``5fe1fcf9-f7b2-4b94-b36f-f154a3075f8e``.

   -  ``shared-ip-id``. The ID for shared IP address (not the IP address itself). In this 
      example, we used ``25fce49c-955f-4ec4-944a-b03152540b74``.

   The operation returns the response, as shown in the following output:

   .. code::  

       +----------+--------------------------------------+
       | Property | Value                                |
       +----------+--------------------------------------+
       | id       | 25fce49c-955f-4ec4-944a-b03152540b74 |
       | address  | 162.209.73.72                        |
       +----------+--------------------------------------+
       
.. _si-verify-shared-ip-neutron:

Verify shared IP address (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following steps show you how verify that the shared IP address is set for the Server A 
and B public network ports.

#. Issue the following neutron command:

   .. code::  

       $ neutron ip-address-list

   The operation returns the result as shown in the following output

   .. code::  

       +--------------------------------------+----------------------------------------+---------+--------------------------------------+--------------------------------------+------------------------------------------------------------------------------------+
       | id                                   | address                                | version | network_id                           | subnet_id                            | port_ids                                                                           |
       +--------------------------------------+----------------------------------------+---------+--------------------------------------+--------------------------------------+------------------------------------------------------------------------------------+
       | 19eab919-00bf-4c8a-83a6-0d815f1227bd | 104.239.137.253                        |       4 | 00000000-0000-0000-0000-000000000000 | f1013f45-8135-423a-9c6c-b8ac09f7abb7 | [u'a092ab36-03a6-42ba-ab86-34648f060016']                                          |
       | 23ae9ca0-e39a-4535-b854-6e481aebd9b0 | 166.78.63.149                          |       4 | 00000000-0000-0000-0000-000000000000 | e1a176dc-e3d2-44f5-ad9f-2cf3407df737 | [u'c023bc75-45d5-4875-9570-aa05d6200888']                                          |
       | 25fce49c-955f-4ec4-944a-b03152540b74 | 162.209.73.72                          |       4 | 00000000-0000-0000-0000-000000000000 | 03fc5569-bc3a-44c9-ba9b-0ed2bf3f7517 | [u'7af9f379-1395-458c-aa55-9356156dab10', u'7e504ba5-7802-4ae7-88a1-5b4bc03f2540'] |
       | 46bef5bc-d2f6-4e5a-ba68-33043b668521 | 166.78.156.244                         |       4 | 00000000-0000-0000-0000-000000000000 | 02c09c2c-dad9-4fc2-baab-16d4ceb5696f | [u'7e504ba5-7802-4ae7-88a1-5b4bc03f2540']                                          |
       +--------------------------------------+----------------------------------------+---------+--------------------------------------+--------------------------------------+------------------------------------------------------------------------------------+

                                   

2. Notice that the ID of the shared IP address, in this case ``25fce49c-955f-4ec4-944a-b03152540b74``, 
   has two ports in the ``port_id`` column. This means the IP address association to both 
   servers was successful.
   
**Next topic:** :ref:`Controlling Network Access<controlling-access-intro>`