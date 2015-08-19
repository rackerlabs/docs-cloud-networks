.. _cn-dg-concepts-subnet:

===============
Subnet concepts
===============

A subnet represents an IP address block that can be used to assign IP addresses to virtual 
instances. Each subnet must have a CIDR and must be associated with a network. IP addresses 
can be selected either from the whole subnet CIDR or from allocation pools that can be 
specified by the user.

A subnet can also optionally have a gateway, a list of DNS name servers, and host routes. 
This information is pushed to the cloud servers whose ports are associated with the subnet, 
as long as the ports or servers were created after the subnet was created.

The following table describes the attributes for subnet objects. In the "CRUD" column, the 
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
| id             | uuid-str | N/A      | R       | Generated  | N/A          | UUID           |
|                |          |          |         |            |              | representing   |
|                |          |          |         |            |              | the subnet     |
+----------------+----------+----------+---------+------------+--------------+----------------+
| network\_id    | uuid-str | Yes      | CR      | N/A        | Network this | UUID           |
|                |          |          |         |            | subnet is    | representing   |
|                |          |          |         |            | associated   | the network    |
|                |          |          |         |            | with         |                |
+----------------+----------+----------+---------+------------+--------------+----------------+
| name           | string   | No       | CRU     | None       | N/A          | Human-readable |
|                |          |          |         |            |              | name for the   |
|                |          |          |         |            |              | subnet. This   |
|                |          |          |         |            |              | name might not |
|                |          |          |         |            |              | be unique      |
+----------------+----------+----------+---------+------------+--------------+----------------+
| ip\_version    | int      | Yes      | CR      | 4          | { 4 \| 6 }   | IP version     |
+----------------+----------+----------+---------+------------+--------------+----------------+
| cidr           | string   | Yes      | CR      | N/A        | Valid CIDR   | CIDR           |
|                |          |          |         |            | in the form  | representing   |
|                |          |          |         |            | <network\    | the IP address |
|                |          |          |         |            | _address>/   | range for this |
|                |          |          |         |            | <prefix>     | subnet, based  |
|                |          |          |         |            |              | on the IP      |
|                |          |          |         |            |              | version        |
+----------------+----------+----------+---------+------------+--------------+----------------+
| gateway\_ip    | string   | No       | CRUD    | Null       | Valid IP     | The default    |
|                |          |          |         |            | address or   | gateway used   |
|                |          |          |         |            | null         | by devices in  |
|                |          |          |         |            |              | this subnet.   |
|                |          |          |         |            |              | This is        |
|                |          |          |         |            |              | applied on     |
|                |          |          |         |            |              | cloud servers  |
|                |          |          |         |            |              | only at boot   |
|                |          |          |         |            |              | time and will  |
|                |          |          |         |            |              | not change for |
|                |          |          |         |            |              | existing       |
|                |          |          |         |            |              | servers.       |
+----------------+----------+----------+---------+------------+--------------+----------------+
| dns\           | list of  | No       | CRU     | Empty list | N?A          | DNS name       |
| _nameservers   | str      |          |         |            |              | servers used   |
|                |          |          |         |            |              | by hosts in    |
|                |          |          |         |            |              | this subnet.   |
|                |          |          |         |            |              | This is        |
|                |          |          |         |            |              | applied on     |
|                |          |          |         |            |              | cloud servers  |
|                |          |          |         |            |              | only at boot   |
|                |          |          |         |            |              | time and will  |
|                |          |          |         |            |              | not change for |
|                |          |          |         |            |              | existing       |
|                |          |          |         |            |              | servers.       |
+----------------+----------+----------+---------+------------+--------------+----------------+
| allocation\    | list of  | No       | CR      | Every      | The start    | Sub-ranges of  |
| _pools         | dict     |          |         | address in | and end      | theCIDR        |
|                |          |          |         | the CIDR,  | addresses of | available for  |
|                |          |          |         | excluding  | the range    | dynamic        |
|                |          |          |         | gateway\   | must be      | allocation to  |
|                |          |          |         | _ip        | valid IP     | ports [ {      |
|                |          |          |         | if it is   | addresses.   | "start":       |
|                |          |          |         | configured |              | "10.0.0.2",    |
|                |          |          |         |            |              | "end":         |
|                |          |          |         |            |              | "10.0.0.254"}  |
|                |          |          |         |            |              | ]              |
+----------------+----------+----------+---------+------------+--------------+----------------+
| host\_routes   | list of  | No       | CRU     | Empty List | []           | Routes that    |
|                | dict     |          |         |            |              | should be used |
|                |          |          |         |            |              | by devices     |
|                |          |          |         |            |              | with IP        |
|                |          |          |         |            |              | addresses from |
|                |          |          |         |            |              | this subnet    |
|                |          |          |         |            |              | (not including |
|                |          |          |         |            |              | the local      |
|                |          |          |         |            |              | subnet route). |
|                |          |          |         |            |              | These routes   |
|                |          |          |         |            |              | are applied on |
|                |          |          |         |            |              | cloud servers  |
|                |          |          |         |            |              | only at boot   |
|                |          |          |         |            |              | time and will  |
|                |          |          |         |            |              | not change for |
|                |          |          |         |            |              | existing       |
|                |          |          |         |            |              | servers.       |
+----------------+----------+----------+---------+------------+--------------+----------------+
| enable\_dhcp   | Boolean  | No       | CRU     | Null       | Null         | Specifies      |
|                |          |          |         |            |              | whether DHCP   |
|                |          |          |         |            |              | is enabled for |
|                |          |          |         |            |              | this subnet.   |
|                |          |          |         |            |              | The default    |
|                |          |          |         |            |              | value is null  |
|                |          |          |         |            |              | and cannot be  |
|                |          |          |         |            |              | changed.       |
+----------------+----------+----------+---------+------------+--------------+----------------+
| tenant\_id     | uuid-str | No       | CR      | N/A        | N/A          | Owner of the   |
|                |          |          |         |            |              | network. This  |
|                |          |          |         |            |              | value cannot   |
|                |          |          |         |            |              | be changed and |
|                |          |          |         |            |              | must belong to |
|                |          |          |         |            |              | the tenant.    |
+----------------+----------+----------+---------+------------+--------------+----------------+
