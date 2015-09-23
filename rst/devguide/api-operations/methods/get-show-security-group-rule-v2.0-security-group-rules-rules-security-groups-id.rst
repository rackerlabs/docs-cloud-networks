
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
|parameters.\                      |String               |An array of rules in |
|**security_group_rule**           |                     |a security group.    |
+----------------------------------+---------------------+---------------------+
|parameters.security_group_rule.\  |Uuid                 |The ID for the       |
|**id**                            |                     |security group rule. |
+----------------------------------+---------------------+---------------------+
|parameters.security_group_rule.\  |String               |The direction (      |
|**direction**                     |                     |``ingress`` ). For a |
|                                  |                     |Cloud Servers        |
|                                  |                     |instance, an         |
|                                  |                     |``ingress`` security |
|                                  |                     |group rule is        |
|                                  |                     |applied to incoming  |
|                                  |                     |traffic for that     |
|                                  |                     |instance.            |
+----------------------------------+---------------------+---------------------+
|parameters.security_group_rule.\  |String               |The network ether    |
|**ethertype**                     |                     |type, either         |
|                                  |                     |``IPv4`` or ``IPv6``.|
+----------------------------------+---------------------+---------------------+
|parameters.security_group_rule.\  |Uuid                 |The security group   |
|**security_group_id**             |                     |ID for the security  |
|                                  |                     |group with which the |
|                                  |                     |rule is associated.  |
+----------------------------------+---------------------+---------------------+
|parameters.security_group_rule.\  |Uuid                 |The tenant ID of the |
|**tenant_id**                     |                     |security group rule  |
|                                  |                     |owner.               |
+----------------------------------+---------------------+---------------------+
|parameters.security_group_rule.\  |Int                  |The minimum port     |
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
|parameters.security_group_rule.\  |Int                  |The maximum port     |
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
|parameters.security_group_rule.\  |String               |The protocol. Set to |
|**protocol**                      |                     |null.                |
+----------------------------------+---------------------+---------------------+
|parameters.security_group_rule.\  |String               |The remote group ID. |
|**remote_group_id**               |                     |This attribute must  |
|                                  |                     |be set to null since |
|                                  |                     |self-referential     |
|                                  |                     |Security Groups are  |
|                                  |                     |not supported.       |
+----------------------------------+---------------------+---------------------+
|parameters.security_group_rule.\  |String               |The remote IP        |
|**remote_ip_prefix**              |                     |prefix. This         |
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




