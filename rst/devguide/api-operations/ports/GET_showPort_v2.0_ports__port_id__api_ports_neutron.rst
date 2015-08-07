=============================================================
Show port - Cloud Networks™ Developer Guide  - Neutron API v2
=============================================================

 Show port
~~~~~~~~~~

`Request <GET_showPort_v2.0_ports__port_id__api_ports_neutron.html#GET_showPort_v2.0_ports__port_id__api_ports_neutron-Request>`__
`Response <GET_showPort_v2.0_ports__port_id__api_ports_neutron.html#GET_showPort_v2.0_ports__port_id__api_ports_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **GET** | ``/v2.0/ports/{port_id}``    | Retrieves information for a          |
|         |                              | specified port.                      |
+---------+------------------------------+--------------------------------------+

You can control which attributes are returned by using the ``fields``
query parameter. For information, see `Filtering
Requests <http://docs.rackspace.com/networks/api/v2/cn-devguide/content/section_filtering.html>`__.

**Normal response codes:** 200

**Error response codes:** unauthorized (401), itemNotFound (404)

 Request
^^^^^^^^

This table shows the URI parameters for the show port request:

+-----------------------+---------+---------------------------------------------+
| Name                  | Type    | Description                                 |
+=======================+=========+=============================================+
| ``{port_id}``         | ​U​U​ID | The UUID for the port.                      |
+-----------------------+---------+---------------------------------------------+

This operation does not accept a request body.

 Response
^^^^^^^^^

This list shows the body parameters for the response:

`|image2|\ Collapse All <#>`__ \| `|image3|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **port**: Object. Required.

      The container for the port details.

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

      -  **fixed\_ips**: Xsd:UUID. Required.

         Array of fixed IP address objects.

         -  **subnet\_id**: Xsd:UUID. Required.

            The subnet ID for the fixed IP address for a port.

         -  **ip\_address**: Xsd:string. Required.

            The fixed IP address for a port.

      -  **id**: Csapi:uuid. Required.

         The ID of the port.

      -  **device\_id**: Csapi:uuid. Required.

         The ID of the device that uses this port - for example, a
         virtual server.

 
**Example 5.20. Show port: JSON response**

.. code::  

    {
        "port":
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
    }
