==============================================================================
Create security group rule - Cloud Networks™ Developer Guide  - Neutron API v2
==============================================================================

 Create security group rule
~~~~~~~~~~~~~~~~~~~~~~~~~~~

`Request <POST_createSecGroupRule_v2.0_security-group-rules_api_ext_security_neutron.html#POST_createSecGroupRule_v2.0_security-group-rules_api_ext_security_neutron-Request>`__
`Response <POST_createSecGroupRule_v2.0_security-group-rules_api_ext_security_neutron.html#POST_createSecGroupRule_v2.0_security-group-rules_api_ext_security_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **POST* | ``/v2.0/security-group-rules | Creates a security group rule.       |
| *       | ``                           |                                      |
+---------+------------------------------+--------------------------------------+

**Normal response codes:** 201

**Error response codes:** badRequest (400), unauthorized (401),
itemNotFound (404), buildInProgress (409)

 Request
^^^^^^^^

This list shows the body parameters for the request:

`|image2|\ Collapse All <#>`__ \| `|image3|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **security\_group\_rule**: Xsd:string. Required.

      An object to contain the security group rules.

      -  **direction**: Xsd:string. Required.

         The direction in which the security group rule is applied
         (``ingress``). For a Cloud Servers instance, an ingress
         security group rule is applied to incoming (ingress) traffic
         for that instance.

      -  **ethertype**: Xsd:string. Required.

         The network ether type, either ``IPv4`` or ``IPv6``. Addresses
         represented in CIDR must match the ingress rules.

      -  **security\_group\_id**: Csapi:uuid. Required.

         The ID of the security group to associate with this security
         group rule.

      -  **port\_range\_min**: Xsd:int. Optional.

         The minimum port number in the range that is matched by the
         security group rule. If the protocol is ``TCP`` or ``UDP``,
         this value must be less than or equal to the value of the
         ``port_range_max`` parameter. If the protocol is ``ICMP``, this
         value may be an ``ICMP`` type. If the protocol attribute is
         "null", this value must be "null".

      -  **port\_range\_max**: Xsd:int. Optional.

         The maximum port number in the range that is matched by the
         security group rule. The ``port_range_min`` parameter
         constrains this ``port_range_max`` parameter. If the protocol
         is ``ICMP``, this value may be an ``ICMP`` code. If the
         protocol attribute is "null", this value must be "null".

      -  **protocol**: Xsd:string. Optional.

         The protocol that is matched by the security group rule. Valid
         values are ``null``, ``tcp``, ``udp``, and ``icmp``.

      -  **remote\_group\_id**: Csapi:uuid. Optional.

         The remote group ID to be associated with this security group
         rule. This attribute must be set to null since self-referential
         Security Groups are not supported.

      -  **remote\_ip\_prefix**: Csapi:uuid. Optional.

         The remote IP prefix to be associated with this security group
         rule. This attribute matches the specified IP prefix as the
         source IP address of the IP packet.

 
**Example 5.29. Create security group rule: JSON request**

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
^^^^^^^^^

This list shows the body parameters for the response:

`|image4|\ Collapse All <#>`__ \| `|image5|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **security\_group\_rule**: Xsd:string. Required.

      An array of rules in a security group.

      -  **id**: Csapi:uuid. Required.

         The ID for the security group rule.

      -  **direction**: Xsd:string. Required.

         The direction (``ingress``). For a Cloud Servers instance, an
         ``ingress`` security group rule is applied to incoming traffic
         for that instance.

      -  **ethertype**: Xsd:string. Required.

         The network ether type, either ``IPv4`` or ``IPv6``.

      -  **security\_group\_id**: Csapi:uuid. Required.

         The security group ID for the security group with which the
         rule is associated.

      -  **tenant\_id**: Csapi:uuid. Required.

         The tenant ID of the security group rule owner.

      -  **port\_range\_min**: Xsd:int. Optional.

         The minimum port number in the range that is matched by the
         security group rule. If the protocol is ``TCP`` or ``UDP``,
         this value must be less than or equal to the value of the
         ``port_range_max`` parameter. If the protocol is ``ICMP``, this
         value may be an ``ICMP`` type. If the protocol attribute is
         "null", this value must be "null".

      -  **port\_range\_max**: Xsd:int. Optional.

         The maximum port number in the range that is matched by the
         security group rule. The ``port_range_min`` parameter
         constrains this ``port_range_max`` parameter. If the protocol
         is ``ICMP``, this value may be an ``ICMP`` code. If the
         protocol attribute is "null", this value must be "null".

      -  **protocol**: Xsd:string. Optional.

         The protocol. Set to null.

      -  **remote\_group\_id**: Xsd:string. Optional.

         The remote group ID. This attribute must be set to null since
         self-referential Security Groups are not supported.

      -  **remote\_ip\_prefix**: Xsd:string. Optional.

         The remote IP prefix. This attribute matches the specified IP
         prefix as the source IP address of the IP packet.

 
**Example 5.30. Create security group rule: JSON response**

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
