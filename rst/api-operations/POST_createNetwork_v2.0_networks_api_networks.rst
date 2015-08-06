==================================================================
Create network - Cloud Networks™ Developer Guide  - Neutron API v2
==================================================================

 Create network
~~~~~~~~~~~~~~~

`Request <POST_createNetwork_v2.0_networks_api_networks.html#POST_createNetwork_v2.0_networks_api_networks-Request>`__
`Response <POST_createNetwork_v2.0_networks_api_networks.html#POST_createNetwork_v2.0_networks_api_networks-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **POST* | ``/v2.0/networks``           | Creates a network.                   |
| *       |                              |                                      |
+---------+------------------------------+--------------------------------------+

The tenant ID that you specify in the URI is the tenant who creates the
network.

..  note:: 
Note
Only one ``IPv4`` and one ``IPv6`` subnet can be specified per network.

**Normal response codes:** 201

**Error response codes:** badRequest (400), unauthorized (401)

 Request
^^^^^^^^

This list shows the body parameters for the request:

`|image3|\ Collapse All <#>`__ \| `|image4|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **network**: Object. Required.

      The container for the network details.

      -  **admin\_state\_up**: Xsd:bool. Optional.

         The administrative state of the network. The default value is
         ``true`` and cannot be changed by the user.

      -  **name**: Xsd:string. Optional.

         The network name. Currently, network names should be 40
         characters or fewer.

      -  **shared**: Xsd:bool. Optional.

         Admin only. Indicates whether this network is shared across all
         tenants. The default value is ``false`` and cannot be changed
         by the user.

      -  **tenant\_id**: Csapi:uuid. Optional.

         The ID of the tenant who owns the network.

 
**Example 5.2. Create network: JSON request**

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
^^^^^^^^^

This list shows the body parameters for the response:

`|image5|\ Collapse All <#>`__ \| `|image6|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **network**: Object. Required.

      The container for the network details.

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

 
**Example 5.3. Create network: JSON response**

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
