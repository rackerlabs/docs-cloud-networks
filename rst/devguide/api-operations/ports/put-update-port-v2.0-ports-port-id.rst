
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Update port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    PUT /v2.0/ports/{port_id}

Updates a specified port.

You can update information for a port, such as its symbolic name, associated IP addresses, and security_groups. When you update IP addresses for a port, any previously associated IP addresses are removed, returned to the appropriate subnet's allocation pools, and replaced by the IP addresses specified in the body of the update request. Therefore, this operation replaces the ``fixed_ips`` attribute when it is specified in the request body.

.. warning::
   If the updated IP addresses are not valid or are already in use, the operation fails and the existing IP addresses are not removed from the port.
   
   

.. warning::
   When you update the ``fixed_ips`` attribute of a port that is already attached to an active cloud server instance, the changes do not take effect on the server even though the attributes of the port are updated. As a result, this operation is useful only for ports that are not attached to any server. After the port attributes are updated they can be passed to a Cloud Server instance at boot time.
   
   



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
|409                       |conflict                 |There is a resource      |
|                          |                         |conflict.                |
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""




This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{port_id}                 |Uuid                     |The UUID for the port.   |
+--------------------------+-------------------------+-------------------------+





This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|port                      |Object *(Required)*      |The container for the    |
|                          |                         |port details.            |
+--------------------------+-------------------------+-------------------------+
|name                      |String *(Optional)*      |A symbolic name for the  |
|                          |                         |port.                    |
+--------------------------+-------------------------+-------------------------+
|device_id                 |Uuid *(Optional)*        |The ID of the port       |
|                          |                         |device.                  |
+--------------------------+-------------------------+-------------------------+
|security_groups           |Uuid *(Optional)*        |The ID of the security   |
|                          |                         |groups.                  |
+--------------------------+-------------------------+-------------------------+





**Example Update port: JSON request**


.. code::

    {
        "port": {
            "admin_state_up": true,
            "device_id": "d6b4d3a5-c700-476f-b609-1493dd9dadc0",
            "name": "port1",
            "network_id": "6aeaf34a-c482-4bd3-9dc3-7faf36412f12"
        }
    } 


Response
""""""""""""""""





This table shows the body parameters for the response:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|port                      |Object                   |The container for the    |
|                          |                         |port details.            |
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
|fixed_ips                 |Uuid                     |Array of fixed IP        |
|                          |                         |address objects.         |
+--------------------------+-------------------------+-------------------------+
|subnet_id                 |Uuid                     |The subnet ID for the    |
|                          |                         |fixed IP address for a   |
|                          |                         |port.                    |
+--------------------------+-------------------------+-------------------------+
|ip_address                |String                   |The fixed IP address for |
|                          |                         |a port.                  |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid                     |The ID of the port.      |
+--------------------------+-------------------------+-------------------------+
|device_id                 |Uuid                     |The ID of the device     |
|                          |                         |that uses this port -    |
|                          |                         |for example, a virtual   |
|                          |                         |server.                  |
+--------------------------+-------------------------+-------------------------+







**Example Update port: JSON response**


.. code::

    {
       "port":
          {
             "admin_state_up":true,
             "device_id": "",
             "device_owner": null,
             "fixed_ips": [
                 {
                     "ip_address": "fc01::8",
                     "subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0"
                 }
             ],
             "id":"8fb361d8-bab0-418d-b1b8-7204a230fb06",
             "mac_address":"fa:16:3e:2e:7c:8a",
             "name":"sample_port_1",
             "network_id":"a3775a7d-9f8b-4148-be81-c84bbd0837ce",
             "security_groups":[],
             "status": "ACTIVE",
             "tenant_id":"60cd4f6dbc2f491982a284e7b83b5be3" 
          }
    }

