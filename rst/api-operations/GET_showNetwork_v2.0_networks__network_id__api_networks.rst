================================================================
Show network - Cloud Networks™ Developer Guide  - Neutron API v2
================================================================

 Show network
~~~~~~~~~~~~~

`Request <GET_showNetwork_v2.0_networks__network_id__api_networks.html#GET_showNetwork_v2.0_networks__network_id__api_networks-Request>`__
`Response <GET_showNetwork_v2.0_networks__network_id__api_networks.html#GET_showNetwork_v2.0_networks__network_id__api_networks-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **GET** | ``/v2.0/networks/{network_id | Retrieves information for a          |
|         | }``                          | specified network.                   |
+---------+------------------------------+--------------------------------------+

You can control which attributes are returned by using the ``fields``
query parameter. For information, see `Filtering
Requests <http://docs.rackspace.com/networks/api/v2/cn-devguide/content/section_filtering.html>`__.

**Normal response codes:** 200

**Error response codes:** unauthorized (401), itemNotFound (404)

 Request
^^^^^^^^

This table shows the URI parameters for the show network request:

+-----------------------+---------+---------------------------------------------+
| Name                  | Type    | Description                                 |
+=======================+=========+=============================================+
| ``{network_id}``      | ​U​U​ID | The UUID for the network.                   |
+-----------------------+---------+---------------------------------------------+

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

 
**Example 5.4. Show network: JSON response**

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
