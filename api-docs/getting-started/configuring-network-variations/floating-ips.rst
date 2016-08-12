.. _floating-ips:

===========================
Using floating IP addresses
===========================

.. Important::

   The Floating IP Address API is currently in Early Access. It is available
   for Managed Infrastructure customers and Managed Operations customers. It is
   not available for RackConnect customers. To use this feature, contact
   Rackspace Support.


The following flow chart shows the steps for creating floating IP addresses and
associating them to servers and performing a seamless transfer from  a fixed IP
address to a floating IP address. Detailed steps are provided in this section.

.. image:: /_images/fi-neutron-api.svg

.. COMMENT The sections are also organized by example type. To simplify your path through
.. COMMENT this section, decide whether you prefer neutron-client or cURL examples.

.. COMMENT **Next step:** Choose one of the following methods:

**Next step:** Choose the following method:

.. COMMENT  - Floating IP address with nova and neutron client <floating-ips-with-neutron>

-  :ref:`Floating IP address with cURL <floating-ip-with-curl>`

.. COMMENT  floating-ip-neutron  {belongs below in toctree}

.. toctree::
   :maxdepth: 2

   floating-ips-curl

