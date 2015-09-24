
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

..  _get-retrieve-list-of-ports-v2.0-ports: 

Retrieve list of ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/ports

Retrieves list of ports to which the tenant has access.

Default policy settings for this operation return those subnets that are owned by the tenant who submits the request. You can control which attributes are returned by using the ``fields`` query parameter.



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

+------------------------------+-----------------------+-----------------------+
|Name                          |Type                   |Description            |
+==============================+=======================+=======================+
|parameters.\ **ports**        |Array                  |The array of ports.    |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\ **status** |String                 |The port status (      |
|                              |                       |``ACTIVE`` or ``DOWN`` |
|                              |                       |).                     |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\ **name**   |String                 |The port name.         |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\            |Bool                   |The administrative     |
|**admin_state_up**            |                       |state of the network.  |
|                              |                       |The default value is   |
|                              |                       |``true`` and cannot be |
|                              |                       |changed by the user.   |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\            |Uuid                   |The ID of the attached |
|**network_id**                |                       |network.               |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\            |Uuid                   |An array of security   |
|**security_groups**           |                       |group IDs attached to  |
|                              |                       |this port.             |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\            |Uuid                   |The ID of the tenant   |
|**tenant_id**                 |                       |who owns the port.     |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\            |String                 |The ID of the entity   |
|**device_owner**              |                       |that uses this port -  |
|                              |                       |for example, a DHCP    |
|                              |                       |agent.                 |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\            |String                 |The MAC address of the |
|**mac_address**               |                       |port.                  |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\            |Array                  |Array of fixed IP      |
|**fixed_ips**                 |                       |address objects.       |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.fixed_ips.\  |Uuid                   |The subnet ID for the  |
|**subnet_id**                 |                       |fixed IP address for a |
|                              |                       |port.                  |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.fixed_ips.\  |String                 |The IP address for the |
|**ip_address**                |                       |fixed IP address for a |
|                              |                       |port.                  |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\ **id**     |Uuid                   |The ID of the port.    |
+------------------------------+-----------------------+-----------------------+
|parameters.ports.\            |Uuid                   |The ID of the device   |
|**device_id**                 |                       |that uses this port -  |
|                              |                       |for example, a virtual |
|                              |                       |server.                |
+------------------------------+-----------------------+-----------------------+







**Example Retrieve list of ports: JSON response**


.. code::

   {
       "ports": [
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
       ]
   }




