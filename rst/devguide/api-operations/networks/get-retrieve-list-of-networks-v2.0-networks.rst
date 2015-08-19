
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Retrieve list of networks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/networks

Retrieves list of networks to which the specified tenant has access.

<<<<<<< HEAD
You can control which attributes are returned by using the ``fields`` query parameter. For more information, see `Filtering Requests <http://docs.rackspace.com/networks/api/v2/cn-devguide/content/section_filtering.html>`__.
=======
You can control which attributes are returned by using the ``fields`` query parameter.
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
=======
|200                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|401                       |                         |                         |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""






<<<<<<< HEAD
=======


>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
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





**Example Retrieve list of networks: JSON response**


.. code::

        Status Code: 200 OK
        Content-Length: 370
        Content-Type: application/json; charset=UTF-8
        Date: Thu, 19 Feb 2015 20:41:20 GMT, Thu, 19 Feb 2015 20:41:21 GMT
        Server: Jetty(9.2.z-SNAPSHOT)
        Via: 1.1 Repose (Repose/6.2.0.2)


