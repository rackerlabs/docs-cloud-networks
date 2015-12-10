.. _configure-host-routes-with-curl:

Configure host routes with cURL
-------------------------------

These sections walk you through configuring host routes by using cURL.

.. _chr-create-network-curl:

Create a network (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After you create a network, copy its network ID. You use this ID to create a subnet and 
boot the server.

#. **Create network with cURL request**

   .. code::  

      $ curl -s https://$API_ENDPOINT/v2.0/networks \
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
               "admin_state_up": null,
               "id": "a8fde776-e80f-47bb-a050-0c057d89afc3",
               "name": "RackerNet",
               "shared": false,
               "status": "ACTIVE",
               "subnets": [],
               "tenant_id": "5831008"
          }
       }
           
#. Copy the ``id`` value from the output. You will use this value when you create a subnet, 
   provision your server, or perform other related activities. In this example, the ID is 
   ``a8fde776-e80f-47bb-a050-0c057d89afc3``, but use the ID from your response.

.. _chr-create-subnet-curl:

Create a subnet with host routes (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create a subnet with host routes, you specify a network, an IP address, allocation pools, 
and host routes for your subnet.

#. Issue the following cURL command, substituting your own values for the ones shown.

   **Create subnet with cURL request**

   .. code::  

      $ curl -s https://$API_ENDPOINT/v2.0/subnets \
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
                   "tenant_id": "5831008"}}' | python -m json.tool

    **Create subnet with cURL response**

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

#. Note the host_routes attribute with the destination of ``1.1.1.0/24`` and the nexthop 
   of ``192.168.5.254``.

.. _chr-boot-server-curl:

Boot a Server (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note::

	To create your new server, you need the following information:
	
   -  The name of the new server. Use a name of your choice.
   -  The image ID. 
   -  The flavor ID. 
   -  The network ID of the network, which is ``net-id=a8fde776-e80f-47bb-a050-0c057d89afc3``.

#. Issue the following cURL command, substituting your own values for the ones shown.

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
                     {"uuid": "00000000-0000-0000-0000-000000000000"}, 
                     {"uuid": "11111111-1111-1111-1111-111111111111"}, 
                     {"uuid":"a8fde776-e80f-47bb-a050-0c057d89afc3"} 
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
                               

#. Copy the ``id`` value from the output for future reference. In this example, the ID is 
   ``a1061a57-0136-4c29-aac1-8b1a646a3001``, but use the ID from your response.

.. _chr-verify-ip-on-port-curl:

Verify the IP on the server port (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to verify the IP address on the server port. In this case, 
the IP address should be ``192.168.5.3`` from the start of the allocation pool.

#. Issue the following cURL command, substituting your own values for the ones shown.

   **Show server details with cURL request**

   .. code::  

      $ curl -k https://dfw.servers.api.rackspacecloud.com/v2.0/$TENANT_ID/servers/a1061a57-0136-4c29-aac1-8b1a646a3001  \
            -X GET
            -H "Content-Type: application/json" \
            -H "User-Agent: python-novaclient" \
            -H "Accept: application/json" \
            -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool
            
   **Positional arguments**
   
   - The server ID. In this example, the ID is ``a1061a57-0136-4c29-aac1-8b1a646a3001``.

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
                               

#. Note the IP address on the ``public`` interface (in this case, ``10.23.233.124``). Use 
   this to log in to the server in the next step.

.. _chr-login-to-server-sshcurl:

Log in to the server and verify the route (ssh)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following steps show you how to log in to the server and verify that the host route is 
configured correctly by using the command line.

#. Issue the following command at the prompt, substituting your own values for the ones shown:

   .. code::  

      $ ssh root@10.23.233.124

   The command returns output like the following example:

   .. code::  

       The authenticity of host '10.23.233.124 (10.23.233.124)' can't be established.
       RSA key fingerprint is 87:b6:8f:7a:44:80:a4:58:f8:9b:09:82:d4:b0:f9:bf.
       Are you sure you want to continue connecting (yes/no)? yes
       Warning: Permanently added '10.23.233.124' (RSA) to the list of known hosts.
       root@10.23.233.124's password:


#. Enter your password when prompted.

#. Issue the following command at the prompt:

   .. code::  

      root@ata:~# route

   The command returns output like the following example:

   .. code::  

       Kernel IP routing table
       Destination Gateway Genmask Flags Metric Ref Use Iface
       default 10.23.233.1 0.0.0.0 UG 100 0 0 eth0
       1.1.1.0 192.168.5.254 255.255.255.0 UG 0 0 0 eth2
       10.23.233.0 * 255.255.255.0 U 0 0 0 eth0
       10.181.192.0 * 255.255.248.0 U 0 0 0 eth1
       192.168.5.0 * 255.255.255.0 U 0 0 0 eth2
                           

   Notice the route ``1.1.1.0`` with Gateway ``192.168.5.254`` in the
   preceding output. That is what was expected.


**Next topic:** :ref:`Provision additional IP address and dual-stack IP addresses on an isolated network port<provision-port-ips>`