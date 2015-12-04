.. _send-requests-ovw:

=====================
Sending API requests
=====================

The |apiservice| supports JSON data serialization request and response format.

You have several options for sending requests through an API:

- Developers and testers might prefer to use cURL with the command-line tool from
  http://curl.haxx.se/. For more information about using cURL, see 
  :ref:`How cURL commands work <how-curl-commands-work>`.
  
- Service clients, like nova or neutron, allow you to submit API requests 
  using those interfaces.  For more information see 
  :ref:`How the neutron client works <neutron-client>` and 
  :ref:`How the nova client works <nova-client>`. To install neutron, see 
  :ref:`Install the neutron client <install-neutron>`.  To install nova, see
  :ref:`Install the nova client <install-nova>`

- If you are developing applications or automation, try using 
  :rax-dev:`Rackspace SDKs<sdks>`, :rax-devdocs:`Rackspace CLI<rack-cli/>`, 
  or :os-wiki:`OpenStack client applications <wiki/OpenStackClients>`.
        
- If you like to use a more graphical interface, the REST client for Mozilla Firefox also
  works well for testing and trying out commands. See
  https://addons.mozilla.org/en-US/firefox/addon/restclient/.

  Other browser plug-ins are available for the browser of your choice.

- You can also download and install RESTclient, a Java application for testing ReSTful web
  services, from http://code.google.com/p/rest-client/<http://code.google.com/p/rest-client/.

When submitting a request using cURL, browser plugins, or RESTclient, you specify your 
authentication token in the ``X-Auth-Token`` header. The syntax for the ``X-Auth-Token`` 
header is (where you substitute your token for the one shown):

.. code::

   X-Auth-Token: 89b24a6ef19a4576b2b422b7416a0578

The request format in the ``Content-Type`` header in the request. This header is required 
for operations that have a request body. The syntax for the ``Content-Type`` header for a 
json request is:

.. code::

   Content-Type: application/json


You specify the response format by using one of the following methods:

-  ``Accept`` header. The default format is ``json``.  To specify a different format, 
   replace "json", in the following example, with a supported format. The syntax for the 
   ``Accept`` header for a json response is:

.. code::

   Accept: application/json

   

