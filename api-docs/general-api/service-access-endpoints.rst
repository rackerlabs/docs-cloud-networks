.. _service-access-endpoints:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Service access and endpoints
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The |service| service is a regionalized service that allows customers to select the
regional endpoint where the |service| service is provisioned.

.. tip::

   To help you decide which regionalized endpoint to use, see the considerations for 
   choosing a data center in the :kc-article:`About regions <about-regions>` Rackspace 
   Knowledge Center article.

If you are working with cloud servers that are in one of the Rackspace data centers, using 
the ServiceNet endpoint in the same data center has no network costs and provides a faster 
connection. ServiceNet is the data center internet network. In your authentication response 
(see :ref:`authentication-ovw`), it is listed as InternalURL.

If you are working with servers that are not in one of the Rackspace data centers, you 
must use a public endpoint to connect. In your authentication response, public endpoints 
are listed as publicURL. If you are working with servers in multiple data centers or have 
a mixed environment where you have servers in your data centers and in Rackspace data 
centers, use a public endpoint because it is accessible from all the servers in the 
different environments.

.. note::

   You should copy the base URLs directly from the catalog rather than trying to construct 
   them manually.

.. tip::

   If you do not know your account ID or which data center you are working in, you can 
   find that information in the :mycloud:`Cloud Control Panel <>`.
