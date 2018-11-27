.. _post-provision-ip-address-v2.0-ip-addresses:

Provision IP address
~~~~~~~~~~~~~~~~~~~~

.. code::

    POST /v2.0/ip_addresses

This operation allows you to provision an IP address on a specified network.

A list of port_ids must be specified to provision the IP address on the
specified ports.

You can provision a shared IP with a specific IP address (Cloud Networks only).

.. note::

   When provisioning IP addresses, the type is automatically set to ``shared``
   when multiple port IDs are included in the request.


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
|404                       |Not Found                |Item not found.          |
+--------------------------+-------------------------+-------------------------+


Request
-------

This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|**ip_address**            |Object                   |The container for shared |
|                          |                         |IP request parameters.   |
+--------------------------+-------------------------+-------------------------+
|ip_address.\              |Uuid                     |The ID of the network. A |
|**network_id**            |                         |"network_id" of          |
|                          |                         |``00000000-0000-0000-    |
|                          |                         |0000-000000000000``      |
|                          |                         |provisions an IP address |
|                          |                         |on PublicNet             |
+--------------------------+-------------------------+-------------------------+
|ip_address.\ **port_ids** |Array                    |The array of port        |
|                          |                         |objects, containing port |
|                          |                         |IDs. At least two ports  |
|                          |                         |are required to          |
|                          |                         |provision a shared IP    |
|                          |                         |address.                 |
+--------------------------+-------------------------+-------------------------+
|ip_address.\ **version**  |String                   |The subnet IP version,   |
|                          |                         |which is ``4`` or ``6``. |
+--------------------------+-------------------------+-------------------------+

**Example Provision IP address: JSON request**


.. code::

   {
       "ip_address": {
           "network_id": "00000000-0000-0000-0000-000000000000",
           "version": 4,
           "port_ids": [
               "6200d533-a42b-4c04-82a1-cc14dbdbf2de",
               "9d0db2d7-62df-4c99-80cb-6f140a5260e8"
            ]
       }
   }


**Example Provision IP address with a specified IP: JSON request**


.. code::

   {
       "ip_address": {
           "network_id": "00000000-0000-0000-0000-000000000000",
           "version": 4,
           "port_ids": [
               "6200d533-a42b-4c04-82a1-cc14dbdbf2de",
               "9d0db2d7-62df-4c99-80cb-6f140a5260e8"
            ]
       }
   }

Response
--------

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


**Example Provision IP address: JSON response**


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

