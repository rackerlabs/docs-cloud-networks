==================================================================
Update network - Cloud Networks™ Developer Guide  - Neutron API v2
==================================================================

 Update network
~~~~~~~~~~~~~~~

`Request <PUT_updateNetwork_v2.0_networks__network_id__api_networks.html#PUT_updateNetwork_v2.0_networks__network_id__api_networks-Request>`__
`Response <PUT_updateNetwork_v2.0_networks__network_id__api_networks.html#PUT_updateNetwork_v2.0_networks__network_id__api_networks-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **PUT** | ``/v2.0/networks/{network_id | Updates a specified network.         |
|         | }``                          |                                      |
+---------+------------------------------+--------------------------------------+

   style="margin-left: 0.5in; margin-right: 0.5in;">

|[Warning]|
Warning
Network IDs "00000000-0000-0000-0000-000000000000" and
"11111111-1111-1111-1111-111111111111" correspond to the PublicNet and
ServiceNet networks of Rackspace. Changes to these networks are not
supported.

**Normal response codes:** 200

**Error response codes:** badRequest (400), unauthorized (401),
forbidden (403), itemNotFound (404)

 Request
^^^^^^^^

This table shows the URI parameters for the update network request:

+-----------------------+---------+---------------------------------------------+
| Name                  | Type    | Description                                 |
+=======================+=========+=============================================+
| ``{network_id}``      | ​U​U​ID | The UUID for the network.                   |
+-----------------------+---------+---------------------------------------------+

This list shows the body parameters for the request:

`|image3|\ Collapse All <#>`__ \| `|image4|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **network**: Object. Required.

      The container for the network details.

   -  **networks**:

      -  **name**: Xsd:string. Optional.

         The network name.

 
**Example 5.5. Update network: JSON request**

.. code::  

    {
     "network":
      {
        "name": "sample_network_5_updated"
      }
    }

 Response
^^^^^^^^^

This list shows the body parameters for the response:

`|image5|\ Collapse All <#>`__ \| `|image6|\ Expand All <#>`__ \|
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

 
**Example 5.6. Update network: JSON response**

.. code::  

    {
         "network":{
          "status":"ACTIVE",
          "subnets":[

          ],
          "name":"sample_network_5_updated",
          "admin_state_up":true,
          "tenant_id":"4fd44f30292945e481c7b8a0c8908869",
          "shared":false,
          "id":"1f370095-98f6-4079-be64-6d3d4a6adcc6",
       }

    }
