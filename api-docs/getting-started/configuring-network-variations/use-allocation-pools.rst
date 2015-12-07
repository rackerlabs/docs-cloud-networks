.. _use-alloc-pools:

=====================================================================
Controlling dynamic IP address allocation by using allocation pools 
=====================================================================

Allocation pools are a property of the ``subnets`` resource and can be used to control 
dynamic address allocation within a CIDR. 

An allocation pool is a subset of the CIDR. Any addresses that are not part of the 
allocation pool are not dynamically assigned to ports or to server instances. However, 
addresses that are not part of the allocation pool, but that are within the CIDR, can still 
be assigned statically when a port is created by using the ``fixed_ips`` attribute of the 
``ports`` resource. The port ID can then be passed to the server at boot time as shown in 
the example.

The following flow chart shows the steps for using allocation pools to control dynamic IP 
address allocation. Detailed steps are provided in this section.

.. image:: /_images/uap-neutron-api.png

The sections are also organized by example type. To simplify your path through this 
topic, decide whether you prefer neutron-client or cURL examples.

**Next step:** Choose one of the following methods:

-  :ref:`Use allocation pools to control dynamic IP address allocation with neutron client <use-allocation-pools-with-neutron>`
-  :ref:`Use allocation pools to control dynamic IP address allocation with cURL <use-allocation-pools-with-curl>`


.. toctree::
   :maxdepth: 2

   use-allocation-pools-neutron
   use-allocation-pools-curl