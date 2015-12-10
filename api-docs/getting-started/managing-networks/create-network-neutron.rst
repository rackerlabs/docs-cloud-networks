.. _create-network-with-neutron:

Create and list network and subnet with neutron
-----------------------------------------------

These sections walk you through creating your network and subnet and then listing them by 
using the neutron client.

.. _cn-create-network-neutron:

Create a network (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create a network, you specify a name for your network. After you create a network, copy 
its network ID. You use this ID to create a subnet and attach it to a port.

#. **Create network with neutron request**

   .. code::  

      $ neutron net-create amp
      
   **Positional arguments:**

   -  The network name. In this example, the name is ``amp``.

   **Create network with neutron response**

   .. code::  

       +----------------+--------------------------------------+
       | Field          | Value                                |
       +----------------+--------------------------------------+
       | admin_state_up | True                                 |
       | id             | 29f52c7e-6efd-4335-a14a-db77d32a2555 |
       | name           | amp                                  |
       | shared         | False                                |
       | status         | ACTIVE                               |
       | subnets        |                                      |
       | tenant_id      | 53501b3c25d34f8ea293c03298caed60     |
       +----------------+--------------------------------------+

#. Copy the ID value from the output. You will use this value when you create a subnet, 
   provision your server, or perform other related activities. In this example, the ID is
   ``29f52c7e-6efd-4335-a14a-db77d32a2555``, but use the ``id`` from your response.

.. _cn-create-subnet-neutron:

Create a subnet (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create a subnet, you specify a network, an IP address, and a name for your subnet. 
After you create a subnet, copy its subnet ID for future reference.

#. **Create subnet with neutron request**

   .. code::  

      $ neutron subnet-create --name Subamp /
        --ip-version 4 29f52c7e-6efd-4335-a14a-db77d32a2555 120.1.2.0/24

   **Positional arguments:**
   
   -  ``name`` The subnet name. In this example, the name is ``Subamp``.

   -  ``ip-version`` The version of the subnet IP. In this example, the version is ``4``.

   -  The network ID or name. In this example, we used the network ID
      ``29f52c7e-6efd-4335-a14a-db77d32a2555``.

   -  The network CIDR. In this example, the CIDR is ``120.1.2.0/24``.

   **Create subnet with neutron response**

   .. code::  

       +------------------+----------------------------------------------+
       | Field            | Value                                        |
       +------------------+----------------------------------------------+
       | allocation_pools | {"start": "120.1.2.1", "end": "120.1.2.254"} |
       | cidr             | 120.1.2.0/24                                 |
       | dns_nameservers  |                                              |
       | enable_dhcp      |                                              |
       | gateway_ip       |                                              |
       | host_routes      |                                              |
       | id               | 23e3059e-4f39-4f7f-8cf2-c326e5de6c37         |
       | ip_version       | 4                                            |
       | name             | Subamp                                       |
       | network_id       | 29f52c7e-6efd-4335-a14a-db77d32a2555         |
       | tenant_id        | 53501b3c25d34f8ea293c03298caed60             |
       +------------------+----------------------------------------------+

#. Copy the id value from the output for future reference. In this example, the id is 
   ``23e3059e-4f39-4f7f-8cf2-c326e5de6c37``, but use the ``id`` from your response.

.. _cn-list-networks-neutron:

List networks (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**List networks with neutron request**

.. code::  

   $ neutron net-list 

**List networks with neutron response**

.. code::  

   +--------------------------------------+------+---------------------------------------------------+
   | id                                   | name | subnets                                           |
   +--------------------------------------+------+---------------------------------------------------+
   | 29f52c7e-6efd-4335-a14a-db77d32a2555 | amp  | 23e3059e-4f39-4f7f-8cf2-c326e5de6c37 120.1.2.0/24 |
   +--------------------------------------+------+---------------------------------------------------+

.. _cn-list-subnets-neutron:

List subnets (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**List subnets with neutron request**

.. code::

   $ neutron subnet-list 

**List subnets with neutron response**

.. code::

   +--------------------------------------+--------+--------------+----------------------------------------------+
   | id                                   | name   | cidr         | allocation_pools                             |
   +--------------------------------------+--------+--------------+----------------------------------------------+
   | 23e3059e-4f39-4f7f-8cf2-c326e5de6c37 | Subamp | 120.1.2.0/24 | {"start": "120.1.2.1", "end": "120.1.2.254"} |
   +--------------------------------------+--------+--------------+----------------------------------------------+

**Next topic:** :ref:`Boot a new server with your cloud network<boot-new-server>` 

