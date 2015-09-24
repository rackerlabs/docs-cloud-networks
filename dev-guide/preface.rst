.. _cn-dg-preface:

===============================
Cloud Networks - Neutron API v2
===============================

Rackspace Cloud Networks enables you to create isolated networks and provision server 
instances with Rackspace networks or the isolated networks that you created.

When you create an isolated network, it is associated with your tenant ID, which is also 
known as your account ID or account number. If you don't know your tenant ID, you can find 
it by logging in to the `Cloud Control Panel`_ and expanding the **Account** menu in the 
upper-right corner of the screen. Your tenant ID is shown at the top of the menu, listed 
as **Account #**.

Cloud Networks was originally released using the Cloud Servers the Nova-Network API, whose 
operations are detailed in `Network extension`_ of the *Next Generation Cloud Servers Developers Guide*. 
Now Rackspace Cloud Networks has been released using the Neutron API, detailed in this guide. 
We recommend that you use the Neutron API operations even though the Nova-Network API 
operations still work. For information that helps you determine which method is better for 
you, see :ref:`Networking: neutron versus nova-network <neutron-vs-nova>`.

We welcome `feedback, comments, and bug reports`_.

.. _Cloud Control Panel: http://mycloud.rackspace.com
.. _Network extension: http://docs.rackspace.com/servers/api/v2/cs-devguide/content/network_extension.html
.. _feedback, comments, and bug reports: https://feedback.rackspace.com/

.. _cn-dg-preface-intended:

Intended Audience
~~~~~~~~~~~~~~~~~

This guide assists software developers who want to develop applications by using Cloud 
Networks with the Neutron API.

To use this information, you should have access to an active Rackspace Cloud Servers 
account and access to Cloud Networks. You should also be familiar with the following concepts:

-  Cloud Servers service

-  RESTful web services

-  HTTP/1.1

-  JSON data serialization formats

.. _cn-dg-preface-pricing:

Pricing and service level
~~~~~~~~~~~~~~~~~~~~~~~~~

Cloud Networks is part of the Rackspace Cloud and your use through the API is billed 
according to the `pricing schedule for Cloud Servers`_.

The `Service Level Agreement`_ (SLA) for Cloud Networks is available as part of Cloud Servers.

.. _pricing schedule for Cloud Servers: http://www.rackspace.com/cloud/servers/pricing/
.. _Service Level Agreement: http://www.rackspace.com/cloud/servers/service-levels/

.. _cn-dg-preface-resources:

Resources
~~~~~~~~~

For additional Cloud Servers and Cloud Networks service resources, see the 
`Rackspace Cloud`_ site, which provides related documents and links to Rackspace support 
channels including `Knowledge Center articles`_, phone, chat, and tickets.

For product updates and announcements through Twitter, see http://twitter.com/rackspace.

For information about the supernova client, which is an unsupported wrapper for the nova 
client that is useful for managing multiple nova environments, see `supernova client`_.

.. _Rackspace Cloud: http://www.rackspacecloud.com/cloud_hosting_products/servers
.. _Knowledge Center articles: http://www.rackspace.com/knowledge_center/
.. _supernova client: http://major.github.io/supernova/
