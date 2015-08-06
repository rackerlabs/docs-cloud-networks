===============================================================
Show subnet - Cloud Networks™ Developer Guide  - Neutron API v2
===============================================================

 Show subnet
~~~~~~~~~~~~

`Request <GET_showSubnet_v2.0_subnets__subnet_id__api_subnets_neutron.html#GET_showSubnet_v2.0_subnets__subnet_id__api_subnets_neutron-Request>`__
`Response <GET_showSubnet_v2.0_subnets__subnet_id__api_subnets_neutron.html#GET_showSubnet_v2.0_subnets__subnet_id__api_subnets_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **GET** | ``/v2.0/subnets/{subnet_id}` | Retrieves information for a          |
|         | `                            | specified subnet.                    |
+---------+------------------------------+--------------------------------------+

You can control which attributes are returned by using the ``fields``
query parameter. For information, see `Filtering
Requests <http://docs.rackspace.com/networks/api/v2/cn-devguide/content/section_filtering.html>`__.

**Normal response codes:** 201

**Error response codes:** unauthorized (401), itemNotFound (404)

 Request
^^^^^^^^

This table shows the URI parameters for the show subnet request:

+-----------------------+---------+---------------------------------------------+
| Name                  | Type    | Description                                 |
+=======================+=========+=============================================+
| ``{subnet_id}``       | ​U​U​ID | The UUID for the subnet.                    |
+-----------------------+---------+---------------------------------------------+

This operation does not accept a request body.

 Response
^^^^^^^^^

This list shows the body parameters for the response:

`|image2|\ Collapse All <#>`__ \| `|image3|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **subnet**: Object. Required.

      The container for the subnet details.

      -  **name**: Xsd:string. Optional.

         The subnet name.

      -  **enable\_dhcp**: Xsd:boolean. Required.

         Indicates if DHCP for the subnet is enabled. This value is
         false and cannot be changed.

      -  **network\_id**: Csapi:uuid. Optional.

         The ID of the attached network.

      -  **tenant\_id**: Csapi:uuid. Required.

         The tenant ID of the owner of the subnet. Only administrative
         users can specify a tenant ID other than their own.

      -  **dns\_nameservers**: Array. Optional.

         The array of DNS name servers for the subnet.

      -  **allocation\_pools**: Array. Optional.

         The array of allocation pool objects.

         -  **end**: Xsd:string. Required.

            The ending IP address of the subnet allocation pool.

         -  **start**: Xsd:string. Optional.

            The starting IP address of the subnet allocation pool.

      -  **host\_routes**: Array. Required.

         The array of host route IP addresses for the subnet.

      -  **ip\_version**: Xsd:string. Required.

         The subnet IP version, which is ``4`` or ``6``.

      -  **gateway\_ip**: Xsd:string. Required.

         The subnet gateway IP address.

      -  **cidr**: Xsd:string. Required.

         The subnet CIDR.

      -  **id**: Csapi:uuid. Required.

         The ID of the subnet.

 
**Example 5.14. Show subnet: JSON response**

.. code::  

    {
        "subnet": {
            "name": "my_subnet",
            "enable_dhcp": false,
            "network_id": "d32019d3-bc6e-4319-9c1d-6722fc136a22",
            "tenant_id": "4fd44f30292945e481c7b8a0c8908869",
            "dns_nameservers": [
            ],
            "allocation_pools": [
                {
                    "start": "192.0.0.2",
                    "end": "192.255.255.254"
                }
            ],
            "host_routes":[
            ],
            "ip_version": 4,
            "gateway_ip": "192.0.0.1",
            "cidr": "192.0.0.0/8",
            "id": "54d6f61d-db07-451c-9ab3-b9609b6b6f0b"
        }
    }
