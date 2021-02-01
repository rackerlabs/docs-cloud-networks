.. _sharing-ips:

Sharing IP address between servers
----------------------------------

.. Important::

   The Shared IP Address API is currently in Limited Access. It is available
   for Managed Infrastructure customers and Managed Operations customers. It is
   not available for RackConnect customers. To use this feature, contact
   Rackspace Support.

To determine whether the servers are in the same ``publicIPZoneId``, use the
Get ``/servers/{serverID}`` API operation to get the server details for each
server and compare the contents of the ``RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId``
attributes.

..  note::

    To share a Cloud Networks (isolated network) IP address, you don't need the
    servers to be in the same publicIPZoneId.

The user needs to configure a heartbeat mechanism between using an application,
such as keepalived, to control ownership of the Shared IP.  Corosync and
pacemaker can be used for this purpose, but they work in isolated networks only
if multicast is used. They work normally on provider networks. Currently, VRRP
is not supported.

The following flow chart shows the steps for sharing a public IPv4 address
between two newly created servers or two existing servers with the same
``publicIPZoneId``. Detailed steps are provided in this section.

.. image:: /_images/si-neutron-api.svg


The sections are also organized by example type. To simplify your path through
this chapter, decide whether you prefer neutron-client or cURL examples.

**Next step:** Choose one of the following methods:

.. toctree::
   :maxdepth: 2

   sharing-ips-neutron
   sharing-ips-curl
