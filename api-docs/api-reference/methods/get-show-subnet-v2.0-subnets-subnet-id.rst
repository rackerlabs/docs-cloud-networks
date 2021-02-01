..  _get-show-subnet-v2.0-subnets-subnet-id:

Show subnet
~~~~~~~~~~~

.. code::

    GET /v2.0/subnets/{subnet_id}

This operation retrieves information for a specified subnet.

You can control which attributes are returned by using the ``fields`` query
parameter. For more information, see
:ref:`Filtering Requests <generalapi-filtering>`.


This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|201                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |Item not found.          |
+--------------------------+-------------------------+-------------------------+


Request
-------

This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{subnet_id}               |Uuid                     |The UUID for the subnet. |
+--------------------------+-------------------------+-------------------------+


This operation does not accept a request body.

Response
--------

This table shows the body parameters for the response:

+---------------------------------------+-------------------+------------------+
|Name                                   |Type               |Description       |
+=======================================+===================+==================+
|**subnet**                             |Object             |The container of  |
|                                       |                   |subnet details.   |
+---------------------------------------+-------------------+------------------+
|subnet.\ **name**                      |String             |The subnet name.  |
+---------------------------------------+-------------------+------------------+
|subnet.\ **enable_dhcp**               |Boolean            |Indicates if DHCP |
|                                       |                   |for the subnet is |
|                                       |                   |enabled. This     |
|                                       |                   |value is          |
|                                       |                   |``false`` and     |
|                                       |                   |cannot be changed.|
+---------------------------------------+-------------------+------------------+
|subnet.\ **network_id**                |Uuid               |The ID of the     |
|                                       |                   |attached network. |
+---------------------------------------+-------------------+------------------+
|subnet.\ **tenant_id**                 |Uuid               |The ID of the     |
|                                       |                   |tenant who owns   |
|                                       |                   |the subnet.       |
+---------------------------------------+-------------------+------------------+
|subnet.\ **dns_nameservers**           |Array              |The array of dns  |
|                                       |                   |name servers for  |
|                                       |                   |the subnet.       |
+---------------------------------------+-------------------+------------------+
|subnet.\ **allocation_pools**          |Array              |The array of      |
|                                       |                   |allocation pool   |
|                                       |                   |objects.          |
+---------------------------------------+-------------------+------------------+
|subnet.allocation_pools.\ **end**      |String             |The ending IP     |
|                                       |                   |address of the    |
|                                       |                   |subnet allocation |
|                                       |                   |pool.             |
+---------------------------------------+-------------------+------------------+
|subnet.allocation_pools.\ **start**    |String             |The starting IP   |
|                                       |                   |address of the    |
|                                       |                   |subnet allocation |
|                                       |                   |pool.             |
+---------------------------------------+-------------------+------------------+
|subnet.\ **host_routes**               |Array              |The array of host |
|                                       |                   |routes for the    |
|                                       |                   |subnet.           |
+---------------------------------------+-------------------+------------------+
|subnet.\ **ip_version**                |String             |The subnet IP     |
|                                       |                   |version, which is |
|                                       |                   |``4`` or ``6``.   |
+---------------------------------------+-------------------+------------------+
|subnet.\ **gateway_ip**                |String             |The gateway IP    |
|                                       |                   |address.          |
+---------------------------------------+-------------------+------------------+
|subnet.\ **cidr**                      |String             |The CIDR for the  |
|                                       |                   |subnet.           |
+---------------------------------------+-------------------+------------------+
|subnet.\ **id**                        |Uuid               |The ID of the     |
|                                       |                   |subnet.           |
+---------------------------------------+-------------------+------------------+


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


