..  _put-update-port-v2.0-ports-port-id:

Update port
~~~~~~~~~~~

.. code::

    PUT /v2.0/ports/{port_id}

This operation allows you to update a specified port.

You can update information for a port, such as its symbolic name, associated IP
addresses, and security_groups. When you update IP addresses for a port, any
previously associated IP addresses are removed, returned to the appropriate
subnet's allocation pools, and replaced by the IP addresses specified in the
body of the update request. Therefore, this operation replaces the
``fixed_ips`` attribute when it is specified in the request body.

.. warning::

   If the updated IP addresses are not valid or are already in use, the
   operation fails and the existing IP addresses are not removed from the port.


.. warning::

   When you update the ``fixed_ips`` attribute of a port that is already
   attached to an active cloud server instance, the changes do not take effect
   on the server even though the attributes of the port are updated. As a
   result, this operation is useful only for ports that are not attached to any
   server. After the port attributes are updated they can be passed to a Cloud
   Server instance at boot time.


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
-------

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
|**port**                  |Object                   |The container for the    |
|                          |                         |port details.            |
+--------------------------+-------------------------+-------------------------+
|port.\ **name**           |String *(Optional)*      |A symbolic name for the  |
|                          |                         |port.                    |
+--------------------------+-------------------------+-------------------------+
|port.\ **device_id**      |Uuid *(Optional)*        |The ID of the port       |
|                          |                         |device.                  |
+--------------------------+-------------------------+-------------------------+
|port.\ **security_groups**|Uuid *(Optional)*        |The ID of the security   |
|                          |                         |groups.                  |
+--------------------------+-------------------------+-------------------------+

**Example Update port: JSON request**


.. code::

   {
       "port": {
           "device_id": "d6b4d3a5-c700-476f-b609-1493dd9dadc0",
           "name": "port1",
           "security_group": "[fedbba3a-58ad-4482-87ea-14f1aa2a0819]"
       }
   }

Response
--------

This table shows the body parameters for the response:

+-----------------------------+------------------------+-----------------------+
|Name                         |Type                    |Description            |
+=============================+========================+=======================+
|**port**                     |Object                  |The container for the  |
|                             |                        |port details.          |
+-----------------------------+------------------------+-----------------------+
|port.\ **status**            |String                  |The port status (      |
|                             |                        |``ACTIVE`` or ``DOWN`` |
|                             |                        |).                     |
+-----------------------------+------------------------+-----------------------+
|port.\ **name**              |String                  |The port name.         |
+-----------------------------+------------------------+-----------------------+
|port.\ **admin_state_up**    |Bool                    |The administrative     |
|                             |                        |state of the network.  |
|                             |                        |The default value is   |
|                             |                        |``true`` and cannot be |
|                             |                        |changed by the user.   |
+-----------------------------+------------------------+-----------------------+
|port.\ **network_id**        |Uuid                    |The ID of the attached |
|                             |                        |network.               |
+-----------------------------+------------------------+-----------------------+
|port.\ **security_groups**   |Uuid                    |An array of security   |
|                             |                        |group IDs attached to  |
|                             |                        |this port.             |
+-----------------------------+------------------------+-----------------------+
|port.\ **tenant_id**         |Uuid                    |The ID of the tenant   |
|                             |                        |who owns the port.     |
+-----------------------------+------------------------+-----------------------+
|port.\ **device_owner**      |String                  |The ID of the entity   |
|                             |                        |that uses this port -  |
|                             |                        |for example, a DHCP    |
|                             |                        |agent.                 |
+-----------------------------+------------------------+-----------------------+
|port.\ **mac_address**       |String                  |The MAC address of the |
|                             |                        |port.                  |
+-----------------------------+------------------------+-----------------------+
|port.\ **fixed_ips**         |Uuid                    |Array of fixed IP      |
|                             |                        |address objects.       |
+-----------------------------+------------------------+-----------------------+
|port.fixed_ips.\             |Uuid                    |The subnet ID for the  |
|**subnet_id**                |                        |fixed IP address for a |
|                             |                        |port.                  |
+-----------------------------+------------------------+-----------------------+
|port.fixed_ips.\             |String                  |The fixed IP address   |
|**ip_address**               |                        |for a port.            |
+-----------------------------+------------------------+-----------------------+
|port.\ **id**                |Uuid                    |The ID of the port.    |
+-----------------------------+------------------------+-----------------------+
|port.\ **device_id**         |Uuid                    |The ID of the device   |
|                             |                        |that uses this port -  |
|                             |                        |for example, a virtual |
|                             |                        |server.                |
+-----------------------------+------------------------+-----------------------+

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
            "security_groups":[fedbba3a-58ad-4482-87ea-14f1aa2a0819],
            "status": "ACTIVE",
            "tenant_id":"60cd4f6dbc2f491982a284e7b83b5be3"
         }
   }