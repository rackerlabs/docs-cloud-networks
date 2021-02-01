..  _get-show-network-v2.0-networks-network-id:

Show network
~~~~~~~~~~~~

.. code::

    GET /v2.0/networks/{network_id}

This operation retrieves information for a specified network.

You can control which attributes are returned by using the ``fields`` query
parameter. For more information, see
:ref:`Filtering Requests <generalapi-filtering>`.


This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |Item not found.          |
+--------------------------+-------------------------+-------------------------+


Request
-------

This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{network_id}              |Uuid                     |The UUID for the network.|
+--------------------------+-------------------------+-------------------------+

This operation does not accept a request body.

Response
--------

This table shows the body parameters for the response:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|parameters.\ **networks** |Array                    |The array of networks.   |
+--------------------------+-------------------------+-------------------------+
|parameters.networks.\     |String                   |The network status. The  |
|**status**                |                         |default value is         |
|                          |                         |``ACTIVE`` and cannot be |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
|parameters.networks.\     |Dict                     |The associated subnets.  |
|**subnets**               |                         |                         |
+--------------------------+-------------------------+-------------------------+
|parameters.networks.\     |String                   |The network name.        |
|**name**                  |                         |                         |
+--------------------------+-------------------------+-------------------------+
|parameters.networks.\     |Bool                     |The administrative state |
|**admin_state_up**        |                         |of the network. The      |
|                          |                         |default value is         |
|                          |                         |``true`` and cannot be   |
|                          |                         |changed by the user.     |
+--------------------------+-------------------------+-------------------------+
|parameters.networks.\     |Uuid                     |The tenant ID.           |
|**tenant_id**             |                         |                         |
+--------------------------+-------------------------+-------------------------+
|parameters.networks.\     |Uuid                     |The network ID.          |
|**id**                    |                         |                         |
+--------------------------+-------------------------+-------------------------+
|parameters.networks.\     |Bool                     |Indicates whether this   |
|**shared**                |                         |network is shared across |
|                          |                         |all tenants. The default |
|                          |                         |value is ``false`` and   |
|                          |                         |cannot be changed by the |
|                          |                         |user.                    |
+--------------------------+-------------------------+-------------------------+


**Example Show network: JSON response**


.. code::

   {
       "network":
       {
           "admin_state_up": true,
           "id": "4d4e772a-98e7-4409-8a3c-4fed4324da26",
           "name": "sameer-3",
           "shared": false,
           "status": "ACTIVE",
           "subnets": [],
           "tenant_id": "546428"
       }
   }


