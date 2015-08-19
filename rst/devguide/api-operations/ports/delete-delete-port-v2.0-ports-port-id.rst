
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Delete port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    DELETE /v2.0/ports/{port_id}

Deletes a specified port.

Any IP addresses that are associated with the port are returned to the appropriate subnet's allocation pools.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
<<<<<<< HEAD
|204                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |Item not found.          |
+--------------------------+-------------------------+-------------------------+
|409                       |conflict                 |There is a resource      |
|                          |                         |conflict.                |
=======
|204                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|401                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|404                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|409                       |                         |                         |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""

<<<<<<< HEAD
=======



>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{port_id}                 |Uuid                     |The UUID for the port.   |
+--------------------------+-------------------------+-------------------------+





This operation does not accept a request body.




Response
""""""""""""""""





<<<<<<< HEAD
**Example Delete port: JSON response**


.. code::

    Content-Type: application/json
    Accept: application/json
    status: 204

=======


This operation does not return a response body.
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call

