.. _booting-new-server:

=============================================
Booting a new server with your cloud network
=============================================

Now that you have a cloud network, you can attach it to a new server.

The following flow chart shows the steps to attach a network and provision a server.
Detailed steps are provided in this section.

.. note::

   You can pass network attributes to the server at boot time in the following ways.

   #. You can pass the network ID.

   #. You can pass the ID of the ports on the desired networks.

The flowchart assumes that you are passing the port UUID of the isolated network.

.. image:: /_images/bns-neutron-api.svg

The sections are also organized by example type. To simplify your path through this
topic, decide whether you prefer neutron-client or cURL examples.

**Next step:** Choose one of the following methods:

-  :ref:`Booting server with neutron client <booting-server-with-neutron>`
-  :ref:`Booting server with cURL <booting-server-with-curl>`

.. toctree::
   :maxdepth: 2

   booting-server-neutron
   booting-server-curl
