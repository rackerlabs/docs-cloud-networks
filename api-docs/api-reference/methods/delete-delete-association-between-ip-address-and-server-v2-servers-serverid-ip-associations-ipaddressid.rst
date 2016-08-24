.. _delete-delete-association-between-ip-address-and-server-v2-servers-serverid-ip-associations-ipaddressid:

Delete association between IP address and server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    DELETE /v2/servers/{serverID}/ip_associations/{IPAddressID}

This operation deletes the association between the server and the associated IP
address, using the associated IP address ID.

.. note::

   All IP associations must be removed from an IP address by using this
   operation before you can de-allocate an IP address from a tenant, by using
   the DELETE ``/ip_addresses`` or the PUT ``/ip_addresses`` operation with an
   empty list of port IDs.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|204                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|400                       |Error                    |A general error has      |
|                          |                         |occured.                 |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+
|403                       |Forbidden                |The request is forbidden.|
+--------------------------+-------------------------+-------------------------+
|405                       |Bad Method               |Bad method.              |
+--------------------------+-------------------------+-------------------------+
|413                       |Over Limit               |The number of items      |
|                          |                         |returned is above the    |
|                          |                         |allowed limit.           |
+--------------------------+-------------------------+-------------------------+
|500                       |Compute fault            |There was a compute      |
|                          |                         |fault.                   |
+--------------------------+-------------------------+-------------------------+
|503                       |Service Unavailable      |The requested service is |
|                          |                         |unavailable.             |
+--------------------------+-------------------------+-------------------------+


Request
-------

This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{IPAddressID}             |Uuid                     |The IP address ID. Note  |
|                          |                         |that this is the ID and  |
|                          |                         |not the IP address       |
|                          |                         |itself.                  |
+--------------------------+-------------------------+-------------------------+


This operation does not accept a request body.


Response
--------

**Example Delete association between IP address and server: JSON response**


.. code::

   Content-Type: application/json
   Accept: application/json
   status: 204

