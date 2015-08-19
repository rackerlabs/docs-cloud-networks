
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Update network
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    PUT /v2.0/networks/{network_id}

Updates a specified network.

This operation allows you to update certain network attributes.

.. warning::
   Network IDs ``"00000000-0000-0000-0000-000000000000"`` and ``"11111111-1111-1111-1111-111111111111"`` correspond to the PublicNet and ServiceNet networks of Rackspace. Changes to these networks are not supported.
   
   



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


Request
""""""""""""""""

This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{network_id}              |Uuid                     |The UUID for the network.|
+--------------------------+-------------------------+-------------------------+





This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|network                   |Object *(Required)*      |The container for the    |
|                          |                         |network details.         |
+--------------------------+-------------------------+-------------------------+
|name                      |String *(Optional)*      |The network name.        |
+--------------------------+-------------------------+-------------------------+





**Example Update network: JSON request**


.. code::

    {
     "network":
      {
        "name": "sample_network_5_updated"
      }
    }
    


Response
""""""""""""""""


This table shows the body parameters for the response:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|networks                  |Array                    |The array of networks.   |
+--------------------------+-------------------------+-------------------------+
|status                    |String                   |The network status. The  |
|                          |                         |default value is         |
|                          |                         |``ACTIVE`` and cannot be |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
|subnets                   |Dict                     |The associated subnets.  |
+--------------------------+-------------------------+-------------------------+
|name                      |String                   |The network name.        |
+--------------------------+-------------------------+-------------------------+
|admin_state_up            |Bool                     |The administrative state |
|                          |                         |of the network. The      |
|                          |                         |default value is         |
|                          |                         |``true`` and cannot be   |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
|tenant_id                 |Uuid                     |The tenant ID.           |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid                     |The network ID.          |
+--------------------------+-------------------------+-------------------------+
|shared                    |Bool                     |Indicates whether this   |
|                          |                         |network is shared across |
|                          |                         |all tenants. The default |
|                          |                         |value is ``false`` and   |
|                          |                         |cannot be changed by the |
|                          |                         |user.                    |
+--------------------------+-------------------------+-------------------------+





**Example Update network: JSON response**


.. code::

    {
         "network":{
          "status":"ACTIVE",
          "subnets":[],
          "name":"sample_network_5_updated",
          "admin_state_up":true,
          "tenant_id":"4fd44f30292945e481c7b8a0c8908869",
          "shared":false,
          "id":"1f370095-98f6-4079-be64-6d3d4a6adcc6",
       }
    }


