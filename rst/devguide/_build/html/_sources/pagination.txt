.. _cn-dg-generalapi-pagination:

======================
Pagination of requests
======================

To reduce load on the service, list operations return a maximum number of items at a time. To help you navigate the collection, you can set the `limit`, `marker`, and `page_reverse` parameters in the URI.

For example, the following request returns up to 100 pages, starting with the item with ID=1234:

.. code::  

    ?limit=100&marker=1234&page_reverse=False

The `marker` parameter is the ID of the last item in the previous list. The `limit` parameter sets the page size. The `page_reverse` parameter sets the page direction. These parameters are optional. If the client requests a limit beyond the maximum limit configured by the deployment, the server returns the number of items equal to the maximum limit.

For convenience, list responses contain `next` links and `previous` links. The last page in the list requested with `page_reverse=False` does not contain a `next` link, and the last page in the list requested with `page_reverse=True` does not contain a `previous` link. The following examples illustrate two pages with three items.

 
**Example: Network collection, first page: JSON request**

.. code::  

    GET /v2.0/networks.json?limit=2 HTTP/1.1

**Example: Network collection, first page: JSON response**

.. code::  

                {
        "networks": [
            {
                "admin_state_up": true,
                "id": "396f12f8-521e-4b91-8e21-2e003500433a",
                "name": "net3",
                "provider:network_type": "vlan",
                "provider:physical_network": "physnet1",
                "provider:segmentation_id": 1002,
                "router:external": false,
                "shared": false,
                "status": "ACTIVE",
                "subnets": [],
                "tenant_id": "20bd52ff3e1b40039c312395b04683cf"
            },
            {
                "admin_state_up": true,
                "id": "71c1e68c-171a-4aa2-aca5-50ea153a3718",
                "name": "net2",
                "provider:network_type": "vlan",
                "provider:physical_network": "physnet1",
                "provider:segmentation_id": 1001,
                "router:external": false,
                "shared": false,
                "status": "ACTIVE",
                "subnets": [],
                "tenant_id": "20bd52ff3e1b40039c312395b04683cf"
            }
        ],
        "networks_links": [
            {
                "href": "http://127.0.0.1:9696/v2.0/networks.json?limit=2&amp;marker=71c1e68c-171a-4aa2-aca5-50ea153a3718",
                "rel": "next"
            },
            {
                "href": "http://127.0.0.1:9696/v2.0/networks.json?limit=2&amp;marker=396f12f8-521e-4b91-8e21-2e003500433a&amp;page_reverse=True",
                "rel": "previous"
            }
        ]
    }

**Example: Network collection, last page: JSON request**

.. code::  

    GET /v2.0/networks.json?limit=2&marker=71c1e68c-171a-4aa2-aca5-50ea153a3718 HTTP/1.1

**Example: Network collection, last page: JSON response**

.. code::  

                {
        "networks": [
            {
                "admin_state_up": true,
                "id": "b3680498-03da-4691-896f-ef9ee1d856a7",
                "name": "net1",
                "provider:network_type": "vlan",
                "provider:physical_network": "physnet1",
                "provider:segmentation_id": 1000,
                "router:external": false,
                "shared": false,
                "status": "ACTIVE",
                "subnets": [],
                "tenant_id": "c05140b3dc7c4555afff9fab6b58edc2"
            }
        ],
            "networks_links": [
                {
                    "href": "http://127.0.0.1:9696/v2.0/networks.json?limit=2&amp;marker=b3680498-03da-4691-896f-ef9ee1d856a7&amp;page_reverse=True",
                    "rel": "previous"
                }
            ]
    }
