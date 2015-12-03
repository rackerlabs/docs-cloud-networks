.. _create-first-network:

===============================
Create your first cloud network
===============================

The following flow chart shows the steps for creating a network. Detailed steps are 
provided in this section.

.. image:: /_images/cfn-neutron-api.png

The sections are also organized by example type. To simplify your path through this 
topic, decide whether you prefer neutron-client or cURL examples.

.. note::

   **Network Limitations:**

   -  The isolated network must exist in the same region as the cloud
      server.

   -  You can create up to 10 isolated networks with up to 250 servers
      attached to each one.

**Next step:** Choose one of the following methods:

-  :ref:`Create and list network and subnet with neutron<create-network-with-neutron>`
-  :ref:`Create and list network and subnet with cURL<create-network-with-curl>`

.. toctree::
   :maxdepth: 2
   
   create-network-neutron
   create-network-curl