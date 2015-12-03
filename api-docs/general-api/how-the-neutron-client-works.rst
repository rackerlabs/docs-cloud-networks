.. _neutron-client:

============================
How the neutron client works
============================

The neutron client is an open-source Python client that you use to run commands to make 
API calls. Each client command runs cURL commands that embed API requests. The client runs 
from a desktop computer or remote system, such as a cloud server.

To install and configure the neutron client on a Linux distribution or
on Mac OS X, see :ref:`Install the neutron client <install-neutron>`.


.. note::
   You can specify ``--debug`` as the first parameter on any neutron command to show the 
   underlying API request for the command. This is a good way to become familiar with API 
   requests. For example: ``neutron --debug net-list``.

.. warning::
   If you upgrade the operating system of the desktop or remote machine where you installed 
   the client, you may need to reinstall the neutron client.
