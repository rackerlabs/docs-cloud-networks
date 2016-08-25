
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

..  _post-create-security-group-rule-v2.0-security-group-rules:

Create security group rule
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    POST /v2.0/security-group-rules

This operation creates a security group rule.

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
|404                       |Not Found                |Item not found.          |
+--------------------------+-------------------------+-------------------------+
|409                       |buildInProgress          |Build is in progress.    |
+--------------------------+-------------------------+-------------------------+


Request
-------


This table shows the body parameters for the request:

+----------------------------------+---------------------+---------------------+
|Name                              |Type                 |Description          |
+==================================+=====================+=====================+
|**security_group_rule**           |String               |An object to contain |
|                                  |                     |the security group   |
|                                  |                     |rules.               |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |String               |The direction of     |
|**direction**                     |                     |traffic. An          |
|                                  |                     |``ingress`` rule is  |
|                                  |                     |applied to incoming  |
|                                  |                     |server traffic and an|
|                                  |                     |``egress`` rule is   |
|                                  |                     |applied to outgoing  |
|                                  |                     |server traffic.      |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |String               |The network ether    |
|**ethertype**                     |                     |type, either         |
|                                  |                     |``IPv4`` or          |
|                                  |                     |``IPv6``. Addresses  |
|                                  |                     |represented in CIDR  |
|                                  |                     |must match the       |
|                                  |                     |ingress rules.       |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |Uuid                 |The ID of the        |
|**security_group_id**             |                     |security group to    |
|                                  |                     |associate with this  |
|                                  |                     |security group rule. |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |Int                  |The minimum port     |
|**port_range_min**                |                     |number in the range  |
|                                  |                     |that is matched by   |
|                                  |                     |the security group   |
|                                  |                     |rule. If the         |
|                                  |                     |protocol is ``TCP``  |
|                                  |                     |or ``UDP``, this     |
|                                  |                     |value must be less   |
|                                  |                     |than or equal to the |
|                                  |                     |value of the         |
|                                  |                     |``port_range_max``   |
|                                  |                     |parameter. If the    |
|                                  |                     |protocol is          |
|                                  |                     |``ICMP``, this value |
|                                  |                     |may be an ``ICMP``   |
|                                  |                     |type. If the         |
|                                  |                     |protocol attribute   |
|                                  |                     |is "null", this      |
|                                  |                     |value must be "null".|
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |Int                  |The maximum port     |
|**port_range_max**                |                     |number in the range  |
|                                  |                     |that is matched by   |
|                                  |                     |the security group   |
|                                  |                     |rule. The            |
|                                  |                     |``port_range_min``   |
|                                  |                     |parameter constrains |
|                                  |                     |this                 |
|                                  |                     |``port_range_max``   |
|                                  |                     |parameter. If the    |
|                                  |                     |protocol is          |
|                                  |                     |``ICMP``, this value |
|                                  |                     |may be an ``ICMP``   |
|                                  |                     |code. If the         |
|                                  |                     |protocol attribute   |
|                                  |                     |is "null", this      |
|                                  |                     |value must be "null".|
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |String               |The protocol that is |
|**protocol**                      |                     |matched by the       |
|                                  |                     |security group rule. |
|                                  |                     |Valid values are     |
|                                  |                     |``null``, ``tcp``,   |
|                                  |                     |``udp``, and         |
|                                  |                     |``icmp``.            |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |Uuid                 |The remote group ID  |
|**remote_group_id**               |                     |to be associated     |
|                                  |                     |with this security   |
|                                  |                     |group rule. This     |
|                                  |                     |attribute must be    |
|                                  |                     |set to null since    |
|                                  |                     |self-referential     |
|                                  |                     |Security Groups are  |
|                                  |                     |not supported.       |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |Uuid                 |The remote IP prefix |
|**remote_ip_prefix**              |                     |to be associated     |
|                                  |                     |with this security   |
|                                  |                     |group rule. This     |
|                                  |                     |attribute matches    |
|                                  |                     |the specified IP     |
|                                  |                     |prefix as the source |
|                                  |                     |IP address of the IP |
|                                  |                     |packet.              |
+----------------------------------+---------------------+---------------------+


**Example Create security group rule: JSON request**


.. code::

   POST /v2.0/security-group-rules.json
   Accept: application/json
   {
      "security_group_rule":{
         "direction":"ingress",
         "port_range_min":"80",
         "ethertype":"IPv4",
         "port_range_max":"80",
         "protocol":"TCP",
         "remote_group_id":null,
         "security_group_id":"a7734e61-b545-452d-a3cd-0189cbd9747a"
      }
   }


Response
--------


This table shows the body parameters for the response:

+----------------------------------+---------------------+---------------------+
|Name                              |Type                 |Description          |
+==================================+=====================+=====================+
|**security_group_rule**           |String               |An array of rules in |
|                                  |                     |a security group.    |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\ **id**      |Uuid                 |The ID for the       |
|                                  |                     |security group rule. |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |String               |The direction of     |
|**direction**                     |                     |traffic. An          |
|                                  |                     |``ingress`` rule is  |
|                                  |                     |applied to incoming  |
|                                  |                     |server traffic and an|
|                                  |                     |``egress`` rule is   |
|                                  |                     |applied to outgoing  |
|                                  |                     |server traffic.      |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |String               |The network ether    |
|**ethertype**                     |                     |type, either         |
|                                  |                     |``IPv4`` or ``IPv6``.|
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |Uuid                 |The security group   |
|**security_group_id**             |                     |ID for the security  |
|                                  |                     |group with which the |
|                                  |                     |rule is associated.  |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |Uuid                 |The tenant ID of the |
|**tenant_id**                     |                     |security group rule  |
|                                  |                     |owner.               |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |Int                  |The minimum port     |
|**port_range_min**                |                     |number in the range  |
|                                  |                     |that is matched by   |
|                                  |                     |the security group   |
|                                  |                     |rule. If the         |
|                                  |                     |protocol is ``TCP``  |
|                                  |                     |or ``UDP``, this     |
|                                  |                     |value must be less   |
|                                  |                     |than or equal to the |
|                                  |                     |value of the         |
|                                  |                     |``port_range_max``   |
|                                  |                     |parameter. If the    |
|                                  |                     |protocol is          |
|                                  |                     |``ICMP``, this value |
|                                  |                     |may be an ``ICMP``   |
|                                  |                     |type. If the         |
|                                  |                     |protocol attribute   |
|                                  |                     |is "null", this      |
|                                  |                     |value must be "null".|
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |Int                  |The maximum port     |
|**port_range_max**                |                     |number in the range  |
|                                  |                     |that is matched by   |
|                                  |                     |the security group   |
|                                  |                     |rule. The            |
|                                  |                     |``port_range_min``   |
|                                  |                     |parameter constrains |
|                                  |                     |this                 |
|                                  |                     |``port_range_max``   |
|                                  |                     |parameter. If the    |
|                                  |                     |protocol is          |
|                                  |                     |``ICMP``, this value |
|                                  |                     |may be an ``ICMP``   |
|                                  |                     |code. If the         |
|                                  |                     |protocol attribute   |
|                                  |                     |is "null", this      |
|                                  |                     |value must be "null".|
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |String               |The protocol. Set to |
|**protocol**                      |                     |null.                |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |String               |The remote group ID. |
|**remote_group_id**               |                     |This attribute must  |
|                                  |                     |be set to null since |
|                                  |                     |self-referential     |
|                                  |                     |Security Groups are  |
|                                  |                     |not supported.       |
+----------------------------------+---------------------+---------------------+
|security_group_rule.\             |String               |The remote IP        |
|**remote_ip_prefix**              |                     |prefix. This         |
|                                  |                     |attribute matches    |
|                                  |                     |the specified IP     |
|                                  |                     |prefix as the source |
|                                  |                     |IP address of the IP |
|                                  |                     |packet.              |
+----------------------------------+---------------------+---------------------+


**Example Create security group rule: JSON response**


.. code::

   {
      "security_group_rule":{
         "direction":"ingress",
         "ethertype":"IPv4",
         "id":"2bc0accf-312e-429a-956e-e4407625eb62",
         "port_range_max":80,
         "port_range_min":80,
         "protocol":"TCP",
         "remote_group_id":null,
         "remote_ip_prefix":null,
         "security_group_id":"a7734e61-b545-452d-a3cd-0189cbd9747a",
         "tenant_id":"5831008"
      }
   }




