.. _get-retrieve-list-of-ip-addresses-v2.0-ip-addresses:

Retrieve list of IP addresses
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    GET /v2.0/ip_addresses

This operation retrieves list of IP addresses for specified tenant.

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
-------

This operation does not accept a request body.

Response
--------

This table shows the body parameters for the response:

+---------------------------+-------------------------+------------------------+
|Name                       |Type                     |Description             |
+===========================+=========================+========================+
|**ip_addresses**           |Array                    |The array of IP         |
|                           |                         |addresses.              |
+---------------------------+-------------------------+------------------------+
|ip_addresses.\ **id**      |Uuid                     |The ID of the IP        |
|                           |                         |address.                |
+---------------------------+-------------------------+------------------------+
|ip_addresses.\             |Uuid                     |The network UUID of the |
|**network_id**             |                         |IP address.             |
+---------------------------+-------------------------+------------------------+
|ip_addresses.\ **address** |String                   |The IP address.         |
|                           |                         |                        |
+---------------------------+-------------------------+------------------------+
|ip_addresses.\ **port_ids**|Array                    |The array of port       |
|                           |                         |objects, containing     |
|                           |                         |port IDs. More than one |
|                           |                         |port ID indicates a     |
|                           |                         |shared IP.              |
+---------------------------+-------------------------+------------------------+
|ip_addresses.\             |Uuid                     |The subnet UUID of the  |
|**subnet_id**              |                         |IP address.             |
+---------------------------+-------------------------+------------------------+
|ip_addresses.\             |Uuid                     |The ID of the tenant    |
|**tenant_id**              |                         |who owns the IP address.|
+---------------------------+-------------------------+------------------------+
|ip_addresses.\ **version** |String                   |The subnet IP version,  |
|                           |                         |which is ``4`` or ``6``.|
+---------------------------+-------------------------+------------------------+
|ip_addresses.\ **type**    |String                   |The type of IP address. |
|                           |                         |Valid types are         |
|                           |                         |``fixed`` or ``shared``.|
+---------------------------+-------------------------+------------------------+


**Example Retrieve list of IP addresses: JSON response**


.. code::

   {
       "ip_addresses":
       [
          {
               "id": "4cacd68e-d7aa-4ff2-96f4-5c6f57dba737",
               "network_id": "6870304a-7212-443f-bd0c-089c886b44df",
               "address": "192.168.10.1",
               "port_ids":
                   ['2f693cca-7383-45da-8bae-d26b6c2d6718'],
               "subnet_id": "f11687e8-ef0d-4207-8e22-c60e737e473b",
               "tenant_id": "2345678",
               "version": "4",
               "type": "fixed"
           }
       ]
   }



