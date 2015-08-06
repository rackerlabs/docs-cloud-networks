=================================================================
Update subnet - Cloud Networks™ Developer Guide  - Neutron API v2
=================================================================

 Update subnet
~~~~~~~~~~~~~~

`Request <PUT_updateSubnet_v2.0_subnets__subnet_id__api_subnets_neutron.html#PUT_updateSubnet_v2.0_subnets__subnet_id__api_subnets_neutron-Request>`__
`Response <PUT_updateSubnet_v2.0_subnets__subnet_id__api_subnets_neutron.html#PUT_updateSubnet_v2.0_subnets__subnet_id__api_subnets_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **PUT** | ``/v2.0/subnets/{subnet_id}` | Updates a specified subnet.          |
|         | `                            |                                      |
+---------+------------------------------+--------------------------------------+

The IP version (``ip_version``), network ID (``network_id``), and CIDR
(``cidr``) cannot be updated. Attempting to update these parameters
results in a 400 Bad Request error.

You cannot update allocation pools that are attached to a port.

   style="margin-left: 0.5in; margin-right: 0.5in;">

|[Warning]|
Warning
If any attributes are updated, the changes will take effect only for
ports or cloud servers using this subnet that are created after this
modification. Any existing ports or servers are not updated.

**Normal response codes:** 201

**Error response codes:** badRequest (400), unauthorized (401),
forbidden (403), itemNotFound (404)

 Request
^^^^^^^^

This table shows the URI parameters for the update subnet request:

+-----------------------+---------+---------------------------------------------+
| Name                  | Type    | Description                                 |
+=======================+=========+=============================================+
| ``{subnet_id}``       | ​U​U​ID | The UUID for the subnet.                    |
+-----------------------+---------+---------------------------------------------+

This list shows the body parameters for the request:

`|image3|\ Collapse All <#>`__ \| `|image4|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **subnet**: Object. Required.

      The container for subnet details.

      -  **name**: Xsd:string. Required.

         The subnet name.

      -  **gateway\_ip**: Xsd:string. Optional.

         The gateway IP address.

 
**Example 5.15. Update subnet: JSON request**

.. code::  

    {
        "subnet": {
            "name": "my_subnet"
        }
    }

 Response
^^^^^^^^^

This list shows the body parameters for the response:

`|image5|\ Collapse All <#>`__ \| `|image6|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **subnet**: Object. Required.

      The container for subnet details.

      -  **name**: Xsd:string. Required.

         The subnet name.

      -  **enable\_dhcp**: Xsd:boolean. Optional.

         Indicates if DHCP for the subnet is enabled. This value is
         false and cannot be changed.

      -  **network\_id**: Csapi:uuid. Optional.

         The ID of the attached network.

      -  **tenant\_id**: Csapi:uuid. Optional.

         The tenant ID of the owner of the subnet. Only administrative
         users can specify a tenant ID other than their own.

      -  **dns\_nameservers**: Array. Optional.

         The array of DNS name servers for the subnet.

      -  **allocation\_pools**: Array. Optional.

         The array of allocation pool objects.

         -  **end**: Xsd:string. Optional.

            The ending IP address of the subnet allocation pool.

         -  **start**: Xsd:string. Optional.

            The starting IP address of the subnet allocation pool.

      -  **host\_routes**: Array. Required.

         The array of host route IP addresses for the subnet.

      -  **ip\_version**: Xsd:string. Required.

         The subnet IP version, which is ``4`` or ``6``.

      -  **gateway\_ip**: Xsd:string. Optional.

         The subnet gateway IP address.

      -  **cidr**: Xsd:string. Required.

         The subnet CIDR.

      -  **id**: Csapi:uuid. Required.

         The ID of the subnet.

 
**Example 5.16. Update subnet: JSON response**

.. code::  

    {
        "subnet": {
            "name": "private-subnet",
            "enable_dhcp": false,
            "network_id": "db193ab3-96e3-4cb3-8fc5-05f4296d0324",
            "tenant_id": "26a7980765d0414dbc1fc1f88cdb7e6e",
            "dns_nameservers": [
            ],
            "allocation_pools": [
                {
                    "start": "10.0.0.2",
                    "end": "10.0.0.254"
                }
            ],
            "host_routes": [
            ],
            "ip_version": 4,
            "gateway_ip": "10.0.0.1",
            "cidr": "10.0.0.0/24",
            "id": "08eae331-0402-425a-923c-34f7cfe39c1b"
        }
    }
