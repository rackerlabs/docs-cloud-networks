=================================================================
Delete subnet - Cloud Networks™ Developer Guide  - Neutron API v2
=================================================================

 Delete subnet
~~~~~~~~~~~~~~

`Request <DELETE_removeSubnet_v2.0_subnets__subnet_id__api_subnets_neutron.html#DELETE_removeSubnet_v2.0_subnets__subnet_id__api_subnets_neutron-Request>`__
`Response <DELETE_removeSubnet_v2.0_subnets__subnet_id__api_subnets_neutron.html#DELETE_removeSubnet_v2.0_subnets__subnet_id__api_subnets_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **DELET | ``/v2.0/subnets/{subnet_id}` | Deletes a specified subnet.          |
| E**     | `                            |                                      |
+---------+------------------------------+--------------------------------------+

This operation fails if the subnet IP addresses are still allocated.

**Normal response codes:** 204

**Error response codes:** unauthorized (401), itemNotFound (404),
conflict (409)

 Request
^^^^^^^^

This table shows the URI parameters for the delete subnet request:

+-----------------------+---------+---------------------------------------------+
| Name                  | Type    | Description                                 |
+=======================+=========+=============================================+
| ``{subnet_id}``       | ​U​U​ID | The UUID for the subnet.                    |
+-----------------------+---------+---------------------------------------------+

This operation does not accept a request body.

 Response
^^^^^^^^^

This operation does not return a response body.
