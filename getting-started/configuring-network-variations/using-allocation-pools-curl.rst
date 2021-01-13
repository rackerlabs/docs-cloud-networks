.. _using-allocation-pools-with-curl:

Using allocation pools to control dynamic IP address allocation with cURL
-------------------------------------------------------------------------

These sections walk you through using allocation pools to control dynamic IP
address allocation by using cURL.

.. _uap-creating-network-curl:

Creating a network (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^

First, create a network, and then copy the network ID. You use this ID to
create a subnet and boot the server.

#. Issue the following cURL command, substituting your own values for the ones
   shown.

   **Create network with cURL request**

   .. code::

      $ curl -s $API_ENDPOINT/networks \
          -X POST \
          -H "Content-Type: application/json" \
          -H "User-Agent: python-novaclient" \
          -H "Accept: application/json" \
          -H "X-Auth-Token: $AUTH_TOKEN" \
          -d '{"network": {"name": "Rackernet"}}' | python -m json.tool

   **Create network with cURL response**

   .. code::

       {
          "network":{
               "admin_state_up": "true",
               "id": "a8fde776-e80f-47bb-a050-0c057d89afc3",
               "name": "RackerNet",
               "shared": false,
               "status": "ACTIVE",
               "subnets": [],
               "tenant_id": "5831008"
          }
       }


#. Copy the ``id`` value from the output. You will use this value when you
   create a subnet, provision your server, or perform other related activities.
   In this example, the ID is ``a8fde776-e80f-47bb-a050-0c057d89afc3``, but use
   the ID from your response.

.. _uap-creating-subnet-curl:

Creating a subnet with allocation pools (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To create a subnet with allocation pools, you specify a network, an IP
address, allocation pools, and host routes for your subnet.

#. Issue the following cURL command, substituting your own values for the ones
   shown.

   **Create subnet with cURL request**

   .. code::

      $ curl -s $API_ENDPOINT/subnets \
          -X POST \
          -H "Content-Type: application/json" \
          -H "User-Agent: python-novaclient" \
          -H "Accept: application/json" \
          -H "X-Auth-Token: $AUTH_TOKEN" \
          -d '{"subnet":
               {
                 "network_id": "a8fde776-e80f-47bb-a050-0c057d89afc3",
                 "ip_version": 4,
                 "cidr": "192.168.5.0/24",
                 "gateway_ip": null,
                 "allocation_pools": [
                   {
                       "end": "192.168.5.100",
                       "start": "192.168.5.3"
                   },
                   {
                       "end": "192.168.5.254",
                       "start": "192.168.5.103"
                   }
                 ],
                 "host_routes": [
                   {
                       "destination": "1.1.1.0/24",
                       "nexthop": "192.168.5.254"
                   }
                 ],
                 "tenant_id": "5831008"
               }
              }' | python -m json.tool

   **Create subnet with cURL response**

   .. code::

       {
          "subnet":
             {
               "allocation_pools": [
                   {
                       "end": "192.168.5.100",
                       "start": "192.168.5.3"
                   },
                   {
                       "end": "192.168.5.254",
                       "start": "192.168.5.103"
                   }
               ],
               "cidr": "192.168.5.0/24",
               "dns_nameservers": [],
               "enable_dhcp": false,
               "gateway_ip": null,
               "host_routes": [
                   {
                       "destination": "1.1.1.0/24",
                       "nexthop": "192.168.5.254"
                   }
               ],
               "id": "98c1af30-05c9-4502-8b1f-9bffde843cba",
               "ip_version": 4,
               "name": "",
               "network_id": "a8fde776-e80f-47bb-a050-0c057d89afc3",
               "tenant_id": "5831008"
            }
       }


#. Copy the ID value from the output for future reference. In this example, the
   ID is ``98c1af30-05c9-4502-8b1f-9bffde843cba``, but use the ID from your
   response.

.. _uap-booting-server-curl:

Booting server (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to boot server with cURL, using the network ID
of the network you created in the first step of this procedure.

.. note::

	To create your new server, you need the following information:

   -  The name of the new server. Use a name of your choice.
   -  The image ID.
   -  The flavor ID.
   -  The network ID of the network, which is
      ``net-id=a8fde776-e80f-47bb-a050-0c057d89afc3``.

1. Issue the following cURL command, substituting your own values for the ones
   shown.

   **Boot server with cURL request**

   .. code::

      $ curl https://dfw.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers \
          -X POST \
          -H "Content-Type: application/json" \
          -H "User-Agent: python-novaclient" \
          -H "Accept: application/json" \
          -H "X-Auth-Token: $AUTH_TOKEN" \
          -d '{"server":
                {
                  "name": "ata",
                  "imageRef": "ffa476b1-9b14-46bd-99a8-862d1d94eb7a",
                  "flavorRef": "2",
                  "max_count": 1,
                  "min_count": 1,
                  "networks": [
                     {"uuid": "00000000-0000-0000-0000-000000000000"}, {"uuid": "11111111-1111-1111-1111-111111111111"}, {"uuid":"a8fde776-e80f-47bb-a050-0c057d89afc3"}
                  ]
                }
              }' | python -m json.tool

   **Boot server with cURL response**

   .. code::

       {
           "server": {
               "OS-DCF:diskConfig": "AUTO",
               "id": "a1061a57-0136-4c29-aac1-8b1a646a3001",
               "links": [
                   {"href": "https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/a1061a57-0136-4c29-aac1-8b1a646a3001", "rel": "self"},
                   {"href": "https://dfw.servers.api.rackspacecloud.com/5831008/servers/a1061a57-0136-4c29-aac1-8b1a646a3001", "rel": "bookmark"}
               ],
               "adminPass": "ugZmn5Le6S8y"
           }
       }


#. Copy the ``id`` value from the output for future reference. In this example,
   the ID is ``a1061a57-0136-4c29-aac1-8b1a646a3001``, but use the ID from your
   response.

.. _uap-verifying-ip-curl:

Verifying IP on server port (curl)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following step shows you how to verify the IP address on the server port.
In this case, the IP address should be ``192.168.5.3`` from the start of the
allocation pool.

Issue the following cURL command, substituting your own values for the ones
shown.

**Show server details with cURL request**

.. code::

   $ curl -k https://dfw.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers/a1061a57-0136-4c29-aac1-8b1a646a3001  \
         -X GET
         -H "Content-Type: application/json" \
         -H "User-Agent: python-novaclient" \
         -H "Accept: application/json" \
         -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

**Positional arguments**

- The server ID.  In this example, the ID is
  ``a1061a57-0136-4c29-aac1-8b1a646a3001``.

**Show server details with cURL response**

.. code::

   {
      "server":
        {
            "OS-DCF:diskConfig": "AUTO",
            "OS-EXT-STS:power_state": 1,
            "OS-EXT-STS:task_state": null,
            "OS-EXT-STS:vm_state": "active",
            "accessIPv4": "10.23.233.124",
            "accessIPv6": "2001:4801:787f:205:bccb:feff:fe00:189",
            "addresses": {
               "RackerNet": [
                  {
                     "addr": "192.168.5.3",
                     "version": 4
                  }
               ],
               "private": [
                  {
                     "addr": "10.181.192.114",
                     "version": 4
                  }
               ],
               "public": [
                  {
                     "addr": "10.23.233.124",
                     "version": 4
                  },
                  {
                     "addr": "2001:4801:787f:205:bccb:feff:fe00:189",
                     "version": 6
                  }
               ]
            },
            "config_drive": "",
            "created": "2014-09-29T05:50:53Z",
            "flavor": {
               "id": "2",
               "links": [
                  {
                     "href": "https://dfw.servers.api.rackspacecloud.com/5831008/flavors/2",
                     "rel": "bookmark"
                  }
               ]
            },
            "hostId": "0488142a8f859cb4020234cc235f8cd8a22bee126726025d70c0b9ba",
            "id": "a1061a57-0136-4c29-aac1-8b1a646a3001",
            "image": {
               "id": "ffa476b1-9b14-46bd-99a8-862d1d94eb7a",
               "links": [
                  {
                     "href": "https://dfw.servers.api.rackspacecloud.com/5831008/images/ffa476b1-9b14-46bd-99a8-862d1d94eb7a",
                     "rel": "bookmark"
                  }
               ]
            },
            "key_name": null,
            "links": [
               {
                  "href": "https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/a1061a57-0136-4c29-aac1-8b1a646a3001",
                  "rel": "self"
               },
               {
                  "href": "https://dfw.servers.api.rackspacecloud.com/5831008/servers/a1061a57-0136-4c29-aac1-8b1a646a3001",
                  "rel": "bookmark"
               }
            ],
            "metadata": {},
            "name": "ata",
            "progress": 100,
            "status": "ACTIVE",
            "tenant_id": "5831008",
            "updated": "2014-09-29T05:52:19Z",
            "user_id": "207638"
         }
   }

.. _uap-creating-port-curl:

Creating a port outside the allocation pool (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Before you can attach port and network to a server, you need to create the
port.

Do this by using the ``fixed_ips`` attribute and assigning the new IP address
to the port. In this case, the allocation pool IP addresses range from
``192.168.5.3`` to ``192.168.5.100`` and the IP address for the new port is
``192.168.5.1``.

Issue the following cURL command, substituting your own values for the ones
shown.

**Create port with cURL request**

.. code::

   $ curl -k $API_ENDPOINT/ports \
       -X POST
       -H "Content-Type: application/json" \
       -H "User-Agent: python-novaclient" \
       -H "Accept: application/json" \
       -H "X-Auth-Token: $AUTH_TOKEN"
       -d '{
             "port":
             {
               "admin_state_up": true,
               "device_id": "",
               "name": "Rackerport",
               "fixed_ips": [
                   {
                       "ip_address": "192.168.5.1",
                       "subnet_id": "98c1af30-05c9-4502-8b1f-9bffde843cba"
                   }
               ],
               "network_id": "a8fde776-e80f-47bb-a050-0c057d89afc3"
             }
           }' | python -m json.tool

**Create port with cURL response**

.. code::

   {
      "port":
      {
         "admin_state_up": true,
         "device_id": "",
         "device_owner": null,
         "fixed_ips": [
            {
               "subnet_id": "98c1af30-05c9-4502-8b1f-9bffde843cba",
               "ip_address": "192.168.5.1"
            }
         ],
         "id": "e84fb78e-fc92-45aa-90b3-8786c82b5112",
         "mac_address": "BE:CB:FE:00:01:69",
         "name": "Rackerport",
         "network_id": "a8fde776-e80f-47bb-a050-0c057d89afc3",
         "security_groups": [],
         "status": "ACTIVE",
         "tenant_id": "5831008"
      }
   }

**Next topic:** :ref:`Configuring host routes<configuring-host-routes>`
