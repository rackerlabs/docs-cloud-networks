============================================================================
Retrieve list of subnets - Cloud Networks™ Developer Guide  - Neutron API v2
============================================================================

 Retrieve list of subnets
~~~~~~~~~~~~~~~~~~~~~~~~~

`Request <GET_listSubnets_v2.0_subnets_api_subnets_neutron.html#GET_listSubnets_v2.0_subnets_api_subnets_neutron-Request>`__
`Response <GET_listSubnets_v2.0_subnets_api_subnets_neutron.html#GET_listSubnets_v2.0_subnets_api_subnets_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **GET** | ``/v2.0/subnets``            | Retrieves list of subnets to which   |
|         |                              | the specified tenant has access.     |
+---------+------------------------------+--------------------------------------+

You can control which attributes are returned by using the ``fields``
query parameter

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

   -  **subnets**: Array. Required.

      The array of subnets.

      -  **name**: Xsd:string. Required.

         The subnet name.

      -  **enable\_dhcp**: Xsd:boolean. Required.

         Indicates if DHCP for the subnet is enabled. This value is
         false and cannot be changed.

      -  **network\_id**: Csapi:uuid. Required.

         The ID of the attached network.

      -  **tenant\_id**: Csapi:uuid. Required.

         The ID of the tenant who owns the subnet.

      -  **dns\_nameservers**: Array. Required.

         The array of dns name servers for the subnet.

      -  **allocation\_pools**: Array. Required.

         The array of allocation pool objects.

         -  **end**: Xsd:string. Required.

            The ending IP address of the subnet allocation pool.

         -  **start**: Xsd:string. Required.

            The starting IP address of the subnet allocation pool.

      -  **host\_routes**: Array. Required.

         The array of host routes for the subnet.

      -  **ip\_version**: Xsd:string. Required.

         The subnet IP version, which is ``4`` or ``6``.

      -  **gateway\_ip**: Xsd:string. Required.

         The gateway IP address.

      -  **cidr**: Xsd:string. Required.

         The CIDR for the subnet.

      -  **id**: Csapi:uuid. Required.

         The ID of the subnet.

 
**Example 5.7. Retrieve list of subnets: JSON response**

.. code::  

    {
        "subnets": [
            {
                "allocation_pools": [
                    {
                        "end": "192.168.9.254",
                        "start": "192.168.9.1"
                    }
                ],
                "cidr": "192.168.9.0/24",
                "dns_nameservers": [],
                "enable_dhcp": false,
                "gateway_ip": null,
                "host_routes": [],
                "id": "f975defc-637d-4e2a-858b-c6cc4cec3951",
                "ip_version": 4,
                "name": "",
                "network_id": "0ebf6a10-5fc1-4f13-aca9-be0a2a00b1ac",
                "tenant_id": "123456"
            }
        ]
    }
