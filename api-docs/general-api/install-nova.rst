.. _install-nova:

=========================================================
Install the nova client with the Cloud Networks extension 
=========================================================

The |apiservice| doesn’t currently offer a way to authenticate or to attach networks to, 
and detach networks from, a server. If you want to attach and detach networks by using 
the nova client, you must use the Cloud Networks virtual interface extension by installing 
the ``os_virtual_interfacesv2_python_novaclient_ext`` package.

.. note:: 

   The python-novaclient is developed and maintained by the OpenStack community. Although 
   we do not directly support python-novaclient, you can post in the comments below if you 
   run into any difficulties.

For help installing the nova client and Cloud Networks extension, see
`Install the nova Client with the Cloud Networks Extension <http://docs.rackspace.com/servers/api/v2/cs-gettingstarted/content/section_gs_install_nova.html>`__
in the *Next Generation Cloud Servers Getting Started Guide*.
