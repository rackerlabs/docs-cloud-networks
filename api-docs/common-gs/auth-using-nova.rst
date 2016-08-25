.. _auth-nova:

Authenticate by using the nova client
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the following steps to authenticate by using the nova client to get the
authentication token and the service catalog:

#. Get an authentication token:

   .. code::

       $ nova credentials

   Successful authentication returns user credentials, including ID, name,
   roles, and the authentication token. The token appears in the ``id`` field
   in the ``Token`` box as shown in the following example.

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

   After you generate a token, the nova client automatically injects the token
   into any nova client commands that you issue.

   However, because the token expires after 24 hours, you must generate a new
   token once a day.

#. Get the service catalog with a list of endpoints:

   .. code::

       $ nova endpoints

   For each service, the response includes the public URL (which is the
   endpoint, including your tenant ID, that you use to access the service), the
   region, the service name, the tenant ID, the version ID, and the endpoints
   that you can use to get version information for the API.

   To access the Cloud Networks or next generation Cloud Servers service, use
   the ``publicURL`` value for the ``cloudServersOpenStack`` service.

   The following example shows the information returned for the DFW region for
   the Cloud Servers service:

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

   The ``cloudServersOpenStack`` service might show multiple endpoints to
   enable regional choice. Select the appropriate endpoint for the region that
   you want to interact with by examining the ``region`` field.

#. Copy the values in the ``publicURL`` and ``tenantId`` fields for the
   ``cloudServersOpenStack`` service for your region.

