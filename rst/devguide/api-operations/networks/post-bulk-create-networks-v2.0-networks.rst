
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

.. _post-bulk-create-networks-v2.0-networks:

Bulk create networks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/networks

Creates multiple networks in a single request.

In the request body, specify a list of networks.

.. note::
   Bulk create operations are always atomic, meaning that either all or no networks in the request body are created.
   
   



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


Request
""""""""""""""""








This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|network                   |Object *(Required)*      |The container for the    |
|                          |                         |network details.         |
+--------------------------+-------------------------+-------------------------+
|admin_state_up            |Bool *(Optional)*        |The administrative state |
|                          |                         |of the network. The      |
|                          |                         |default value is         |
|                          |                         |``true`` and cannot be   |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
|name                      |String *(Optional)*      |The network name.        |
|                          |                         |Currently, network names |
|                          |                         |should be 40 characters  |
|                          |                         |or fewer.                |
+--------------------------+-------------------------+-------------------------+
|shared                    |Bool *(Optional)*        |Admin only. Indicates    |
|                          |                         |whether this network is  |
|                          |                         |shared across all        |
|                          |                         |tenants. The default     |
|                          |                         |value is ``false`` and   |
|                          |                         |cannot be changed by the |
|                          |                         |user.                    |
+--------------------------+-------------------------+-------------------------+
|tenant_id                 |Uuid *(Optional)*        |The ID of the tenant who |
|                          |                         |owns the network.        |
+--------------------------+-------------------------+-------------------------+





**Example Bulk create networks: JSON request**


.. code::

   {
      "networks":[
         {
            "name":"sample_network_1",
            "admin_state_up":false
         },
         {
            "name":"sample_network_2",
            "admin_state_up":false
         }
      ]
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







**Example Bulk create networks: JSON response**


.. code::

   {
      "networks":[
         {
            "status":"ACTIVE",
            "subnets":[
   
            ],
            "name":"sample_network3",
            "provider:physical_network":null,
            "admin_state_up":true,
            "tenant_id":"4fd44f30292945e481c7b8a0c8908869",
            "provider:network_type":"local",
            "shared":false,
            "id":"bc1a76cb-8767-4c3a-bb95-018b822f2130",
            "provider:segmentation_id":null
         },
         {
            "status":"ACTIVE",
            "subnets":[
   
            ],
            "name":"sample_network4",
            "provider:physical_network":null,
            "admin_state_up":true,
            "tenant_id":"4fd44f30292945e481c7b8a0c8908869",
            "provider:network_type":"local",
            "shared":false,
            "id":"af374017-c9ae-4a1d-b799-ab73111476e2",
            "provider:segmentation_id":null
         }
      ]
   }




