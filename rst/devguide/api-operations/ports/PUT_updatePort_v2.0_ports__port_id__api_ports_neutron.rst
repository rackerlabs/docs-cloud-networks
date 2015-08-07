===============================================================
Update port - Cloud Networks™ Developer Guide  - Neutron API v2
===============================================================

 Update port
~~~~~~~~~~~~

`Request <PUT_updatePort_v2.0_ports__port_id__api_ports_neutron.html#PUT_updatePort_v2.0_ports__port_id__api_ports_neutron-Request>`__
`Response <PUT_updatePort_v2.0_ports__port_id__api_ports_neutron.html#PUT_updatePort_v2.0_ports__port_id__api_ports_neutron-Response>`__

 
+---------+------------------------------+--------------------------------------+
| Method  | URI                          | Description                          |
+=========+==============================+======================================+
| **PUT** | ``/v2.0/ports/{port_id}``    | Updates a specified port.            |
+---------+------------------------------+--------------------------------------+

You can update information for a port, such as its symbolic name,
associated IP addresses, and security\_groups. When you update IP
addresses for a port, any previously associated IP addresses are
removed, returned to the appropriate subnet's allocation pools, and
replaced by the IP addresses specified in the body of the update
request. Therefore, this operation replaces the ``fixed_ips`` attribute
when it is specified in the request body.

   style="margin-left: 0.5in; margin-right: 0.5in;">

|[Warning]|
Warning
If the updated IP addresses are not valid or are already in use, the
operation fails and the existing IP addresses are not removed from the
port.

   style="margin-left: 0.5in; margin-right: 0.5in;">

|[Warning]|
Warning
When you update the ``fixed_ips`` attribute of a port that is already
attached to an active cloud server instance, the changes do not take
effect on the server even though the attributes of the port are updated.
As a result, this operation is useful only for ports that are not
attached to any server. After the port attributes are updated they can
be passed to a Cloud Server instance at boot time.

**Normal response codes:** 200

**Error response codes:** badRequest (400), unauthorized (401),
forbidden (403), itemNotFound (404), conflict (409)

 Request
^^^^^^^^

This table shows the URI parameters for the update port request:

+-----------------------+---------+---------------------------------------------+
| Name                  | Type    | Description                                 |
+=======================+=========+=============================================+
| ``{port_id}``         | ​U​U​ID | The UUID for the port.                      |
+-----------------------+---------+---------------------------------------------+

This list shows the body parameters for the request:

`|image3|\ Collapse All <#>`__ \| `|image4|\ Expand All <#>`__ \|
`Toggle All <#>`__

-  **parameters**:

   -  **port**: Object. Required.

      The container for the port details.

      -  **name**: Xsd:string. Optional.

         A symbolic name for the port.

      -  **device\_id**: Xsd:uuid. Optional.

         The ID of the port device.

      -  **security\_groups**: Xsd:uuid. Optional.

         The ID of the security groups.

 
**Example 5.21. Update port: JSON request**

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

`|image5|\ Collapse All <#>`__ \| `|image6|\ Expand All <#>`__ \|
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

 
**Example 5.22. Update port: JSON response**

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
