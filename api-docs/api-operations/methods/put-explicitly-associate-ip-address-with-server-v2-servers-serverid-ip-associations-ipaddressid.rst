
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

.. _put-explicitly-associate-ip-address-with-server-v2-servers-serverid-ip-associations-ipaddressid:

Explicitly associate IP address with server
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    PUT /v2/servers/{serverID}/ip_associations/{IPAddressID}

Explicitly associate a provisioned IP address with server

This operation explicitly associates to a server an IP address.

.. important::
   Before using this operation, you must use the POST ``ip_addresses`` API operation to 
   provision the IP address.
   
   

Any IP addresses provisioned using POST ``/ip_addresses`` that have not been associated with 
the servers using the ``/ip_associations`` API will not be able to forward traffic from the 
intended servers. For example, if you need to share IP address between two ports, belonging 
to two servers, you must use a POST ``/ip_addresses`` for the relevant ports, followed by an 
IP association. The IP association must be done for the IP address for both the servers so 
that they can forward traffic for the IP address.

For usage examples, please see the Cloud Networks Getting Started Guide.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|201                       |Success                  |Request succeeded.       |
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
""""""""""""""""


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


**Example Explicitly associate IP address with server: JSON response**


.. code::

   {
       "ip_association": 
           {
               "id": "2", 
               "address": "10.1.1.2"
           }
   }

