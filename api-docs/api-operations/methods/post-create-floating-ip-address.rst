.. _post-create-floating-ip-address:

Create floating IP address
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/floatingips

Creates a floating IP, and, if you specify port information, associates the floating IP 
with an internal port.

To associate the floating IP with an internal port, specify the port UUID attribute in the 
request body. If you do not specify a port UUID in the request, you can issue a **PUT** 
request instead of a **POST** request.

By default, this operation associates the floating IP address with a single fixed IP 
address that is configured on a networking port. If a port has multiple IP addresses, you 
must specify the ``fixed_ip_address`` attribute in the request body to associate a fixed IP
address with the floating IP address.

You must configure an IP address with the internal Networking port that is associated with 
the floating IP address.

.. note::

   You can create floating IPs on only external networks. When you create a floating IP, 
   you must specify the UUID of the network on which you want to create the floating IP.

This table shows the possible response codes for this operation:


+--------------------------+--------------------+----------------------------------------+
|Response Code             |Name                |Description                             |
+==========================+====================+========================================+
|201                       |Success             |Request succeeded.                      |
+--------------------------+--------------------+----------------------------------------+
|400                       |Bad Request         |A general error has occurred. Most      |
|                          |                    |likely the requested floating IP address|
|                          |                    |network was not passed in the request.  |
+--------------------------+--------------------+----------------------------------------+
|404                       |Not Found           |The floating IP address network does not|
|                          |                    |exist or the requested port does not    |
|                          |                    |exist.                                  |
+--------------------------+--------------------+----------------------------------------+
|409                       |Conflict            |A conflict has occured. Most likely     |
|                          |                    |the requested port is already associated|
|                          |                    |with a different floating IP address.   |
+--------------------------+--------------------+----------------------------------------+

Request
""""""""""""""""

This table shows the body parameters for the request:

+--------------------------+-------------------------+--------------------------+
|Name                      |Type                     |Description               |
+==========================+=========================+==========================+
|**floatingip**            |Object *(Required)*      |The container for floating|
|                          |                         |IP request parameters.    |
+--------------------------+-------------------------+--------------------------+
|floatingip.\              |Uuid *(Required)*        |The ID of the network. A  |
|**floating_network_id**   |                         |"network_id" of           |
|                          |                         |``00000000-0000-0000-     |
|                          |                         |0000-000000000000``       |
|                          |                         |provisions an IP address  |
|                          |                         |on PublicNet              |
+--------------------------+-------------------------+--------------------------+
|floatingip.\ **port_id**  |Uuid                     |The ID of the port.       |
+--------------------------+-------------------------+--------------------------+

**Example Create floating IP address: JSON request**


.. code::

   {
     "floatingip": {
        "floating_network_id": "00000000-0000-0000-0000-000000000000",
        "port_id": "ce705c24-c1ef-408a-bda3-7bbd946164ab"
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


**Example Provision IP address: JSON response**


.. code::

   {
     "floatingip": {
        "fixed_ip_address": "10.0.0.3",
        "floating_ip_address": "172.24.4.228",
        "floating_network_id": "376da547-b977-4cfe-9cba-275c80debf57",
        "id": "2f245a7b-796b-4f26-9cf9-9e82d248fda7",
        "port_id": "ce705c24-c1ef-408a-bda3-7bbd946164ab",
        "router_id": "d23abc8d-2991-4a55-ba98-2aaea84cc72f",
        "status": "ACTIVE",
        "tenant_id": "4969c491a3c74ee4af974e6d800c62de"
     }
   }

