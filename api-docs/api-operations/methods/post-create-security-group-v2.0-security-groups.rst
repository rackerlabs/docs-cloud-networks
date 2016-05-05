..  _post-create-security-group-v2.0-security-groups: 

Create security group
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/security-groups

This operation creates a security group.

This operation creates a security group with default security group rules for the ``IPv4`` 
and ``IPv6`` ether types.



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


Request
""""""""""""""""


This table shows the body parameters for the request:

+-----------------------------+------------------------+-----------------------+
|Name                         |Type                    |Description            |
+=============================+========================+=======================+
|**security_group**           |Object                  |A container for        |
|                             |                        |security group details.|
+-----------------------------+------------------------+-----------------------+
|security_group.\ **name**    |String                  |A symbolic name for    |
|                             |                        |the security group,    |
|                             |                        |which does not need to |
|                             |                        |be unique.             |
+-----------------------------+------------------------+-----------------------+
|security_group.\             |String *(Optional)*     |Describes the security |
|**description**              |                        |group.                 |
+-----------------------------+------------------------+-----------------------+



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


This table shows the body parameters for the response:

+--------------------------------------------------+-------+--------------------+
|Name                                              |Type   |Description         |
+==================================================+=======+====================+
|**security_group**                                |Object |The container for   |
|                                                  |       |security group      |
|                                                  |       |details.            |
+--------------------------------------------------+-------+--------------------+
|security_group.\ **id**                           |Uuid   |The UUID for the    |
|                                                  |       |security group.     |
+--------------------------------------------------+-------+--------------------+
|security_group.\ **name**                         |String |The security group  |
|                                                  |       |name.               |
+--------------------------------------------------+-------+--------------------+
|security_group.\ **description**                  |String |The security group  |
|                                                  |       |description.        |
+--------------------------------------------------+-------+--------------------+
|security_group.\ **tenant_id**                    |Uuid   |The tenant ID of    |
|                                                  |       |the security group  |
|                                                  |       |owner.              |
+--------------------------------------------------+-------+--------------------+
|security_group.\ **security_group_rules**         |String |An array of rules   |
|                                                  |       |in a security group.|
+--------------------------------------------------+-------+--------------------+
|security_group.security_group_rules.\ **id**      |Uuid   |The ID for the      |
|                                                  |       |security group rule.|
+--------------------------------------------------+-------+--------------------+
|security_group.security_group_rules.\             |String |The direction of    |
|**direction**                                     |       |traffic. An         |
|                                                  |       |``ingress`` rule    |
|                                                  |       |applies to incoming |
|                                                  |       |server traffic and  |
|                                                  |       |an ``egress`` rule  |
|                                                  |       |applies to outgoing |
|                                                  |       |server traffic.     |
+--------------------------------------------------+-------+--------------------+
|security_group.security_group_rules.\             |String |The network ether   |
|**ethertype**                                     |       |type, either        |
|                                                  |       |``IPv4`` or         |
|                                                  |       |``IPv6``.           |
+--------------------------------------------------+-------+--------------------+
|security_group.security_group_rules.\             |Uuid   |The security group  |
|**security_group_id**                             |       |ID for the security |
|                                                  |       |group with which    |
|                                                  |       |the rule is         |
|                                                  |       |associated.         |
+--------------------------------------------------+-------+--------------------+
|security_group.security_group_rules.\             |Uuid   |The tenant ID of    |
|**tenant_id**                                     |       |the security group  |
|                                                  |       |rule owner.         |
+--------------------------------------------------+-------+--------------------+
|security_group.security_group_rules.\             |Int    |The minimum port    |
|**port_range_min**                                |       |number in the range |
|                                                  |       |that is matched by  |
|                                                  |       |the security group  |
|                                                  |       |rule. If the        |
|                                                  |       |protocol is ``TCP`` |
|                                                  |       |or ``UDP``, this    |
|                                                  |       |value must be less  |
|                                                  |       |than or equal to    |
|                                                  |       |the value of the    |
|                                                  |       |``port_range_max``  |
|                                                  |       |parameter. If the   |
|                                                  |       |protocol is         |
|                                                  |       |``ICMP``, this      |
|                                                  |       |value may be an     |
|                                                  |       |``ICMP`` type. If   |
|                                                  |       |the protocol        |
|                                                  |       |attribute is        |
|                                                  |       |"null", this value  |
|                                                  |       |must be "null".     |
+--------------------------------------------------+-------+--------------------+
|security_group.security_group_rules.\             |Int    |The maximum port    |
|**port_range_max**                                |       |number in the range |
|                                                  |       |that is matched by  |
|                                                  |       |the security group  |
|                                                  |       |rule. The           |
|                                                  |       |``port_range_min``  |
|                                                  |       |parameter           |
|                                                  |       |constrains this     |
|                                                  |       |``port_range_max``  |
|                                                  |       |parameter. If the   |
|                                                  |       |protocol is         |
|                                                  |       |``ICMP``, this      |
|                                                  |       |value may be an     |
|                                                  |       |``ICMP`` code. If   |
|                                                  |       |the protocol        |
|                                                  |       |attribute is        |
|                                                  |       |"null", this value  |
|                                                  |       |must be "null".     |
+--------------------------------------------------+-------+--------------------+
|security_group.security_group_rules.\             |String |The protocol. Set   |
|**protocol**                                      |       |to null.            |
+--------------------------------------------------+-------+--------------------+
|security_group.security_group_rules.\             |String |The remote group    |
|**remote_group_id**                               |       |ID. This attribute  |
|                                                  |       |must be set to null |
|                                                  |       |since self-         |
|                                                  |       |referential         |
|                                                  |       |Security Groups are |
|                                                  |       |not supported.      |
+--------------------------------------------------+-------+--------------------+
|security_group.security_group_rules.\             |String |The remote IP       |
|**remote_ip_prefix**                              |       |prefix. This        |
|                                                  |       |attribute matches   |
|                                                  |       |the specified IP    |
|                                                  |       |prefix as the       |
|                                                  |       |source IP address   |
|                                                  |       |of the IP packet.   |
+--------------------------------------------------+-------+--------------------+


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




