=========================================================================
Delete security group - Cloud Networks™ Developer Guide  - Neutron API v2
=========================================================================

 Delete security group
~~~~~~~~~~~~~~~~~~~~~~

`Request <DELETE_deleteSecGroup_v2.0_security-groups__security_group_id__api_ext_security_neutron.html#DELETE_deleteSecGroup_v2.0_security-groups__security_group_id__api_ext_security_neutron-Request>`__
`Response <DELETE_deleteSecGroup_v2.0_security-groups__security_group_id__api_ext_security_neutron.html#DELETE_deleteSecGroup_v2.0_security-groups__security_group_id__api_ext_security_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **DELET | ``/v2.0/security-groups/{sec | Deletes a security group.            |
| E**     | urity_group_id}``            |                                      |
+---------+------------------------------+--------------------------------------+

This operation deletes an OpenStack Networking security group and its
associated security group rules. The delete operation fails if a port is
associated with the security group.

**Normal response codes:** 204

**Error response codes:** unauthorized (401), itemNotFound (404)

 Request
^^^^^^^^

This table shows the URI parameters for the delete security group
request:

+-----------------------+---------+---------------------------------------------+
| Name                  | Type    | Description                                 |
+=======================+=========+=============================================+
| ``{security_group_id} | ​U​U​ID | The unique identifier of the security       |
| ``                    |         | group.                                      |
+-----------------------+---------+---------------------------------------------+

This operation does not accept a request body.

 Response
^^^^^^^^^

 
**Example 5.27. Delete security group: JSON response**

.. code::  

    Content-Type: application/json
    Accept: application/json
    status: 204

This operation does not return a response body.
