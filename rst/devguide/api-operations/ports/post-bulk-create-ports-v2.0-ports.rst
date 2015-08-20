
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Bulk Create Ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/ports

Creates multiple ports in a single request. Specify a list of ports in the request body.

This operation creates multiple ports with a single request.

.. note::
   Bulk create operations are always atomic, meaning that either all or no ports in the request body are created.
   
   



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
|409                       |conflict                 |There is a resource      |
|                          |                         |conflict.                |
+--------------------------+-------------------------+-------------------------+
|503                       |Generaton failure        |The mac generation       |
|                          |                         |failed.                  |
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""








This operation does not accept a request body.




**Example Bulk Create Ports: JSON request**


.. code::

    {
       "ports":[
          {
             "name":"sample_port_1",
             "admin_state_up":false,
             "network_id":"a3775a7d-9f8b-4148-be81-c84bbd0837ce"
          },
          {
             "name":"sample_port_2",
             "admin_state_up":false,
             "network_id":"a3775a7d-9f8b-4148-be81-c84bbd0837ce"
          }
       ]
    }
    


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







**Example Bulk Create Ports: JSON response**


.. code::

    {
       "ports":[
          {
             "status":"DOWN",
             "binding:host_id":null,
             "name":"sample_port_1",
             "admin_state_up":true,
             "network_id":"a3775a7d-9f8b-4148-be81-c84bbd0837ce",
             "tenant_id":"60cd4f6dbc2f491982a284e7b83b5be3",
             "binding:vif_type":"ovs",
             "device_owner":"",
             "binding:capabilities":{
                "port_filter":true
             },
             "mac_address":"fa:16:3e:2e:7c:8a",
             "fixed_ips":[
    
             ],
             "id":"8fb361d8-bab0-418d-b1b8-7204a230fb06",
             "security_groups":[
                "99f465bc-0d7c-4142-8829-7ae0179f2fa8"
             ],
             "device_id":""
          },
          {
             "status":"DOWN",
             "binding:host_id":null,
             "name":"sample_port_2",
             "admin_state_up":false,
             "network_id":"a3775a7d-9f8b-4148-be81-c84bbd0837ce",
             "tenant_id":"60cd4f6dbc2f491982a284e7b83b5be3",
             "binding:vif_type":"ovs",
             "device_owner":"",
             "binding:capabilities":{
                "port_filter":true
             },
             "mac_address":"fa:16:3e:0a:4e:13",
             "fixed_ips":[
    
             ],
             "id":"d4c93b0b-f593-424e-a199-d648478a5a3c",
             "security_groups":[
                "99f465bc-0d7c-4142-8829-7ae0179f2fa8"
             ],
             "device_id":""
          }
       ]
    }

