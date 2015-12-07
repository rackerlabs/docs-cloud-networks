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
connection. ServiceNet is the data center internet network. In your 
:ref:`authentication response <review-auth-resp>`, the service catalog lists the 
ServiceNet endpoint values in the ``InternalURL`` field.

In some cases, you must use a public endpoint to access the |service|.

- If you are working with servers that are not in one of the Rackspace data centers, you 
  must use a public endpoint to connect.  

- If you are working with servers in multiple data centers or a mixed environment where 
  you have servers in your data centers and in Rackspace data centers, use a public 
  endpoint because it is accessible from all the servers in the 
  different environments.

You can find the public endpoints to access the Cloud Orchestration API in the service 
catalog returned in the 
:ref:`authentication response <review-auth-resp>`. 

Search the response for the service name, ``cloudNetworks``. 
Then copy the URI from the ``publicURL`` field for the regional data center that you 
want to use. Use this value when you configure environment variables to use in API requests. 
      

.. tip::

    You can find your account ID and default data center in the 
    :mycloud:`Cloud Control Panel <>`. For details, see 
    :ref:`Get credentials <get-credentials>` .