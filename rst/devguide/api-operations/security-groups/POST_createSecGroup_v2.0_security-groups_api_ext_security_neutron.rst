=========================================================================
Create security group - Cloud Networks™ Developer Guide  - Neutron API v2
=========================================================================

 Create security group
~~~~~~~~~~~~~~~~~~~~~~

`Request <POST_createSecGroup_v2.0_security-groups_api_ext_security_neutron.html#POST_createSecGroup_v2.0_security-groups_api_ext_security_neutron-Request>`__
`Response <POST_createSecGroup_v2.0_security-groups_api_ext_security_neutron.html#POST_createSecGroup_v2.0_security-groups_api_ext_security_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **POST* | ``/v2.0/security-groups``    | Creates a security group.            |
| *       |                              |                                      |
+---------+------------------------------+--------------------------------------+

This operation creates a security group with default security group
rules for the ``IPv4`` and ``IPv6`` ether types.

**Normal response codes:** 201

**Error response codes:** badRequest (400), unauthorized (401)

 Request
^^^^^^^^

This list shows the body parameters for the request:

`|image2|\ Collapse All <#>`__ \| `|image3|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **security\_group**: Object. Required.

      A container for security group details.

      -  **name**: Xsd:string. Required.

         A symbolic name for the security group, which does not need to
         be unique.

      -  **description**: Xsd:string. Optional.

         Describes the security group.

 
**Example 5.24. Create security group: JSON request**

.. code::  

    {
       "security_group":{
          "name":"new-webservers",
          "description":"security group for webservers"
       }
    }

 Response
^^^^^^^^^

This list shows the body parameters for the response:

`|image4|\ Collapse All <#>`__ \| `|image5|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **security\_group**: Object. Required.

      The container for security group details.

      -  **id**: Csapi:uuid. Required.

         The UUID for the security group.

      -  **name**: Xsd:string. Required.

         The security group name.

      -  **description**: Xsd:string. Required.

         The security group description.

      -  **tenant\_id**: Csapi:uuid. Required.

         The tenant ID of the security group owner.

      -  **security\_group\_rules**: Xsd:string. Required.

         An array of rules in a security group.

         -  **id**: Csapi:uuid. Required.

            The ID for the security group rule.

         -  **direction**: Xsd:string. Required.

            The direction (``ingress``). For a Cloud Servers instance,
            an ``ingress`` security group rule is applied to incoming
            traffic for that instance.

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
            ``port_range_max`` parameter. If the protocol is ``ICMP``,
            this value may be an ``ICMP`` type. If the protocol
            attribute is "null", this value must be "null".

         -  **port\_range\_max**: Xsd:int. Optional.

            The maximum port number in the range that is matched by the
            security group rule. The ``port_range_min`` parameter
            constrains this ``port_range_max`` parameter. If the
            protocol is ``ICMP``, this value may be an ``ICMP`` code. If
            the protocol attribute is "null", this value must be "null".

         -  **protocol**: Xsd:string. Optional.

            The protocol. Set to null.

         -  **remote\_group\_id**: Xsd:string. Optional.

            The remote group ID. This attribute must be set to null
            since self-referential Security Groups are not supported.

         -  **remote\_ip\_prefix**: Xsd:string. Optional.

            The remote IP prefix. This attribute matches the specified
            IP prefix as the source IP address of the IP packet.

 
**Example 5.25. Create security group: JSON response**

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
