.. _delete-floating-ip-address:

Delete floating IP address
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    DELETE /v2.0/floatingips/{floatingip_id}

This operation deletes a floating IP and, if present, its associated port.

This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|204                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |Requested IP not found.  |
+--------------------------+-------------------------+-------------------------+


Request
-------

This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{floatingip_id}           |String                   |The IP address ID. Note  |
|                          |                         |that this is the ID and  |
|                          |                         |not the IP address       |
|                          |                         |itself.                  |
+--------------------------+-------------------------+-------------------------+

This operation does not accept a request body.

Response
--------

**Example Delete floating IP address: JSON response**


.. code::

   Content-Type: application/json
   Accept: application/json
   status: 204

