========================================================================
List security groups - Cloud Networks™ Developer Guide  - Neutron API v2
========================================================================

 List security groups
~~~~~~~~~~~~~~~~~~~~~

`Request <GET_listSecGroups_v2.0_security-groups_api_ext_security_neutron.html#GET_listSecGroups_v2.0_security-groups_api_ext_security_neutron-Request>`__
`Response <GET_listSecGroups_v2.0_security-groups_api_ext_security_neutron.html#GET_listSecGroups_v2.0_security-groups_api_ext_security_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **GET** | ``/v2.0/security-groups``    | Retrieves a list of all security     |
|         |                              | groups to which the specified tenant |
|         |                              | has access.                          |
+---------+------------------------------+--------------------------------------+

**Normal response codes:** 200

**Error response codes:** unauthorized (401)

 Request
^^^^^^^^

This operation does not accept a request body.

 Response
^^^^^^^^^

This list shows the body parameters for the response:

`|image2|\ Collapse All <#>`__ \| `|image3|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **security\_groups**: Object. Required.

      An array of security groups.

      -  **id**: Csapi:uuid. Required.

         The UUID for the security group.

      -  **name**: Xsd:string. Required.

         The security group name.

      -  **description**: Xsd:string. Required.

         The security group description.

      -  **tenant\_id**: Csapi:uuid. Required.

         The tenant ID of the owner of the security groups.

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

         -  **protocol**: Xsd:string. Required.

            The protocol that is matched by the security group rule.
            Valid values are ``null``, ``tcp``, ``udp``, and ``icmp``.

         -  **remote\_group\_id**: Xsd:string. Optional.

            The remote group ID. This attribute must be set to null
            since self-referential Security Groups are not supported.

         -  **remote\_ip\_prefix**: Xsd:string. Optional.

            The remote IP prefix. This attribute matches the specified
            IP prefix as the source IP address of the IP packet.

 
**Example 5.23. List security groups: JSON response**

.. code::  

    {
        "security_groups": [
            {
                "description": "default",
                "id": "85cc3048-abc3-43cc-89b3-377341426ac5",
                "name": "default",
                "security_group_rules": [
                    {
                        "direction": "ingress",
                        "ethertype": "IPv6",
                        "id": "c0b09f00-1d49-4e64-a0a7-8a186d928138",
                        "port_range_max": 22,
                        "port_range_min": 22,
                        "protocol": "TCP",
                        "remote_group_id": null,
                        "remote_ip_prefix": null,
                        "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
                        "tenant_id": "5831008"
                    },
                    {
                        "direction": "ingress",
                        "ethertype": "IPv4",
                        "id": "f7d45c89-008e-4bab-88ad-d6811724c51c",
                        "port_range_max": 22,
                        "port_range_min": 22,
                        "protocol": "TCP",
                        "remote_group_id": null,
                        "remote_ip_prefix": null,
                        "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
                        "tenant_id": "5831008"
                    }
                ],
                "tenant_id": "5831008"
            }
        ]
    }
