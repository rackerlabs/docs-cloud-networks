.. _req-resp-types:

==========================
Request and response types
==========================

The |apiservice| supports JSON data serialization format.

The request format is specified by using the ``Content-Type`` header and is
required for operations that have a request body.

The syntax for the ``Content-Type`` header is:

.. code::

    Content-Type: application/json

The response format can be specified in requests either by using the ``Accept``
header or adding a ``.json`` extension to the request URI. A response  can be
serialized using a format that is different from the request. If no response
format is specified, JSON is the default. If conflicting formats are specified
by using both an ``Accept`` header and a query extension, the query extension
takes precedence.

You specify a json response format by using one of the following methods:

-  ``Accept`` header. The syntax for the ``Accept`` header is::

       Accept: application/json

-  Query extension. Add the ``.json`` extension to the  request URI. For
   example, the ``.json`` extension in the following URI request specifies that
   the response body is returned in JSON format.

   .. code::

      POST /v2/010101/servers.json

If you do not specify a response format, JSON is the default.


