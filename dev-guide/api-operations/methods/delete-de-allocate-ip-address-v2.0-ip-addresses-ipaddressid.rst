
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

.. _delete-de-allocate-ip-address-v2.0-ip-addresses-ipaddressid:

De-allocate IP address
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    DELETE /v2.0/ip_addresses/{ipAddressID}

De-allocates a specified associated IP address.

This operation de-allocates the specified IP address from the tenant, using the associated 
IP address ID.

.. note::
   Before using this operation to de-allocate an IP address from a tenant, all IP associations 
   must be removed from the IP address by using the DELETE ``/ip_associations`` operation.


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
|{ipAddressID}             |String                   |The IP address ID. Note  |
|                          |                         |that this is the ID and  |
|                          |                         |not the IP address       |
|                          |                         |itself.                  |
+--------------------------+-------------------------+-------------------------+



This operation does not accept a request body.



Response
""""""""""""""""



**Example De-allocate IP address: JSON response**


.. code::

   Content-Type: application/json
   Accept: application/json
   status: 204
   




