.. _get-retrieve-list-of-floating-ip-addresses:

Retrieve list of floating IP addresses
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/floatingips

Retrieves list of floating IP addressees that are accessible to the tenant who submits the 
request. If an admin user submits the request, the response body includes all floating IP 
addresses.

You may use the `fields` query parameter to control which fields are returned in the 
response body. Additionally, you may filter results by using query string parameters.

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

+---------------------------+-------------------------+------------------------+
|Name                       |Type                     |Description             |
+===========================+=========================+========================+
|**floatingips**            |Array                    |The array of floating IP|
|                           |                         |addresses.              |
+---------------------------+-------------------------+------------------------+
|floatingips.\ **router_id**|Uuid                     |The ID of the router    |
+---------------------------+-------------------------+------------------------+
|floatingips.\ **tenant_id**|Uuid                     |The tenant ID           |
+---------------------------+-------------------------+------------------------+
|floatingips.\              |Uuid                     |The ID of the network   |
|**floating_network_id**    |                         |                        |
+---------------------------+-------------------------+------------------------+
|floatingips.\              |String                   |The fixed IP address    |
|**fixed_ip_address**       |                         |that is associated with |
|                           |                         |the floating IP.        |
+---------------------------+-------------------------+------------------------+
|floatingips.\              |String                   |The floating IP address.|
|**floating_ip_address**    |                         |                        |
+---------------------------+-------------------------+------------------------+
|floatingips.\ **port_id**  |Uuid                     |The ID of the port.     |
+---------------------------+-------------------------+------------------------+
|floatingips.\ **id**       |Uuid                     |The ID of the floating  |
|                           |                         |IP address.             |
+---------------------------+-------------------------+------------------------+
|floatingips.\ **status**   |String *(Required)*      |The status of the       |
|                           |                         |floating IP address.    |
+---------------------------+-------------------------+------------------------+


**Example Retrieve list of floating IP addresses: JSON response**


.. code::

   {
     "floatingips": [
        {
            "router_id": "d23abc8d-2991-4a55-ba98-2aaea84cc72f",
            "tenant_id": "4969c491a3c74ee4af974e6d800c62de",
            "floating_network_id": "376da547-b977-4cfe-9cba-275c80debf57",
            "fixed_ip_address": "10.0.0.3",
            "floating_ip_address": "172.24.4.228",
            "port_id": "ce705c24-c1ef-408a-bda3-7bbd946164ab",
            "id": "2f245a7b-796b-4f26-9cf9-9e82d248fda7",
            "status": "ACTIVE"
        },
        {
            "router_id": null,
            "tenant_id": "4969c491a3c74ee4af974e6d800c62de",
            "floating_network_id": "376da547-b977-4cfe-9cba-275c80debf57",
            "fixed_ip_address": null,
            "floating_ip_address": "172.24.4.227",
            "port_id": null,
            "id": "61cea855-49cb-4846-997d-801b70c71bdd",
            "status": "DOWN"
        }
     ]
   }




