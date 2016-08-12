.. _floating-ip-with-curl:

Using floating IP Adresses with cURL
------------------------------------

These sections walk you through creating a network with a port, attaching the
network to a new or existing server, allocating a new floating IP address
with the server, and seamlessly transferring traffic from a fixed IP address to
the floating IP address.

.. important::

   At this time floating IP functionality is only available in the ```IAD``
   datacenter, so all your regional resources should be located in that
   region.


.. _fi-creating-network-curl:

Creating network (cURL)
~~~~~~~~~~~~~~~~~~~~~~~

Create the network.

#. Issue the following cURL command, substituting your own values for the ones
   shown.

   **Create network with cURL request**

   .. code::

      $ curl -s $API_ENDPOINT/networks \
              -X POST \
              -H "Content-Type: application/json" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -d '{"network": {"name": "FLIPnet"}}' | python -m json.tool

   **Create network with cURL response**

   .. code::

      {
          "network":{
             "status":"ACTIVE",
             "subnets":[
             ],
             "name":"FLIPnet",
             "admin_state_up":true,
             "tenant_id":"53501b3c25d34f8ea293c03298caed60",
             "shared":false,
             "id":"29f52c7e-6efd-4335-a14a-db77d32a2555",
          }
      }


#. Copy the ``id`` value from the output. You will need this value when you
   perform other related activities. In this example, the ID is
   ``29f52c7e-6efd-4335-a14a-db77d32a2555``, but use the ID from your response.

.. _fi-creating-subnet-curl:

Creating subnet (cURL)
~~~~~~~~~~~~~~~~~~~~~~

Create the subnet for the network with a ``gateway_ip`` and an
``allocation pool`` with ``start`` and ``end`` values for the pool. The gateway
IP address is not within the allocation pool. Remember that ``x.x.x.0`` and
``x.x.x.255`` are reserved subnet addresses. You need  the subnet to actually
serve traffic.

#. Issue the following cURL command, substituting your own values for the ones
   shown.

   **Create subnet with cURL request**

   .. code::

      $ curl -s  $API_ENDPOINT/subnets
             -X POST
             -H "Content-Type: application/json"
             -H "Accept: application/json"
             -H "X-Auth-Token: $AUTH_TOKEN"
             -d '{"subnet":
                     {"name": "FLIPnet_sn",
                      "cidr":"192.168.33.0/24",
                      "gateway_ip": "192.168.33.1",
                      "network_id": "29f52c7e-6efd-4335-a14a-db77d32a2555",
                      "ip_version": "4",
                      "allocation_pools": [
                         {"start": "192.168.33.2",
                          "end": "192.168.33.254"}
                      ]}}'| python -m json.tool

   **Create subnet with cURL response**

   .. code::

      {
          "subnet":
             {
               "cidr":"192.168.33.0/24",
               "ip_version":4,
               "network_id":"29f52c7e-6efd-4335-a14a-db77d32a2555",
               "allocation_pools":[
               {
                   "start":"192.168.33.2",
                   "end":"192.168.33.254"
               },
               "dns_nameservers":[
               ],
               "host_routes":[
               ],
               "enable_dhcp":false,
               "gateway_ip":192.168.33.1,
               "id":"23e3059e-4f39-4f7f-8cf2-c326e5de6c37",
               "name":"FLIPnet_sn",
               "tenant_id":"53501b3c25d34f8ea293c03298caed60"
            }
      }


.. _fi-creating-server-curl:

Creating or preparing a server (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you already have a server, remove the public interface as shown in step 1.
If you do not have a server, create one without a public interface as shown in
step 2.

1. Existing server option

   1.1. For an existing server, issue the following cURL command to remove the
   public interface, substituting your own values for the ones shown. In
   this example, the server id is ``1ed5bc31-153d-4570-a361-92d5a02fd428``
   and the interface is ``a589b11b-cd51-4274-8ec0-832ce799d156``.

       **Remove public interface from existing server with cURL request**

       .. code::

          $ curl -s https://iad.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers/1ed5bc31-153d-4570-a361-92d5a02fd428/os-virtual-interfacesv2/a589b11b-cd51-4274-8ec0-832ce799d156
            -X DELETE \
            -H "X-Auth-Token: $AUTH_TOKEN"

       **Remove public interface from existing server with cURL response**

       This operation does not return a request body.  If it is successful, it
       returns an ``HTTP 200`` return code.

   1.2. Create a port on the network, by issuing the following cURL command,
   substituting your own values for the ones shown.

        **Create port with cURL request**

        .. code::

           $ curl -s $API_ENDPOINT/ports
              -X POST
              -H "Content-Type: application/json" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -d '{"port":
                    {
                      "name": "FLIP_port",
                      "device_id": "",
                      "network_id": "29f52c7e-6efd-4335-a14a-db77d32a2555"}
                    }' | python -m json.tool

        **Create port with cURL response**

        .. code::

           {
            "port": {
               "admin_state_up": true,
               "device_id": "",
               "device_owner": null,
               "fixed_ips": [
                 {
                     "ip_address": "192.168.33.2",
                     "subnet_id": "525b1720-4a27-4e6d-9cc7-14829e97b8b5"
                 }
               ],
               "id": "e84fb78e-fc92-45aa-90b3-8786c82b5112",
               "mac_address": "BC:76:4E:20:3F:09",
               "name": "FLIP_port",
               "network_id": "29f52c7e-6efd-4335-a14a-db77d32a2555",
               "security_groups": [],
               "status": "ACTIVE",
               "tenant_id": "53501b3c25d34f8ea293c03298caed605"
            }
         }

   1.3. Note the port id, in this case ``e84fb78e-fc92-45aa-90b3-8786c82b5112``,
   but use your own value.

2. New server option

   2.1. If you don't already have a server, issue the following cURL command to
   create one without a public interface, substituting your own values for
   the ones shown.

       **Boot server without a public interface with cURL request**

       .. code::

          $ curl https://iad.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers \
              -X POST \
              -H "Content-Type: application/json" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -d '{"server":
                     {"name": "FLIPserver",
                      "imageRef": "c63e20ad-6e3b-4e0b-943c-95cf3ba6c3a6",
                      "flavorRef": "2",
                      "max_count": 1,
                      "min_count": 1,
                      "networks": [{"uuid": "29f52c7e-6efd-4335-a14a-db77d32a2555"}, {"uuid": "11111111-1111-1111-1111-111111111111"}]
               }}' | python -m json.tool

       **Boot server with cURL response**

       .. code::

          {
            "server":
             {
               "OS-DCF:diskConfig": "AUTO",
               "id": "1ed5bc31-153d-4570-a361-92d5a02fd428",
               "links":[
                   {
                       "href": "https://netdev-ord.ohthree.com/v2/5831008/servers/1ed5bc31-153d-4570-a361-92d5a02fd428",
                       "rel": "self"
                   },
                   {
                       "href": "https://netdev-ord.ohthree.com/5831008/servers/1ed5bc31-153d-4570-a361-92d5a02fd428",
                       "rel": "bookmark"
                   }
               ],
               "adminPass": "LuXD49ijFf3D"
             }
          }

   2.2 Once you've created the server, identify the correct port by issuing the
   following cURL command. In this example the server id is
   ``1ed5bc31-153d-4570-a361-92d5a02fd428``, but substitute your own value.

       **Find port with cURL request**

       .. code::

          curl -s -X GET https://iad.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers/1ed5bc31-153d-4570-a361-92d5a02fd428/os-virtual-interfacesv2'

       **Find port with cURL request**

       .. code::

          {
            "virtual_interfaces": [
              {
                "ip_addresses": [
                  {
                    "network_id": "11111111-1111-1111-1111-111111111111",
                    "network_label": "private",
                    "address": "10.176.8.112"
                  }
                ],
                "id": "45314c82-47a5-4448-8937-2b01be1980bf",
                "mac_address": "BC:76:4E:20:B4:BF"
              },
              {
                "ip_addresses": [
                  {
                    "network_id": "29f52c7e-6efd-4335-a14a-db77d32a2555",
                    "network_label": "FLIPnet",
                   "address": "192.168.33.2"
                  }
                ],
                "id": "94cae8b5-3319-48fa-add9-537bcbc77535",
                "mac_address": "BC:76:4E:20:B4:9E"
              }
            ]
          }

   2.3 Note the port id, in this case ``94cae8b5-3319-48fa-add9-537bcbc77535``,
   but use your own value.

.. _fi-allocate-floating-ip-curl:

Allocate floating IP address (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to allocate a Floating IP and associate it
with the port on the Cloud Server instance connected to the Cloud Network.


#. Issue the following cURL command, substituting your own port id for the
   port id in the command.

   **Allocate floating IP address with cURL request**

   .. code::

      $ curl -s $API_ENDPOINT/floatingips
        -X POST
        -H "Content-Type: application/json"
        -H "Accept: application/json"
        -H "X-Auth-Token: $AUTH_TOKEN"
        -d '{"floatingip":
              {
                 "floating_network_id":"00000000-0000-0000-0000-000000000000",
                 "port_id":"e84fb78e-fc92-45aa-90b3-8786c82b5112"
            }}' | python -m json.tool

   **Allocate floating IP address with cURL response**

   .. code::

      {
          "port": {
              "admin_state_up": true,
              "device_id": "",
              "device_owner": null,
              "fixed_ips": [
                  {
                      "ip_address": "192.168.33.2",
                      "subnet_id": "525b1720-4a27-4e6d-9cc7-14829e97b8b5"
                  }
              ],
              "id": "b396f184-4c82-47c7-a932-947c2c5acb21",
              "mac_address": "BC:76:4E:20:3F:09",
              "name": "FLIP_port",
              "network_id": "2a68d5be-65f4-45b7-99a0-6a6f1d98525d",
              "security_groups": [],
              "status": "ACTIVE",
              "tenant_id": "53501b3c25d34f8ea293c03298caed605"
          }
      }


.. COMMENT .. _fi-seamless-transfer-curl:

.. COMMENT Seamless transfer of traffic from fixed IP to floating IP  (cURL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. COMMENT In the preceding steps you assigned a floating IP address to your server. To
           seamlessly transfer traffic from an existing fixed IP address server to this
           floating IP server, perform the following two steps.

           #.	Update DNS to point your domain from the original fixed IP address server's
               public-net IP address to the new floating IP address.


           #.	Wait for the fixed IP address server to stop receiving requests, and then
               spin it down.



**Next topic:** :ref:`Control Network Access<control-access-intro>`
