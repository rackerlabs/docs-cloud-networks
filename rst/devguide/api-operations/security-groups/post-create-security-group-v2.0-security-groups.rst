
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Create security group
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/security-groups

Creates a security group.

This operation creates a security group with default security group rules for the ``IPv4`` and ``IPv6`` ether types.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
<<<<<<< HEAD
|201                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|400                       |Error                    |A general error has      |
|                          |                         |occured.                 |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
=======
|201                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|400                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|401                       |                         |                         |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""






<<<<<<< HEAD
=======


>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|security_group            |Object *(Required)*      |A container for security |
|                          |                         |group details.           |
+--------------------------+-------------------------+-------------------------+
|name                      |String *(Required)*      |A symbolic name for the  |
|                          |                         |security group, which    |
|                          |                         |does not need to be      |
|                          |                         |unique.                  |
+--------------------------+-------------------------+-------------------------+
|description               |String *(Optional)*      |Describes the security   |
|                          |                         |group.                   |
+--------------------------+-------------------------+-------------------------+





**Example Create security group: JSON request**


.. code::

    {
       "security_group":{
          "name":"new-webservers",
          "description":"security group for webservers"
       }
    }


Response
""""""""""""""""


<<<<<<< HEAD
=======


>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
This table shows the body parameters for the response:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
<<<<<<< HEAD
|security_group            |Object                   |The container for        |
|                          |                         |security group details.  |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid                     |The UUID for the         |
|                          |                         |security group.          |
+--------------------------+-------------------------+-------------------------+
|name                      |String                   |The security group name. |
+--------------------------+-------------------------+-------------------------+
|description               |String                   |The security group       |
|                          |                         |description.             |
+--------------------------+-------------------------+-------------------------+
|tenant_id                 |Uuid                     |The tenant ID of the     |
|                          |                         |security group owner.    |
+--------------------------+-------------------------+-------------------------+
|security_group_rules      |String                   |An array of rules in a   |
|                          |                         |security group.          |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid                     |The ID for the security  |
|                          |                         |group rule.              |
+--------------------------+-------------------------+-------------------------+
|direction                 |String                   |The direction (          |
=======
|security_group            |Object *(Required)*      |The container for        |
|                          |                         |security group details.  |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid *(Required)*        |The UUID for the         |
|                          |                         |security group.          |
+--------------------------+-------------------------+-------------------------+
|name                      |String *(Required)*      |The security group name. |
+--------------------------+-------------------------+-------------------------+
|description               |String *(Required)*      |The security group       |
|                          |                         |description.             |
+--------------------------+-------------------------+-------------------------+
|tenant_id                 |Uuid *(Required)*        |The tenant ID of the     |
|                          |                         |security group owner.    |
+--------------------------+-------------------------+-------------------------+
|security_group_rules      |String *(Required)*      |An array of rules in a   |
|                          |                         |security group.          |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid *(Required)*        |The ID for the security  |
|                          |                         |group rule.              |
+--------------------------+-------------------------+-------------------------+
|direction                 |String *(Required)*      |The direction (          |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |``ingress`` ). For a     |
|                          |                         |Cloud Servers instance,  |
|                          |                         |an ``ingress`` security  |
|                          |                         |group rule is applied to |
|                          |                         |incoming traffic for     |
|                          |                         |that instance.           |
+--------------------------+-------------------------+-------------------------+
<<<<<<< HEAD
|ethertype                 |String                   |The network ether type,  |
|                          |                         |either ``IPv4`` or       |
|                          |                         |``IPv6``.                |
+--------------------------+-------------------------+-------------------------+
|security_group_id         |Uuid                     |The security group ID    |
=======
|ethertype                 |String *(Required)*      |The network ether type,  |
|                          |                         |either ``IPv4`` or       |
|                          |                         |``IPv6``.                |
+--------------------------+-------------------------+-------------------------+
|security_group_id         |Uuid *(Required)*        |The security group ID    |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |for the security group   |
|                          |                         |with which the rule is   |
|                          |                         |associated.              |
+--------------------------+-------------------------+-------------------------+
<<<<<<< HEAD
|tenant_id                 |Uuid                     |The tenant ID of the     |
|                          |                         |security group rule      |
|                          |                         |owner.                   |
+--------------------------+-------------------------+-------------------------+
|port_range_min            |Int                      |The minimum port number  |
=======
|tenant_id                 |Uuid *(Required)*        |The tenant ID of the     |
|                          |                         |security group rule      |
|                          |                         |owner.                   |
+--------------------------+-------------------------+-------------------------+
|port_range_min            |Int *(Optional)*         |The minimum port number  |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |in the range that is     |
|                          |                         |matched by the security  |
|                          |                         |group rule. If the       |
|                          |                         |protocol is ``TCP`` or   |
|                          |                         |``UDP``, this value must |
|                          |                         |be less than or equal to |
|                          |                         |the value of the         |
|                          |                         |``port_range_max``       |
|                          |                         |parameter. If the        |
|                          |                         |protocol is ``ICMP``,    |
|                          |                         |this value may be an     |
|                          |                         |``ICMP`` type. If the    |
|                          |                         |protocol attribute is    |
|                          |                         |"null", this value must  |
|                          |                         |be "null".               |
+--------------------------+-------------------------+-------------------------+
<<<<<<< HEAD
|port_range_max            |Int                      |The maximum port number  |
=======
|port_range_max            |Int *(Optional)*         |The maximum port number  |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |in the range that is     |
|                          |                         |matched by the security  |
|                          |                         |group rule. The          |
|                          |                         |``port_range_min``       |
|                          |                         |parameter constrains     |
|                          |                         |this ``port_range_max``  |
|                          |                         |parameter. If the        |
|                          |                         |protocol is ``ICMP``,    |
|                          |                         |this value may be an     |
|                          |                         |``ICMP`` code. If the    |
|                          |                         |protocol attribute is    |
|                          |                         |"null", this value must  |
|                          |                         |be "null".               |
+--------------------------+-------------------------+-------------------------+
<<<<<<< HEAD
|protocol                  |String                   |The protocol. Set to     |
|                          |                         |null.                    |
+--------------------------+-------------------------+-------------------------+
|remote_group_id           |String                   |The remote group ID.     |
=======
|protocol                  |String *(Optional)*      |The protocol. Set to     |
|                          |                         |null.                    |
+--------------------------+-------------------------+-------------------------+
|remote_group_id           |String *(Optional)*      |The remote group ID.     |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |This attribute must be   |
|                          |                         |set to null since self-  |
|                          |                         |referential Security     |
|                          |                         |Groups are not supported.|
+--------------------------+-------------------------+-------------------------+
<<<<<<< HEAD
|remote_ip_prefix          |String                   |The remote IP prefix.    |
=======
|remote_ip_prefix          |String *(Optional)*      |The remote IP prefix.    |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
|                          |                         |This attribute matches   |
|                          |                         |the specified IP prefix  |
|                          |                         |as the source IP address |
|                          |                         |of the IP packet.        |
+--------------------------+-------------------------+-------------------------+





**Example Create security group: JSON response**


.. code::

    {
       "security_group":{
          "description":"security group for webservers",
          "id":"10fb1612-f78f-4d35-b008-15133520debe",
          "name":"new-webservers",
          "security_group_rules":[],
          "tenant_id":"5831008"
       }
    }


