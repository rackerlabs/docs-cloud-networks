..  _post-create-port-v2.0-ports:

Create port
~~~~~~~~~~~

.. code::

    POST /v2.0/ports

This operation creates a port on a specified network.

You must specify the network where the port is to be created in the
``network_id`` parameter in the request body.

When a port is created on a network that has both an IPv4 and an IPv6 subnet,
the port gets an IPv4 address by default. To create a port with an IPv6 address
instead, the IPv6 address must be passed via the ``fixed_ips`` attribute.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
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
+--------------------------+-------------------------+-------------------------+


Request
-------

This table shows the body parameters for the request:

+-----------------------------+------------------------+-----------------------+
|Name                         |Type                    |Description            |
+=============================+========================+=======================+
|**port**                     |Object                  |The container for the  |
|                             |                        |port details.          |
+-----------------------------+------------------------+-----------------------+
|port.\ **network_id**        |Uuid                    |The ID of the attached |
|                             |                        |network.               |
+-----------------------------+------------------------+-----------------------+
|port.\ **admin_state_up**    |Bool *(Optional)*       |The administrative     |
|                             |                        |state of the network.  |
|                             |                        |The default value is   |
|                             |                        |``true`` and cannot be |
|                             |                        |changed by the user.   |
+-----------------------------+------------------------+-----------------------+
|port.\ **name**              |String *(Optional)*     |A symbolic name for    |
|                             |                        |the port.              |
+-----------------------------+------------------------+-----------------------+
|port.\ **device_id**         |Uuid *(Optional)*       |The ID of the port     |
|                             |                        |device.                |
+-----------------------------+------------------------+-----------------------+
|port.\ **tenant_id**         |Uuid *(Optional)*       |The ID of the tenant   |
|                             |                        |who owns the port.     |
+-----------------------------+------------------------+-----------------------+
|port.\ **fixed_ips**         |Array *(Optional)*      |Array of fixed IP      |
|                             |                        |address objects.       |
+-----------------------------+------------------------+-----------------------+
|port.fixed_ips.\             |Uuid *(Optional)*       |The subnet ID for the  |
|**subnet_id**                |                        |fixed IP address for a |
|                             |                        |port.                  |
+-----------------------------+------------------------+-----------------------+
|port.fixed_ips.\             |String *(Optional)*     |The IP address for the |
|**ip_address**               |                        |fixed IP address for a |
|                             |                        |port.                  |
+-----------------------------+------------------------+-----------------------+


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




