===============================================================
Create port - Cloud Networks™ Developer Guide  - Neutron API v2
===============================================================

 Create port
~~~~~~~~~~~~

`Request <POST_createPort_v2.0_ports_api_ports_neutron.html#POST_createPort_v2.0_ports_api_ports_neutron-Request>`__
`Response <POST_createPort_v2.0_ports_api_ports_neutron.html#POST_createPort_v2.0_ports_api_ports_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **POST* | ``/v2.0/ports``              | Creates a port on a specified        |
| *       |                              | network.                             |
+---------+------------------------------+--------------------------------------+

You must specify the network where the port is to be created in the
``network_id`` parameter in the request body.

When a port is created on a network that has both an IPv4 and an IPv6
subnet, the port gets an IPv4 address by default. To create a port with
an IPv6 address instead, the IPv6 address must be passed via the
``fixed_ips`` attribute.

**Normal response codes:** 201

**Error response codes:** badRequest (400), unauthorized (401),
forbidden (403), itemNotFound (404), macGenerationFailure (503),
serviceUnavailable (503)

 Request
^^^^^^^^

This list shows the body parameters for the request:

`|image2|\ Collapse All <#>`__ \| `|image3|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **port**: Object. Required.

      The container for the port details.

      -  **network\_id**: Csapi:uuid. Required.

         The ID of the attached network.

      -  **admin\_state\_up**: Xsd:bool. Optional.

         The administrative state of the network. The default value is
         ``true`` and cannot be changed by the user.

      -  **name**: Xsd:string. Optional.

         A symbolic name for the port.

      -  **device\_id**: Xsd:uuid. Optional.

         The ID of the port device.

      -  **tenant\_id**: Csapi:uuid. Optional.

         The ID of the tenant who owns the port.

 
**Example 5.18. Create port: JSON request**

.. code::  

    {
        "port": {
            "admin_state_up": true,
            "device_id": "d6b4d3a5-c700-476f-b609-1493dd9dadc0",
            "name": "port1",
            "network_id": "6aeaf34a-c482-4bd3-9dc3-7faf36412f12"
        }
    } 

 Response
^^^^^^^^^

This list shows the body parameters for the response:

`|image4|\ Collapse All <#>`__ \| `|image5|\ Expand All <#>`__ \|
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

 
**Example 5.19. Create port: JSON response**

.. code::  

    {
       "port":
          {
             "admin_state_up":true,
             "device_id": "",
             "device_owner": null,
             "fixed_ips": [
                 {
                     "ip_address": "fc01::8",
                     "subnet_id": "1d18d76b-a04a-4147-a04c-151630ec80d0"
                 }
             ],
             "id":"8fb361d8-bab0-418d-b1b8-7204a230fb06",
             "mac_address":"fa:16:3e:2e:7c:8a",
             "name":"sample_port_1",
             "network_id":"a3775a7d-9f8b-4148-be81-c84bbd0837ce",
             "security_groups":[],
             "status": "ACTIVE",
             "tenant_id":"60cd4f6dbc2f491982a284e7b83b5be3" 
          }
    }
