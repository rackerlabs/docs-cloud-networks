.. _put-update-ports-with-an-ip-address-v2.0-ip-addresses-ipaddressid:

Update ports with an IP address
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    PUT /v2.0/ip_addresses/{ipAddressID}

Updates the port IDs provisioned with an IP address.

This operation updates the port IDs that are sharing an IP address, using the IP address ID. 
Old ports are replaced by the new list of ports included in the request body. Only the port 
attributes may be updated with this operation.

.. note::
   Updating the IP address with an empty port list de-allocates the IP addresses from the 
   tenant using the IP address.
   

This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |
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

This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|**ip_address**            |Array                    |The container for shared |
|                          |                         |IP request parasmeters.  |
+--------------------------+-------------------------+-------------------------+
|ip_address.\ **port_ids** |Array                    |The array of port        |
|                          |                         |objects, containing port |
|                          |                         |IDs which have the       |
|                          |                         |shared IP.               |
+--------------------------+-------------------------+-------------------------+


**Example Update ports with an IP address: JSON request**


.. code::

   {
       "ip_address": {
           "port_ids": ['275b0516-206f-4421-8e42-1d3d1e4e9fb2', '66811c0a-fdbd-49d4-b1dd-f0f15a329744']
       }
   }
   

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


**Example Update ports with an IP address: JSON response**


.. code::

   {
       "ip_address": 
       {
           "id": "4cacd68e-d7aa-4ff2-96f4-5c6f57dba737",
           "network_id": "6870304a-7212-443f-bd0c-089c886b44df",
           "address": "192.168.10.1",
           "port_ids": ['275b0516-206f-4421-8e42-1d3d1e4e9fb2',
                       '66811c0a-fdbd-49d4-b1dd-f0f15a329744'],
           "subnet_id": "f11687e8-ef0d-4207-8e22-c60e737e473b",
           "tenant_id": "2345678",
           "version": "4",
           "type": "shared"
       }
   }
   
