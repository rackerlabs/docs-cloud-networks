.. _concepts-port:

=============
Port concepts
=============

A port represents a virtual switch port on a logical network switch. Cloud servers attach 
their interfaces into ports. The logical port also defines the MAC address and the IP 
addresses, to be assigned to the interfaces plugged into them. When IP addresses are 
associated with a port, the port is associated with a subnet, because the IP address was 
taken from the allocation pool for a specific subnet.

The following table describes the attributes for port objects. In the "CRUD" column, the 
abbreviations are defined as follows:

-  **C**: The attribute is used in create operations.

-  **R**: The attribute is returned in response to show and list
   operations.

-  **U**: You can update the value of this attribute.

-  **D**: You can delete the value of this attribute.

+----------------+----------+----------+---------+------------+--------------+----------------+
| Attribute      | Type     | Required | CRUD    | Default    | Validation   | Notes          |
|                |          |          |         | value      | constraints  |                |
+================+==========+==========+=========+============+==============+================+
| id             | uuid-str | N/A      | R       | Generated  | N/A          | UUID for the   |
|                |          |          |         |            |              | port.          |
+----------------+----------+----------+---------+------------+--------------+----------------+
| network\_id    | uuid-str | Yes      | CR      | N/A        | Existing     | Network that   |
|                |          |          |         |            | network      | this port is   |
|                |          |          |         |            | identifier   | associated     |
|                |          |          |         |            |              | with.          |
+----------------+----------+----------+---------+------------+--------------+----------------+
| name           | String   | No       | CRU     | None       | N/A          | Human-readable |
|                |          |          |         |            |              | name for the   |
|                |          |          |         |            |              | port. This     |
|                |          |          |         |            |              | name might not |
|                |          |          |         |            |              | be unique.     |
+----------------+----------+----------+---------+------------+--------------+----------------+
| admin\_state\  | Boolean  | No       | CRU     | True       | True         | Administrative |
| _up            |          |          |         |            |              | state of port. |
|                |          |          |         |            |              | This value is  |
|                |          |          |         |            |              | always set to  |
|                |          |          |         |            |              | `true`.        |
+----------------+----------+----------+---------+------------+--------------+----------------+
| status         | string   | N/A      | R       | ACTIVE     | N/A          | Indicates      |
|                |          |          |         |            |              | whether the    |
|                |          |          |         |            |              | network is     |
|                |          |          |         |            |              | currently      |
|                |          |          |         |            |              | operational.   |
|                |          |          |         |            |              | The status is  |
|                |          |          |         |            |              | always set to  |
|                |          |          |         |            |              | `ACTIVE`.      |
+----------------+----------+----------+---------+------------+--------------+----------------+
| mac\_address   | string   | No       | CR      | Generated  | Valid MAC in | MAC address to |
|                |          |          |         |            | 6-octet form | use on this    |
|                |          |          |         |            | separated by | port.          |
|                |          |          |         |            | colons       |                |
+----------------+----------+----------+---------+------------+--------------+----------------+
| fixed\_ips     | list of  | No       | CRU     | Auto       | Valid IP     | Specifies IP   |
|                | dict     |          |         | allocated  | address and  | addresses for  |
|                |          |          |         | from pool  | existing     | the port thus  |
|                |          |          |         |            | subnet       | associating    |
|                |          |          |         |            | identifier   | the port       |
|                |          |          |         |            |              | itself with    |
|                |          |          |         |            |              | the subnets    |
|                |          |          |         |            |              | from which the |
|                |          |          |         |            |              | IP addresses   |
|                |          |          |         |            |              | are picked     |
+----------------+----------+----------+---------+------------+--------------+----------------+
| device\_id     | str      | No       | CRUD    | None       | N/A          | Identifies the |
|                |          |          |         |            |              | device (such   |
|                |          |          |         |            |              | as cloud       |
|                |          |          |         |            |              | server) using  |
|                |          |          |         |            |              | this port.     |
|                |          |          |         |            |              | When the port  |
|                |          |          |         |            |              | is not         |
|                |          |          |         |            |              | attached to an |
|                |          |          |         |            |              | instance, this |
|                |          |          |         |            |              | field is       |
|                |          |          |         |            |              | empty.         |
+----------------+----------+----------+---------+------------+--------------+----------------+
| device\_owner  | str      | No       | CRUD    | Null       | N/A          | Identifies the |
|                |          |          |         |            |              | entity using   |
|                |          |          |         |            |              | this port.     |
+----------------+----------+----------+---------+------------+--------------+----------------+
| tenant\_id     | uuid-str | No       | CR      | N/A        | N/A          | Owner of the   |
|                |          |          |         |            |              | network. This  |
|                |          |          |         |            |              | value cannot   |
|                |          |          |         |            |              | be changed.    |
+----------------+----------+----------+---------+------------+--------------+----------------+
| security\      | list of  | No       | CRUD    | None       | Existing     | Specifies the  |
| _groups        | dict     |          |         |            | security     | IDs of any     |
|                |          |          |         |            | group IDs    | security       |
|                |          |          |         |            |              | groups         |
|                |          |          |         |            |              | associated     |
|                |          |          |         |            |              | with a port.   |
+----------------+----------+----------+---------+------------+--------------+----------------+
