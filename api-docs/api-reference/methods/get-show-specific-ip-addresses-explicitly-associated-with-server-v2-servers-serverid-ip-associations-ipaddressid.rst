.. _get-show-specific-ip-addresses-explicitly-associated-with-server-v2-servers-serverid-ip-associations-ipaddressid:

Show specific IP addresses explicitly associated with server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    GET /v2/servers/{serverID}/ip_associations/{IPAddressID}

This operation retrieves information for a specific IP address explicitly
associated with a server using the ``/ip_associations`` API operations by
specifying the associated IP address ID.

Perform this operation to verify that the association of the IP address to the
server exists.

Any IP addresses provisioned using POST ``/ip_addresses`` that have not been
associated with the servers using the ``/ip_associations`` API will not be able
to forward traffic from the intended servers. For example, if you need to share
IP address between two ports, belonging to two servers, you must use a POST
``/ip_addresses`` for the relevant ports, followed by an IP association. The IP
association must be done for the IP address for both the servers so that they
can forward traffic for the IP address.


This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |
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

This table shows the body parameters for the response:

+-----------------------------+------------------------+-----------------------+
|Name                         |Type                    |Description            |
+=============================+========================+=======================+
|ip_association.\ **id**      |Uuid                    |The ID of the          |
|                             |                        |associated IP address. |
+-----------------------------+------------------------+-----------------------+
|ip_association.\ **address** |Uuid                    |The associatied IP     |
|                             |                        |address.               |
+-----------------------------+------------------------+-----------------------+


**Example Show specific IP addresses explicitly associated with server: JSON
response**


.. code::

   {
       "ip_association":
       {
           "id": "1",
           "address": "10.1.1.1"
       }
   }



