.. _concepts:

==================
|service| Concepts
==================

.. _concepts-network:

Network concepts
~~~~~~~~~~~~~~~~

A network is an isolated virtual layer-2 broadcast domain that is typically
reserved for the tenant who created it, unless the network is configured to be
shared. Tenants can create up to 10 networks per region.

In the Networks API v2.0, the network is the main entity. Ports and subnets are
always associated with a network.

The following table describes the attributes for network objects. In the "CRUD"
column, the abbreviations are defined as follows:

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
|                |          |          |         |            |              | network.       |
+----------------+----------+----------+---------+------------+--------------+----------------+
| name           | string   | No       | CRU     | None       | N/A          | Human-readable |
|                |          |          |         |            |              | name for the   |
|                |          |          |         |            |              | network. The   |
|                |          |          |         |            |              | name might not |
|                |          |          |         |            |              | be unique.     |
+----------------+----------+----------+---------+------------+--------------+----------------+
| admin\_state\  | Boolean  | No       | CRU     | True       | True         | The            |
| _up            |          |          |         |            |              | administrative |
|                |          |          |         |            |              | state of       |
|                |          |          |         |            |              | network. This  |
|                |          |          |         |            |              | value is       |
|                |          |          |         |            |              | `true` by      |
|                |          |          |         |            |              | default and    |
|                |          |          |         |            |              | cannot be      |
|                |          |          |         |            |              | changed.       |
+----------------+----------+----------+---------+------------+--------------+----------------+
| status         | string   | N/A      | R       | null       | N/A          | Indicates      |
|                |          |          |         |            |              | whether        |
|                |          |          |         |            |              | network is     |
|                |          |          |         |            |              | currently      |
|                |          |          |         |            |              | operational.   |
|                |          |          |         |            |              | The status is  |
|                |          |          |         |            |              | `null` by      |
|                |          |          |         |            |              | default and    |
|                |          |          |         |            |              | cannot be      |
|                |          |          |         |            |              | changed.       |
+----------------+----------+----------+---------+------------+--------------+----------------+
| subnets        | list of  | No       | R       | Empty list | N/A          | Subnets        |
|                | uuid-str |          |         |            |              | associated     |
|                |          |          |         |            |              | with this      |
|                |          |          |         |            |              | network. One   |
|                |          |          |         |            |              | IPv4 and one   |
|                |          |          |         |            |              | IPv6 subnet    |
|                |          |          |         |            |              | can be         |
|                |          |          |         |            |              | specified in a |
|                |          |          |         |            |              | Network.       |
+----------------+----------+----------+---------+------------+--------------+----------------+
| shared         | Bool     | No       | CRU     | False      | False        | Specifies      |
|                |          |          |         |            |              | whether the    |
|                |          |          |         |            |              | network        |
|                |          |          |         |            |              | resource can   |
|                |          |          |         |            |              | be accessed by |
|                |          |          |         |            |              | any tenant.    |
|                |          |          |         |            |              | The default    |
|                |          |          |         |            |              | value is       |
|                |          |          |         |            |              | `False` and    |
|                |          |          |         |            |              | cannot be      |
|                |          |          |         |            |              | changed        |
+----------------+----------+----------+---------+------------+--------------+----------------+
| tenant\_id     | uuid-str | No       | CR      | N/A        | N/A          | Owner of the   |
|                |          |          |         |            |              | network. This  |
|                |          |          |         |            |              | value cannot   |
|                |          |          |         |            |              | be changed and |
|                |          |          |         |            |              | must belong to |
|                |          |          |         |            |              | the tenant.    |
+----------------+----------+----------+---------+------------+--------------+----------------+

.. _concepts-subnet:

Subnet concepts
~~~~~~~~~~~~~~~

A subnet represents an IP address block that can be used to assign IP addresses
to virtual instances. Each subnet must have a CIDR and must be associated with
a network. IP addresses can be selected either from the whole subnet CIDR or
from allocation pools that can be specified by the user.

A subnet can also optionally have a gateway, a list of DNS name servers, and
host routes. This information is pushed to the cloud servers whose ports are
associated with the subnet, as long as the ports or servers were created after
the subnet was created.

The following table describes the attributes for subnet objects. In the "CRUD"
column, the abbreviations are defined as follows:

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

.. _concepts-port:


Port concepts
~~~~~~~~~~~~~

A port represents a virtual switch port on a logical network switch. Cloud
servers attach their interfaces into ports. The logical port also defines the
MAC address and the IP addresses, to be assigned to the interfaces plugged into
them. When IP addresses are associated with a port, the port is associated with
a subnet, because the IP address was taken from the allocation pool for a
specific subnet.

The following table describes the attributes for port objects. In the "CRUD"
column, the abbreviations are defined as follows:

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

.. _concepts-security:

Security groups and rules concepts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A security group is a named container for security group rules, which provide
Rackspace Public Cloud users the ability to specify the types of traffic that
are allowed to pass through, to, and from ports (Public/ServiceNet) on a Cloud
server instance. After an instance is active, you can assign one or more
security groups to Neutron ports on that instance. You cannot apply security
groups to a port at boot time.

..  note::
    There are no default security groups created for you in your Rackspace
    account. In order to use security groups, you have to create them first and
    then apply them to Neutron ports that belong to Cloud Server instances.

.. _concepts-security-groups:

Security groups
---------------

-  act as a firewall for your cloud server instances.

-  can be applied to Rackspace Cloud Servers on Public, ServiceNet Neutron
   ports and Cloud Networks ports.

-  can contain rules for both the inbound traffic, also known as ingress
   direction, and outbound traffic, or egress direction.

-  are limited to no more than 5 security groups per Neutron port. When a
   Neutron port has multiple security groups applied, the rules from each
   security group are effectively aggregated to dictate the rules for access on
   that port.

   ..  note::
       If there is more than one security group applied to a Neutron port, we
       apply the most permissive rule. For example, if you have one rule that
       allows ICMP traffic from IP address 10.23.194.19 and another rule that
       allows access to ICMP from everyone, then everyone can access the server
       via ICMP on that Neutron port.

-  may contain up to 20 security group rules.

The rules of a security group control the incoming and outgoing traffic that is
allowed to reach or leave an instance through the Public, ServiceNet Neutron,
and Cloud Networks ports to which the security group is applied.

.. _concepts-security-rules:

Security group rules
--------------------

-  are a white-list (permit traffic if there is a match). You cannot create
   rules that deny traffic.

-  may be added to, and removed from, Security Groups either before the
   Security Group is applied to the port or while the Security Group is applied
   to the port.

   ..  note::
       If you add or remove rules from a security groups while the security
       group is applied to a port, you need to re-apply the security group to
       the port for the changes to take effect. The security group rule changes
       are applied to the port after a short period of time.

-  cannot be edited. To change a security group rule, you have to delete the
   original security group rule and add a new rule.

-  cannot refer to a different security group. These self-referential rules are
   not supported.

-  are limited to a total of 100 security group rules per user, across all the
   user's security groups.

There are some limits and quotas around security groups and security group
rules, as shown in the preceding lists. Here they are again, for convenience.

.. _concepts-security-quotas:

Security Groups and Rules Quotas
--------------------------------

-  Maximum of 5 security groups per port.

-  Maximum of 20 security group rules per security group.

-  Maximum of 100 security group rules per user.

.. _concepts-security-parameters:

Security Rules Parameters
-------------------------

Specify the following parameters when you create a rule:

- **Ethertype**

  This is the type of traffic to allow, either ``IPv4`` or ``IPv6``.

- **Protocol**

  Choose ``TCP`` for SSH, ``ICMP`` for pings, or ``UDP`` for data exchanges.

- **Port range**

  Enter the range of ports for the rule. To open a single port only, enter the
  same value twice.

  ..  note::
      Since ICMP does not support ports, enter the ICMP type in the
      ``port_range_min`` field and enter the ICMP code in the
      ``port_range_max`` field.

- **Remote IP prefix**

  This optional parameter permits traffic from a Source IP address
  corresponding to the Remote IP prefix. You can enter a single IP address
  (for example: 10.553.16.23) or a range of IP addresses (for example:
  10.553.16.23/24).

.. _concepts-shared-ips:

Shared IP addresses
~~~~~~~~~~~~~~~~~~~

.. important
   The shared IP address API is currently in Limited Availability. It is
   available to Managed Infrastructure customers and Managed Operations
   customers. To use this feature, contact Rackspace Support.

A shared IP address is a special case where an additional IP address is shared
between 2 or more virtual machines (or as virtual machine cluster) to
facilitate fail-over in a redundant configuration.

For example, if you have a group of cloud servers that perform specialized
functions in a redundant setup (such as an Nginx, or HAProxy, load-balancer or
a Vyatta firewall appliance/router), one of the servers acts as the primary
server and the others act as backup. In this case, the active server owns the
Shared IP address. External clients use the Shared IP address on the Public
interface as the IP to communicate with the cluster. If the active, or primary,
server does down, the backup takes over and there is no impact for clients that
are connected, because the IP address doesn't change.

The failover mechanism, and transfer of ownership of the Shared IP address, is
controlled by the actual application that is used to implement redundancy and
happens entirely in the data-plane by using means such as gratuitous address
resolution protocol (GARP).

.. _concepts-shared-ip-examples:

Cluster examples with multiple shared IP addresses
--------------------------------------------------

Within a cluster with various services, each service gets it's own IP address.
This allows each service to migrate independently between members to share the
load. There may be as many IP addresses as the customer has unique services, or
roles, in the cluster. For example, you may have a 2-node cluster with one node
running a MySQL database and the other running a network file system (NFS). The
natural operation is to have each node run one service, and, during
maintenances, run them both temporarily on the same node.

In MySQL-MMM (the multi-master replication manager), it is fairly common to
have a Reader role on one IP address and a Writer role on another IP address.
In this case, each service's IP address stays with its service, but the IP
address may relocate to the other node as needed. As in the previous case, run
each role on a different node but sometimes run them together during
maintenances.

In general, a cluster can have more than 2 servers and potentially many shared
IP addresses. Each shared IP address needs to be able to reside on any server
in the cluster. Take the extreme example of a cluster of 10 servers, with 8
shared IP addresses. At one moment, the shared IP addresses may all be assigned
to different servers. At another moment, all 8 may need to be assigned to just
one of the servers. The cluster may decide to move 1 or more of the shared IP
addresses to another server in the cluster at any time.
