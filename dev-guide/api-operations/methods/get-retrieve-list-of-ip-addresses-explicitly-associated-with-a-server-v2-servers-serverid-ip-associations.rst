
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

.. _get-retrieve-list-of-ip-addresses-explicitly-associated-with-a-server-v2-servers-serverid-ip-associations:

Retrieve list of IP addresses explicitly associated with a server
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2/servers/{serverID}/ip_associations

Retrieves list of explicitly associated IPs for specified server.

This operation retrieves a list of all IP addresses explicitly associated to the specified server using the 
``/ip_addresses`` API operations.

Any IP addresses provisioned using POST ``/ip_addresses`` that have not been associated with the servers using 
the ``/ip_associations`` API will not be able to forward traffic from the intended servers. For example, if you 
need to share IP address between two ports, belonging to two servers, you must use a POST ``/ip_addresses`` for 
the relevant ports, followed by an IP association. The IP association must be done for the IP address for both 
the servers so that they can forward traffic for the IP address.



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
""""""""""""""""


This operation does not accept a request body.


Response
""""""""""""""""

This table shows the body parameters for the response:

+------------------------------+-----------------------+-----------------------+
|Name                          |Type                   |Description            |
+==============================+=======================+=======================+
|**ip_associations**           |Array                  |The array of IP        |
|                              |                       |associations.          |
+------------------------------+-----------------------+-----------------------+
|ip_associations.\ **id**      |Uuid                   |The ID of the          |
|                              |                       |associated IP address. |
+------------------------------+-----------------------+-----------------------+
|ip_associations.\ **address** |Uuid                   |The associatied IP     |
|                              |                       |address.               |
+------------------------------+-----------------------+-----------------------+


**Example Retrieve list of IP addresses explicitly associated with a server: JSON response**


.. code::

   {
       "ip_associations": 
       [
           {
               "id": "1", 
               "address": "10.1.1.1"
           }, 
           {
               "id": "2", 
               "address": "10.1.1.2"
           }
       ]
   }




