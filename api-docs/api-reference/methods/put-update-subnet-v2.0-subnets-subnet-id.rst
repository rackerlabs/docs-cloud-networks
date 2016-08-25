.. _put-update-subnet-v2.0-subnets-subnet-id:

Update subnet
~~~~~~~~~~~~~

.. code::

    PUT /v2.0/subnets/{subnet_id}

This operation updates a specified subnet.

The IP version ( ``ip_version`` ), network ID ( ``network_id`` ), and CIDR
( ``cidr`` ) cannot be updated. Attempting to update these parameters results
in a ``400 Bad Request`` error.

You cannot update allocation pools that are attached to a port.

.. warning::

   If any attributes are updated, the changes will take effect only for ports
   or cloud servers using this subnet that are created after this modification.
   Any existing ports or servers are not updated.

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


Request
--------

This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{subnet_id}               |Uuid                     |The UUID for the subnet. |
+--------------------------+-------------------------+-------------------------+

This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|**subnet**                |Object                   |The container for subnet |
|                          |                         |details.                 |
+--------------------------+-------------------------+-------------------------+
|subnet.\ **name**         |String                   |The subnet name.         |
|                          |                         |                         |
+--------------------------+-------------------------+-------------------------+
|subnet.\ **gateway_ip**   |String                   |The gateway IP address.  |
|                          |                         |                         |
+--------------------------+-------------------------+-------------------------+

**Example Update subnet: JSON request**


.. code::

   {
       "subnet": {
           "name": "private-subnet"
       }
   }



Response
--------

This table shows the body parameters for the response:

+--------------------------------------+-------------------+-------------------+
|Name                                  |Type               |Description        |
+======================================+===================+===================+
|**subnet**                            |Object             |The container for  |
|                                      |                   |subnet details.    |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **name**                     |String             |The subnet name.   |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **enable_dhcp**              |Boolean            |Indicates if DHCP  |
|                                      |                   |for the subnet is  |
|                                      |                   |enabled. This      |
|                                      |                   |value is ``false`` |
|                                      |                   |and cannot be      |
|                                      |                   |changed.           |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **network_id**               |Uuid               |The ID of the      |
|                                      |                   |attached network.  |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **tenant_id**                |Uuid               |The tenant ID of   |
|                                      |                   |the owner of the   |
|                                      |                   |subnet. Only       |
|                                      |                   |administrative     |
|                                      |                   |users can specify  |
|                                      |                   |a tenant ID other  |
|                                      |                   |than their own.    |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **dns_nameservers**          |Array              |The array of DNS   |
|                                      |                   |name servers for   |
|                                      |                   |the subnet.        |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **allocation_pools**         |Array              |The array of       |
|                                      |                   |allocation pool    |
|                                      |                   |objects.           |
+--------------------------------------+-------------------+-------------------+
|subnet.allocation_pools.\ **end**     |String             |The ending IP      |
|                                      |                   |address of the     |
|                                      |                   |subnet allocation  |
|                                      |                   |pool.              |
+--------------------------------------+-------------------+-------------------+
|subnet.allocation_pools.\ **start**   |String             |The starting IP    |
|                                      |                   |address of the     |
|                                      |                   |subnet allocation  |
|                                      |                   |pool.              |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **host_routes**              |Array              |The array of host  |
|                                      |                   |route IP addresses |
|                                      |                   |for the subnet.    |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **ip_version**               |String             |The subnet IP      |
|                                      |                   |version, which is  |
|                                      |                   |``4`` or ``6``.    |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **gateway_ip**               |String             |The subnet gateway |
|                                      |                   |IP address.        |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **cidr**                     |String             |The subnet CIDR.   |
+--------------------------------------+-------------------+-------------------+
|subnet.\ **id**                       |Uuid               |The ID of the      |
|                                      |                   |subnet.            |
+--------------------------------------+-------------------+-------------------+

**Example Update subnet: JSON response**


.. code::

   {
       "subnet": {
           "name": "private-subnet",
           "enable_dhcp": false,
           "network_id": "db193ab3-96e3-4cb3-8fc5-05f4296d0324",
           "tenant_id": "26a7980765d0414dbc1fc1f88cdb7e6e",
           "dns_nameservers": [
           ],
           "allocation_pools": [
               {
                   "start": "10.0.0.2",
                   "end": "10.0.0.254"
               }
           ],
           "host_routes": [
           ],
           "ip_version": 4,
           "gateway_ip": "10.0.0.1",
           "cidr": "10.0.0.0/24",
           "id": "08eae331-0402-425a-923c-34f7cfe39c1b"
       }
   }
