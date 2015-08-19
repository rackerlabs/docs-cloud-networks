
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Show subnet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/subnets/{subnet_id}

Retrieves information for a specified subnet.

You can control which attributes are returned by using the ``fields`` query parameter. For information, see `Filtering Requests <http://docs.rackspace.com/networks/api/v2/cn-devguide/content/section_filtering.html>`__.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
<<<<<<< HEAD
|201                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |Item not found.          |
=======
|201                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|401                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|404                       |                         |                         |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""

<<<<<<< HEAD
=======



>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{subnet_id}               |Uuid                     |The UUID for the subnet. |
+--------------------------+-------------------------+-------------------------+





This operation does not accept a request body.




Response
""""""""""""""""


<<<<<<< HEAD
=======


>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
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
<<<<<<< HEAD
|                          |                         |This value is ``false``  |
|                          |                         |and cannot be changed.   |
=======
|                          |                         |This value is false and  |
|                          |                         |cannot be changed.       |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
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





**Example Show subnet: JSON response**


.. code::

    {
        "subnet": {
            "name": "my_subnet",
            "enable_dhcp": false,
            "network_id": "d32019d3-bc6e-4319-9c1d-6722fc136a22",
            "tenant_id": "4fd44f30292945e481c7b8a0c8908869",
            "dns_nameservers": [
            ],
            "allocation_pools": [
                {
                    "start": "192.0.0.2",
                    "end": "192.255.255.254"
                }
            ],
            "host_routes":[
            ],
            "ip_version": 4,
            "gateway_ip": "192.0.0.1",
            "cidr": "192.0.0.0/8",
            "id": "54d6f61d-db07-451c-9ab3-b9609b6b6f0b"
        }
    }
    


