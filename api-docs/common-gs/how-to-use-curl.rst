.. _how-curl-commands-work:

cURL is a command-line tool that you can use to interact with REST interfaces. cURL lets
you transmit and receive HTTP requests and responses from the command line or a shell
script, which enables you to work with the API directly. cURL is available for Linux
distributions, Mac OS® X, and Microsoft Windows®. For information about cURL, see
`http://curl.haxx.se/ <http://curl.haxx.se/>`__.

To run the cURL request examples shown in this guide on Mac OS® X or another
Linux-based operating system, copy each example directly to the command line or a script.

.. note::

   If you are using Microsoft Windows, you need to adjust the cURL examples to run them. See
   :ref:`Convert cURL examples to run on Windows <convert-cURL-examples-for-windows>`.


.. _auth-curl-json:

The following example shows a cURL command for sending an authentication request to
the Rackspace Cloud Identity service.

**Example: cURL command for sending a JSON request**

.. include:: ../common-gs/samples/auth-req-curl.rst

In this example, ``$apiKey`` is an environment variable that stores your API key value.
Environment variables make it easier to reference account information in API requests,
to reuse the same cURL commands with different credentials, and to keep sensitive
information like your API key from being exposed when you send requests to Rackspace
Cloud API services. For details about creating environment variables, see :ref:`Configure
environment variables <configure-environment-variables>`.

..  note::

    The carriage returns in the cURL request examples use a backslash (``\``) as an
    escape character. The escape character allows continuation of the command across
    multiple lines.


The cURL examples in this guide use the following command-line options.

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Option
     - Description
   * - **-d**
     - Sends the specified data in a **POST** request to the HTTP server. Use
       this option to send a JSON request body to the server.
   * - **-H**
     - Specifies an extra HTTP header in the request. You can specify any
       number of extra headers. Precede each header with the ``-H`` option.

       Common headers in Rackspace API requests are as follows:

       - ``Content-Type``: Required for operations with a request body.

         Specifies the format of the request body. Following is the syntax
         for the header where format is ``json``:

         .. code::

                Content-Type: application/json

       - ``X-Auth-Token``: Required. Specifies the authentication
         token.


       - ``X-Auth-Project-Id``: Optional. Specifies the project ID,
         which can be your account number or another value.


       - ``Accept``: Optional. Specifies the format of the response
         body.

         Following is the syntax for the header where the format is
         ``json``, which is the default:

         .. code::

              Accept: application/json

   * - **-i**
     - Includes the HTTP header in the output.

   * - **-s**
     - Specifies silent or quiet mode, which makes cURL mute. No progress or
       error messages are shown.

       If your cURL command is not generating any output, try replacing the
       ``-s`` option with ``-i``.

   * - **-T**
     - Transfers the specified local file to the remote URL.
   * - **-X**
     - Specifies the request method to use when communicating with the HTTP
       server. The specified method is used instead of the default method,
       which is **GET**.

For commands that return a response, use json.tool to pretty-print the output by
appending the following command to the cURL call:

.. code::

   | python -m json.tool

To use json.tool, import the JSON module. For information about json.tool, see
`JSON encoder and decoder`_.


If you run a Python version earlier than 2.6, import the simplejson module and use
simplejson.tool. For information about simplejson.tool, see
`simplejson encoder and decoder`_.

If you do not want to pretty-print JSON output, omit this code.

.. note::

   If your request includes the ``-i`` option to show header output, do not try to pretty-print the output. Header information is not in JSON format, and the API service returns an error if you specify json.tool.

.. _json encoder and decoder: http://docs.python.org/2/library/json.html
.. _simplejson encoder and decoder: http://simplejson.googlecode.com/svn/tags/simplejson-2.0.9/docs/index.html

.. _json.tool: http://docs.python.org/2/library/json.html
.. _simplejson.tool: http://simplejson.googlecode.com/svn/tags/simplejson-2.0.9/docs/index.html


.. _convert-cURL-examples-for-windows:

Convert cURL examples to run on Windows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The cURL examples in the Rackspace API documentation use syntax supported
on Mac OS® X, Linux and UNIX systems. Microsoft Windows does not support
the same format. However, you can run the examples after making the following changes:

- Replace all the line continuation backslash characters (``\``) with a caret (``^``), and remove any trailing spaces after
  the ``^``.

- If an example includes JSON data, export the data to a text file. When you run the cURL command, use the ``@filename`` syntax to import the JSON data. Save the JSON data files in a directory, and run cURL commands from that directory.

The following example shows the format for Linux and UNIX systems:

.. code::

      $ curl https://identity.api.rackspacecloud.com/v2.0/tokens  \
            -X POST \
            -d '{"auth":{"RAX-KSKEY:apiKeyCredentials":{"username":"yourUserName","apiKey":"$apiKey"}}}' \
            -H "Content-type: application/json"

The following example shows the same request with the changes made for Windows systems:

.. code::

     $ curl https://identity.api.rackspacecloud.com/v2.0/tokens  ^
           -X POST ^
           -d @credentials.txt  ^
           -H "Content-type: application/json"
