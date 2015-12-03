.. _cn-dg-overview-consequences:

=================================================
Consequences of detaching from Rackspace networks
=================================================

When you provision a next generation cloud server, you can attach to one or more isolated 
networks and the Rackspace networks. You can also explicitly opt out of attaching the 
Rackspace networks to the server, which introduces the following consequences:

-  If you do not attach the PublicNet network to the server, the server cannot access the 
   Internet and some Rackspace products and services.

-  If you do not attach the ServiceNet network to the server, the server cannot access 
   certain Rackspace products and services.

The following graphic depicts the services that are available only when you attach the 
Rackspace networks to your server:

.. image:: /_images/cloud-networks-infographic-revised4.png

.. _cn-dg-overview-consequences-optout:

Opting out
~~~~~~~~~~

To opt out of attaching the Rackspace networks to your server, perform the following action 
depending on how you are provisioning the server:

-  **nova boot command**: Specify the optional `--no-public` and `--no-service-net` parameters.

-  **Cloud Servers Nova-Network API (nova client or cURL)**: If you do not specify any 
   networks, ServiceNet and PublicNet are attached by default. However, if you specify an 
   isolated network, you must explicitly specify the UUIDs for PublicNet and ServiceNet to 
   attach these networks to your server.

   The UUID for ServiceNet is ``11111111-1111-1111-1111-111111111111`` and the UUID for 
   PublicNet is ``00000000-0000-0000-0000-000000000000``.

   Omit these UUIDs from the request to opt out of attaching to these networks.

-  **Cloud Control Panel**: Clear the PublicNet and ServiceNet selections during the server 
   creation process. You are warned that your capabilities might be degraded by this choice.
