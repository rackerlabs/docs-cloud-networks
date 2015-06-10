.. _cn-dg-concepts-security:

=========================
Security groups and rules
=========================

.. important::
    Important: The Security Groups API is currently in Limited Availability. It is available only to Managed Infrastructure customers and not to RackConnect or Managed Operations customers. To use this feature, contact Rackspace Support.

A security group is a named container for security group rules, which provide Rackspace Public Cloud users the ability to specify the types of traffic that are allowed to pass through, to, and from ports (Public/ServiceNet) on a Cloud server instance. After an instance is active, you can assign one or more security groups to Neutron ports on that instance. You cannot apply security groups to a port at boot time.

..  note:: 
    There are no default security groups created for you in your Rackspace account. In order to use security groups, you have to create them first and then apply them to Neutron ports that belong to Cloud Server instances.

.. _cn-dg-concepts-security-groups:

Security groups
~~~~~~~~~~~~~~~

-  act as a firewall for your cloud server instances.

-  can be applied to Rackspace Cloud Servers on Public and ServiceNet Neutron ports. They are not supported for Cloud Networks ports (Isolated Networks).

-  can only contain rules for the inbound traffic, also known as ingress direction. Outbound traffic, or egress direction, rules are not supported at this time.

-  are limited to no more than 5 security groups per Neutron port. When a Neutron port has multiple security groups applied, the rules from each security group are effectively aggregated to dictate the rules for access on that port.

   ..  note:: 
    If there is more than one security group applied to a Neutron port, we apply the most permissive rule. For example, if you have one rule that allows ICMP traffic from IP address 10.23.194.19 and another rule that allows access to ICMP from everyone, then everyone can access the server via ICMP on that Neutron port.

-  may contain up to 20 security group rules.

The rules of a security group control the incoming traffic that is allowed to reach an instance through the Public and ServiceNet Neutron ports, where the security group is applied to those ports.

.. _cn-dg-concepts-security-rules:

Security group rules
~~~~~~~~~~~~~~~~~~~~

-  are a white-list (permit traffic if there is a match). You cannot create rules that deny traffic.

-  may be added to, and removed from, Security Groups either before the Security Group is applied to the port or while the Security Group is applied to the port.

   ..  note:: 
        If you add or remove rules from a security groups while the security group is applied to a port, you need to re-apply the security group to the port for the changes to take effect. The security group rule changes are applied to the port after a short period of time.

-  cannot be edited. To change a security group rule, you have to delete the original security group rule and add a new rule.

-  cannot refer to a different security group. These self-referential rules are not supported.

-  are limited to a total of 100 security group rules per user, across all the user's security groups.

There are some limits and quotas around security groups and securit group rules, as shown the preceding lists. Here they are again, for convenience.

.. _cn-dg-concepts-security-quotas:

Quotas
~~~~~~

-  Maximum of 5 security groups per port.

-  Maximum of 20 security group rules per security group.

-  Maximum of 100 security group rules per user.

.. _cn-dg-concepts-security-parameters:

Parameters
~~~~~~~~~~

Specify the following parameters when you create a rule:

Ethertype
---------

This is the type of traffic to allow, either `IPv4` or `IPv6`.

Protocol
--------

Choose `TCP` for SSH, `ICMP` for pings, or `UDP` for data exchanges.

Port range
----------

Enter the range of ports for the rule. To open a single port only, enter the same value twice.

    ..  note:: 
        Since ICMP does not support ports, enter the ICMP type in the `port_range_min` field and enter the ICMP code in the `port_range_max` field.

Remote IP prefix
----------------

This optional parameter permits traffic from a Source IP address corresponding to the Remote IP prefix. You can enter a single IP address (for example: 10.553.16.23) or a range of IP addresses (for example: 10.553.16.23/24).
