
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

.. _post-bulk-create-subnet-v2.0-subnets:

Bulk create subnet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/subnets

Creates multiple subnets in a single request. Specify a list of subnets in the request body.

Bulk create operations are always atomic, meaning that either all or no subnets in the request body are created.



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





**Example Bulk create subnet: JSON request**


.. code::

   {
      "subnets":[
         {
            "cidr":"192.168.199.0/24",
            "ip_version":4,
            "network_id":"e6031bc2-901a-4c66-82da-f4c32ed89406"
         },
         {
            "cidr":"10.56.4.0/22",
            "ip_version":4,
            "network_id":"64239a54-dcc4-4b39-920b-b37c2144effa"
         }
      ]
   }





Response
""""""""""""""""





This table shows the body parameters for the response:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|subnets                   |Array                    |The array of subnets.    |
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
|tenant_id                 |Uuid                     |The ID of the tenant who |
|                          |                         |owns the subnet.         |
+--------------------------+-------------------------+-------------------------+
|dns_nameservers           |Array                    |The array of dns name    |
|                          |                         |servers for the subnet.  |
+--------------------------+-------------------------+-------------------------+
|allocation_pools          |Array                    |The array of allocation  |
|                          |                         |pool objects.            |
+--------------------------+-------------------------+-------------------------+
|end                       |String                   |The ending IP address of |
|                          |                         |the subnet allocation    |
|                          |                         |pool.                    |
+--------------------------+-------------------------+-------------------------+
|start                     |String                   |The starting IP address  |
|                          |                         |of the subnet allocation |
|                          |                         |pool.                    |
+--------------------------+-------------------------+-------------------------+
|host_routes               |Array                    |The array of host routes |
|                          |                         |for the subnet.          |
+--------------------------+-------------------------+-------------------------+
|ip_version                |String                   |The subnet IP version,   |
|                          |                         |which is ``4`` or ``6``. |
+--------------------------+-------------------------+-------------------------+
|gateway_ip                |String                   |The gateway IP address.  |
+--------------------------+-------------------------+-------------------------+
|cidr                      |String                   |The CIDR for the subnet. |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid                     |The ID of the subnet.    |
+--------------------------+-------------------------+-------------------------+







**Example Bulk create subnet: JSON response**


.. code::

   {
      "subnets":[
         {
            "allocation_pools":[
               {
                  "end":"192.168.199.254",
                  "start":"192.168.199.2"
               }
            ],
            "cidr":"192.168.199.0/24",
            "dns_nameservers":[
   
            ],
            "enable_dhcp":true,
            "gateway_ip":"192.168.199.1",
            "host_routes":[
   
            ],
            "id":"0468a7a7-290d-4127-aedd-6c9449775a24",
            "ip_version":4,
            "name":"",
            "network_id":"e6031bc2-901a-4c66-82da-f4c32ed89406",
            "tenant_id":"d19231fc08ec4bc4829b668040d34512"
         },
         {
            "allocation_pools":[
               {
                  "end":"10.56.7.254",
                  "start":"10.56.4.2"
               }
            ],
            "cidr":"10.56.4.0/22",
            "dns_nameservers":[
   
            ],
            "enable_dhcp":true,
            "gateway_ip":"10.56.4.1",
            "host_routes":[
   
            ],
            "id":"b0e7435c-1512-45fb-aa9e-9a7c5932fb30",
            "ip_version":4,
            "name":"",
            "network_id":"64239a54-dcc4-4b39-920b-b37c2144effa",
            "tenant_id":"d19231fc08ec4bc4829b668040d34512"
         }
      ]
   }




