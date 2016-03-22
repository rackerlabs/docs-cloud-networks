.. _removing-network:

============================
Deleting your cloud network
============================

When you no longer need your cloud network, delete it.

.. note::

   You cannot delete a network while its port is still attached to a server. Also, you 
   cannot delete the PublicNet and ServiceNet networks .

The following flow chart shows the steps for deleting an isolated network. Detailed steps 
are provided in this section.

.. image:: /_images/dn-neutron-api.png

The sections are also organized by example type. To simplify your path through this 
topic, decide whether you prefer neutron-client or cURL examples.

**Next step:** Choose one of the following methods:

-  :ref:`Deleting your network with neutron client <deleting-network-with-neutron>`
-  :ref:`Deleting your network with cURL <deleting-network-with-curl>`


.. toctree::
   :maxdepth: 2

   deleting-network-neutron
   deleting-network-curl


