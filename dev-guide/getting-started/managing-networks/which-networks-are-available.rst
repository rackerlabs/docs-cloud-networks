
=============================
Which networks are available?
=============================

The Rackspace Public Cloud enables you to attach one or more of the
following networks to your server:

Public (***PublicNet***):
    Rackspace PublicNet connects the cloud infrastructure components
    (like servers, load balancers, and network appliances) to the
    Internet. PublicNet is optimized for north-south traffic (traffic
    flowing to and from the Internet). It follows a direct addressing
    model, so that all public IP addresses are directly configured on
    the servers without using Network Address Translation (NAT).
    PublicNet is dual-stacked for IPv4 and IPv6. When you create servers
    with PublicNet, your servers get an IPv4 and an IPv6 address by
    default.

    When you list networks, PublicNet is labeled ``public``.

Service (***ServiceNet***)
    ServiceNet is an internal, IPv4-only multi-tenant network within
    each Rackspace Cloud region that is optimized to carry east-west
    traffic. It provides servers access to regional services such as
    Cloud Files, Cloud Load Balancers, Cloud Databases, and Cloud Backup
    at no cost. ServiceNet is also required for Windows Cloud Server
    activation. We recommend that you connect servers to ServiceNet so
    that they can access these services. The networks ``10.176.0.0/12``
    and ``10.208.0.0/12`` are reserved for ServiceNet .

    When you list networks, ServiceNet is labeled ``private``.

Isolated networks (Cloud Networks)
    Isolated networks are user-defined L2 networks that are fully
    isolated and single-tenant, and offer users a means to securely
    connect their application servers. They are provided at no charge.
    Isolated Networks can now be provisioned either as IPv4 or IPv6, or
    they can be dual stacked (IPv4 and IPv6). Isolated networks are
    recommended for all inter-server communication. Even though
    ServiceNet can also be used for server east-west (backend)
    connectivity, ServiceNet is not recommended for that purpose
    because, unlike isolated networks, ServiceNet is multi-tenant.
    Isolated networks also include full support for the broadcasting and
    multicasting required for some clustering technologies.
