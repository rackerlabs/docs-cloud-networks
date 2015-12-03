.. _share-ips:

================================
Share IP address between servers
================================

.. Important:: 

   The Shared IP Address API is currently in Early Access. It is available for Managed 
   Infrastructure customers and Managed Operations customers. It is not available for 
   RackConnect customers. To use this feature, contact Rackspace Support.

To determine whether the servers are in the same ``publicIPZoneId``, use the Get 
``/servers/{serverID}`` API operation to get the server details for each server and compare 
the contents of the ``RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId`` attributes.

..  note:: 

    To share a Cloud Networks (isolated network) IP address, you don't need the servers to be 
    in the same publicIPZoneId.

The user needs to configure a heartbeat mechanism between using an application, such as 
VRRP, keepalived, and so on, to control ownership of the Shared IP.

The following flow chart shows the steps for sharing a public IPv4 address between two 
newly created servers or two existing servers with the same ``publicIPZoneId``. Detailed 
steps are provided in this section.

.. image:: /_images/si-neutron-api.png

The sections are also organized by example type. To simplify your path through this 
chapter, decide whether you prefer neutron-client or cURL examples.

**Next step:** Choose one of the following methods:

-  :ref:`Share IP address with nova and neutron client <share-ips-with-neutron>`
-  :ref:`Share IP address with cURL <share-ips-with-curl>`

.. toctree::
   :maxdepth: 2

   share-ips-neutron
   share-ips-curl