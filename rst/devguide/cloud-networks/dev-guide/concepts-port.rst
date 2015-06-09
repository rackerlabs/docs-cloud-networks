.. _cn-dg-concepts-port:

====
Port
====

A port represents a virtual switch port on a logical network switch. Cloud servers attach their interfaces into ports. The logical port also defines the MAC address and the IP addresses, to be assigned to the interfaces plugged into them. When IP addresses are associated with a port, the port is associated with a subnet, because the IP address was taken from the allocation pool for a specific subnet.

The following table describes the attributes for port objects. In the "CRUD" column, the abbreviations are defined as follows:

-  **C**: The attribute is used in create operations.

-  **R**: The attribute is returned in response to show and list
   operations.

-  **U**: You can update the value of this attribute.

-  **D**: You can delete the value of this attribute.

+----------------+---------+---------+---------+------------+--------------+----------------+
| Attribute      | Type    | Require | CRUD    | Default    | Validation   | Notes          |
|                |         | d       |         | value      | constraints  |                |
+================+=========+=========+=========+============+==============+================+
| id             | uuid-st | N/A     | R       | Generated  | N/A          | UUID for the   |
|                | r       |         |         |            |              | port.          |
+----------------+---------+---------+---------+------------+--------------+----------------+
| network\_id    | uuid-st | Yes     | CR      | N/A        | Existing     | Network that   |
|                | r       |         |         |            | network      | this port is   |
|                |         |         |         |            | identifier   | associated     |
|                |         |         |         |            |              | with.          |
+----------------+---------+---------+---------+------------+--------------+----------------+
| name           | String  | No      | CRU     | None       | N/A          | Human-readable |
|                |         |         |         |            |              | name for the   |
|                |         |         |         |            |              | port. This     |
|                |         |         |         |            |              | name might not |
|                |         |         |         |            |              | be unique.     |
+----------------+---------+---------+---------+------------+--------------+----------------+
| admin\_state\_ | Boolean | No      | CRU     | True       | True         | Administrative |
| up             |         |         |         |            |              | state of port. |
|                |         |         |         |            |              | This value is  |
|                |         |         |         |            |              | always set to  |
|                |         |         |         |            |              | `true`.        |
+----------------+---------+---------+---------+------------+--------------+----------------+
| status         | string  | N/A     | R       | ACTIVE     | N/A          | Indicates      |
|                |         |         |         |            |              | whether the    |
|                |         |         |         |            |              | network is     |
|                |         |         |         |            |              | currently      |
|                |         |         |         |            |              | operational.   |
|                |         |         |         |            |              | The status is  |
|                |         |         |         |            |              | always set to  |
|                |         |         |         |            |              | `ACTIVE`.      |
+----------------+---------+---------+---------+------------+--------------+----------------+
| mac\_address   | string  | No      | CR      | Generated  | Valid MAC in | MAC address to |
|                |         |         |         |            | 6-octet form | use on this    |
|                |         |         |         |            | separated by | port.          |
|                |         |         |         |            | colons       |                |
+----------------+---------+---------+---------+------------+--------------+----------------+
| fixed\_ips     | list(di | No      | CRU     | Automatica | Valid IP     | Specifies IP   |
|                | ct)     |         |         | lly        | address and  | addresses for  |
|                |         |         |         | allocated  | existing     | the port thus  |
|                |         |         |         | from pool  | subnet       | associating    |
|                |         |         |         |            | identifier   | the port       |
|                |         |         |         |            |              | itself with    |
|                |         |         |         |            |              | the subnets    |
|                |         |         |         |            |              | from which the |
|                |         |         |         |            |              | IP addresses   |
|                |         |         |         |            |              | are picked     |
+----------------+---------+---------+---------+------------+--------------+----------------+
| device\_id     | str     | No      | CRUD    | None       | N/A          | Identifies the |
|                |         |         |         |            |              | device (such   |
|                |         |         |         |            |              | as cloud       |
|                |         |         |         |            |              | server) using  |
|                |         |         |         |            |              | this port.     |
|                |         |         |         |            |              | When the port  |
|                |         |         |         |            |              | is not         |
|                |         |         |         |            |              | attached to an |
|                |         |         |         |            |              | instance, this |
|                |         |         |         |            |              | field is       |
|                |         |         |         |            |              | empty.         |
+----------------+---------+---------+---------+------------+--------------+----------------+
| device\_owner  | str     | No      | CRUD    | Null       | N/A          | Identifies the |
|                |         |         |         |            |              | entity using   |
|                |         |         |         |            |              | this port.     |
+----------------+---------+---------+---------+------------+--------------+----------------+
| tenant\_id     | uuid-st | No      | CR      | N/A        | N/A          | Owner of the   |
|                | r       |         |         |            |              | network. This  |
|                |         |         |         |            |              | value cannot   |
|                |         |         |         |            |              | be changed.    |
+----------------+---------+---------+---------+------------+--------------+----------------+
| security\_grou | list(di | No      | CRUD    | None       | Existing     | Specifies the  |
| ps             | ct)     |         |         |            | security     | IDs of any     |
|                |         |         |         |            | group IDs    | security       |
|                |         |         |         |            |              | groups         |
|                |         |         |         |            |              | associated     |
|                |         |         |         |            |              | with a port.   |
+----------------+---------+---------+---------+------------+--------------+----------------+
