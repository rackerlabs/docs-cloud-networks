
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

..  _get-list-security-group-rules-v2.0-security-group-rules: 

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
|200                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |The user is unauthorized |
|                          |                         |to make this request.    |
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""








This operation does not accept a request body.




Response
""""""""""""""""





This table shows the body parameters for the response:

+-----------------------------------+---------------------+--------------------+
|Name                               |Type                 |Description         |
+===================================+=====================+====================+
|parameters.\                       |String               |An array of rules   |
|**security_group_rules**           |                     |in a security group.|
+-----------------------------------+---------------------+--------------------+
|parameters.security_group_rules.\  |Uuid                 |The ID for the      |
|**id**                             |                     |security group rule.|
+-----------------------------------+---------------------+--------------------+
|parameters.security_group_rules.\  |String               |The direction (     |
|**direction**                      |                     |``ingress`` ). For  |
|                                   |                     |a Cloud Servers     |
|                                   |                     |instance, an        |
|                                   |                     |``ingress``         |
|                                   |                     |security group rule |
|                                   |                     |is applied to       |
|                                   |                     |incoming traffic    |
|                                   |                     |for that instance.  |
+-----------------------------------+---------------------+--------------------+
|parameters.security_group_rules.\  |String               |The network ether   |
|**ethertype**                      |                     |type, either        |
|                                   |                     |``IPv4`` or         |
|                                   |                     |``IPv6``.           |
+-----------------------------------+---------------------+--------------------+
|parameters.security_group_rules.\  |Uuid                 |The security group  |
|**security_group_id**              |                     |ID for the security |
|                                   |                     |group with which    |
|                                   |                     |the rule is         |
|                                   |                     |associated.         |
+-----------------------------------+---------------------+--------------------+
|parameters.security_group_rules.\  |Uuid                 |The tenant ID of    |
|**tenant_id**                      |                     |the security group  |
|                                   |                     |rule owner.         |
+-----------------------------------+---------------------+--------------------+
|parameters.security_group_rules.\  |Int                  |The minimum port    |
|**port_range_min**                 |                     |number in the range |
|                                   |                     |that is matched by  |
|                                   |                     |the security group  |
|                                   |                     |rule. If the        |
|                                   |                     |protocol is ``TCP`` |
|                                   |                     |or ``UDP``, this    |
|                                   |                     |value must be less  |
|                                   |                     |than or equal to    |
|                                   |                     |the value of the    |
|                                   |                     |``port_range_max``  |
|                                   |                     |parameter. If the   |
|                                   |                     |protocol is         |
|                                   |                     |``ICMP``, this      |
|                                   |                     |value may be an     |
|                                   |                     |``ICMP`` type. If   |
|                                   |                     |the protocol        |
|                                   |                     |attribute is        |
|                                   |                     |"null", this value  |
|                                   |                     |must be "null".     |
+-----------------------------------+---------------------+--------------------+
|parameters.security_group_rules.\  |Int                  |The maximum port    |
|**port_range_max**                 |                     |number in the range |
|                                   |                     |that is matched by  |
|                                   |                     |the security group  |
|                                   |                     |rule. The           |
|                                   |                     |``port_range_min``  |
|                                   |                     |parameter           |
|                                   |                     |constrains this     |
|                                   |                     |``port_range_max``  |
|                                   |                     |parameter. If the   |
|                                   |                     |protocol is         |
|                                   |                     |``ICMP``, this      |
|                                   |                     |value may be an     |
|                                   |                     |``ICMP`` code. If   |
|                                   |                     |the protocol        |
|                                   |                     |attribute is        |
|                                   |                     |"null", this value  |
|                                   |                     |must be "null".     |
+-----------------------------------+---------------------+--------------------+
|parameters.security_group_rules.\  |String               |The protocol. Set   |
|**protocol**                       |                     |to null.            |
+-----------------------------------+---------------------+--------------------+
|parameters.security_group_rules.\  |String               |The remote group    |
|**remote_group_id**                |                     |ID. This attribute  |
|                                   |                     |must be set to null |
|                                   |                     |since self-         |
|                                   |                     |referential         |
|                                   |                     |Security Groups are |
|                                   |                     |not supported.      |
+-----------------------------------+---------------------+--------------------+
|parameters.security_group_rules.\  |String               |The remote IP       |
|**remote_ip_prefix**               |                     |prefix. This        |
|                                   |                     |attribute matches   |
|                                   |                     |the specified IP    |
|                                   |                     |prefix as the       |
|                                   |                     |source IP address   |
|                                   |                     |of the IP packet.   |
+-----------------------------------+---------------------+--------------------+







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




