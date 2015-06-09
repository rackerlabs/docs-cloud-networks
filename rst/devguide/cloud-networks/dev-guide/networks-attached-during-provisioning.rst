.. cn-dg-overview-attached:

================================================
Which networks are attached during provisioning?
================================================

Which networks get attached, manually or automatically, to a newly provisioned server depends on which of the following methods you use to provision that server:

-  **Cloud Servers Neutron API**: You must specify the networks that you want to attach to your server. The UUID for ServiceNet is::

   11111111-1111-1111-1111-111111111111

and the UUID for PublicNet is::

    00000000-0000-0000-0000-000000000000

..  note::
    The Neutron API is currently accessible by using cURL commands, browser plug-ins for REST, or various programming languages and tools. The neutron client is not supported at this time.

-  **nova boot command**: You must specify the networks that you want to attach to your server. If you do not specify any networks, ServiceNet and PublicNet are attached by default. To attach to isolated networks that you have created, you must explicitly specify them in the command. If you do so, those networks, in addition to PublicNet and ServiceNet, are attached to your server.

-  **Cloud Control Panel**: PublicNet and ServiceNet are automatically attached, but you can disable these networks during the server creation process. You can also attach any isolated networks that you have created.

..  note::
    You can explicitly opt out of attaching to the Rackspace networks, which introduces certain potential complications. For more information, see :ref:`Consequences of detaching from Rackspace networks <cn-dg-overview-consequences>`.
