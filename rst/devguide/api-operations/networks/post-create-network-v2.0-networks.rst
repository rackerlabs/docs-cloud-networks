
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

.. _post-create-network-v2.0-networks:

Create network
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/networks

Creates a network.

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
|network                   |Object                   |The container for the    |
|                          |                         |network details.         |
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




