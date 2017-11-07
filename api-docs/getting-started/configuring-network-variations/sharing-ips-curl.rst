.. _sharing-ips-with-curl:

Sharing IP Adresses with cURL
-----------------------------

These sections walk you through creating a shared IP address and attaching it
to two existing servers or two new servers by using cURL.

Once the steps are completed, there will be a shared IP address common to two
servers in the control plane. However, you will still need to configure the
guest on the servers, perhaps an application like Linux-HA to take advantage of
the shared IP during a failover.

- **If you already have two active servers, start here:** :ref:`Verifying servers share publicIPZoneId (cURL) <si-verifying-servers-zone-curl>`

- **If you need to create servers, start here:** :ref:`Creating server A (cURL) <si-creating-serverA-curl>`

.. _si-creating-serverA-curl:

Creating server A (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^

Create the first server by using the standard Nova boot process.

#. Issue the following cURL command, substituting your own values for the ones
   shown.

   **Boot server A with cURL request**

   .. code::

      $ curl -i -vv https://dfw.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers
              -X POST \
              -H "Content-Type: application/json" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -d '{"server": {"name": "serverA",
                 "imageRef": "2f85a777-9ffd-4b49-a60e-1155ceb93a5e",
                 "flavorRef": "4", "max_count": 1, "min_count": 1,
                 "networks": [
                    {"uuid": "00000000-0000-0000-0000-000000000000"},
                    {"uuid": "11111111-1111-1111-1111-111111111111"}
                 ]}}' | python -m json.tool

   **Boot server A with cURL response**

   .. code::

       {
           "server": {
               "OS-DCF:diskConfig": "AUTO",
               "id": "f387799f-9668-4cc7-9f0f-03c9cfc43af6",
               "links": [
                   {
                       "href": "https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/f387799f-9668-4cc7-9f0f-03c9cfc43af6",
                       "rel": "self"
                   },
                   {
                       "href": "https://dfw.servers.api.rackspacecloud.com/5831008/servers/f387799f-9668-4cc7-9f0f-03c9cfc43af6",
                       "rel": "bookmark"
                   }
               ],
               "adminPass": "27L93SfBWttf"
           }
       }


2. Copy the ``id`` value from the output. You will need this value when you
   performing other related activities. In this example, the ID is
   ``f387799f-9668-4cc7-9f0f-03c9cfc43af6``, but use the ID from your response.

.. _si-getting-serverA-zone-curl:

Getting server A publicIPZoneId (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In order to share a public IP address, the servers have to be in the same
``publicIPZoneId``. To determine the server's ``publicIPZoneId``, perform the
GET server details operation and find the
``RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId`` attribute.

..  note::

    If you want to share a Cloud Networks (or isolated network) address, the
    servers do not need to be in the same ``publicIPZoneId``.

#. Issue the following cURL command, substituting your own values for the ones
   shown.

   **Show server A details with cURL request**

   .. code::

      $ curl -s https://dfw.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers/f387799f-9668-4cc7-9f0f-03c9cfc43af6 \
              -X GET \
              -H "Content-Type: application/json" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

   **Show server A details with cURL response**

   .. code::

       {
           "server": {
               "OS-DCF:diskConfig": "AUTO",
               "OS-EXT-STS:power_state": 1,
               "OS-EXT-STS:task_state": null,
               "OS-EXT-STS:vm_state": "active",
               "RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId": "85013d5f5100b7b903bc99c3a333d9af01ecd4b4f0df970a2c27a796",
               "accessIPv4": "166.78.9.96",
               "accessIPv6": "2001:4800:7810:512:b8bd:1f9c:ff05:339e",
               ...
               "id": "f387799f-9668-4cc7-9f0f-03c9cfc43af6",
               ...
           }
       }


#. Note the server id, in this case ``f387799f-9668-4cc7-9f0f-03c9cfc43af6``,
   and the ``RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId`` value, in this example
   ``85013d5f5100b7b903bc99c3a333d9af01ecd4b4f0df970a2c27a796``.

.. _si-creating-serverB-curl:

Creating server B (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^

The following step shows you how to create server B in the same
``publicIPZoneId`` as server A, by using a scheduler hint to direct the service
to create server B near to server A (``f387799f-9668-4cc7-9f0f-03c9cfc43af6``).

Issue the following cURL command, substituting your own values for the ones
shown.

**Boot server B with cURL request**

.. code::

   $ curl -i -vv https://dfw.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers
         -X POST \
         -H "Content-Type: application/json" \
         -H "Accept: application/json" \
         -H "X-Auth-Token: $AUTH_TOKEN" \
         -d '{"server": {"name": "serverB",
            "os:scheduler_hints": {"public_ip_zone:near":
            ["f387799f-9668-4cc7-9f0f-03c9cfc43af6"]},
            "imageRef": "2f85a777-9ffd-4b49-a60e-1155ceb93a5e",
            "flavorRef": "4", "max_count": 1, "min_count": 1,
            "networks": [
               {"uuid": "00000000-0000-0000-0000-000000000000"},
               {"uuid": "11111111-1111-1111-1111-111111111111"}
            ]}}' | python -m json.tool

**Boot server B with cURL response**

.. code::

   {
      "server": {
         "OS-DCF:diskConfig": "AUTO",
         "id": "1a861bf7-2a5e-40a4-acb3-1fb058cf2a74",
         "links": [
            {
               "href": "https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/1a861bf7-2a5e-40a4-acb3-1fb058cf2a74",
               "rel": "self"
            },
            {
               "href": "https://dfw.servers.api.rackspacecloud.com/5831008/servers/1a861bf7-2a5e-40a4-acb3-1fb058cf2a74",
               "rel": "bookmark"
            }
         ],
         "adminPass": "42L12DfA13sd"
      }
   }

.. _si-verifying-servers-zone-curl:

Verifying servers share publicIPZoneId (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps show you how to verify that both servers are in the same
``publicIPZoneId`` using cURL.


#. You have already run this command for server A and noted the
   ``RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId``. Now, issue the following cURL
   command, substituting your own Server B id for the server id in the command.

   **Show server B details with cURL request**

   .. code::

      $ curl -s https://dfw.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers/1a861bf7-2a5e-40a4-acb3-1fb058cf2a74 \
              -X GET \
              -H "Content-Type: application/json" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

   **Show server B details with cURL response**

   .. code::

       {
           "server": {
               "OS-DCF:diskConfig": "AUTO",
               ...
               "RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId": "85013d5f5100b7b903bc99c3a333d9af01ecd4b4f0df970a2c27a796",
               ...
               "id": "1a861bf7-2a5e-40a4-acb3-1fb058cf2a74",
               ...
           }
       }


#. Make sure the ``RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId`` value is the same for
   both server A and server B.

.. _si-showing-server-ports-curl:

Showing server ports (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following step shows you how to boot a server by using the port ID of the
port that you configured with dual-stack IP addresses in the second step of
this procedure.

#. Issue the following cURL command for server A, where the value for device_id
   is your server A ID.

   **List server A ports with cURL request**

   .. code::
      $ API_ENDPOINT='https://dfw.networks.api.rackspacecloud.com'
      $ curl -s $API_ENDPOINT/ports?device_id=f387799f-9668-4cc7-9f0f-03c9cfc43af6 \
              -X GET \
              -H "Content-Type: application/json" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

   **Positional arguments**

   - The server A ID.  In this example, the ID is
     ``f387799f-9668-4cc7-9f0f-03c9cfc43af6``.

   **List server A ports with cURL response**

   .. code::

       {
         "ports_links": [
           {
             "href": "http://localhost:9696/v2.0/ports?device_id=f387799f-9668-4cc7-9f0f-03c9cfc43af6&marker=ad88326b-b232-45e8-9fe6-ff0618ff5de6&page_reverse=True",
             "rel": "previous"
           }
         ],
         "ports": [
           {
             "status": "ACTIVE",
             "name": "",
             "admin_state_up": true,
             "network_id": "00000000-0000-0000-0000-000000000000",
             "tenant_id": "1234567",
             "device_owner": "compute:None",
             "mac_address": "BC:76:4E:05:39:80",
             "fixed_ips": [
               {
                 "subnet_id": "00ef42bd-5d9c-45f7-8f8a-07660ca17418",
                 "ip_address": "2001:4800:7818:101:be76:4eff:fe05:3980"
               },
               {
                 "subnet_id": "55a4df37-6aad-4bd7-85b7-7d30a884c595",
                 "ip_address": "104.130.132.199"
               }
             ],
             "id": "ad88326b-b232-45e8-9fe6-ff0618ff5de6",
             "security_groups": [],
             "device_id": "f387799f-9668-4cc7-9f0f-03c9cfc43af6"
           },
           {
             "status": "ACTIVE",
             "name": "",
             "admin_state_up": true,
             "network_id": "11111111-1111-1111-1111-111111111111",
             "tenant_id": "1234567",
             "device_owner": "compute:None",
             "mac_address": "BC:76:4E:05:6E:0D",
             "fixed_ips": [
               {
                 "subnet_id": "aaa8137b-d52e-43ee-887a-7fd066acd127",
                 "ip_address": "10.208.232.222"
               }
             ],
             "id": "098994a6-898b-4d30-a123-31ab5dac220f",
             "security_groups": [],
             "device_id": "e2f6b206-278d-40e4-915e-cce62a171ac0"
           }
         ]
       }


#. Note the id value for the port where the network_id is
   ``00000000-0000-0000-0000-000000000000`` for future reference. In this
   example, the ID is ``ad88326b-b232-45e8-9fe6-ff0618ff5de6``), but use the ID
   from your response.

#. Repeat the ``GET /ports`` command (step 1 in this procedure) for server B,
   and note the port ID for that server's public network.

.. _si-creating-shared-ip-curl:

Creating shared IP address (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps show you how to create a shared IP address for the Server A
and B public network ports identified in the previous step.

#. Issue the following cURL command, using your port IDs and tenant ID.

   **Create IP address with cURL request**

   .. code::

      $ curl -s $API_ENDPOINT/ip_addresses \
              -X POST \
              -H "Content-Type: application/json" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -d "{"ip_address":{"network_id": "00000000-0000-0000-0000-000000000000",
                 "port_ids": [
                    "ad88326b-b232-45e8-9fe6-ff0618ff5de6",
                    "51ca694d-c60a-4162-8070-54b3385a7833"
                 ], "tenant_id": "1234567", "version": 4}}"
              | python -m json.tool

   **Create IP address with cURL response**

   .. code::

       {
         "ip_address": {
           "subnet_id": "2ecd46c2-64a5-4d81-84a9-58536306c851",
           "version": 4,
           "address": "23.253.64.51",
           "network_id": "00000000-0000-0000-0000-000000000000",
           "tenant_id": "661145",
           "port_ids": [
                   "ad88326b-b232-45e8-9fe6-ff0618ff5de6",
                   "51ca694d-c60a-4162-8070-54b3385a7833"
           ],
           "type": "shared",
           "id": "89875b4a-b098-414f-980a-5e9f89078a49"
         }
       }


#. Note the new shared IP ID for future reference. In this example, the ID is
   ``89875b4a-b098-414f-980a-5e9f89078a49``), but use the ID from your
   response.

.. _si-associating-shared-ip-curl:

Associating shared IP address to both servers (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps show you how to explicitly associate the new shared IP
address to servers A and B.

#. Issue the following cURL command, using your server A ID and shared IP
   address ID.

   **Associate IP address to server A with cURL request**

   .. code::

      $ curl -s https://dfw.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers/f387799f-9668-4cc7-9f0f-03c9cfc43af6/ip_associations/89875b4a-b098-414f-980a-5e9f89078a49 \
              -X PUT \
              -H "Content-Type: application/json" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool


   **Positional arguments**

   - The server A ID. In this example, the ID is
     ``f387799f-9668-4cc7-9f0f-03c9cfc43af6``.
   - The shared IP address.  In this example, the IP address is
     ``89875b4a-b098-414f-980a-5e9f89078a49``.

   **Associate IP address to server A with cURL response**

   .. code::

       {
           "ip_associations":
           [
               {
                   "id": "1",
                   "address": "166.78.9.96"
               },
               {
                   "id": "2",
                   "address": "23.253.64.51"
               }
           ]
       }


#. Repeat the process for server B.

   Issue the following cURL command, using your server B ID and shared IP
   address ID.

   **Associate IP address to server B with cURL request**

   .. code::

      $ curl -s https://dfw.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers/1a861bf7-2a5e-40a4-acb3-1fb058cf2a74/ip_associations/89875b4a-b098-414f-980a-5e9f89078a49 \
              -X PUT \
              -H "Content-Type: application/json" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

   **Positional arguments**

   - The server B ID. In this example, the ID is
     ``1a861bf7-2a5e-40a4-acb3-1fb058cf2a74``.
   - The shared IP address.  In this example, the IP address is
     ``89875b4a-b098-414f-980a-5e9f89078a49``.

   **Associate IP address to server B with cURL response**

   .. code::

       {
           "ip_associations":
           [
               {
                   "id": "1",
                   "address": "162.209.72.242"
               },
               {
                   "id": "2",
                   "address": "23.253.64.51"
               }
           ]
       }

.. _si-verifying-shared-ip-curl:

Verifying shared IP address (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps show you how to verify that the shared IP address is set
for the Server A and B public network ports.

#. Issue the following cURL command, using your port IDs and tenant ID.

   **List IP addresses with cURL request**

   .. code::

      $ curl -s $API_ENDPOINT/ip_addresses \
              -X GET \
              -H "Content-Type: application/json" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

   **List IP addresses with cURL response**

   .. code::

       {
         "ip_addresses": [
           {
             "subnet_id": "4707387f-e03d-4026-ab42-a44960e2c25e",
             "version": 4,
             "address": "10.182.1.134",
             "network_id": "11111111-1111-1111-1111-111111111111",
             "tenant_id": "661145",
             "port_ids": [
               "6899273a-6840-4875-9e26-e6c56c44ef25"
             ],
             "type": "fixed",
             "id": "82bb89ad-89dc-4cf7-a2ca-020869e33c08"
           },
           {
             "subnet_id": "2ecd46c2-64a5-4d81-84a9-58536306c851",
             "version": 4,
             "address": "23.253.64.51",
             "network_id": "00000000-0000-0000-0000-000000000000",
             "tenant_id": "661145",
             "port_ids": [
               "96924e21-127e-4460-9a14-8f9a74e4f0b1",
               "9d0db2d7-62df-4c99-80cb-6f140a5260e8"
             ],
             "type": "shared",
             "id": "89875b4a-b098-414f-980a-5e9f89078a49"
           },
           {
             "subnet_id": "c27b857f-3765-45bb-8fae-c6bec114259b",
             "version": 4,
             "address": "166.78.60.76",
             "network_id": "00000000-0000-0000-0000-000000000000",
             "tenant_id": "661145",
             "port_ids": [
               "9d0db2d7-62df-4c99-80cb-6f140a5260e8"
             ],
             "type": "fixed",
             "id": "8fbc0756-470b-4883-be03-4deaf0a6c465"
           }
         ]
       }


2. Note that both ports show up for the IP address you created. In this case,
   the shared IP address is ``23.253.64.51`` and both ports are listed.

**Next topic:** :ref:`Control Network Access<control-access-intro>`
