.. _request-using-client:

Install CLI clients and |product name| Virtual Interface extension
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The nova client is an open-source Python client provides access to all public
|apiservice| methods. You can use the nova client to perform the following
operations:

#. Boot a server with isolated networks and ports.

#. Attach and detach networks from servers (if the Cloud Networks
   extension is installed).

The neutron client is an open-source Python client provides access to all
public |apiservice| methods.

To send requests using either client, you have to install the client and set
environment variables.


**Prerequisites for both clients**

- Linux or Mac OS X
- Python 2.6 or later
- **setuptools** package, installed by default on Mac OS X
- **pip** package
- Rackspace Cloud account and access to |service|

+--------------------+--------------------------------------------------------+
| Prerequisite       | Description                                            |
+====================+========================================================+
| Python 2.6 or      | Currently, the nova client does not support Python 3.  |
| later              |                                                        |
+--------------------+--------------------------------------------------------+
| **setuptools**     | Installed by default on Mac OS X.                      |
| package            |                                                        |
|                    | Many Linux distributions provide packages to make      |
|                    | **setuptools** easy to install.                        |
|                    |                                                        |
|                    | Search your package manager for **setuptools** to find |
|                    | an installation package. If you cannot find one,       |
|                    | download the **setuptools** package directly from      |
|                    | http://pypi.python.org/pypi/setuptools.                |
+--------------------+--------------------------------------------------------+
| **pip** package    | To install the nova client on a Mac OS X or Linux      |
|                    | system, use **pip** because it is easy and ensures     |
|                    | that you get the latest version of the nova client     |
|                    | from the Python Package Index at                       |
|                    | http://pypi.python.org/pypi/python-novaclient/>.       |
|                    | Also, it lets you update the package later on.         |
|                    |                                                        |
|                    | Install **pip** through the package manager for your   |
|                    | system:                                                |
|                    |                                                        |
|                    | -  Mac OS X                                            |
|                    |                                                        |
|                    |    .. code::                                           |
|                    |                                                        |
|                    |        $ sudo easy_install pip                         |
|                    |                                                        |
|                    | -  Ubuntu                                              |
|                    |                                                        |
|                    |    .. code::                                           |
|                    |                                                        |
|                    |        $ aptitude install python-pip                   |
|                    |                                                        |
|                    | -  Debian                                              |
|                    |                                                        |
|                    |    .. code::                                           |
|                    |                                                        |
|                    |        $ aptitude install python-pip                   |
|                    |                                                        |
|                    | -  Fedora                                              |
|                    |                                                        |
|                    |    .. code::                                           |
|                    |                                                        |
|                    |        $ yum install python-pip                        |
|                    |                                                        |
|                    | -  CentOS, or RHEL (from EPEL or another 3rd party     |
|                    |    repository)                                         |
|                    |                                                        |
|                    |    .. code::                                           |
|                    |                                                        |
|                    |        $ yum install python-pip                        |
|                    |                                                        |
+--------------------+--------------------------------------------------------+

.. _install-nova-client:

Install the nova client
-----------------------

To install the nova client, perform the following steps.

1. Run the following commands on a Mac OS X or Linux distribution to install
   the OpenStack and designate clients:

   .. code::

      $ sudo pip install rackspace-novaclient

  .. note::

     If you previously installed the rackspace-novaclient package, run the
     following command to upgrade it:

     .. code::

        $ sudo pip install --upgrade rackspace-novaclient

2. Export the following environment variables manually, or update your
   ``.bash_profile`` or ``.bashrc`` files with these variables:

  .. code::

     export OS_AUTH_URL=https://identity.api.rackspacecloud.com/v2.0/
     export OS_AUTH_SYSTEM=rackspace
     export OS_USERNAME=yourUserName
     export OS_TENANT_ID=yourTenantId
     export OS_REGION_NAME=yourRegionName
     export OS_PASSWORD=yourAPIKey

  The following table describes the environment variables:

.. list-table:: **Environment variables**
   :widths: 22 56
   :header-rows: 1

   * - Environment variable
     - Description
   * - OS_AUTH_URL
     - The endpoint for the Rackspace Cloud Identity service, which the nova
       client uses for authentication.
   * - OS_AUTH_SYSTEM
     - The authentication system required to get your credentials.
   * - OS_USERNAME
     - Your Rackspace Cloud user name.
   * - OS_TENANT_ID
     - Your Rackspace Cloud tenant ID (account number)
   * - OS_REGION_NAME
     - The regional endpoint (for example, DFW) where you want to deploy the
       Cloud Servers resources. For details, see :ref:`service-access`.
   * - OS_PASSWORD
     - Your Rackspace API key.

If you upgrade the operating system of the desktop or remote machine where you
installed nova, you may need to reinstall nova to ensure correct operation.

If you have trouble using pip to install the nova client, you can download a
nova client installation package from the python package repository at
http://pypi.python.org/pypi/rackspace-novaclient/, use ``python-pip`` or
``yum`` commands instead of ``pip``.

Run the help command to ensure that the client has installed correctly and to
review information about using the client.

.. code::

   $ nova help

To get help for a specific command, type the command name after the ``help``
parameter, as follows:

.. code::

   $ nova help <command_name>

You cannot use every command that is listed. The nova client was written for
use with recent development versions of OpenStack, so it includes support for
some features that are not available in the Rackspace Cloud. For a complete
list of Openstack commands, see the
:os-docs:`OpenStack Compute command-line client reference
<cli-reference/content/novaclient_commands.html>`.

.. _install-neutron-client:

Install the neutron client
--------------------------

To install the neutron client for Ubuntu, Debian, or Mac OS X, run the
following command:

.. code::

     $ sudo pip install rackspace-neutronclient

To install the neutron client for RHEL, CentOS, or Fedora, run the following
command:

.. code::

     $ sudo python-pip install rackspace-neutronclient

.. note::

   If you previously installed the rackspace-novaclient package, run the
   following command to upgrade it:

	For Ubuntu, Debian, or Mac OS X:

   .. code::

        $ pip install --upgrade rackspace-neutronclient

   For RHEL, CentOS, or Fedora:

   .. code::

        $ python-pip install --upgrade rackspace-neutronclient

You can specify a debug parameter on any neutron command to show the underlying
API request for the command. This is a good way to become familiar with the API
requests.

.. _install-virtual-int-ext:

Install the Cloud Networks Virtual Interface extension
------------------------------------------------------

To attach networks to existing servers, rather than just at boot time, you need
to install the Virtual Interface extension by using the following command:

.. code::

   $ sudo pip install os_virtual_interfacesv2_python_novaclient_ext

.. note::

   If you previously installed this package, run the following command to
   upgrade it:

   .. code::

      $ sudo pip install os_virtual_interfacesv2_python_novaclient_ext --upgrade


