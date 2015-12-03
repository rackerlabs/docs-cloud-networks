.. _get-the-authentication-token:

============================
Get the authentication token
============================

To authenticate access to Rackspace Cloud services, you issue an
authentication request to the Rackspace Cloud Identity service, which is
an implementation of the OpenStack Keystone Identity Service v2.0.

Authenticate by using the following endpoint:
https://identity.api.rackspacecloud.com/v2.0

In response to valid credentials, an authentication request to the
Rackspace Cloud Identity service returns an authentication token and a
service catalog that contains a list of all services and endpoints
available for this token. Because the authentication token expires after
24 hours, you must generate a new token once a day.

For detailed information about the Rackspace Identity Service v2.0, see
`*Cloud Identity Client Developer Guide API
v2.0* <http://docs.rackspace.com/auth/api/v2.0/auth-client-devguide/content/index.html>`__.

**Next step:** Choose one of the following methods:

-  `Authenticate with the nova client <nova_auth.html>`__

-  `Authenticate with cURL <curl_auth.html>`__

Authenticate with the nova client
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When you authenticate by using the nova client, you execute separate
commands to get the authentication token and the service catalog.

**Procedure: To authenticate with the nova client:**

#. Get an authentication token:

   .. code::  

       $ nova credentials

   Successful authentication returns user credentials, including ID,
   name, roles, and the authentication token. The token appears in the
   ``id`` field in the ``Token`` box as shown in the following example.

   **Example: Authentication credentials response**

   .. code::  

       +------------------+---------------------------------------------------------------------------------------+
       | User Credentials | Value                                                                                 |
       +------------------+---------------------------------------------------------------------------------------+
       | id               | 170454                                                                                |
       | name             | MyRackspaceAcct                                                                       |
       | roles            | [{u'description': u'User Admin Role.', u'id': u'3', u'name': u'identity:user-admin'}] |
       +------------------+---------------------------------------------------------------------------------------+
       +---------+----------------------------------------+
       | Token   | Value                                  |
       +---------+----------------------------------------+
       | expires | 2012-07-28T13:58:56.000-05:00          |
       | id      | 1bd336d5-e0c6-49d9-b902-d3dbdc463062   |
       | tenant  | {u'id': u'010101', u'name': u'010101'} |
       +---------+----------------------------------------+


   After you generate a token, the nova client automatically injects the
   token into any nova client commands that you issue.

   However, because the token expires after 24 hours, you must generate
   a new token once a day.

#. Get the service catalog with a list of endpoints:

   .. code::  

   $ nova endpoints

   For each service, the response includes the public URL (which is the
   endpoint, including your tenant ID, that you use to access the
   service), the region, the service name, the tenant ID, the version
   ID, and the endpoints that you can use to get version information for
   the API.

   To access the Cloud Networks or next generation Cloud Servers
   service, use the ``publicURL`` value for the
   ``cloudServersOpenStack`` service.

   The following example shows the information returned for the DFW
   region for the next generation Cloud Servers service:

   **Example: Authentication endpoints response**

   .. code::

       +-----------------------+------------------------------------------------------+
       | cloudServersOpenStack | Value                                                |
       +-----------------------+------------------------------------------------------+
       | publicURL             | https://dfw.servers.api.rackspacecloud.com/v2/010101 |
       | region                | DFW                                                  |
       | serviceName           | cloudServersOpenStack                                |
       | tenantId              | 010101                                               |
       | versionId             | 2                                                    |
       | versionInfo           | https://dfw.servers.api.rackspacecloud.com/v2        |
       | versionList           | https://dfw.servers.api.rackspacecloud.com/          |
       +-----------------------+------------------------------------------------------+


   The ``cloudServersOpenStack`` service might show multiple endpoints
   to enable regional choice. Select the appropriate endpoint for the
   region that you want to interact with by examining the ``region``
   field.

#. Copy the values in the ``publicURL`` and ``tenantId`` fields for the
   ``cloudServersOpenStack`` service for your region.

**Next step:** `Create your first cloud
network <create_first_net.html>`__

Authenticate with cURL
~~~~~~~~~~~~~~~~~~~~~~

To authenticate with cURL, issue a **POST** **/tokens** request to the
appropriate Rackspace Cloud Identity Service endpoint.

In the request body, supply one of the following sets of credentials:

-  User name and password

-  User name and API key

Your user name and password are the ones that you use to log in to the
Rackspace Cloud Control Panel.

.. note:: 
   If you authenticate with username and password credentials, you can use
   multi-factor authentication to add an additional level of account
   security. This feature is not implemented for username and API
   credentials. For more information, see `Multifactor
   authentication <http://docs.rackspace.com/auth/api/v2.0/auth-client-devguide/content/MFA_Ops.html>`__
   in the *Cloud Identity Client Developer Guide*.

To obtain your API key, log in to
` <http://mycloud.rackspace.com.>`__\ \ `http://mycloud.rackspace.com <http://mycloud.rackspace.com.>`__,
select Account:\ *``username``* > Account Settings, and click Show next
to the API Key field.

**Procedure: To authenticate with cURL:**

#. Get an authentication token and a service catalog with a list of
   endpoints.

   Use one of the following cURL commands to authenticate to the
   Identity endpoint:

   **Example: Authenticate with username and password: JSON
   request**

   .. code::  

       $ curl -s https://identity.api.rackspacecloud.com/v2.0/tokens -X 'POST' \
              -d '{"auth":{"passwordCredentials":{"username":"yourUserName", "password":"yourPassword"}}}' \
              -H "Content-Type: application/json" | python -m json.tool


   **Example: Authenticate with username and API key: JSON request**

   .. code::  

       $ curl -s https://identity.api.rackspacecloud.com/v2.0/tokens -X 'POST' \
              -d '{"auth":{"RAX-KSKEY:apiKeyCredentials":{"username":"yourUserName", "apiKey":"yourApiKey"}}}' \
              -H "Content-Type: application/json" | python -m json.tool


.. tip::
   For information about the json.tool, see `More about
   json.tool <curl.html#json_tool>`__.

   In response to valid credentials, your request returns an
   authentication token and a service catalog with the endpoints that
   you need to request services.


.. note::

   If you authenticated with username and password credentials, and the
   Identity service returns a 401 message requesting additional
   credentials, your account is configured for multi-factor
   authentication. To complete the authentication process, `submit a
   second POST tokens request with multi-factor authentication
   credentials <http://docs.rackspace.com/auth/api/v2.0/auth-client-devguide/content/proc_mfa_auth.html>`__.

   Do not include explicit API endpoints in your scripts and
   applications. Instead, find the endpoint for your service and region.

   The following output shows a partial authentication response in JSON
   format:

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

   | 

   Successful authentication returns the following information:

   +--------------------------------------+--------------------------------------+
   | |1|                                  | **Endpoints to request Rackspace     |
   |                                      | Cloud services**. Appears in the     |
   |                                      | ``endpoints`` element in the         |
   |                                      | ``serviceCatalog`` element.          |
   |                                      |                                      |
   |                                      | Endpoint information includes the    |
   |                                      | public URL (which is the endpoint    |
   |                                      | that you use to access the service), |
   |                                      | region, tenant ID, and version       |
   |                                      | information.                         |
   +--------------------------------------+--------------------------------------+
   | |2|                                  | **Tenant ID**. Appears in the        |
   |                                      | ``tenantId`` field in the            |
   |                                      | ``endpoints`` element. Also known as |
   |                                      | the account number.                  |
   |                                      |                                      |
   |                                      | You include the tenant ID in the     |
   |                                      | endpoint URL when you call a         |
   |                                      | Rackspace Cloud service.             |
   +--------------------------------------+--------------------------------------+
   | |3|                                  | **The name of the service**. Appears |
   |                                      | in the ``name`` field.               |
   |                                      |                                      |
   |                                      | To access the next generation Cloud  |
   |                                      | Servers service, locate and use the  |
   |                                      | ``publicURL`` value for the          |
   |                                      | ``cloudServersOpenStack`` service.   |
   |                                      |                                      |
   |                                      | A service might show multiple        |
   |                                      | endpoints to enable regional         |
   |                                      | choice. Select the appropriate       |
   |                                      | endpoint for the region that you     |
   |                                      | want to interact with by examining   |
   |                                      | the ``region`` field.                |
   +--------------------------------------+--------------------------------------+
   | |4|                                  | **Expiration date and time for       |
   |                                      | authentication token**. Appears in   |
   |                                      | the ``expires`` field in the         |
   |                                      | ``token`` element.                   |
   |                                      |                                      |
   |                                      | The authentication token expires     |
   |                                      | after this date and time, unless it  |
   |                                      | is revoked earlier. After the token  |
   |                                      | expires or is revoked, you must      |
   |                                      | generate a new token if you want to  |
   |                                      | continue accessing Rackspace Cloud   |
   |                                      | services.                            |
   |                                      |                                      |
   |                                      | This field predicts the maximum      |
   |                                      | lifespan for a token, but does not   |
   |                                      | guarantee that the token reaches     |
   |                                      | that lifespan. Clients are           |
   |                                      | encouraged to cache a token until it |
   |                                      | expires.                             |
   +--------------------------------------+--------------------------------------+
   | |5|                                  | **Authentication token**. Appears in |
   |                                      | the ``id`` field in the ``token``    |
   |                                      | element.                             |
   |                                      |                                      |
   |                                      | You pass the authentication token in |
   |                                      | the ``X-Auth-Token`` header each     |
   |                                      | time that you send a request to a    |
   |                                      | service.                             |
   +--------------------------------------+--------------------------------------+

#. Copy the values in the ``publicURL`` and ``tenantId`` fields for the
   ``cloudServersOpenStack`` service for your region.

   Copy the authentication token from the ``id`` field in the ``token``
   element.

   As a next step, you can set environment variables to these values.

**Next step: Choose one of the following steps:**

-  `Export environment variables to run cURL commands
   (optional) <export_env_vars.html>`__

-  `Create your first cloud network <create_first_net.html>`__
