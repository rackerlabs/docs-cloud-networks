
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

..  _get-retrieve-list-of-subnets-v2.0-subnets: 

Retrieve list of subnets
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/subnets

Retrieves list of subnets to which the specified tenant has access.

You can control which attributes are returned by using the ``fields`` query parameter. 
For more information, see :ref:`Filtering Requests <generalapi-filtering>`.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""








This operation does not accept a request body.




Response
""""""""""""""""





This table shows the body parameters for the response:

+---------------------------------------+-------------------+------------------+
|Name                                   |Type               |Description       |
+=======================================+===================+==================+
|**subnets**                            |Array              |The array of      |
|                                       |                   |subnets.          |
+---------------------------------------+-------------------+------------------+
|subnets.\ **name**                     |String             |The subnet name.  |
+---------------------------------------+-------------------+------------------+
|subnets.\ **enable_dhcp**              |Boolean            |Indicates if DHCP |
|                                       |                   |for the subnet is |
|                                       |                   |enabled. This     |
|                                       |                   |value is          |
|                                       |                   |``false`` and     |
|                                       |                   |cannot be changed.|
+---------------------------------------+-------------------+------------------+
|subnets.\ **network_id**               |Uuid               |The ID of the     |
|                                       |                   |attached network. |
+---------------------------------------+-------------------+------------------+
|subnets.\ **tenant_id**                |Uuid               |The ID of the     |
|                                       |                   |tenant who owns   |
|                                       |                   |the subnet.       |
+---------------------------------------+-------------------+------------------+
|subnets.\ **dns_nameservers**          |Array              |The array of dns  |
|                                       |                   |name servers for  |
|                                       |                   |the subnet.       |
+---------------------------------------+-------------------+------------------+
|subnets.\ **allocation_pools**         |Array              |The array of      |
|                                       |                   |allocation pool   |
|                                       |                   |objects.          |
+---------------------------------------+-------------------+------------------+
|subnets.allocation_pools.\ **end**     |String             |The ending IP     |
|                                       |                   |address of the    |
|                                       |                   |subnet allocation |
|                                       |                   |pool.             |
+---------------------------------------+-------------------+------------------+
|subnets.allocation_pools.\ **start**   |String             |The starting IP   |
|                                       |                   |address of the    |
|                                       |                   |subnet allocation |
|                                       |                   |pool.             |
+---------------------------------------+-------------------+------------------+
|subnets.\ **host_routes**              |Array              |The array of host |
|                                       |                   |routes for the    |
|                                       |                   |subnet.           |
+---------------------------------------+-------------------+------------------+
|subnets.\ **ip_version**               |String             |The subnet IP     |
|                                       |                   |version, which is |
|                                       |                   |``4`` or ``6``.   |
+---------------------------------------+-------------------+------------------+
|subnets.\ **gateway_ip**               |String             |The gateway IP    |
|                                       |                   |address.          |
+---------------------------------------+-------------------+------------------+
|subnets.\ **cidr**                     |String             |The CIDR for the  |
|                                       |                   |subnet.           |
+---------------------------------------+-------------------+------------------+
|subnets.\ **id**                       |Uuid               |The ID of the     |
|                                       |                   |subnet.           |
+---------------------------------------+-------------------+------------------+







**Example Retrieve list of subnets: JSON response**


.. code::

   {
       "subnets": [
           {
               "allocation_pools": [
                   {
                       "end": "192.168.9.254",
                       "start": "192.168.9.1"
                   }
               ],
               "cidr": "192.168.9.0/24",
               "dns_nameservers": [],
               "enable_dhcp": false,
               "gateway_ip": null,
               "host_routes": [],
               "id": "f975defc-637d-4e2a-858b-c6cc4cec3951",
               "ip_version": 4,
               "name": "",
               "network_id": "0ebf6a10-5fc1-4f13-aca9-be0a2a00b1ac",
               "tenant_id": "123456"
           }
       ]
   }
   




