.. _remove-network:

=========================
Delete your cloud network
=========================

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

-  :ref:`Delete your network with neutron client <delete-network-with-neutron>`
-  :ref:`Delete your network with cURL <delete-network-with-curl>`


.. toctree::
   :maxdepth: 2

   delete-network-neutron
   delete-network-curl


