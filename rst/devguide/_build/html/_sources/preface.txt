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
Now Cloud Networks has been released using the Neutron API 
(see `API operations <api_operations_neutron.html>`_). We recommend that you use the 
Neutron API operations even though the Nova-Network API operations still work. For information 
that helps you determine which method is better for you, see `Networking: neutron versus 
nova-network <section_nova_v_neutron.html>`__.

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

.. _cn-dg-preface-changehist:

Document change history
~~~~~~~~~~~~~~~~~~~~~~~

This version of the guide applies only to v2.0 of the API. The most recent changes are 
described in the following table:

+--------------------+-----------------------------------------------------------------+
|   Revision Date    |                       Summary of Changes                        |
+====================+=================================================================+
| March 24, 2015     | Added sections related to the security group extension          |
|                    | in Overview, Concepts, and Extensions.                          |
+--------------------+-----------------------------------------------------------------+
| March 19, 2015     | Corrected the link to the Cloud Servers Dev Guide in            |
|                    | Overview.                                                       |
+--------------------+-----------------------------------------------------------------+
| March 11, 2015     | Updated API Operations to note levels of availability           |
|                    | for the various APIs and extensions.                            |
+--------------------+-----------------------------------------------------------------+
| March 6, 2015      | Updated Identity API endpoint documentation to remove           |
|                    | references to regional endpoints. All customers can             |
|                    | authenticate using the https://identity.api.rackspacecloud.com  |
|                    | global endpoint, regardless of geographic location.             |
+--------------------+-----------------------------------------------------------------+
| February 9, 2015   | Updated "Create network” with corrected create                  |
|                    | network example.                                                |
+--------------------+-----------------------------------------------------------------+
| January 15, 2015   | Updated “Authenticate with cURL” with information about using   |
|                    | multi-factor authentication for added security when a user      |
|                    | authenticates with username and password credentials.           |
+--------------------+-----------------------------------------------------------------+
| November 20, 2014  | Public release of this document.                                |
+--------------------+-----------------------------------------------------------------+
| September 30, 2014 | Published document with neutron API calls.                      |
+--------------------+-----------------------------------------------------------------+

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
