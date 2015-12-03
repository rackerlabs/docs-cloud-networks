.. _provision-port-ips:

===============================================================================
Provision additional IP and dual-stack IP addresses on an isolated network port
===============================================================================

For extra flexibility, you can configure a port to have both IPv4 and IPv6 IP addresses 
and boot a server using that port.

The following flow chart shows the steps for using dual-stack IP addresses on a port. 
Detailed steps are provided in this section.

.. image:: /_images/ppi-neutron-api.png

The sections are also organized by example type. To simplify your path through this 
chapter, decide whether you prefer neutron-client or cURL examples.

**Next step:** Choose one of the following methods:

-  :ref:`Provision a port with additional IP and dual-stack IPs with neutron client <provision-port-ips-with-neutron>`
-  :ref:`Provision a port with additional IP and dual-stack IPs with cURL <provision-port-ips-with-curl>`

.. toctree::
   :maxdepth: 2

   provision-port-ips-neutron
   provision-port-ips-curl