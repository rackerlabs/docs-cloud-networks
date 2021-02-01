.. _paginated-collections:

=====================
Paginated collections
=====================

To reduce load on the service, retrieve operations return a maximum limit of
100 items at a time. If a request supplies no limit or one that exceeds the
configured  default limit, the default limit is used instead.

This behavior is called *pagination*. Pagination gives you the ability to
limit the size of the returned data and to retrieve a specified subset of a
large data set.  Pagination has two key concepts: limit and marker.

* *Limit* is the restriction on the maximum number of items for that type that
  can be returned.

* *Marker* is a reference to an object's ID and is in the list of paged
  results for a particular resource. For example, if the resource is a load
  balancer, the marker is the load balancer ID at which to begin the list of
  the paged results.

To navigate the collection, you can set the ``limit`` and ``marker``
parameters in the URI. For example, ``?limit=10&marker=1234`` displays a
maximum of 10 load balancers in the paginated results, beginning with the
load balancer whose ID is 1234.

You can also use the ``offset`` parameter, which is a count of the number
of objects from where the paginated list is started.

If a marker beyond the end of a list is given, an empty list is returned.

The following examples illustrate two pages with three items.


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

**Example: Network collection, second and last page: JSON response**

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
