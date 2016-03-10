.. _put-update-floating-ip-address:

Update floating IP address
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    PUT /v2.0/floatingips/{floatingip_id}

This operation updates the association of a floating IP address with a port, either
associating or disassociating it.

To disassociate a floating IP address from a port, set the ``port_id`` attribute to null 
or omit it from the request body.

This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|201                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|400                       |Bad Request              |The requested floating IP|
|                          |                         |network was not passed in|
|                          |                         |the request or the       |
|                          |                         |requested port and IP are|
|                          |                         |already associated.      |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |The requested port or    |
|                          |                         |floating IP address do   |
|                          |                         |not exist.               |
+--------------------------+-------------------------+-------------------------+
|409                       |Conflict                 |The requested port does  |
|                          |                         |not exist or is already  |
|                          |                         |associated with another  |
|                          |                         |floating IP address      |
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

**Example Update floating IP address (association): JSON request**

.. code::

   {
     "floatingip": {
        "port_id": "fc861431-0e6c-4842-a0ed-e2363f9bc3a8"
     }
   }

**Example Update floating IP address (disassociation): JSON request**

.. code::

   {
     "floatingip": {
        "port_id": null
     }
   }


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


**Example Update floating IP address (association): JSON response**


.. code::

   {
     "floatingip": {
        "floating_network_id": "376da547-b977-4cfe-9cba-275c80debf57",
        "router_id": "d23abc8d-2991-4a55-ba98-2aaea84cc72f",
        "fixed_ip_address": "10.0.0.4",
        "floating_ip_address": "172.24.4.228",
        "tenant_id": "4969c491a3c74ee4af974e6d800c62de",
        "status": "ACTIVE",
        "port_id": "fc861431-0e6c-4842-a0ed-e2363f9bc3a8",
        "id": "2f245a7b-796b-4f26-9cf9-9e82d248fda7"
     }
   }

 **Example Update floating IP address (disassociation): JSON response**
 
 .. code::
 
    {
     "floatingip": {
        "floating_network_id": "376da547-b977-4cfe-9cba-275c80debf57",
        "router_id": "d23abc8d-2991-4a55-ba98-2aaea84cc72f",
        "fixed_ip_address": null,
        "floating_ip_address": "172.24.4.228",
        "tenant_id": "4969c491a3c74ee4af974e6d800c62de",
        "status": "ACTIVE",
        "port_id": null,
        "id": "2f245a7b-796b-4f26-9cf9-9e82d248fda7"
     }
   }

