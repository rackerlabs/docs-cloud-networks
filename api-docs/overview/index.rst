.. _overview-index:

========
Overview
========

This overview introduces the types of |apiservice| operations, service limits, a 
comparison between the Neutron API and the Nova-Network API, the available networks, 
which networks are attached to a server (based on the provisioning method), and a discussion 
about the consequences of choosing not to attach to Rackspace PublicNet and ServiceNet 
networks.

You can use the Cloud Networks service Neutron API to perform the following tasks:

-  List networks to which the specified tenant has access.

-  Create isolated networks.

-  Show details for isolated networks.

-  Delete an isolated network, if it is not associated with any server.

    ..  note::

        To detach a network from a server, you must use the Cloud Networks virtual interface 
        extension to delete the virtual interface for the network from the server. For more 
        information, see 
        :rax-devdocs:`Delete virtual interface <cloud-servers/v2/developer-guide/#delete-virtual-interface>`
        in the *Cloud Servers Developer Guide*.

-  Manage subnets.

-  Manage ports.

-  Manage security groups and security group rules.

.. COMMENT -  Manage and share IP addresses between servers in the same public zone.

.. toctree::
   :maxdepth: 2
   
   neutron-versus-nova
   available-networks
   networks-attached-during-provisioning
   consequences-of-detaching

