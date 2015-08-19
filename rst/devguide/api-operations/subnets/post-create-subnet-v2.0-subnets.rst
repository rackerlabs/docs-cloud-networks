
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Create subnet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/subnets

Creates a subnet on a specified network.

You cannot create subnets on the PublicNet and ServiceNet networks. Only one IPv4 subnet and one IPv6 subnet are permitted per network.

If the ``gateway_ip`` parameter is not specified, it is set to ``null``.

If the ``allocation_pools`` parameter is not specified, Cloud Networks automatically allocates pools for covering all IP addresses in the CIDR, excluding the address reserved for the subnet gateway. Otherwise, you can explicitly specify allocation pools as shown in the following example.

.. warning::
   When you specify both the ``allocation_pools`` and ``gateway_ip`` parameters, you must ensure that the gateway IP address does not overlap with the specified allocation pools; otherwise a ``409 Conflict`` error occurs.
   
   



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|201                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|400                       |Error                    |A general error has      |
|                          |                         |occured.                 |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+
|403                       |Forbidden                |The request is forbidden.|
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |Item not found.          |
+--------------------------+-------------------------+-------------------------+
|409                       |conflict                 |There is a resource      |
|                          |                         |conflict.                |
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""








This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|subnet                    |Object *(Required)*      |The container for subnet |
|                          |                         |details.                 |
+--------------------------+-------------------------+-------------------------+
|name                      |String *(Optional)*      |The subnet name.         |
+--------------------------+-------------------------+-------------------------+
|network_id                |Uuid *(Required)*        |The ID of the attached   |
|                          |                         |network.                 |
+--------------------------+-------------------------+-------------------------+
|cidr                      |String *(Required)*      |The subnet CIDR.         |
+--------------------------+-------------------------+-------------------------+
|ip_version                |String *(Required)*      |The subnet IP version,   |
|                          |                         |which is ``4`` or ``6``. |
+--------------------------+-------------------------+-------------------------+
|allocation_pools          |Array *(Optional)*       |The array of allocation  |
|                          |                         |pool objects.            |
+--------------------------+-------------------------+-------------------------+
|end                       |String *(Optional)*      |The ending IP address of |
|                          |                         |the subnet allocation    |
|                          |                         |pool.                    |
+--------------------------+-------------------------+-------------------------+
|start                     |String *(Optional)*      |The starting IP address  |
|                          |                         |of the subnet allocation |
|                          |                         |pool.                    |
+--------------------------+-------------------------+-------------------------+
|host_routes               |Array *(Optional)*       |The array of host route  |
|                          |                         |IP addresses for the     |
|                          |                         |subnet.                  |
+--------------------------+-------------------------+-------------------------+
|destination               |String *(Optional)*      |The host route           |
|                          |                         |destination IP address   |
|                          |                         |and port.                |
+--------------------------+-------------------------+-------------------------+
|next_hop                  |String *(Optional)*      |The host route           |
|                          |                         |destination next hop IP  |
|                          |                         |address.                 |
+--------------------------+-------------------------+-------------------------+
|gateway_ip                |String *(Optional)*      |The subnet gateway IP    |
|                          |                         |address.                 |
+--------------------------+-------------------------+-------------------------+





**Example Create subnet: JSON request**


.. code::

    {
        "subnet": {
            "network_id": "d32019d3-bc6e-4319-9c1d-6722fc136a22",
            "ip_version": 4,
            "name":"",
            "cidr": "192.168.199.0/24"
        }
    }
    


**Example Create Subnet with host routes: JSON request**


.. code::

    {
        "subnet": {
        "network_id": "eaac8bec-9caf-43a2-8a9d-18ad3d1709c9",
        "ip_version": 4,
        "name":"",
        "cidr": "192.168.19.0/24",
        "host_routes": [
                {
                    "destination": "1.1.1.0/24",
                    "nexthop": "192.168.19.20"
                }
            ]
        }
    }
    


**Example Create Subnet with allocation pools and gateway IP: JSON request**


.. code::

    {
        "subnet":
        {
            "network_id": "c23f2b6c-efa1-4b66-8bdf-34cda87b8102",
            "ip_version": 4,
            "name":"",
            "cidr": "192.168.62.0/24",
            "gateway_ip": "192.168.62.1",
            "allocation_pools": [
                {
                    "end": "192.168.62.21",
                    "start": "192.168.62.11"
                },
                {
                    "end": "192.168.62.251",
                    "start": "192.168.62.241"
                }
            ],
            "tenant_id": "123456"
        }
    }
    
    


Response
""""""""""""""""




This table shows the body parameters for the response:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|subnet                    |Object                   |The container for the    |
|                          |                         |subnet details.          |
+--------------------------+-------------------------+-------------------------+
|name                      |String                   |The subnet name.         |
+--------------------------+-------------------------+-------------------------+
|enable_dhcp               |Boolean                  |Indicates if DHCP for    |
|                          |                         |the subnet is enabled.   |
|                          |                         |This value is ``false``  |
|                          |                         |and cannot be changed.   |
+--------------------------+-------------------------+-------------------------+
|network_id                |Uuid                     |The ID of the attached   |
|                          |                         |network.                 |
+--------------------------+-------------------------+-------------------------+
|tenant_id                 |Uuid                     |The tenant ID of the     |
|                          |                         |owner of the subnet.     |
|                          |                         |Only administrative      |
|                          |                         |users can specify a      |
|                          |                         |tenant ID other than     |
|                          |                         |their own.               |
+--------------------------+-------------------------+-------------------------+
|dns_nameservers           |Array                    |The array of DNS name    |
|                          |                         |servers for the subnet.  |
+--------------------------+-------------------------+-------------------------+
|allocation_pools          |Array                    |The array of allocation  |
|                          |                         |pool objects.            |
+--------------------------+-------------------------+-------------------------+
|start                     |String                   |The starting IP address  |
|                          |                         |of the subnet allocation |
|                          |                         |pool.                    |
+--------------------------+-------------------------+-------------------------+
|host_routes               |Array                    |The array of host route  |
|                          |                         |IP addresses for the     |
|                          |                         |subnet.                  |
+--------------------------+-------------------------+-------------------------+
|ip_version                |String                   |The subnet IP version,   |
|                          |                         |which is ``4`` or ``6``. |
+--------------------------+-------------------------+-------------------------+
|gateway_ip                |String                   |The subnet gateway IP    |
|                          |                         |address.                 |
+--------------------------+-------------------------+-------------------------+
|cidr                      |String                   |The subnet CIDR.         |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid                     |The ID of the subnet.    |
+--------------------------+-------------------------+-------------------------+





**Example Create subnet: JSON response**


.. code::

    {
        "subnet": {
            "name": "",
            "enable_dhcp": false,
            "network_id": "d32019d3-bc6e-4319-9c1d-6722fc136a22",
            "tenant_id": "4fd44f30292945e481c7b8a0c8908869",
            "dns_nameservers": [],
            "allocation_pools": [
                {
                    "start": "192.168.199.1",
                    "end": "192.168.199.254"
                }
            ],
            "host_routes": [],
            "ip_version": 4,
            "gateway_ip": null,  
            "cidr": "192.168.199.0/24",
            "id": "3b80198d-4f7b-4f77-9ef5-774d54e17126"
        }
    }
    


**Example Create Subnet with host routes: JSON response**


.. code::

    {
        "subnet": {
            "allocation_pools": [
                {
                   "end": "192.168.19.254",
                   "start": "192.168.19.1"
                }
             ],
            "cidr": "192.168.19.0/24",
            "dns_nameservers": [],
            "enable_dhcp": false,
            "gateway_ip": null,
            "host_routes": [
                {
                    "destination": "1.1.1.0/24",
                    "nexthop": "192.168.19.20"
                }
            ],
            "id": "f46041c1-7c39-4d15-a018-de2ccc31931c",
            "ip_version": 4,
            "name": "",
            "network_id": "eaac8bec-9caf-43a2-8a9d-18ad3d1709c9",
            "tenant_id": "546428"
        }
    }


**Example Create Subnet with allocation pools and gateway IP: JSON response**


.. code::

    {
        "allocation_pools": [
            {
                "end": "192.168.62.21",
                "start": "192.168.62.11"
            },
            {
                "end": "192.168.62.251",
                "start": "192.168.62.241"
            }
        ],
        "cidr": "192.168.62.0/24",
        "dns_nameservers": [],
        "enable_dhcp": false,
        "gateway_ip": "192.168.62.1",
        "host_routes": [],
        "id": "bbda1637-79df-4ec6-8399-baa8e01dda22",
        "ip_version": 4,
        "name": "",
        "network_id": "c23f2b6c-efa1-4b66-8bdf-34cda87b8102",
        "tenant_id": "546428"
    }


