..  _post-create-network-v2.0-networks: 

Create network
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/networks

This operation creates a network.

The tenant ID that you specify in the URI is the tenant who creates the network.

.. note::
   Only one ``IPv4`` and one ``IPv6`` subnet can be specified per network.
   
   



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
"""""""""""""""

This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|**network**               |Object                   |The container for the    |
|                          |                         |network details.         |
+--------------------------+-------------------------+-------------------------+
|network.\                 |Bool *(Optional)*        |The administrative state |
|**admin_state_up**        |                         |of the network. The      |
|                          |                         |default value is         |
|                          |                         |``true`` and cannot be   |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
|network.\ **name**        |String *(Optional)*      |The network name.        |
|                          |                         |Currently, network names |
|                          |                         |should be 40 characters  |
|                          |                         |or fewer.                |
+--------------------------+-------------------------+-------------------------+
|network.\ **shared**      |Bool *(Optional)*        |Admin only. Indicates    |
|                          |                         |whether this network is  |
|                          |                         |shared across all        |
|                          |                         |tenants. The default     |
|                          |                         |value is ``false`` and   |
|                          |                         |cannot be changed by the |
|                          |                         |user.                    |
+--------------------------+-------------------------+-------------------------+
|network.\ **tenant_id**   |Uuid *(Optional)*        |The ID of the tenant who |
|                          |                         |owns the network.        |
+--------------------------+-------------------------+-------------------------+


**Example Create network: JSON request**

.. code::

   {
       "network": 
       {
           "name": "testnet-3",
           "shared": false,
           "tenant_id": "123456"
       }
   }


Response
""""""""""""""""

This table shows the body parameters for the response:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|**networks**              |Array                    |The array of networks.   |
+--------------------------+-------------------------+-------------------------+
|networks.\ **status**     |String                   |The network status. The  |
|                          |                         |default value is         |
|                          |                         |``ACTIVE`` and cannot be |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
|networks.\ **subnets**    |Dict                     |The associated subnets.  |
|                          |                         |                         |
+--------------------------+-------------------------+-------------------------+
|networks.\ **name**       |String                   |The network name.        |
|                          |                         |                         |
+--------------------------+-------------------------+-------------------------+
|networks.\                |Bool                     |The administrative state |
|**admin_state_up**        |                         |of the network. The      |
|                          |                         |default value is         |
|                          |                         |``true`` and cannot be   |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
|networks.\ **tenant_id**  |Uuid                     |The tenant ID.           |
|                          |                         |                         |
+--------------------------+-------------------------+-------------------------+
|networks.\ **id**         |Uuid                     |The network ID.          |
|                          |                         |                         |
+--------------------------+-------------------------+-------------------------+
|networks.\ **shared**     |Bool                     |Indicates whether this   |
|                          |                         |network is shared across |
|                          |                         |all tenants. The default |
|                          |                         |value is ``false`` and   |
|                          |                         |cannot be changed by the |
|                          |                         |user.                    |
+--------------------------+-------------------------+-------------------------+


**Example Create network: JSON response**


.. code::

   
   {
   "network": 
       {
           "admin_state_up": true,
           "id": "4d4e772a-98e7-4409-8a3c-4fed4324da26",
           "name": "testnet-3",
           "shared": false,
           "status": "ACTIVE",
           "subnets": [],
           "tenant_id": "123456"
       }
   }

