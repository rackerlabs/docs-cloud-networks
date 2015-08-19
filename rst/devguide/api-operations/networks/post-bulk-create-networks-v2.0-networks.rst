
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

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
<<<<<<< HEAD
|201                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|400                       |Error                    |A general error has      |
|                          |                         |occured.                 |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
=======
|201                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|400                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|401                       |                         |                         |
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


<<<<<<< HEAD
=======


>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
This table shows the body parameters for the response:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
<<<<<<< HEAD
|networks                  |Array                    |The array of networks.   |
+--------------------------+-------------------------+-------------------------+
|status                    |String                   |The network status. The  |
=======
|networks                  |Array *(Required)*       |The array of networks.   |
+--------------------------+-------------------------+-------------------------+
|status                    |String *(Required)*      |The network status. The  |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |default value is         |
|                          |                         |``ACTIVE`` and cannot be |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
<<<<<<< HEAD
|subnets                   |Dict                     |The associated subnets.  |
+--------------------------+-------------------------+-------------------------+
|name                      |String                   |The network name.        |
+--------------------------+-------------------------+-------------------------+
|admin_state_up            |Bool                     |The administrative state |
=======
|subnets                   |Dict *(Required)*        |The associated subnets.  |
+--------------------------+-------------------------+-------------------------+
|name                      |String *(Required)*      |The network name.        |
+--------------------------+-------------------------+-------------------------+
|admin_state_up            |Bool *(Required)*        |The administrative state |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |of the network. The      |
|                          |                         |default value is         |
|                          |                         |``true`` and cannot be   |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
<<<<<<< HEAD
|tenant_id                 |Uuid                     |The tenant ID.           |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid                     |The network ID.          |
+--------------------------+-------------------------+-------------------------+
|shared                    |Bool                     |Indicates whether this   |
=======
|tenant_id                 |Uuid *(Optional)*        |The tenant ID.           |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid *(Required)*        |The network ID.          |
+--------------------------+-------------------------+-------------------------+
|shared                    |Bool *(Required)*        |Indicates whether this   |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
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


