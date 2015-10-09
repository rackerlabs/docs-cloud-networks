.. _api-operations-ip-addresses:

IP address operations
~~~~~~~~~~~~~~~~~~~~~~~~~~

This section describes the API operations for IP addresses. For general information about 
IP addresses and shared IP addresses, see :ref:`Shared IP addresses concepts <concepts-shared-ips>`.

.. note::
	The IP Addresses API is currently in Limited Availability. It is available only to 
	Managed Infrastructure customers and not to RackConnect or Managed Operations customers. 
	To use this feature, contact Rackspace Support.


.. IP ADDRESS OPS

.. include:: methods/get-retrieve-list-of-ip-addresses-v2.0-ip-addresses.rst
.. include:: methods/post-provision-ip-address-v2.0-ip-addresses.rst
.. include:: methods/put-update-ports-with-an-ip-address-v2.0-ip-addresses-ipaddressid.rst
.. include:: methods/get-show-ip-address-details-v2.0-ip-addresses-ipaddressid.rst
.. include:: methods/delete-de-allocate-ip-address-v2.0-ip-addresses-ipaddressid.rst


.. IP ASSOCIATION OPS

.. include:: methods/get-retrieve-list-of-ip-addresses-explicitly-associated-with-a-server-v2-servers-serverid-ip-associations.rst
.. include:: methods/put-explicitly-associate-ip-address-with-server-v2-servers-serverid-ip-associations-ipaddressid.rst
.. include:: methods/get-show-specific-ip-addresses-explicitly-associated-with-server-v2-servers-serverid-ip-associations-ipaddressid.rst
.. include:: methods/delete-delete-association-between-ip-address-and-server-v2-servers-serverid-ip-associations-ipaddressid.rst