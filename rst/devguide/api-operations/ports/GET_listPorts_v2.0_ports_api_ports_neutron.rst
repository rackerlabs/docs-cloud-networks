==========================================================================
Retrieve list of ports - Cloud Networks™ Developer Guide  - Neutron API v2
==========================================================================

 Retrieve list of ports
~~~~~~~~~~~~~~~~~~~~~~~

`Request <GET_listPorts_v2.0_ports_api_ports_neutron.html#GET_listPorts_v2.0_ports_api_ports_neutron-Request>`__
`Response <GET_listPorts_v2.0_ports_api_ports_neutron.html#GET_listPorts_v2.0_ports_api_ports_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **GET** | ``/v2.0/ports``              | Retrieves list of ports to which the |
|         |                              | tenant has access.                   |
+---------+------------------------------+--------------------------------------+

Default policy settings for this operation return those subnets that are
owned by the tenant who submits the request. You can control which
attributes are returned by using the ``fields`` query parameter.

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

   -  **ports**: Array. Required.

      The array of ports.

      -  **status**: Xsd:string. Required.

         The port status (``ACTIVE`` or ``DOWN``).

      -  **name**: Xsd:string. Required.

         The port name.

      -  **admin\_state\_up**: Xsd:bool. Required.

         The administrative state of the network. The default value is
         ``true`` and cannot be changed by the user.

      -  **network\_id**: Csapi:uuid. Required.

         The ID of the attached network.

      -  **security\_groups**: Csapi:uuid. Required.

         An array of security group IDs attached to this port.

      -  **tenant\_id**: Csapi:uuid. Required.

         The ID of the tenant who owns the port.

      -  **device\_owner**: Xsd:string. Required.

         The ID of the entity that uses this port - for example, a DHCP
         agent.

      -  **mac\_address**: Xsd:string. Required.

         The MAC address of the port.

      -  **fixed\_ips**: Array. Required.

         Array of fixed IP address objects.

         -  **subnet\_id**: Xsd:UUID. Required.

            The subnet ID for the fixed IP address for a port.

         -  **ip\_address**: Xsd:string. Required.

            The IP address for the fixed IP address for a port.

      -  **id**: Csapi:uuid. Required.

         The ID of the port.

      -  **device\_id**: Csapi:uuid. Required.

         The ID of the device that uses this port - for example, a
         virtual server.

 
**Example 5.17. Retrieve list of ports: JSON response**

.. code::  

    {
        "ports": [
            {
                "admin_state_up": true, 
                "device_id": "", 
                "device_owner": null, 
                "fixed_ips": [
                    {
                        "ip_address": "192.168.3.11", 
                        "subnet_id": "739ecc58-f9a0-4145-8a06-cd415e6e5c8d"
                    }
                ], 
                "id": "10ba23f5-bb70-4fd7-a118-83f89b62e340", 
                "mac_address": "BE:CB:FE:00:00:EE", 
                "name": "port1", 
                "network_id": "6406ed30-193a-4958-aae5-7c05268d332b", 
                "security_groups": [], 
                "status": "ACTIVE", 
                "tenant_id": "123456"
            }
        ]
    }
