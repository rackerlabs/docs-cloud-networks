.. _provisioning-port-ips:

=================================================================
Provisioning additional IP and dual-stack IP addresses on a port
=================================================================

For extra flexibility, you can configure an isolated network  port to have both IPv4 and 
IPv6 IP addresses and boot a server using that port.

The following flow chart shows the steps for using dual-stack IP addresses on a port. 
Detailed steps are provided in this section.

.. image:: /_images/ppi-neutron-api.png

The sections are also organized by example type. To simplify your path through this 
chapter, decide whether you prefer neutron-client or cURL examples.

**Next step:** Choose one of the following methods:

-  :ref:`Provisioning a port with additional IP and dual-stack IPs with neutron client <provisioning-port-ips-with-neutron>`
-  :ref:`Provisioning a port with additional IP and dual-stack IPs with cURL <provisioning-port-ips-with-curl>`

.. toctree::
   :maxdepth: 2

   provisioning-port-ips-neutron
   provisioning-port-ips-curl