
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

List security group rules
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/security-group-rules

Retrieves a list of all security group rules that the requester can access.

This operation provides a list of security group rules for the requester with the unique ID for each security group rule.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
<<<<<<< HEAD
|200                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
=======
|200                       |                         |                         |
+--------------------------+-------------------------+-------------------------+
|401                       |                         |                         |
>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""






<<<<<<< HEAD
=======


>>>>>>> 2b706e3... Edits common.ent to add fixed_ips to create port call
This operation does not accept a request body.




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
|security_group_rules      |String                   |An array of rules in a   |
|                          |                         |security group.          |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid                     |The ID for the security  |
|                          |                         |group rule.              |
+--------------------------+-------------------------+-------------------------+
|direction                 |String                   |The direction (          |
=======
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





**Example List security group rules: JSON response**


.. code::

    {
       "security_group_rules":[
          {
             "direction":"ingress",
             "ethertype":"IPv6",
             "id":"c0b09f00-1d49-4e64-a0a7-8a186d928138",
             "port_range_max":22,
             "port_range_min":22,
             "protocol":"TCP",
             "remote_group_id":null,
             "remote_ip_prefix":null,
             "security_group_id":"85cc3048-abc3-43cc-89b3-377341426ac5",
             "tenant_id":"5831008"
          },
          {
             "direction":"ingress",
             "ethertype":"IPv4",
             "id":"f7d45c89-008e-4bab-88ad-d6811724c51c",
             "port_range_max":22,
             "port_range_min":22,
             "protocol":"TCP",
             "remote_group_id":null,
             "remote_ip_prefix":null,
             "security_group_id":"85cc3048-abc3-43cc-89b3-377341426ac5",
             "tenant_id":"5831008"
          }
       ]
    }


