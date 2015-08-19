
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Show network
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/networks/{network_id}

Retrieves information for a specified network.

<<<<<<< HEAD
You can control which attributes are returned by using the ``fields`` query parameter. For more information, see `Filtering Requests <http://docs.rackspace.com/networks/api/v2/cn-devguide/content/section_filtering.html>`__.
=======
You can control which attributes are returned by using the ``fields`` query parameter. For information, see `Filtering Requests <http://docs.rackspace.com/networks/api/v2/cn-devguide/content/section_filtering.html>`__.
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
<<<<<<< HEAD
|200                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |Item not found.          |
=======
|200                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|401                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|404                       |                         |                         |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""

<<<<<<< HEAD
=======



>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{network_id}              |Uuid                     |The UUID for the network.|
+--------------------------+-------------------------+-------------------------+





This operation does not accept a request body.




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


