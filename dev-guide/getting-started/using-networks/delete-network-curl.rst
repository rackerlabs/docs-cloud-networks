.. _delete-network-curl:

=============================
Delete your network with cURL
=============================

These sections walk you through deleting your subnet and network by
using cURL.

Delete a subnet (cURL)
~~~~~~~~~~~~~~~~~~~~~~

To delete a subnet, specify the subnet ID.

-  Issue the following cURL command, substituting your own values for
   the ones shown:

   .. code::

      $ curl -i https://dfw.networks.api.rackspacecloud.com/v2.0/subnets/23e3059e-4f39-4f7f-8cf2-c326e5de6c37 \
              -X 'DELETE' \
              -H "X-Auth-Token: $token" \
              -H "X-Auth-Project-Id: $account" \
              -H "Accept: application/json" 

.. note::
   Include the ``-i`` option in the cURL command to show the response
   header. Omit the ``| python -m json.tool`` clause from the command
   because the API operation does not return a JSON response.

   **Argument:**

   -  *``id``*. The ID of the network that you want to delete. In this
      example, the network ID is
      ``29f52c7e-6efd-4335-a14a-db77d32a2555``.

   **Output:**

   Successful deletion returns an 202 Accepted response code:

   .. code::

       HTTP/1.1 204 No Content
       Date: Thu, 04 Oct 2012 16:23:30 GMT
       Content-Length: 58
       Content-Type: text/html;charset=UTF-8
       Server: Jetty(8.0.y.z-SNAPSHOT)

       202 Accepted

       The request is accepted for processing.

**Next step:** `Delete a network
(cURL) <neutron_delete_network_curl.html>`__

Delete a network (cURL)
~~~~~~~~~~~~~~~~~~~~~~~

To delete a network, specify the network ID.

-  Issue the following cURL command, substituting your own values for
   the ones shown:

   .. code::

      $ curl -i https://dfw.networks.api.rackspacecloud.com/v2.0/networks/29f52c7e-6efd-4335-a14a-db77d32a2555 \
              -X 'DELETE' \
              -H "X-Auth-Token: $token" \
              -H "X-Auth-Project-Id: $account" \
              -H "Accept: application/json" 

      style="margin-left: 0.5in; margin-right: 0.5in;">

.. note::
   Include the ``-i`` option in the cURL command to show the response
   header. Omit the ``| python -m json.tool`` clause from the command
   because the API operation does not return a JSON response.

   **Argument:**

   -  ``id``. The ID of the subnet that you want to delete. In this
      example, the subnet ID is
      ``23e3059e-4f39-4f7f-8cf2-c326e5de6c37``.

   **Output:**

   Successful deletion returns an 202 Accepted response code:

   .. code::

       HTTP/1.1 204 No Content
       Date: Thu, 04 Oct 2012 16:23:30 GMT
       Content-Length: 58
       Content-Type: text/html;charset=UTF-8
       Server: Jetty(8.0.y.z-SNAPSHOT)

       202 Accepted

       The request is accepted for processing.

**Next topic:** `Use allocation pools to control dynamic IP address
allocation <use_alloc_pools.html>`__

