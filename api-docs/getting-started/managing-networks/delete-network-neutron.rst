.. _delete-network-with-neutron:

Delete your network with neutron client
---------------------------------------

These sections walk you through deleting your subnet and network by using the neutron client.

.. _dn-delete-subnet:

Delete a subnet (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To delete a subnet, specify the subnet ID.

**Delete subnet with neutron request**

.. code::

   $ neutron subnet-delete 23e3059e-4f39-4f7f-8cf2-c326e5de6c37
   
**Positional argument:**

-  The subnet ID of the subnet that you want to delete. In this example, the subnet ID is
   ``23e3059e-4f39-4f7f-8cf2-c326e5de6c37``.

The operation returns an ``Accepted (204)`` response code, if successful.

.. _dn-delete-network:

Delete a network (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To delete a network, specify the network ID.

**Delete network with neutron request**

.. code::  

   $ neutron net-delete 29f52c7e-6efd-4335-a14a-db77d32a2555
   
**Positional argument:**

-  The network ID of the network that you want to delete. In this example, the network ID 
   is ``29f52c7e-6efd-4335-a14a-db77d32a2555``.

The operation returns an ``Accepted (204)`` response code, if successful.

**Next topic:** :ref:`Attach your network to an existing server<attach-network-to-existing-server>`

