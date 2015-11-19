.. _learning-examples:

===========================================
Learn how to use the examples in this guide
===========================================

For each exercise in this guide, you choose one of the following methods
to make Cloud Networks API calls:

-  **The neutron client**. We recommend that you use the neutron client
   to run simple commands that make neutron API calls. This open-source
   Python client runs on Linux or Mac OS X systems and is easy to learn
   and use. You can specify ``--debug`` as the first parameter on any
   neutron command to show the underlying API request for the command.
   This is a good way to become familiar with API requests. For example:
   neutron --debug net-list.

   For more information, see "ref:`How the neutron client
   works <neutron-client>`.

-  **The `nova
   client <http://www.rackspace.com/knowledge_center/article/using-python-novaclient-with-the-rackspace-cloud>`__**:
   Use the nova client to run simple Nova-Network API commands such as
   those required to boot servers and to attach and detach networks.

   For more information, see :ref:`How the nova client
   works <how-the-nova-client-works>`.

-  **`cURL <http://curl.haxx.se/>`__ commands**: With cURL, you send
   HTTP requests with embedded API calls from the command line. The cURL
   examples in this guide show request and response bodies that are in
   JSON format. See :ref:`How cURL commands work <how-curl-commands-work>`.

You can use cURL in one example and switch to a client in the next
example. If you choose to use a cURL command for any example, you must
export the environment variables required to run the cURL examples. See
`Export environment variables to run cURL commands
(optional) <export-env-vars>`__.

.. _neutron-client::

How the neutron client works
----------------------------

The neutron client is an open-source Python client that you use to run
commands to make API calls. Each client command runs cURL commands that
embed API requests. The client runs from a desktop computer or remote
system, such as a cloud server.

To install and configure the neutron client on a Linux distribution or
on Mac OS X, see `Install the neutron client
(optional) <install-neutron>`__.

To export environment variables (see `Export environment variables to
run cURL commands (optional) <export-env-vars>`__.

.. note::
   You can specify ``--debug`` as the first parameter on any neutron
   command to show the underlying API request for the command. This is a
   good way to become familiar with API requests. For example: ``neutron
   --debug net-list``.

.. warning::
   If you upgrade the operating system of the desktop or remote machine
   where you installed the client, you may need to reinstall the neutron
   client.

.. toctree::
   :maxdepth: 2

    How the nova client works <learning-examples/how-the-nova-client-works>
    How cURL commands work <learning-examples/how-curl-commands-work>
