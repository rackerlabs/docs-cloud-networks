.. _boot-server-with-curl:

Boot server with cURL
---------------------

These sections walk you through listing subnets, creating a port for your network, listing 
the ports, provisioning a server with an attached port, listing servers, and listing servers.

.. _bns-create-port-curl:

Create a port (cURL)
~~~~~~~~~~~~~~~~~~~~

Before you can attach a port and network to a server, you need to create the port.

To create a port, you specify a name for your port and the network name. After you create 
a port, copy its port ID. Use this ID to attach it to a new server.

#. Issue the following cURL command, substituting your own values for  the ones shown:

   .. code::  

      $ curl -s https://dfw.networks.api.rackspacecloud.com/v2.0/ports \
        -X POST \
        -H "Content-Type: application/json" \
        -H "Accept: application/json" \
        -H "X-Auth-Token: $token" \
        -d '{"port": {"admin_state_up": true,"device_id": "","name": "port1", "network_id": "03f240c5-6fb8-47a0-860a-c7ba83be519f"}}'| python -m json.tool

   The operation returns the response body, as shown in the following example:

   .. code::  

       {
           "port": 
           {
                "status": "ACTIVE"
                "name": "port1", 
                "admin_state_up": true, 
                "network_id": "03f240c5-6fb8-47a0-860a-c7ba83be519f", 
                "tenant_id": "5831008"
                "device_owner": null, 
                "mac_address": "AA:BB:CC:00:01:4A", 
                "fixed_ips": [
                   {
                       "subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0", 
                       "ip_address": "fc01::7"
                    }
                ], 
                "id": "79bf47e2-5107-4d93-b9c3-b78ddbc94c93",
                "security_groups": [], 
                "device_id": ""
           }
       }
                           

#. Copy the id value from the output. You will use this value when you provision your 
   server. In this example, the port ID is ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``, but 
   use the value from your response.

.. _bns-list-port-curl:

List port (cURL)
~~~~~~~~~~~~~~~~

After you create a port, you might want to list ports to confirm creation.

#. Issue the following cURL command:

   .. code::  

      $ curl https://dfw.networks.api.rackspacecloud.com/v2.0/ports \
        -X GET 
        -H "User-Agent: python-novaclient" \
        -H "Accept: application/json" \
        -H "X-Auth-Token: $token" | python -m json.tool

   The operation returns the response body as shown in the following example:

   .. code::  

       {     "ports": [
               {
                   "admin_state_up": true,
                   "device_id": "",
                   "device_owner": null,
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

                           

#. Confirm the id value from the output. You will use this value when you provision your 
   server. In this example, the port ID is ``79bf47e2-5107-4d93-b9c3-b78ddbc94c93``, but 
   use the value from your response.

   Also, notice the ``ip_address`` with the value of ``fc01::7``.

.. _bns-boot-server-curl:

Provision a server with a port on an isolated network (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create your new server and attach a port with an isolated network.

.. note::

	To create your new server and attach a port with an isolated network, you need the 
	following information:
	
   -  The name of the new server. Use a name of your choice.
   -  The image ID. 
   -  The flavor ID. 
   -  The port ID or network ID of your isolated network. 
   -  The network ID of PublicNet, which is ``00000000-0000-0000-0000-000000000000``, and 
      ServiceNet, which is ``11111111-1111-1111-1111-111111111111``.

Issue the following cURL command, substituting your own values for the ones shown:

.. code::  

   $ curl https://dfw.servers.api.rackspacecloud.com/v2/$account/servers \
     -X POST \
     -H "Content-Type: application/json" \
     -H "User-Agent: python-novaclient" \
     -H "Accept: application/json" \
     -H "X-Auth-Token: $token" \
     -d '{"server": {"name": "ata", "imageRef": "c63e20ad-6e3b-4e0b-943c-95cf3ba6c3a6", "flavorRef": "2", "max_count": 1, "min_count": 1, "networks":[{"uuid":"00000000-0000-0000-0000-000000000000"},{"uuid": "11111111-1111-1111-1111-111111111111"},{"port":"79bf47e2-5107-4d93-b9c3-b78ddbc94c93"}]}}' \
          | python -m json.tool

The operation returns the response body as shown in the following example:

.. code::  

   {
      "server": {
         "OS-DCF:diskConfig": "AUTO", 
         "id": "cfe9a69d-92ef-462f-9240-ed5b43d3d1af", 
         "links": [
            {
               "href": "https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/cfe9a69d-92ef-462f-9240-ed5b43d3d1af", 
               "rel": "self"
            }, 
            {
               "href": "https://dfw.servers.api.rackspacecloud.com/5831008/servers/cfe9a69d-92ef-462f-9240-ed5b43d3d1af", 
               "rel": "bookmark"
            }
         ], 
         "adminPass": "27L93SfBWttf"
   }
                       
.. _bns-list-networks-curl:

List server and attached networks (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After you provision your server, ensure that the server and attached network are listed.


#. Issue the following command, substituting your own values for the ones shown:

   .. code::  

      $ curl -s https://dfw.servers.api.rackspacecloud.com/v2/$account/servers/cfe9a69d-92ef-462f-9240-ed5b43d3d1af  \
        -X GET \
        -H "Content-Type: application/json" \
        -H "User-Agent: python-novaclient" \
        -H "Accept: application/json" \
        -H "X-Auth-Token: $token" | python -m json.tool

   The operation returns the disk configuration, the addresses of any attached networks, 
   flavor and image information, the server ID, and the server status. The networks include 
   any isolated networks that you have created, in addition to Rackspace public and private 
   networks.

   .. code::  

       {
           "server": {
               "OS-DCF:diskConfig": "AUTO",
               "OS-EXT-STS:power_state": 1,
               "OS-EXT-STS:task_state": null,
               "OS-EXT-STS:vm_state": "active",
               "accessIPv4": "10.13.20.27",
               "accessIPv6": "2001:db8:0:1:a8bb:ccff:fe00:14b",
               "addresses": {
                   "private": [
                       {
                           "addr": "10.181.208.32",
                           "version": 4
                       }
                   ],
                   "public": [
                       {
                           "addr": "2001:db8:0:1:a8bb:ccff:fe00:14b",
                           "version": 6
                       },
                       {
                           "addr": "10.13.20.27",
                           "version": 4
                       }
                   ],
                   "mynet": [
                       {
                           "addr": "fc01::7",
                           "version": 6
                       }
                   ]
               },
               "config_drive": "",
               "created": "2014-10-02T18:18:06Z",
               "flavor": {
                   "id": "2",
                   "links": [
                       {
                           "href": "https://dfw.servers.api.rackspacecloud.com/5831008/flavors/2",
                           "rel": "bookmark"
                       }
                   ]
               },
               "hostId": "406f461675e0cd4c4d7cd920ec726e3b156579612babf69248b97aa3",
               "id": "cfe9a69d-92ef-462f-9240-ed5b43d3d1af",
               "image": {
                   "id": "c63e20ad-6e3b-4e0b-943c-95cf3ba6c3a6",
                   "links": [
                       {
                           "href": "https://dfw.servers.api.rackspacecloud.com/5831008/images/c63e20ad-6e3b-4e0b-943c-95cf3ba6c3a6",
                           "rel": "bookmark"
                       }
                   ]
               },
               "key_name": null,
               "links": [
                   {
                       "href": "https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/cfe9a69d-92ef-462f-9240-ed5b43d3d1af",
                       "rel": "self"
                   },
                   {
                       "href": "https://dfw.servers.api.rackspacecloud.com/5831008/servers/cfe9a69d-92ef-462f-9240-ed5b43d3d1af",
                       "rel": "bookmark"
                   }
               ],
               "metadata": {},
               "name": "ata",
               "progress": 100,
               "status": "ACTIVE",
               "tenant_id": "5831008",
               "updated": "2014-10-02T18:21:36Z",
               "user_id": "207638"
           }
       }
                       

#. Servers are listed by server ID, and the addresses for any attached networks are 
   displayed. Copy the server ID for your server in case you need to update or delete your 
   server.

   Notice the ``mynet`` network IP address ``fc01::7`` in the output, which is the same as 
   the fixed\_ip IP address of the port that you created.

   Use the public IP address when you log in to your server.

.. _bns-list-ports-curl:

List ports (cURL)
~~~~~~~~~~~~~~~~~

Confirm the port information.

Issue the following cURL command:

.. code::  

   $ curl https://dfw.networks.api.rackspacecloud.com/v2.0/ports \
     -X GET \
     -H "User-Agent: python-novaclient" \
     -H "Accept: application/json" \
     -H "X-Auth-Token: $token" | python -m json.tool

The operation returns the response body as shown in the following example:

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
         },
         {
            "admin_state_up": true,
            "device_id": "cfe9a69d-92ef-462f-9240-ed5b43d3d1af",
            "device_owner": "compute:None",
            "fixed_ips": [
               {
                  "ip_address": "10.13.20.27",
                  "subnet_id": "31ac9611-df43-4300-83bb-8c6dc4fb0dec"
               },
               {
                  "ip_address": "2001:db8:0:1:a8bb:ccff:fe00:14b",
                  "subnet_id": "09589a8a-d876-43c6-bab5-4556ad1ac00d"
               }
            ],
            "id": "f5a598c6-00b5-4bcd-9787-1d74576ccf57",
            "mac_address": "AA:BB:CC:00:01:4B",
            "name": "",
            "network_id": "00000000-0000-0000-0000-000000000000",
            "security_groups": [],
            "status": "ACTIVE",
            "tenant_id": "5831008"
         },
         {
            "admin_state_up": true,
            "device_id": "cfe9a69d-92ef-462f-9240-ed5b43d3d1af",
            "device_owner": "compute:None",
            "fixed_ips": [
               {
                  "ip_address": "10.181.208.32",
                  "subnet_id": "07fbe6ae-88ec-45ae-85f3-96f6f327a5b5"
               }
            ],
            "id": "0363f484-9031-4438-9ed5-b526df24c485",
            "mac_address": "AA:BB:CC:00:01:4F",
            "name": "",
            "network_id": "11111111-1111-1111-1111-111111111111",
            "security_groups": [],
            "status": "ACTIVE",
            "tenant_id": "5831008"
         }
      ]
   }
                           

**Next topic:** :ref:`Delete your cloud network<remove-network>` 
