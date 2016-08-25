.. _provisioning-port-ips-with-curl:

Provisioning a port with additional IP and dual-stack IPs with cURL
-------------------------------------------------------------------

These sections walk you through provisioning an additional IP and dual-stack
(v4 and v6) IP addresses on an isolated network port by using cURL.

.. _ppi-showing-port-curl:

Showing a port with an IPv6 address (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, look at your port with an IPv6 IP address. In this example, note the
fixed_ips ip_address of ``fc01::7``, which is an IPv6 address in hexadecimal
format.

#. **List ports with cURL request**

   .. code::

      $ curl -s $API_ENDPOINT/ports \
           -X GET \
           -H "Content-Type: application/json" \
           -H "User-Agent: python-novaclient" \
           -H "Accept: application/json" \
           -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

   **List ports with cURL response**

   .. code::

       {
           "ports": [
               {
                   "admin_state_up": true,
                   "device_id": "cfe9a69d-92ef-462f-9240-ed5b43d3d1af",
                   "device_owner": "compute:None",
                   "fixed_ips": [
                       {
                           "ip_address": "fc01::7",
                           "subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0"
                       }
                   ],
                   "id": "79bf47e2-5107-4d93-b9c3-b78ddbc94c93",
                   "mac_address": "AA:BB:CC:00:01:4A",
                   "name": "port1",
                   "network_id": "03f240c5-6fb8-47a0-860a-c7ba83be519f",
                   "security_groups": [],
                   "status": "ACTIVE",
                   "tenant_id": "5831008"
               }
          ]
       }


#. Note the id value for future reference. In this example, the ID is
   ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``), but use the ID from your
   response.

.. _ppi-getting-cidr-curl:

Getting the IPv4 CIDR for the network (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Now, note the IPv4 CIDR on the same network as the IPv6 CIDR. You should have
already created this subnet on the same network. If you have not done so,
create an IPv4 subnet (**POST /subnets**) on the same network. Because this
example assumes that the subnet has already been created, run the following
command and note the CIDR to identify the IPv4 address.

#. **List subnets with cURL request**

   .. code::

      $ curl -s $API_ENDPOINT/subnets \
           -X GET \
           -H "Content-Type: application/json" \
           -H "User-Agent: python-novaclient" \
           -H "Accept: application/json" \
           -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

   **List subnets with cURL response**

   .. code::

       {
           "subnet": {
               {
                   "allocation_pools": [
                       {
                           "end": "192.168.7.254",
                           "start": "192.168.7.1"
                       }
                   ],
                   "cidr": "192.168.7.0/24",
                   "dns_nameservers": [],
                   "enable_dhcp": null,
                   "gateway_ip": null,
                   "host_routes": [],
                   "id": "321caa1c-2105-4186-b53b-366fa623c09a",
                   "ip_version": 4,
                   "name": "",
                   "network_id": "03f240c5-6fb8-47a0-860a-c7ba83be519f",
                   "tenant_id": "5831008"
               }
           }
       }


#. Note the network_id and CIDR values for future reference. In this example,
   the network_id is ``03f240c5-6fb8-47a0-860a-c7ba83be519f`` and the CIDR is
   ``192.168.7.0/24``, but use the values from your response.

.. _ppi-adding-ip-to-port-curl:

Adding an IPv4 address on the same port (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To add an IPv4 address on the same port, update the IPv6 port with the existing
IPv6 IP address, the subnet's IPv4 ID, and the IP address from the subnet's
IPv4 CIDR. In this example, the IPv4 IP address is ``192.168.7.250`` and the
subnet_id is ``321caa1c-2105-4186-b53b-366fa623c09a``.

Issue the following cURL command, using the port ID from the preceding step in
the URI.

**Update port with cURL request**

.. code::

   $ curl -s $API_ENDPOINT/ports/79bf47e2-5107-4d93-b9c3-b78ddbc94c93 \
         -X PUT \
         -H "Content-Type: application/json" \
         -H "User-Agent: python-novaclient" \
         -H "Accept: application/json" \
         -H "X-Auth-Token: $AUTH_TOKEN" \
         -d '{"port":
               {
                 "fixed_ips": [
                   {
                       "ip_address": "fc01::7",
                       "subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0"
                   },
                   {
                       "ip_address": "192.168.7.250",
                       "subnet_id": "321caa1c-2105-4186-b53b-366fa623c09a"
                   }
                 ]
               }
             }' | python -m json.tool

**Positional arguments**

- The port ID.  In this example, the ID is
  ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``.

*Update port with cURL response**

.. code::

   {
      "port":
      {
         "status": "ACTIVE",
         "name": "port1",
         "admin_state_up": true,
         "network_id": "03f240c5-6fb8-47a0-860a-c7ba83be519f",
         "tenant_id": "5831008",
         "device_owner": "compute:None",
         "mac_address": "AA:BB:CC:00:01:4A",
         "fixed_ips": [
               {
                  "subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0",
                  "ip_address": "fc01::7"
               },
               {
                  "subnet_id": "321caa1c-2105-4186-b53b-366fa623c09a",
                  "ip_address": "192.168.7.250"
               }
         ],
         "id": "79bf47e2-5107-4d93-b9c3-b78ddbc94c93",
         "security_groups": [],
         "device_id": "cfe9a69d-92ef-462f-9240-ed5b43d3d1af"
      }
   }


.. _ppi-showing-port-again-curl:

Showing the port with both IP addresses (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following step shows you how to show port details to verify that
both IPv4 and IPv6 IP addresses are configured by using cURL.


**Show port with cURL request**

.. code::

   $ curl $API_ENDPOINT/ports/79bf47e2-5107-4d93-b9c3-b78ddbc94c93 \
         -X GET \
         -H "Content-Type: application/json" \
         -H "User-Agent: python-novaclient" \
         -H "Accept: application/json" \
         -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

**Positional arguments**

- The port ID.  In this example, the ID is ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``.

**Show port with cURL response**

.. code::

   {
      "ports": [
         {
            "admin_state_up": true,
            "device_id": "cfe9a69d-92ef-462f-9240-ed5b43d3d1af",
            "device_owner": "compute:None",
            "fixed_ips": [
               {
                  "ip_address": "fc01::7",
                  "subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0"
               },
               {
                  "ip_address": "192.168.7.250",
                  "subnet_id": "321caa1c-2105-4186-b53b-366fa623c09a"
               }
            ],
            "id": "79bf47e2-5107-4d93-b9c3-b78ddbc94c93",
            "mac_address": "AA:BB:CC:00:01:4A",
            "name": "port1",
            "network_id": "03f240c5-6fb8-47a0-860a-c7ba83be519f",
            "security_groups": [],
            "status": "ACTIVE",
            "tenant_id": "5831008"
         }
      ]
   }


.. _ppi-booting-server-curl:

Booting a Server (cURL)
^^^^^^^^^^^^^^^^^^^^^^^

The following step shows you how to boot a server by using the port ID of the
port that you configured with dual-stack IP addresses in the second step of
this procedure.

#. Issue the following cURL command, substituting your own values for the ones
   shown:

   **Boot server with cURL request**

   .. code::

      $ curl https://dfw.servers.api.rackspacecloud.com/v2.0/$TENANT_ID/servers \
              -X POST \
              -H "Content-Type: application/json" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -d '{"server":
                     {"name": "ata",
                      "imageRef": "c63e20ad-6e3b-4e0b-943c-95cf3ba6c3a6",
                      "flavorRef": "2",
                      "max_count": 1,
                      "min_count": 1,
                      "networks": [{"uuid": "00000000-0000-0000-0000-000000000000"}, {"uuid": "11111111-1111-1111-1111-111111111111"}, {"port":"79bf47e2-5107-4d93-b9c3-b78ddbc94c93"} ]
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


#. Copy the server id value from the output for future reference. In this
   example, the ID is ``1ed5bc31-153d-4570-a361-92d5a02fd428``, but use the ID
   from your response.

.. _ppi-verifying-ips-curl:

Verifying IP addresses on the server port (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following example shows you how to verify the IP addresses on the server
port. In this case, the IP addresses should be ``192.168.7.250`` and
``fc01::7``.

**Show port with cURL request**

.. code::

   $ curl -k https://dfw.servers.api.rackspacecloud.com/v2.0/$TENANT_ID/servers/1ed5bc31-153d-4570-a361-92d5a02fd428  \
         -X GET
         -H "Content-Type: application/json" \
         -H "User-Agent: python-novaclient" \
         -H "Accept: application/json" \
         -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

**Show port with cURL response**

.. code::

   {
      "server": {
         "OS-DCF:diskConfig": "AUTO",
         "OS-EXT-STS:power_state": 1,
         "OS-EXT-STS:task_state": null,
         "OS-EXT-STS:vm_state": "active",
         "accessIPv4": "10.13.20.20",
         "accessIPv6": "2001:db8:0:1:a8bb:ccff:fe00:12f",
         "addresses": {
            "private": [
               {
                  "addr": "10.181.208.27",
                  "version": 4
               }
            ],
            "public": [
               {
                  "addr": "2001:db8:0:1:a8bb:ccff:fe00:12f",
                  "version": 6
               },
               {
                  "addr": "10.13.20.20",
                  "version": 4
               }
            ],
            "Rack-4": [
               {
                  "addr": "fc01::7",
                  "version": 6
               },
               {
                  "addr": "192.168.7.250",
                  "version": 4
               }
            ]
      	},
         "config_drive": "",
         "created": "2014-10-02T19:16:13Z",
         "flavor": {
            "id": "2",
            "links": [
               {
                  "href": "https://netdev-ord.ohthree.com/5831008/flavors/2",
                  "rel": "bookmark"
               }
            ]
         },
         "hostId": "bbfe330f7bb15e4e89e06a1983abe0dbe506a57e607300ad11e3f285",
         "id": "9e524d9c-6b6e-4fb9-8460-a59fcbd0e127",
         "image": {
            "id": "c63e20ad-6e3b-4e0b-943c-95cf3ba6c3a6",
            "links": [
               {
                  "href": "https://netdev-ord.ohthree.com/5831008/images/c63e20ad-6e3b-4e0b-943c-95cf3ba6c3a6",
                  "rel": "bookmark"
               }
            ]
         },
         "key_name": null,
         "links": [
            {
               "href": "https://netdev-ord.ohthree.com/v2/5831008/servers/9e524d9c-6b6e-4fb9-8460-a59fcbd0e127",
               "rel": "self"
            },
            {
               "href": "https://netdev-ord.ohthree.com/5831008/servers/9e524d9c-6b6e-4fb9-8460-a59fcbd0e127",
               "rel": "bookmark"
            }
         ],
         "metadata": {},
         "name": "ata",
         "progress": 100,
         "status": "ACTIVE",
         "tenant_id": "5831008",
         "updated": "2014-10-02T19:18:43Z",
         "user_id": "207638"
      }
   }

**Next topic:** :ref:`Using floating IP addresses<floating-ips>`
