.. _export-environment-variables:

=================================================
Export environment variables to run cURL commands
=================================================

To run the cURL command examples in this guide, follow this procedure to
export values to environment variables.

Export your tenant ID and authentication token to environment variables.
All cURL examples in this guide use these environment variables.

#. Export your tenant ID to the ``account`` environment variable:

   .. code::  

       $ export account="tenantId"

   *``tenantId``* is the value in the ``tenantId`` field in the
   authentication response.

#. Export your authentication token to the ``token`` environment variable:

   .. code::  

       $ export token="id"

   *``id``* is the value in the ``id`` field in the ``token`` field in
   the authentication response.

