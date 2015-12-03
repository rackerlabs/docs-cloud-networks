.. _boot-new-server:

=========================================
Boot a new server with your cloud network
=========================================

Now that you have a cloud network, you can attach it to a new server.

The following flow chart shows the steps to attach a network and provision a server. 
Detailed steps are provided in this section.

.. note::

   You can pass network attributes to the server at boot time in the following ways.

   #. You can pass the network ID.

   #. You can pass the ID of the ports on the desired networks.

The flowchart assumes that you are passing the port UUID of the isolated network.

.. image:: /_images/bns-neutron-api.png

The sections are also organized by example type. To simplify your path through this 
topic, decide whether you prefer neutron-client or cURL examples.

**Next step:** Choose one of the following methods:

-  :ref:`Boot server with neutron client <boot-server-with-neutron>`
-  :ref:`Boot server with cURL <boot-server-with-curl>`

.. toctree::
   :maxdepth: 2
   
   boot-server-neutron
   boot-server-curl