
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

..  _get-show-security-group-v2.0-security-groups-security-group-ids:

Show security group
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/security-groups/{security_group_id}

Retrieves information for a specified security group.

This operation returns a response body that contains the description, name, security group 
ID, tenant ID, and security group rules associated with the specified security group.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |
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
|{security_group_id}       |Uuid                     |The unique identifier of |
|                          |                         |the security group.      |
+--------------------------+-------------------------+-------------------------+



This operation does not accept a request body.


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


**Example Show security group: JSON response**


.. code::

   {
      "security_group":{
         "description":"default",
         "id":"85cc3048-abc3-43cc-89b3-377341426ac5",
         "name":"default",
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
         ],
         "tenant_id":"5831008"
      }
   }




