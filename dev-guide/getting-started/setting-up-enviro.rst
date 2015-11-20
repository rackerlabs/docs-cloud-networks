.. _setting-up-enviro:

=======================================
Set up the environment and authenticate
=======================================

To follow the examples in this guide, you can use cURL, neutron, or, in
some cases, nova commands. If you plan to use the nova or neutron
clients, install them, and then get your authentication token. If you
plan to use cURL commands, get your authentication token and then export
your environment variables.

.. note::
   You can use any combination of methods to run the commands in this
   guide, switching back and forth if you like. You are not locked into one
   method just because you started with it. All methods are available with
   cURL. Some methods are not available in the nova or neutron clients.

Regardless of which method you choose to make API calls, you must get an
authentication token.

Install the nova client with the Cloud Networks extension (optional)
--------------------------------------------------------------------

The Rackspace Neutron API doesn’t currently offer a way to authenticate
or to attach networks to, and detach networks from, a server. If you
want to attach and detach networks by using the nova client, you must
use the Cloud Networks virtual interface extension by installing the
``os_virtual_interfacesv2_python_novaclient_ext`` package.

.. note::
   The python-novaclient is developed and maintained by the OpenStack
   community. Although we do not directly support python-novaclient, you
   can post in the forums if you run into any difficulties.

For help installing the nova client and Cloud Networks extension, see
`Install the nova Client with the Cloud Networks
Extension <http://docs.rackspace.com/servers/api/v2/cs-gettingstarted/content/section_gs_install_nova.html>`__
in the *Next Generation Cloud Servers Getting Started Guide*.

**Next step:** `Get the authentication token <net-auth>`__

.. toctree::
   :maxdepth: 2

`Install the neutron client (optional) <ch04s02.xhtml>`__
`Get the authentication token <ch04s03.xhtml>`__
`Authenticate with the nova client <ch04s03.xhtml#nova_auth>`__
`Authenticate with cURL <ch04s03.xhtml#curl_auth>`__
`Export environment variables to run cURL commands
(optional) <export-environment-variables>`
