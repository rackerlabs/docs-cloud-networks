.. _get-show-ip-address-details-v2.0-ip-addresses-ipaddressid:

Show IP address details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/ip_addresses/{ipAddressID}

Retrieves information for a specified IP address.

This operation retrieves information for a specified IP address, using the IP address ID.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |Item not found.          |
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""


This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{ipAddressID}             |String                   |The IP address ID. Note  |
|                          |                         |that this is the ID and  |
|                          |                         |not the IP address       |
|                          |                         |itself.                  |
+--------------------------+-------------------------+-------------------------+


This operation does not accept a request body.


Response
""""""""""""""""

This table shows the body parameters for the response:


+---------------------------+-------------------------+------------------------+
|Name                       |Type                     |Description             |
+===========================+=========================+========================+
|**ip_address**             |Object                   |The container of IP     |
|                           |                         |address information.    |
+---------------------------+-------------------------+------------------------+
|ip_address.\ **id**        |Uuid                     |The ID of the IP        |
|                           |                         |address.                |
+---------------------------+-------------------------+------------------------+
|ip_address.\ **network_id**|Uuid                     |The network UUID of the |
|                           |                         |IP address.             |
+---------------------------+-------------------------+------------------------+
|ip_address.\ **address**   |String                   |The IP address.         |
|                           |                         |                        |
+---------------------------+-------------------------+------------------------+
|ip_address.\ **port_ids**  |Array                    |The array of port       |
|                           |                         |objects, containing     |
|                           |                         |port IDs. More than one |
|                           |                         |port ID indicates a     |
|                           |                         |shared IP.              |
+---------------------------+-------------------------+------------------------+
|ip_address.\ **subnet_id** |Uuid                     |The subnet UUID of the  |
|                           |                         |IP address.             |
+---------------------------+-------------------------+------------------------+
|ip_address.\ **tenant_id** |Uuid                     |The ID of the tenant    |
|                           |                         |who owns the IP address.|
+---------------------------+-------------------------+------------------------+
|ip_address.\ **version**   |String                   |The subnet IP version,  |
|                           |                         |which is ``4`` or ``6``.|
+---------------------------+-------------------------+------------------------+
|ip_address.\ **type**      |String                   |The type of IP address. |
|                           |                         |Valid types are         |
|                           |                         |``fixed`` or ``shared``.|
+---------------------------+-------------------------+------------------------+


**Example Show IP address details: JSON response**


.. code::

   {
       "ip_address": 
       {
           "id": "4cacd68e-d7aa-4ff2-96f4-5c6f57dba737",
           "network_id": "fda61e0b-a410-49e8-ad3a-64c595618c7e",
           "address": "192.168.10.1",
           "port_ids": ["6200d533-a42b-4c04-82a1-cc14dbdbf2de",
                       "9d0db2d7-62df-4c99-80cb-6f140a5260e8"],
           "subnet_id": "f11687e8-ef0d-4207-8e22-c60e737e473b",
           "tenant_id": "2345678",
           "version": "4",
           "type": "shared"
       }
   }
   


