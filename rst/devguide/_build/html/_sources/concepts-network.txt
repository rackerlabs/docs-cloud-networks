.. _cn-dg-concepts-network:

=======
Network
=======

A network is an isolated virtual layer-2 broadcast domain that is typically reserved for the tenant who created it, unless the network is configured to be shared. Tenants can create up to 10 networks per region.

In the Networks API v2.0, the network is the main entity. Ports and subnets are always associated with a network.

The following table describes the attributes for network objects. In the "CRUD" column, the abbreviations are defined as follows:

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
|                | r       |         |         |            |              | network.       |
+----------------+---------+---------+---------+------------+--------------+----------------+
| name           | string  | No      | CRU     | None       | N/A          | Human-readable |
|                |         |         |         |            |              | name for the   |
|                |         |         |         |            |              | network. The   |
|                |         |         |         |            |              | name might not |
|                |         |         |         |            |              | be unique.     |
+----------------+---------+---------+---------+------------+--------------+----------------+
| admin\_state\_ | Boolean | No      | CRU     | True       | True         | The            |
| up             |         |         |         |            |              | administrative |
|                |         |         |         |            |              | state of       |
|                |         |         |         |            |              | network. This  |
|                |         |         |         |            |              | value is       |
|                |         |         |         |            |              | `true` by      |
|                |         |         |         |            |              | default and    |
|                |         |         |         |            |              | cannot be      |
|                |         |         |         |            |              | changed.       |
+----------------+---------+---------+---------+------------+--------------+----------------+
| status         | string  | N/A     | R       | null       | N/A          | Indicates      |
|                |         |         |         |            |              | whether        |
|                |         |         |         |            |              | network is     |
|                |         |         |         |            |              | currently      |
|                |         |         |         |            |              | operational.   |
|                |         |         |         |            |              | The status is  |
|                |         |         |         |            |              | `null` by      |
|                |         |         |         |            |              | default and    |
|                |         |         |         |            |              | cannot be      |
|                |         |         |         |            |              | changed.       |
+----------------+---------+---------+---------+------------+--------------+----------------+
| subnets        | list(uu | No      | R       | Empty list | N/A          | Subnets        |
|                | id-str) |         |         |            |              | associated     |
|                |         |         |         |            |              | with this      |
|                |         |         |         |            |              | network. One   |
|                |         |         |         |            |              | IPv4 and one   |
|                |         |         |         |            |              | IPv6 subnet    |
|                |         |         |         |            |              | can be         |
|                |         |         |         |            |              | specified in a |
|                |         |         |         |            |              | Network.       |
+----------------+---------+---------+---------+------------+--------------+----------------+
| shared         | Bool    | No      | CRU     | False      | False        | Specifies      |
|                |         |         |         |            |              | whether the    |
|                |         |         |         |            |              | network        |
|                |         |         |         |            |              | resource can   |
|                |         |         |         |            |              | be accessed by |
|                |         |         |         |            |              | any tenant.    |
|                |         |         |         |            |              | The default    |
|                |         |         |         |            |              | value is       |
|                |         |         |         |            |              | `False` and    |
|                |         |         |         |            |              | cannot be      |
|                |         |         |         |            |              | changed        |
+----------------+---------+---------+---------+------------+--------------+----------------+
| tenant\_id     | uuid-st | No      | CR      | N/A        | N/A          | Owner of the   |
|                | r       |         |         |            |              | network. This  |
|                |         |         |         |            |              | value cannot   |
|                |         |         |         |            |              | be changed and |
|                |         |         |         |            |              | must belong to |
|                |         |         |         |            |              | the tenant.    |
+----------------+---------+---------+---------+------------+--------------+----------------+
