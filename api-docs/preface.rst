.. _cn-dg-preface:

===============
About the API
===============

Rackspace Cloud Networks enables you to create isolated networks and provision server 
instances with Rackspace networks or the isolated networks that you created.

When you create an isolated network, it is associated with your tenant ID, which is also 
known as your account ID or account number. If you don't know your tenant ID, you can find 
it by logging in to the :mycloud:`Cloud Control Panel<>` and expanding the **Account** menu in the 
upper-right corner of the screen. Your tenant ID is shown at the top of the menu, listed 
as **Account #**.

Cloud Networks was originally released using the Cloud Servers the Nova-Network API, whose 
operations are detailed in the   
:rax-devdocs:`Network section <cloud-servers/v2/developer-guide/#document-api-operations/svr-networks-operations>`
of the *Next Generation Cloud Servers Developers Guide*.

Now Rackspace Cloud Networks has been released using the Neutron API, detailed in this guide. 
We recommend that you use the Neutron API operations even though the Nova-Network API 
operations still work. For information that helps you determine which method is better for 
you, see :ref:`Networking: neutron versus nova-network <neutron-vs-nova>`.

We welcome feedback, comments, and bug reports. Visit the :rax-special:`Rackspace customer portal <feedback>`.

.. _cn-dg-preface-pricing:


Pricing and terms of service
-----------------------------

Cloud Networks is part of the Rackspace Cloud. and your use through the API is billed 
according to the :rax:`pricing schedule for Cloud Servers <cloud/servers/pricing>`.

The service level agreement (SLA) for Rackspace Cloud Services is included in the 
:rax:`Rackspace Cloud SLA <information/legal/cloud/sla>`.

The terms of service are part of the :rax:`Rackspace Cloud Terms of Service <information/legal/cloud/tos>`. 
Periodically review these terms because they can be updated any time.


Resources
---------

We welcome feedback, comments, and bug reports. Visit the :rax-special:`Rackspace customer portal <feedback>`.

Use the links below to learn more about the Rackspace Cloud Servers service and API.

- To learn more about the Cloud Networks service and the various ways you can interact 
  with it (API, SDK, CLI, and Control Panel), see the :rax-devdocs:`Rackspace Cloud Guide 
  to Core Infrastructure Services <user-guides/infrastructure/>`.
  
- To learn about using Rackspace Cloud SDKs, see :rax-dev:`Software Development Kits & Tools <docs/#sdks>`. 
    
- To get information about other Rackspace Cloud services APIs, see the
  :rax-devdocs:`Rackspace API Documentation <>`.

Read product updates and announcements by using `Twitter <http://twitter.com/rackspace>`_.

.. software-updates:

.. Comment This file includes the current release information at the top of the document.

Service updates
-------------------

Rackspace provides software updates to introduce backward-compatible updates and 
modifications to |apiservice| |contract version|. These changes are not intended to break 
any existing code that relies on the API (SDK, web applications, scripts, and so on). 
However, you might want to update or extend your code to use new features and enhancements.

To learn about updates and changes included in this and other releases, see the 
:ref:`Release Notes <release-notes>`. 