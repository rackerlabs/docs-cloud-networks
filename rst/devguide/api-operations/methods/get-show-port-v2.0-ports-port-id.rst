
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

..  _get-show-port-v2.0-ports-port-id:

Show port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/ports/{port_id}

Retrieves information for a specified port.

You can control which attributes are returned by using the ``fields`` query parameter. For information, see `Filtering Requests <http://docs.rackspace.com/networks/api/v2/cn-devguide/content/section_filtering.html>`__.



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
|{port_id}                 |Uuid                     |The UUID for the port.   |
+--------------------------+-------------------------+-------------------------+





This operation does not accept a request body.




Response
""""""""""""""""





This table shows the body parameters for the response:

+-----------------------------+------------------------+-----------------------+
|Name                         |Type                    |Description            |
+=============================+========================+=======================+
|parameters.\ **port**        |Object                  |The container for the  |
|                             |                        |port details.          |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\ **status** |String                  |The port status (      |
|                             |                        |``ACTIVE`` or ``DOWN`` |
|                             |                        |).                     |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\ **name**   |String                  |The port name.         |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\            |Bool                    |The administrative     |
|**admin_state_up**           |                        |state of the network.  |
|                             |                        |The default value is   |
|                             |                        |``true`` and cannot be |
|                             |                        |changed by the user.   |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\            |Uuid                    |The ID of the attached |
|**network_id**               |                        |network.               |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\            |Uuid                    |An array of security   |
|**security_groups**          |                        |group IDs attached to  |
|                             |                        |this port.             |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\            |Uuid                    |The ID of the tenant   |
|**tenant_id**                |                        |who owns the port.     |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\            |String                  |The ID of the entity   |
|**device_owner**             |                        |that uses this port -  |
|                             |                        |for example, a DHCP    |
|                             |                        |agent.                 |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\            |String                  |The MAC address of the |
|**mac_address**              |                        |port.                  |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\            |Uuid                    |Array of fixed IP      |
|**fixed_ips**                |                        |address objects.       |
+-----------------------------+------------------------+-----------------------+
|parameters.port.fixed_ips.\  |Uuid                    |The subnet ID for the  |
|**subnet_id**                |                        |fixed IP address for a |
|                             |                        |port.                  |
+-----------------------------+------------------------+-----------------------+
|parameters.port.fixed_ips.\  |String                  |The fixed IP address   |
|**ip_address**               |                        |for a port.            |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\ **id**     |Uuid                    |The ID of the port.    |
+-----------------------------+------------------------+-----------------------+
|parameters.port.\            |Uuid                    |The ID of the device   |
|**device_id**                |                        |that uses this port -  |
|                             |                        |for example, a virtual |
|                             |                        |server.                |
+-----------------------------+------------------------+-----------------------+







**Example Show port: JSON response**


.. code::

   {
       "port":
           {
               "admin_state_up": true, 
               "device_id": "", 
               "device_owner": null, 
               "fixed_ips": [
                   {
                       "ip_address": "192.168.3.11", 
                       "subnet_id": "739ecc58-f9a0-4145-8a06-cd415e6e5c8d"
                   }
               ], 
               "id": "10ba23f5-bb70-4fd7-a118-83f89b62e340", 
               "mac_address": "BE:CB:FE:00:00:EE", 
               "name": "port1", 
               "network_id": "6406ed30-193a-4958-aae5-7c05268d332b", 
               "security_groups": [], 
               "status": "ACTIVE", 
               "tenant_id": "123456"
           }
   }




