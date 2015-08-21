
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Retrieve list of networks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/networks

Retrieves list of networks to which the specified tenant has access.

You can control which attributes are returned by using the ``fields`` query parameter. For more information, see `Filtering Requests <http://docs.rackspace.com/networks/api/v2/cn-devguide/content/section_filtering.html>`__.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""








This operation does not accept a request body.




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







**Example Retrieve list of networks: JSON response**


.. code::

        Status Code: 200 OK
        Content-Length: 370
        Content-Type: application/json; charset=UTF-8
        Date: Thu, 19 Feb 2015 20:41:20 GMT, Thu, 19 Feb 2015 20:41:21 GMT
        Server: Jetty(9.2.z-SNAPSHOT)
        Via: 1.1 Repose (Repose/6.2.0.2)

