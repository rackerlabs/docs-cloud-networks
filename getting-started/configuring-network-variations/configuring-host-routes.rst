.. _configuring-host-routes:

Configuring host routes
-----------------------

At server boot time, you can use the host routes in the ``subnets`` resource to
pass specific static routes to the server.

The following flow chart shows the steps for configuring host routes. Detailed
steps are provided in this section.

**Figure 10.1. Steps to configure host routes**

The sections are also organized by example type. To simplify your path through
this topic, decide whether you prefer neutron-client or cURL examples.

.. image:: /_images/chr-neutron-api.svg

.. toctree::
   :maxdepth: 2

   configuring-host-routes-neutron
   configuring-host-routes-curl
