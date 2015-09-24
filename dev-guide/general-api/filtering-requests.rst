.. _generalapi-filtering:

==================
Filtering requests
==================

The Cloud Networks API supports filtering based on all top-level attributes of a resource. 
Filters are applicable to all list requests.

For example, the following request returns all networks named foobar:

.. code::  

    GET /v2.0/networks?name=<foobar>

When you specify multiple filters, the API returns only objects that meet all filtering 
criteria. The operation applies an **AND** condition among the filters. There is no **OR** 
condition.

By default, the API returns all attributes for any show or list call. You can use the 
``fields`` query parameter to control the attributes that the API returns.

For example, the following request returns only ID and name for each network:

.. code::  

    GET /v2.0/networks.json?fields=<id>&fields=<name>
