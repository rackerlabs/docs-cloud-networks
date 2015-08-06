===============================================================
Delete port - Cloud Networks™ Developer Guide  - Neutron API v2
===============================================================

 Delete port
~~~~~~~~~~~~

`Request <DELETE_removePort_v2.0_ports__port_id__api_ports_neutron.html#DELETE_removePort_v2.0_ports__port_id__api_ports_neutron-Request>`__
`Response <DELETE_removePort_v2.0_ports__port_id__api_ports_neutron.html#DELETE_removePort_v2.0_ports__port_id__api_ports_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **DELET | ``/v2.0/ports/{port_id}``    | Deletes a specified port.            |
| E**     |                              |                                      |
+---------+------------------------------+--------------------------------------+

Any IP addresses that are associated with the port are returned to the
appropriate subnet's allocation pools.

**Normal response codes:** 204

**Error response codes:** unauthorized (401), itemNotFound (404),
conflict (409)

 Request
^^^^^^^^

This table shows the URI parameters for the delete port request:

+-----------------------+---------+---------------------------------------------+
| Name                  | Type    | Description                                 |
+=======================+=========+=============================================+
| ``{port_id}``         | ​U​U​ID | The UUID for the port.                      |
+-----------------------+---------+---------------------------------------------+

This operation does not accept a request body.

 Response
^^^^^^^^^

This operation does not return a response body.
