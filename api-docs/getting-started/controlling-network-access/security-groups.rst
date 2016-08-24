.. _using-security-groups-and-rules:

Controlling network traffic by using security groups and rules
--------------------------------------------------------------

.. Important::

   The Security Groups API is currently in Limited Availability. It is
   available only to Managed Infrastructure customers and not to RackConnect or
   Managed Operations customers. To use this feature, contact Rackspace
   Support.

A security group is a named container for security group rules, which provide
Rackspace Public Cloud users the ability to specify the types of traffic that
are allowed to pass through, to, and from ports (Public/ServiceNet) on a Cloud
server instance. After an instance is active, you can assign one or more
security groups to Neutron ports on that instance. You cannot apply security
groups to a port at boot time.


.. Note::

   There are no default security groups created for you in your Rackspace
   account. In order to use security groups, you have to create them first and
   then apply them to Neutron ports that belong to Cloud Server instances.

For more information about security groups and security group rules, see
:ref:`Security groups and rules<concepts-security>`.

The following flow chart shows the steps for creating, using, and modifying
security groups and rules. Detailed steps are provided in this section.

.. image:: /_images/sg-neutron-api.svg

The sections are also organized by example type. To simplify your path through
this chapter, decide whether you prefer neutron-client or cURL examples.

**Next step:** Choose one of the following methods:

.. toctree::
   :maxdepth: 2

   security-groups-neutron
   security-groups-curl
