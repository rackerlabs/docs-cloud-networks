.. _cn-dg-concepts-shared-ips:

=========================
Shared IP Addresses
=========================

#   .. important::
#      The shared IP address API is currently in Limited Availability. It is available only to 
#      Managed Infrastructure customers and not to RackConnect or Managed Operations customers. 
#      To use this feature, contact Rackspace Support.

A shared IP address is a special case where an additional IP address is shared between 2 or more virtual machines 
(or a virtual machine cluster) to facilitate fail-over in a redundant configuration.

For example, if you have a group of cloud servers that perform specialized functions in a redundant setup (such
as an Nginx, or HAProxy, load-balancer or a Vyatta firewall appliance/router), one of the servers acts as the
primary server and the others act as backup. In this case, the active server owns the Shared IP address. External
clients use the Shared IP address on the Public interface as the IP to communicate with the cluster. If the
active, or primary, server does down, the backup takes over and there is no impact for clients that are
connected, because the IP address doesn't change.

The failover mechanism, and transfer of ownership of the Shared IP address, is controlled by the actual application
that is used to implement redundancy and happens entirely in the data-plane by using means such as gratuitous
address resolution protocol (GARP).

.. _cn-dg-concepts-shared-ip-examples:

Cluster examples with multiple shared IP addresses
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Within a cluster with various services, each service gets it's own IP address. This allows each service to migrate
independently between members to share the load. There may be as many IP addresses as the customer has unique
services, or roles, in the cluster. For example, you may have a 2-node cluster with one node running a MySQL
database and the other running a network file system (NFS). The natural operation is to have each node run
one service, and, during maintenances, run them both temporarily on the same node.

In MySQL-MMM (the multi-master replication manager), it is fairly common to have a Reader role on one IP address
and a Writer role on another IP address. In this case, each service's IP address stays with its service, but the IP
address may relocate to the other node as needed. As in the previous case, run each role on a different node
but sometimes run them together during maintenances.

In general, a cluster can have more than 2 servers and potentially many shared IP addresses. Each shared IP address
needs to be able to reside on any server in the cluster. Take the extreme example of a cluster of 10 servers,
with 8 shared IP addresses. At one moment, the shared IP addresses may all be assigned to different servers.
At another moment, all 8 may need to be assigned to just one of the servers. The cluster may decide to move 1
or more of the shared IP addresses to another server in the cluster at any time.
