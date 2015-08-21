
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

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

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|ports                     |Array                    |The array of ports.      |
+--------------------------+-------------------------+-------------------------+
|status                    |String                   |The port status (        |
|                          |                         |``ACTIVE`` or ``DOWN`` ).|
+--------------------------+-------------------------+-------------------------+
|name                      |String                   |The port name.           |
+--------------------------+-------------------------+-------------------------+
|admin_state_up            |Bool                     |The administrative state |
|                          |                         |of the network. The      |
|                          |                         |default value is         |
|                          |                         |``true`` and cannot be   |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
|network_id                |Uuid                     |The ID of the attached   |
|                          |                         |network.                 |
+--------------------------+-------------------------+-------------------------+
|security_groups           |Uuid                     |An array of security     |
|                          |                         |group IDs attached to    |
|                          |                         |this port.               |
+--------------------------+-------------------------+-------------------------+
|tenant_id                 |Uuid                     |The ID of the tenant who |
|                          |                         |owns the port.           |
+--------------------------+-------------------------+-------------------------+
|device_owner              |String                   |The ID of the entity     |
|                          |                         |that uses this port -    |
|                          |                         |for example, a DHCP      |
|                          |                         |agent.                   |
+--------------------------+-------------------------+-------------------------+
|mac_address               |String                   |The MAC address of the   |
|                          |                         |port.                    |
+--------------------------+-------------------------+-------------------------+
|fixed_ips                 |Array                    |Array of fixed IP        |
|                          |                         |address objects.         |
+--------------------------+-------------------------+-------------------------+
|subnet_id                 |Uuid                     |The subnet ID for the    |
|                          |                         |fixed IP address for a   |
|                          |                         |port.                    |
+--------------------------+-------------------------+-------------------------+
|ip_address                |String                   |The IP address for the   |
|                          |                         |fixed IP address for a   |
|                          |                         |port.                    |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid                     |The ID of the port.      |
+--------------------------+-------------------------+-------------------------+
|device_id                 |Uuid                     |The ID of the device     |
|                          |                         |that uses this port -    |
|                          |                         |for example, a virtual   |
|                          |                         |server.                  |
+--------------------------+-------------------------+-------------------------+







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

