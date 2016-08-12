.. _creating-network-with-curl:

Creating and listing network and subnet with cURL
-------------------------------------------------

These sections walk you through creating your network and subnet and then listing them by
using cURL.

.. _cn-creating-network-curl:

Creating a network (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

After you create a network, copy its network ID. You use this ID to create a subnet or
attach the network to a server.

The Cloud Networks API supports only JSON formatting. XML is not supported.

#. Issue the following cURL command, substituting your own values for
   the ones shown.

   **Create network with cURL request**

   .. code::

      $ curl -s $API_ENDPOINT/networks \
              -X POST \
              -H "Content-Type: application/json" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -d '{"network": {"name": "amp"}}' | python -m json.tool

   **Create network with cURL response**

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

#. Copy the ``id`` value from the output. You will use this value when you create a subnet,
   provision your server, or perform other related activities. In this example, the ID is
   ``29f52c7e-6efd-4335-a14a-db77d32a2555``, but use the ID from your response.

.. _cn-creating-subnet-curl:

Creating a subnet (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~~~

To create a subnet, you specify a network ID (using the ID that you copied in the
preceding step), an IP address, and a name for your subnet. After you create a subnet,
copy its ID for future reference.

#. Issue the following cURL command, substituting your own values for the ones shown.

   **Create subnet with cURL request**

   .. code::

      $ curl -s $API_ENDPOINT/subnets \
              -X POST \
              -H "Content-Type: application/json" \
              -H "Accept: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -d '{"subnet":{"name":"Subamp","cidr":"120.1.2.0/24","ip_version":4,
                 "network_id":"29f52c7e-6efd-4335-a14a-db77d32a2555"}}' \
              | python -m json.tool

   **Create subnet with cURL response**

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

#. Copy the ``id`` value from the output for future reference. In this example, the ID is
   ``23e3059e-4f39-4f7f-8cf2-c326e5de6c37``, but use the ID from your response.

.. _cn-listing-networks-curl:

Listing networks (cURL)
~~~~~~~~~~~~~~~~~~~~~~~~

**List networks with cURL request**

.. code::

   $ curl $API_ENDPOINT/networks \
        -X GET -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

**List networks with cURL response**

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

.. _cn-listing-subnets-curl:

Listing subnets (cURL)
~~~~~~~~~~~~~~~~~~~~~~

**List subnets with cURL request**

.. code::

   $ curl $API_ENDPOINT/subnets \
       -X GET -H "X-Auth-Token: $AUTH_TOKEN" | python -m json.tool

**List subnets with cURL response**

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

**Next topic:**  :ref:`Booting a new server with your cloud network<booting-new-server>`

