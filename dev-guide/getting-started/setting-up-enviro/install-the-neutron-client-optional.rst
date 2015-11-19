.. _install-the-neutron-client-optional:

=====================================
Install the neutron client (optional)
=====================================

Follow the necessary steps to install the neutron client

To manage your network from the command line, you can use the
open-source neutron client application called
``rackspace-python-neutronclient``.

Before you install the neutron client, install the following software:

**Table: Neutron client prerequisite software**

+--------------------+--------------------------------------------------------+
| Prerequisite       | Description                                            |
+====================+========================================================+
| Python 2.6 or      | Currently, the neutron client does not support Python  |
| later              | 3.                                                     |
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
| **pip** package    | To install the neutron client on a Mac OS X or Linux   |
|                    | system, use **pip** because it is easy and ensures     |
|                    | that you get the latest version of the neutron client  |
|                    | from the `Python Package                               |
|                    | Index <http://pypi.python.org/pypi/python-neutronclien |
|                    | t/>`__.                                                |
|                    | Also, it lets you update the package later on.         |
|                    |                                                        |
|                    | Install **pip** through the package manager for your   |
|                    | system:                                                |
|                    |                                                        |
|                    |                                                        |
|                    |                                                        |
|                    | -  Mac OS X                                            |
|                    |                                                        |
|                    |    .. code::                              |
|                    |                                                        |
|                    |                                                    $ s |
|                    | udo easy_install pip                                   |
|                    |                                                        |
|                    | -  Ubuntu                                              |
|                    |                                                        |
|                    |    .. code::                              |
|                    |                                                        |
|                    |                                                    $ a |
|                    | ptitude install python-pip                             |
|                    |                                                        |
|                    | -  Debian                                              |
|                    |                                                        |
|                    |    .. code::                              |
|                    |                                                        |
|                    |                                                    $ a |
|                    | ptitude install python-pip                             |
|                    |                                                        |
|                    | -  Fedora                                              |
|                    |                                                        |
|                    |    .. code::                              |
|                    |                                                        |
|                    |                                                    $ y |
|                    | um install python-pip                                  |
|                    |                                                        |
|                    | -  CentOS, or RHEL (from EPEL or another 3rd party     |
|                    |    repository)                                         |
|                    |                                                        |
|                    |    .. code::                              |
|                    |                                                        |
|                    |                                                    $ y |
|                    | um install python-pip                                  |
|                    |                                                        |
|                    |                                                        |
|                    |                                                        |
                                                                             
+--------------------+--------------------------------------------------------+
| Nova client        | Before you can use the neutron client commands, you    |
|                    | must have an authentication token. Since the neutron   |
|                    | client doesn't provide authentication, install the     |
|                    | nova client. See `Install the nova Client with the     |
|                    | Cloud Networks                                         |
|                    | Extension <http://docs.rackspace.com/servers/api/v2/cs |
|                    | -gettingstarted/content/section_gs_install_nova.html>` |
|                    | __                                                     |
|                    | in the *Next Generation Cloud Servers Getting Started  |
|                    | Guide*.                                                |
+--------------------+--------------------------------------------------------+

| 

**Procedure: To install the neutron client:**

#. **Install or update the neutron client package**

   Run the following command for your operating system to install the
   ``rackspace-python-neutronclient`` package, which includes the
   neutron client:

   For Ubuntu, Debian, or OS X:

   .. code::  

                       $ sudo pip install rackspace-neutronclient

   For RHEL, CentOS, or Fedora:

   .. code::  

                       $ sudo python-pip install rackspace-neutronclient

      style="margin-left: 0.5in; margin-right: 0.5in;">

.. note::
   If you previously installed the ``rackspace-python-neutronclient``
   package, run the following command for your operating system to
   upgrade it:

   For Ubuntu, Debian, or OS X:

   .. code::  

                               $ sudo pip install --upgrade rackspace-neutronclient

   For RHEL, CentOS, or Fedora:

   .. code::  

                               $ sudo python-pip install --upgrade rackspace-neutronclient

#. **Set environment variables**

   Edit your bash profile to add and set environment variables that
   enable the neutron client to connect to your Rackspace Cloud account.
   Use nano, or an editor of your choice, to edit your ``.bash_profile``
   file:

   .. code::  

       $ nano ~/.bash_profile 

   Add the following sets of lines to your bash profile and save the
   file. Substitute your username and tenant ID for the placeholders and
   modify the OS\_UAUTH\_URL if you use a different authentication
   endpoint.

   **Example: US Data Center Example**

   .. code::  

       export OS_AUTH_URL=https://identity.api.rackspacecloud.com/v2.0/
       export OS_EXECUTABLE=neutron 
       export OS_AUTH_SYSTEM=rackspace
       export OS_AUTH_STRATEGY=rackspace
       export OS_REGION_NAME=DFW
       export OS_USERNAME=<username>
       export OS_TENANT_NAME=<tenant_id>
       export OS_PROJECT_ID=<tenant_id>
       export OS_PASSWORD=<apikey>
       export OS_NO_CACHE=1

#. **Set permissions on the bash profile**

   Because the bash profile contains a password, set permissions on it
   so other people cannot read it:

   .. code::  

       $  chmod 600 ~/.bash_profile 

#. **Source the environment variables**

   To source the variables to make them available in your current shell,
   run the following command:

   .. code::  

       $ source ~/.bash_profile 

#. **Test the neutron client**

   To verify that you can talk to the API server, authenticate using
   nova client:

   .. code::  

       $ nova credentials

   Then, list networks, using the neutron client:

   .. code::  

       $ neutron net-list 

#. **Get help for neutron client commands**

   To get help for neutron client commands, run the following command:

   .. code::  

       $ neutron help 

   To get help for a specific command, type the command name after the
   *``help``* parameter, as follows:

   .. code::  

       $ neutron help <command_name> 

   You cannot use every command that is listed. The neutron client was
   written for use with recent development versions of OpenStack, so it
   includes support for some features that are not available in the
   Rackspace Cloud.

.. note::
   To show and become familiar with the underlying API v2 request for a
   command, specify the ``--debug`` parameter as the first parameter on
   any command. For example:

   .. code::  

      $ neutron --debug net-list

#. **Troubleshooting**

   The python-neutronclient is developed and maintained by the OpenStack
   community.

   -  If you cannot run commands successfully, make sure that you
      entered your user name, password, and account number correctly in
      the bash profile file.

   -  If you change any environment variables, either log out and back
      in or source your bash profile again.

   -  To override some environment variable settings, you can use the
      options that are listed at the end of the **neutron help** output.
      For example, you can override the ``OS_PASSWORD`` setting in the
      bash profile by specifying a password on a neutron command, as
      follows:

      .. code::  

       $ neutron --password <password> net-list

Where *``password``* is your Rackspace password.

   -  Having the upstream ``python-neutronclient`` installed at the same
      time as the ``rackspace-python-neutronclient`` may cause problems.

      If you are having trouble, try installing your neutron clients
      using the following instructions and then attempt to reinstall the
      neutron client as shown in the preceding step.

      .. code::  

      $ sudo pip uninstall -y python-neutronclient 

      .. code::  

      $ sudo pip uninstall -y rackspace-neutronclient 

      .. code::  

      $ sudo pip uninstall -y rackspace-auth-neutronclientext

   -  To show the underlying API request for any neutron client command,
      specify ``--debug`` as the first parameter on any neutron command.
      This is a good way to become familiar with API requests. For
      example: neutron --debug net-list.

   -  While Rackspace does not directly support python-neutronclient, if
      the above steps don't help, you can post a question in our forums.

**Next step:** `Get the authentication token <get-the-authentication-token>`__
