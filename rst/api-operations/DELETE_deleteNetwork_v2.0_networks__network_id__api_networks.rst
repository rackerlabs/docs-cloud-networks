==================================================================
Delete network - Cloud Networks™ Developer Guide  - Neutron API v2
==================================================================

 Delete network
~~~~~~~~~~~~~~~

`Request <DELETE_deleteNetwork_v2.0_networks__network_id__api_networks.html#DELETE_deleteNetwork_v2.0_networks__network_id__api_networks-Request>`__
`Response <DELETE_deleteNetwork_v2.0_networks__network_id__api_networks.html#DELETE_deleteNetwork_v2.0_networks__network_id__api_networks-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **DELET | ``/v2.0/networks/{network_id | Deletes a specified network and its  |
| E**     | }``                          | associated resources.                |
+---------+------------------------------+--------------------------------------+

**Normal response codes:** 204

**Error response codes:** unauthorized (401), itemNotFound (404),
conflict (409)

 Request
^^^^^^^^

This table shows the URI parameters for the delete network request:

+-----------------------+---------+---------------------------------------------+
| Name                  | Type    | Description                                 |
+=======================+=========+=============================================+
| ``{network_id}``      | ​U​U​ID | The UUID for the network.                   |
+-----------------------+---------+---------------------------------------------+

This operation does not accept a request body.

 Response
^^^^^^^^^

This operation does not return a response body.
