.. _authentication-ovw:

Get the authentication token
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To authenticate access to Rackspace Cloud services, you issue an authentication request to 
the Rackspace Cloud Identity service, which is an implementation of the OpenStack Keystone 
Identity Service v2.0.

Authenticate by using the following endpoint::

    https://identity.api.rackspacecloud.com/v2.0

In response to valid credentials, an authentication request to the Rackspace Cloud Identity 
service returns an authentication token and a service catalog that contains a list of all 
services and endpoints available for this token. Because the authentication token expires 
after 24 hours, you must generate a new token once a day.

For details see the following information:

- :ref:`Authenticate to the Rackspace Cloud<authenticate-to-cloud>`
- :rax-devdocs:`Rackspace Cloud Identity API developer documentation
  <cloud-identity/v2/developer-guide/>`

Once you have an authentication token, see 
:ref:`Export environment variables<export-environment-variables>` if you plan to copy and 
paste the cURL examples in this guide.
