
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Create port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/ports

Creates a port on a specified network.

You must specify the network where the port is to be created in the ``network_id`` parameter in the request body.

When a port is created on a network that has both an IPv4 and an IPv6 subnet, the port gets an IPv4 address by default. To create a port with an IPv6 address instead, the IPv6 address must be passed via the ``fixed_ips`` attribute.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
<<<<<<< HEAD
|201                       |Success                  |Request succeeded.       |
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
|503                       |Generaton failure        |The mac generation       |
|                          |                         |failed.                  |
+--------------------------+-------------------------+-------------------------+
|503                       |Service Unavailable      |The requested service is |
|                          |                         |unavailable.             |
=======
|201                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|400                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|401                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|403                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|404                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|503                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|503                       |                         |                         |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""






<<<<<<< HEAD
=======


>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|port                      |Object *(Required)*      |The container for the    |
|                          |                         |port details.            |
+--------------------------+-------------------------+-------------------------+
|network_id                |Uuid *(Required)*        |The ID of the attached   |
|                          |                         |network.                 |
+--------------------------+-------------------------+-------------------------+
|admin_state_up            |Bool *(Optional)*        |The administrative state |
|                          |                         |of the network. The      |
|                          |                         |default value is         |
|                          |                         |``true`` and cannot be   |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
|name                      |String *(Optional)*      |A symbolic name for the  |
|                          |                         |port.                    |
+--------------------------+-------------------------+-------------------------+
|device_id                 |Uuid *(Optional)*        |The ID of the port       |
|                          |                         |device.                  |
+--------------------------+-------------------------+-------------------------+
|tenant_id                 |Uuid *(Optional)*        |The ID of the tenant who |
|                          |                         |owns the port.           |
+--------------------------+-------------------------+-------------------------+
<<<<<<< HEAD
=======
|fixed_ips                 |Uuid *(Optional)*        |Array of fixed IP        |
|                          |                         |address objects.         |
+--------------------------+-------------------------+-------------------------+
|subnet_id                 |Uuid *(Optional)*        |The subnet ID for the    |
|                          |                         |fixed IP address for a   |
|                          |                         |port.                    |
+--------------------------+-------------------------+-------------------------+
|ip_address                |String *(Optional)*      |The fixed IP address for |
|                          |                         |a port.                  |
+--------------------------+-------------------------+-------------------------+
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call





**Example Create port: JSON request**


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


<<<<<<< HEAD
=======


>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
This table shows the body parameters for the response:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
<<<<<<< HEAD
|port                      |Object                   |The container for the    |
|                          |                         |port details.            |
+--------------------------+-------------------------+-------------------------+
|status                    |String                   |The port status (        |
|                          |                         |``ACTIVE`` or ``DOWN`` ).|
+--------------------------+-------------------------+-------------------------+
|name                      |String                   |The port name.           |
+--------------------------+-------------------------+-------------------------+
|admin_state_up            |Bool                     |The administrative state |
=======
|port                      |Object *(Required)*      |The container for the    |
|                          |                         |port details.            |
+--------------------------+-------------------------+-------------------------+
|status                    |String *(Required)*      |The port status (        |
|                          |                         |``ACTIVE`` or ``DOWN`` ).|
+--------------------------+-------------------------+-------------------------+
|name                      |String *(Required)*      |The port name.           |
+--------------------------+-------------------------+-------------------------+
|admin_state_up            |Bool *(Required)*        |The administrative state |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |of the network. The      |
|                          |                         |default value is         |
|                          |                         |``true`` and cannot be   |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
<<<<<<< HEAD
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
=======
|network_id                |Uuid *(Required)*        |The ID of the attached   |
|                          |                         |network.                 |
+--------------------------+-------------------------+-------------------------+
|security_groups           |Uuid *(Required)*        |An array of security     |
|                          |                         |group IDs attached to    |
|                          |                         |this port.               |
+--------------------------+-------------------------+-------------------------+
|tenant_id                 |Uuid *(Required)*        |The ID of the tenant who |
|                          |                         |owns the port.           |
+--------------------------+-------------------------+-------------------------+
|device_owner              |String *(Required)*      |The ID of the entity     |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |that uses this port -    |
|                          |                         |for example, a DHCP      |
|                          |                         |agent.                   |
+--------------------------+-------------------------+-------------------------+
<<<<<<< HEAD
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
=======
|mac_address               |String *(Required)*      |The MAC address of the   |
|                          |                         |port.                    |
+--------------------------+-------------------------+-------------------------+
|fixed_ips                 |Uuid *(Required)*        |Array of fixed IP        |
|                          |                         |address objects.         |
+--------------------------+-------------------------+-------------------------+
|subnet_id                 |Uuid *(Required)*        |The subnet ID for the    |
|                          |                         |fixed IP address for a   |
|                          |                         |port.                    |
+--------------------------+-------------------------+-------------------------+
|ip_address                |String *(Required)*      |The fixed IP address for |
|                          |                         |a port.                  |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid *(Required)*        |The ID of the port.      |
+--------------------------+-------------------------+-------------------------+
|device_id                 |Uuid *(Required)*        |The ID of the device     |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |that uses this port -    |
|                          |                         |for example, a virtual   |
|                          |                         |server.                  |
+--------------------------+-------------------------+-------------------------+





**Example Create port: JSON response**


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


