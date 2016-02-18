
.. THIS OUTPUT IS GENERATED FROM THE WADL. DO NOT EDIT.

..  _get-show-security-group-rule-v2.0-security-group-rules-rules-security-groups-id: 

Show security group rule
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    GET /v2.0/security-group-rules/{rules-security-groups-id}

Retrieves information about the specified security group rule.



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
|{rules-security-groups-id}|Uuid                     |The unique identifier of |
|                          |                         |the security group rule. |
+--------------------------+-------------------------+-------------------------+



This operation does not accept a request body.


Response
""""""""""""""""


This table shows the body parameters for the response:

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



**Example Show security group rule: JSON response**


.. code::

   {
      "security_group_rule":{
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
      }
   }




