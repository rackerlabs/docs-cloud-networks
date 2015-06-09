.. _cn-dg-overview-neutronvnova:

=======================================
Networking: Neutron versus Nova-Network
=======================================

Rackspace first introduced networking services that were based on the OpenStack Nova-Network API and exposed these services via the `/os-networksv2` Cloud Servers extension. For documentation on these operations, see `Network extension`_ of the *Next Generation Cloud Servers Developers Guide*. This version of the service is now superseded by the current networking API, based on OpenStack Neutron, which offers a richer suite of networking services. Both APIs continue to function, but the Neutron API will be the base for all the future networking services that Rackspace offers. We recommend that you use the Neutron API for your Cloud Networks API operations.

The current API introduces three new top-level resources — `/networks`, `/ports`, and `/subnets` — which are included in the OpenStack Neutron API. All new networking services that we offer will make use of these resources and build on the OpenStack Neutron API to help you build rich networking topologies and configure advanced network services.

As part of the new API, the following new capabilities are available to users:

-  Create and manage isolated networks using the new API

-  Assign routes to cloud servers at boot-time (host routes)

-  Specify allocation pools to subnets (CIDRs) on isolated networks to control the IP address assignment on your cloud servers

-  Allocate an IP address of your choice to ports on isolated Networks

-  Dual-stack isolated networks: Allocate both IPv4 and IPv6 addresses on the same isolated network port.

The Neutron API supports JSON data serialization format for requests and responses.

For guidance on the Nova-Network API networking operations, see `Network extension`_ of the *Next Generation Cloud Servers Developers Guide*.

.. _Network extension: http://docs.rackspace.com/servers/api/v2/cs-devguide/content/network_extension.html
