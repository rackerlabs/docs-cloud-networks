.. _cn-dg-generalapi-auth:

============================
Get the authentication token
============================

To authenticate access to Rackspace Cloud services, you issue an authentication request to 
the Rackspace Cloud Identity service, which is an implementation of the OpenStack Keystone 
Identity Service v2.0.

Authenticate by using the following endpoint::

    https://identity.api.rackspacecloud.com/v2.0

In response to valid credentials, an authentication request to the Rackspace Cloud Identity 
service returns an authentication token and a service catalog that contains a list of all 
services and endpoints available for this token. Because the authentication token expires 
after 24 hours, you must generate a new token once a day.

For detailed information about the Rackspace Identity Service v2.0, see `Cloud Identity 
Client Developer Guide API v2.0`_.

.. _Cloud Identity Client Developer Guide API v2.0: http://docs.rackspace.com/auth/api/v2.0/auth-client-devguide/content/index.html

.. _cn-dg-generalapi-auth-curl:

Authenticate with cURL
~~~~~~~~~~~~~~~~~~~~~~

To authenticate with cURL, issue a **POST /tokens** request to the appropriate Rackspace 
Cloud Identity Service endpoint.

In the request body, supply one of the following sets of credentials:

-  User name and password

-  User name and API key

Your user name and password are the ones that you use to log in to the Rackspace Cloud 
Control Panel.

..  note::

    If you authenticate with username and password credentials, you can use multi-factor 
    authentication to add an additional level of account security. This feature is not 
    implemented for username and API credentials. For more information, see 
    `Multifactor authentication`_ in the *Cloud Identity Client Developer Guide*.

.. _Multifactor authentication: http://docs.rackspace.com/auth/api/v2.0/auth-client-devguide/content/MFA_Ops.html

To obtain your API key, log in to http://mycloud.rackspace.com,  
select **Account:**\ *username* > **Account Settings**, and click **Show** next to 
the **API Key** field.

**To authenticate with cURL:**

#. Get an authentication token and a service catalog with a list of endpoints.

   Use one of the following cURL commands to authenticate to the Identity endpoint:
 
   **Example: Authenticate with username and password: JSON request**

   .. code::  

       $ curl -s https://identity.api.rackspacecloud.com/v2.0/tokens -X 'POST' \
              -d '{"auth":{"passwordCredentials":{"username":"yourUserName", "password":"yourPassword"}}}' \
              -H "Content-Type: application/json" | python -m json.tool
    
   **Example: Authenticate with username and API key: JSON request**

   .. code::  

       $ curl -s https://identity.api.rackspacecloud.com/v2.0/tokens -X 'POST' \
              -d '{"auth":{"RAX-KSKEY:apiKeyCredentials":{"username":"yourUserName", "apiKey":"yourApiKey"}}}' \
              -H "Content-Type: application/json" | python -m json.tool

   ..  note::

        For information about the json.tool, see :ref:`More about json.tool <cn-dg-generalapi-curl-json>`.

   In response to valid credentials, your request returns an authentication token and a 
   service catalog with the endpoints that you need to request services.

   ..  note:: 
        
        If you authenticated with username and password credentials, and the Identity service 
        returns a 401 message requesting additional credentials, your account is configured 
        for multi-factor authentication. To complete the authentication process, `submit a 
        second POST tokens request with multi-factor authentication credentials`_.

   .. _submit a second POST tokens request with multi-factor authentication credentials: http://docs.rackspace.com/auth/api/v2.0/auth-client-devguide/content/proc_mfa_auth.html

   Do not include explicit API endpoints in your scripts and applications. Instead, find 
   the endpoint for your service and region.

   The following output shows a partial authentication response in JSON format:

   **Example: Authentication: JSON response**

   .. code::  

       {
           "access": {
               "serviceCatalog": [
                   {
                       "endpoints": [
                           {
                               "publicURL": "https://ord.images.api.rackspacecloud.com/v2",
                               "region": "ORD",
                               "tenantId": "010101"
                           },
                           {
                               "publicURL": "https://hkg.images.api.rackspacecloud.com/v2",
                               "region": "HKG",
                               "tenantId": "010101"
                           },
                           {
                               "publicURL": "https://dfw.images.api.rackspacecloud.com/v2",
                               "region": "DFW",
                               "tenantId": "010101"
                           }
                       ],
                       "name": "cloudImages",
                       "type": "image"
                   },
                   {
                       "endpoints": [ 
                           {
                               "publicURL": "https://dfw.servers.api.rackspacecloud.com/v2/010101",
                               "region": "DFW",
                               "tenantId": "010101", 
                               "versionId": "2",
                               "versionInfo": "https://dfw.servers.api.rackspacecloud.com/v2",
                               "versionList": "https://dfw.servers.api.rackspacecloud.com/"
                           },
                           {
                               "publicURL": "https://syd.servers.api.rackspacecloud.com/v2/010101",
                               "region": "SYD",
                               "tenantId": "010101",
                               "versionId": "2",
                               "versionInfo": "https://syd.servers.api.rackspacecloud.com/v2",
                               "versionList": "https://syd.servers.api.rackspacecloud.com/"
                           },
                           {
                               "publicURL": "https://iad.servers.api.rackspacecloud.com/v2/010101",
                               "region": "IAD",
                               "tenantId": "010101",
                               "versionId": "2",
                               "versionInfo": "https://iad.servers.api.rackspacecloud.com/v2",
                               "versionList": "https://iad.servers.api.rackspacecloud.com/"
                           }
                       ],
                       "name": "cloudServersOpenStack", 
                       "type": "compute"
                   }
               ],
               "token": {
                   "RAX-AUTH:authenticatedBy": [
                       "APIKEY"
                   ],
                   "expires": "2014-11-21T11:16:40.995Z",      
                   "id": "459a28e0-777f-416c-8f22-9f6598fabd2f", 
                   "tenant": {
                       "id": "010101",
                       "name": "010101"
                   }
               },
               "user": {
                   "RAX-AUTH:defaultRegion": "ORD",
                   "id": "01010156",
                   "name": "MyRackspaceAcct",
                   "roles": [
                       {
                           "description": "User Admin Role.",
                           "id": "3",
                           "name": "identity:user-admin"
                       }
                   ]
               }
           }
       }

   Successful authentication returns the following information:

   **Endpoints to request Rackspace Cloud services**. Appears in the
   ``endpoints`` element in the ``serviceCatalog`` element.

   - Endpoint information includes the public URL, which is the endpoint that
   	 you use to access the service, as well as region, tenant ID, and version information.
   	 
   	 .. note:: To help you decide which regionalized endpoint to use, read about `special considerations <http://www.rackspace.com/knowledge_center/article/about-regions>`_ for choosing a data center.

   **Tenant ID**. Appears in the ``tenantId`` field in the ``endpoints``
   element. The tenant ID is also known as the account number.

   - You include the tenant ID in the endpoint URL when you call a cloud service.

   **The name of the service**. Appears in the ``name`` field.
   
   - To access the Cloud Networks service, locate and use the ``publicURL`` value 
     for the ``cloudNetworks`` service.

   - The service might show multiple endpoints to enable regional
     choice. Select the appropriate endpoint for the region that you want
     to interact with by examining the ``region`` field.

     .. note:: To help you decide which regionalized endpoint to use, read about
        special considerations for choosing a data center at
        http://ord.admin.kc.rakr.net/knowledge_center/article/about-regions.

   **Expiration date and time for authentication token**. Appears in the
   ``expires`` field in the ``token`` element.

   - After this date and time, the token is no longer valid. This field predicts the maximum 
     lifespan for a token, but does not guarantee that the token reaches that lifespan.

   - Clients are encouraged to cache a token until it expires.

   - Because the authentication token expires after 24 hours, you must generate a token once a day.

   **Authentication token**. Appears in the ``id`` field in the ``token`` element.

   - You pass the authentication token in the ``X-Auth-Token`` header each
     time that you send a request to a service.


#. Copy the values in the ``publicURL`` and ``tenantId`` fields for the 
   ``cloudNetworks`` service for your region, and copy the authentication token from 
   the ``id`` field in the ``token`` element.

As a next step, you can set environment variables to these values.
