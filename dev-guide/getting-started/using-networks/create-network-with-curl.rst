.. _create-network-with-curl:

========================
Create network with cURL
========================

These sections walk you through creating your network and subnet and
then listing them by using cURL.

Create a network (cURL)
~~~~~~~~~~~~~~~~~~~~~~~

After you create a network, copy its network ID. You use this ID to
create a subnet or attach the network to a server.

The Cloud Networks API supports only JSON formatting. XML is not
supported.

#. Issue the following cURL command, substituting your own values for
   the ones shown:

   .. code::

      $ curl -s https://dfw.networks.api.rackspacecloud.com/v2.0/networks \
              -X POST \
              -H "Content-Type: application/json" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $token" \
              -d '{"network": {"name": "amp"}}' | python -m json.tool

   In this cURL command, you specify several options. For information
   about the options, see `cURL command-line
   options <curl.html#curl_options>`__.

   The operation returns the response body, as shown in the following
   example:

   .. code::

       {
          "network":{
             "status":"ACTIVE",
             "subnets":[
             ],
             "name":"amp",
             "admin_state_up":true,
             "tenant_id":"53501b3c25d34f8ea293c03298caed60",
             "shared":false,
             "id":"29f52c7e-6efd-4335-a14a-db77d32a2555",
          }
       }

#. Copy the ``id`` value from the output. You will use this value when
   you create a subnet, provision your server, or perform other related
   activities. In this example, the ID is
   ``29f52c7e-6efd-4335-a14a-db77d32a2555``, but use the ID from your
   response.

**Next step:** \ `Create a subnet
(cURL) <neutron_create_subnet_curl.html>`__

Create a subnet (cURL)
~~~~~~~~~~~~~~~~~~~~~~

To create a subnet, you specify a network ID (using the ID that you
copied in the preceding step), an IP address, and a name for your
subnet. After you create a subnet, copy its ID for future reference.

#. Issue the following cURL command, substituting your own values for
   the ones shown:

   .. code::

      $ curl -s https://dfw.networks.api.rackspacecloud.com/v2.0/subnets \
              -X POST \
              -H "Content-Type: application/json" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $token" \
              -d '{"subnet":{"name":"Subamp","cidr":"120.1.2.0/24","ip_version":4,"network_id":"29f52c7e-6efd-4335-a14a-db77d32a2555"}}' \
              | python -m json.tool

   In this cURL command, you specify several options. For information
   about the options, see `cURL command-line
   options <curl.html#curl_options>`__.

   The operation returns the response body, as shown in the following
   example:

   .. code::

       {
          "subnet":
             {
               "cidr":"120.1.2.0/24",
               "ip_version":4,
               "network_id":"29f52c7e-6efd-4335-a14a-db77d32a2555",
               "allocation_pools":[
               {
                   "end":"120.1.2.254",
                   "start":"120.1.2.1"
               },
               "dns_nameservers":[
               ],
               "host_routes":[
               ],
               "enable_dhcp":false,
               "gateway_ip":null,
               "id":"23e3059e-4f39-4f7f-8cf2-c326e5de6c37",
               "name":"Subamp",
               "tenant_id":"53501b3c25d34f8ea293c03298caed60"
            }
       }

#. Copy the ``id`` value from the output for future reference. In this
   example, the ID is ``23e3059e-4f39-4f7f-8cf2-c326e5de6c37``, but use
   the ID from your response.

**Next step:** \ `List networks
(cURL) <neutron_list_networks_curl.html>`__

List networks (cURL)
~~~~~~~~~~~~~~~~~~~~

The following step shows you how to list networks using cURL.

-  Issue the following cURL command:

   .. code::

      $ curl https://dfw.networks.api.rackspacecloud.com/v2.0/networks \
        -X GET -H "X-Auth-Token: $token" | python -m json.tool

   The operation returns the response body as shown in the following
   example:

   .. code::

       {
          "networks":[
             {
                "status":"ACTIVE",
                "subnets":[
                  "23e3059e-4f39-4f7f-8cf2-c326e5de6c37 120.1.2.0/24"
                 ],
                 "name":"amp",
                 "admin_state_up":true,
                 "tenant_id":"53501b3c25d34f8ea293c03298caed60",
                 "shared":true,
                 "id":"29f52c7e-6efd-4335-a14a-db77d32a2555",
             }
          ]
       }

**Next step:** `List subnets (cURL) <neutron_list_subnets_curl.html>`__

List subnets (cURL)
~~~~~~~~~~~~~~~~~~~

The following step shows you how to list subnets using cURL.

-  Issue the following cURL command:

   .. code::

      $ curl https://dfw.networks.api.rackspacecloud.com/v2.0/subnets \
              -X GET -H "X-Auth-Token: $token" | python -m json.tool

   The operation returns the response body as shown in the following
   example:

   .. code::

       {
          "subnet":
             {
               "allocation_pools":[
                  {
                     "end":"120.1.2.254",
                     "start":"120.1.2.1"
                  }
               ],
              "cidr":"120.1.2.0/24",
              "dns_nameservers":[
               ],
               "enable_dhcp":false,
               "gateway_ip":"null",
               "host_routes":[
               ],
               "id":"23e3059e-4f39-4f7f-8cf2-c326e5de6c37",
               "ip_version":4,    
              "name":"Subamp",
               "network_id":"29f52c7e-6efd-4335-a14a-db77d32a2555",
               "tenant_id":"53501b3c25d34f8ea293c03298caed60"
             }
       }

**Next topic:** \ `Boot a new server with your cloud
network <boot_new_server.html>`__

