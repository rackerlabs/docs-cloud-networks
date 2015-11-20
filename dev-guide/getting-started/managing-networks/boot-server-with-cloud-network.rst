.. _boot-server-with-cloud-network:

=========================================
Boot a new server with your cloud network
=========================================

Now that you have a cloud network, you can attach it to a new server.

The following flow chart shows the steps to attach a network and
provision a server. Detailed steps are provided in this section.

.. note::
   You can pass network attributes to the server at boot time in the
   following ways.

#. You can pass the network ID.

#. You can pass the ID of the ports on the desired networks.

The flowchart assumes that you are passing the port UUID of the isolated
network.

**Figure: Steps to provision a server with a network**

|Steps to provision a server with a network|

The sections are also organized by example type. To simplify your path
through this chapter, decide whether you prefer neutron-client or cURL
examples.

**Next step:** Choose one of the following methods:

-  `Boot server with neutron client <bns_neutron_neutron.html>`__

-  `Boot server with cURL <bns_neutron_curl.html>`__
                           


.. toctree::
   :maxdepth: 2

   Boot server with neutron client <ch06.xhtml#bns_neutron_neutron>`__
   List networks (neutron
client) <ch06.xhtml#neutron_list_networks2_neutron>`__
   Create a port (neutron
client) <ch06.xhtml#neutron_create_port_neutron>`__
   List ports (neutron client) <ch06.xhtml#neutron_list_ports_neutron>`__
   Provision a server with a port and an isolated network (nova
client) <ch06.xhtml#neutron_create_server_nova>`__
   Show port details (neutron
client) <ch06.xhtml#neutron_show_port_neutron>`__
   List servers (nova client) <ch06.xhtml#neutron_list_server_nova>`__
   Boot server with cURL <ch06s02.xhtml>`__
   List subnets (cURL) <ch06s02.xhtml#neutron_list_subnets_bns_curl>`__
   Create a port (cURL) <ch06s02.xhtml#neutron_create_port_curl>`__
   List ports (cURL) <ch06s02.xhtml#neutron_list_port_curl>`__
   Provision a server with a port on an isolated network
(cURL) <ch06s02.xhtml#neutron_create_server_curl>`__
   List server and attached networks
(cURL) <ch06s02.xhtml#neutron_list_server_curl>`__
   List ports (cURL) <ch06s02.xhtml#neutron_list_ports_curl>`__

