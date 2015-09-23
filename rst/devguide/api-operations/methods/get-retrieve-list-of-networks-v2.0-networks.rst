
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

..  _get-retrieve-list-of-networks-v2.0-networks: 

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







**Example Retrieve list of networks: JSON response**


.. code::

       Status Code: 200 OK
       Content-Length: 370
       Content-Type: application/json; charset=UTF-8
       Date: Thu, 19 Feb 2015 20:41:20 GMT, Thu, 19 Feb 2015 20:41:21 GMT
       Server: Jetty(9.2.z-SNAPSHOT)
       Via: 1.1 Repose (Repose/6.2.0.2)


.. code::

   {
       "networks": [
           {
               "admin_state_up": true,
               "id": "00000000-0000-0000-0000-000000000000",
               "name": "public",
               "shared": true,
               "status": "ACTIVE",
               "subnets": [],
               "tenant_id": "rackspace"
           },
           {
               "admin_state_up": true,
               "id": "11111111-1111-1111-1111-111111111111",
               "name": "private",
               "shared": true,
               "status": "ACTIVE",
               "subnets": [],
               "tenant_id": "rackspace"
           },
           {
               "admin_state_up": true,
               "id": "2993e407-5531-4ca8-9d2a-0d13b5cac904",
               "name": "RackNet",
               "shared": false,
               "status": "ACTIVE",
               "subnets": [
                   "017d8997-70ec-4448-91d9-a8097d6d60f3"
               ],
               "tenant_id": "123456"
           }
       ]
   }




