
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

..  _delete-delete-security-group-rule-v2.0-security-group-rules-rules-security-groups-id: 

Delete security group rule
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    DELETE /v2.0/security-group-rules/{rules-security-groups-id}

Deletes the specified rule from a security group.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|204                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |Item not found.          |
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""




This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{rules-security-groups-id}|Uuid                     |The unique identifier of |
|                          |                         |the security group rule. |
+--------------------------+-------------------------+-------------------------+





This operation does not accept a request body.




Response
""""""""""""""""










**Example Delete security group rule: JSON response**


.. code::

   Content-Type: application/json
   Accept: application/json
   status: 204




