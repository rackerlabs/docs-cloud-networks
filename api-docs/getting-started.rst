.. _getting-started:

======================
**Getting Started**
======================

Use this Getting Started Guide to learn how to authenticate, send API requests, 
and complete basic operations by using the |apiservice|.

This section provides neutron client (or nova client) and cURL examples of common |service| 
service operations.

For each exercise, choose one of the following methods to make Cloud Networks API calls:

-  **cURL commands**: With cURL, you send HTTP requests with embedded API calls from the 
   command line. The cURL examples in this guide show request and response bodies that are 
   in JSON format. 
   
   For more information, see :ref:`How cURL commands work <how-curl-commands-work>`.
   
-  **Browser plugin or RST client**.  If you are running API commands directly, using a 
   plugin or RST client, follow the instructions for using that tool. Usually, you will 
   format your request body, if needed, similarly to a cURL command.

-  **The neutron client**. We recommend that you use the neutron client to run simple 
   commands that make neutron API calls. This open-source Python client runs on Linux or 
   Mac OS X systems and is easy to learn and use. You can specify ``--debug`` as the first 
   parameter on any neutron command to show the underlying API request for the command. 
   This is a good way to become familiar with API requests. For example: neutron --debug 
   net-list.

-  **The nova client** Use the nova client to run simple Nova-Network API commands such as 
   those required to boot servers and to attach and detach networks.

You can use cURL in one example and switch to a client in the next example, so you are
not locked into to one method. 

For more information about |service| concepts and API operations, see the 
:ref:`Developer Guide<developer-guide>` and the :ref:`API Reference<api-reference>`. 
   
