=============================================================================
Retrieve list of networks - Cloud Networks™ Developer Guide  - Neutron API v2
=============================================================================

 Retrieve list of networks
~~~~~~~~~~~~~~~~~~~~~~~~~~

`Request <GET_listNetworks_v2.0_networks_api_networks.html#GET_listNetworks_v2.0_networks_api_networks-Request>`__
`Response <GET_listNetworks_v2.0_networks_api_networks.html#GET_listNetworks_v2.0_networks_api_networks-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **GET** | ``/v2.0/networks``           | Retrieves list of networks to which  |
|         |                              | the specified tenant has access.     |
+---------+------------------------------+--------------------------------------+

You can control which attributes are returned by using the ``fields``
query parameter.

**Normal response codes:** 200

**Error response codes:** unauthorized (401)

 Request
^^^^^^^^

This operation does not accept a request body.

 Response
^^^^^^^^^

This list shows the body parameters for the response:

`|image2|\ Collapse All <#>`__ \| `|image3|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **networks**: Array. Required.

      The array of networks.

      -  **status**: Xsd:string. Required.

         The network status. The default value is ``ACTIVE`` and cannot
         be changed by the user.

      -  **subnets**: Xsd:dict. Required.

         The associated subnets.

      -  **name**: Xsd:string. Required.

         The network name.

      -  **admin\_state\_up**: Xsd:bool. Required.

         The administrative state of the network. The default value is
         ``true`` and cannot be changed by the user.

      -  **tenant\_id**: Csapi:uuid. Optional.

         The tenant ID.

      -  **id**: Csapi:uuid. Required.

         The network ID.

      -  **shared**: Xsd:bool. Required.

         Indicates whether this network is shared across all tenants.
         The default value is ``false`` and cannot be changed by the
         user.

 
**Example 5.1. Retrieve list of networks: JSON response**

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
