
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

Create security group rule
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    POST /v2.0/security-group-rules

Creates a security group rule.



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
|409                       |buildInProgress          |Build is in progress.    |
+--------------------------+-------------------------+-------------------------+


Request
""""""""""""""""






This table shows the body parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|security_group_rule       |String *(Required)*      |An object to contain the |
|                          |                         |security group rules.    |
+--------------------------+-------------------------+-------------------------+
|direction                 |String *(Required)*      |The direction in which   |
|                          |                         |the security group rule  |
|                          |                         |is applied ( ``ingress`` |
|                          |                         |). For a Cloud Servers   |
|                          |                         |instance, an ingress     |
|                          |                         |security group rule is   |
|                          |                         |applied to incoming      |
|                          |                         |(ingress) traffic for    |
|                          |                         |that instance.           |
+--------------------------+-------------------------+-------------------------+
|ethertype                 |String *(Required)*      |The network ether type,  |
|                          |                         |either ``IPv4`` or       |
|                          |                         |``IPv6``. Addresses      |
|                          |                         |represented in CIDR must |
|                          |                         |match the ingress rules. |
+--------------------------+-------------------------+-------------------------+
|security_group_id         |Uuid *(Required)*        |The ID of the security   |
|                          |                         |group to associate with  |
|                          |                         |this security group rule.|
+--------------------------+-------------------------+-------------------------+
|port_range_min            |Int *(Optional)*         |The minimum port number  |
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
|port_range_max            |Int *(Optional)*         |The maximum port number  |
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
|protocol                  |String *(Optional)*      |The protocol that is     |
|                          |                         |matched by the security  |
|                          |                         |group rule. Valid values |
|                          |                         |are ``null``, ``tcp``,   |
|                          |                         |``udp``, and ``icmp``.   |
+--------------------------+-------------------------+-------------------------+
|remote_group_id           |Uuid *(Optional)*        |The remote group ID to   |
|                          |                         |be associated with this  |
|                          |                         |security group rule.     |
|                          |                         |This attribute must be   |
|                          |                         |set to null since self-  |
|                          |                         |referential Security     |
|                          |                         |Groups are not supported.|
+--------------------------+-------------------------+-------------------------+
|remote_ip_prefix          |Uuid *(Optional)*        |The remote IP prefix to  |
|                          |                         |be associated with this  |
|                          |                         |security group rule.     |
|                          |                         |This attribute matches   |
|                          |                         |the specified IP prefix  |
|                          |                         |as the source IP address |
|                          |                         |of the IP packet.        |
+--------------------------+-------------------------+-------------------------+





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
""""""""""""""""


This table shows the body parameters for the response:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|security_group_rule       |String                   |An array of rules in a   |
|                          |                         |security group.          |
+--------------------------+-------------------------+-------------------------+
|id                        |Uuid                     |The ID for the security  |
|                          |                         |group rule.              |
+--------------------------+-------------------------+-------------------------+
|direction                 |String                   |The direction (          |
|                          |                         |``ingress`` ). For a     |
|                          |                         |Cloud Servers instance,  |
|                          |                         |an ``ingress`` security  |
|                          |                         |group rule is applied to |
|                          |                         |incoming traffic for     |
|                          |                         |that instance.           |
+--------------------------+-------------------------+-------------------------+
|ethertype                 |String                   |The network ether type,  |
|                          |                         |either ``IPv4`` or       |
|                          |                         |``IPv6``.                |
+--------------------------+-------------------------+-------------------------+
|security_group_id         |Uuid                     |The security group ID    |
|                          |                         |for the security group   |
|                          |                         |with which the rule is   |
|                          |                         |associated.              |
+--------------------------+-------------------------+-------------------------+
|tenant_id                 |Uuid                     |The tenant ID of the     |
|                          |                         |security group rule      |
|                          |                         |owner.                   |
+--------------------------+-------------------------+-------------------------+
|port_range_min            |Int                      |The minimum port number  |
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
|port_range_max            |Int                      |The maximum port number  |
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
|protocol                  |String                   |The protocol. Set to     |
|                          |                         |null.                    |
+--------------------------+-------------------------+-------------------------+
|remote_group_id           |String                   |The remote group ID.     |
|                          |                         |This attribute must be   |
|                          |                         |set to null since self-  |
|                          |                         |referential Security     |
|                          |                         |Groups are not supported.|
+--------------------------+-------------------------+-------------------------+
|remote_ip_prefix          |String                   |The remote IP prefix.    |
|                          |                         |This attribute matches   |
|                          |                         |the specified IP prefix  |
|                          |                         |as the source IP address |
|                          |                         |of the IP packet.        |
+--------------------------+-------------------------+-------------------------+





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


