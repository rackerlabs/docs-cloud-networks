.. _get-show-floating-ip-address-detailsd:

Show floating IP address details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/floatingips/{floatingip_id}

Retrieves information for a specified IP address.

This operation retrieves information for a specified floating IP address, using the IP 
address ID.

You may use the `fields` query parameter to control which fields are returned in the 
response body. For more information about filering, see 
:ref:`Filtering requests<generalapi-filtering>`.

This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |Floating IP not found.   |
+--------------------------+-------------------------+-------------------------+

Request
""""""""""""""""


This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{floatingip_id}           |String                   |The IP address ID. Note  |
|                          |                         |that this is the ID and  |
|                          |                         |not the IP address       |
|                          |                         |itself.                  |
+--------------------------+-------------------------+-------------------------+

This table shows the query parameters for the request:

+-----------+----------+-------------------------------------------------------+
|Name       |Type      |Description                                            |
+===========+==========+=======================================================+
|fields     |String    |Use this query parameter to control which fields are   | 
|           |          |returned in the response body. For example,            |
|           |          |``?fields=fixed_ip_address&fields=floating_ip_address``|
|           |          |would filter the response to those two columns.        |
+-----------+----------+-------------------------------------------------------+

This operation does not accept a request body.


Response
""""""""""""""""

This table shows the body parameters for the response:


+---------------------------+-------------------------+------------------------+
|Name                       |Type                     |Description             |
+===========================+=========================+========================+
|**floatingip**             |Object                   |The container for the   |
|                           |                         |floating IP address info|
+---------------------------+-------------------------+------------------------+
|floatingip.\ **router_id** |Uuid                     |The ID of the router    |
+---------------------------+-------------------------+------------------------+
|floatingip.\ **tenant_id** |Uuid                     |The tenant ID           |
+---------------------------+-------------------------+------------------------+
|floatingip.\               |Uuid                     |The ID of the network   |
|**floating_network_id**    |                         |                        |
+---------------------------+-------------------------+------------------------+
|floatingip.\               |String                   |The fixed IP address    |
|**fixed_ip_address**       |                         |that is associated with |
|                           |                         |the floating IP.        |
+---------------------------+-------------------------+------------------------+
|floatingip.\               |String                   |The floating IP address.|
|**floating_ip_address**    |                         |                        |
+---------------------------+-------------------------+------------------------+
|floatingip.\ **port_id**   |Uuid                     |The ID of the port.     |
+---------------------------+-------------------------+------------------------+
|floatingip.\ **id**        |Uuid                     |The ID of the floating  |
|                           |                         |IP address.             |
+---------------------------+-------------------------+------------------------+
|floatingip.\ **status**    |String *(Required)*      |The status of the       |
|                           |                         |floating IP address.    |
+---------------------------+-------------------------+------------------------+



**Example Show floating IP address details: JSON response**


.. code::

   {
     "floatingip": {
        "floating_network_id": "376da547-b977-4cfe-9cba-275c80debf57",
        "router_id": "d23abc8d-2991-4a55-ba98-2aaea84cc72f",
        "fixed_ip_address": "10.0.0.3",
        "floating_ip_address": "172.24.4.228",
        "tenant_id": "4969c491a3c74ee4af974e6d800c62de",
        "status": "ACTIVE",
        "port_id": "ce705c24-c1ef-408a-bda3-7bbd946164ab",
        "id": "2f245a7b-796b-4f26-9cf9-9e82d248fda7"
     }
   }


