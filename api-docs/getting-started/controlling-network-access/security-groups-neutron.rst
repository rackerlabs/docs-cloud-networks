.. _use-security-groups-with-neutron:

Using security groups and rules with neutron
--------------------------------------------

This section provides steps for creating, using, and modifying security groups and rules 
by using the neutron client.

.. _sg-create-group-neutron:

Create a security group (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following steps show you how to create a security group.

#. **Create the security group**

   Issue the following neutron client command:

   .. code::  

      $ neutron security-group-create \
           --description "security group for webservers" \
           1-new-tcp
           
   **Positional arguments:**

   -  **description** The description of the security group. In this example, the 
      description is ``"security group for webservers"``.

   -  The name of the security group. In this example, the name is ``1-new-tcp``.


   The operation returns the response, as shown in the following output:

   .. code::  

       +----------------------+--------------------------------------+
       | Field                | Value                                |
       +----------------------+--------------------------------------+
       | description          | security group for webservers        |
       | id                   | fd269d7a-0909-488f-b5fc-5606c8aa489f |
       | name                 | 1-new-tcp                            |
       | security_group_rules |                                      |
       | tenant_id            | 5831008                              |
       +----------------------+--------------------------------------+

#. Note the security group ``id`` value from the output. You will use this value in later 
   activities. In this example, the ID is ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, but use 
   the ID from your response.
   
.. _sg-add-ssh-rule-neutron:

Add a rule for SSH traffic (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Issue the following neutron client command, substituting your own
   values for the ones shown:

   .. code::  

      $ neutron security-group-rule-create \
           --direction ingress \
           --ethertype IPv4 \
           --port-range-min 22 \
           --port-range-max 22 \
           --protocol tcp \
           fd269d7a-0909-488f-b5fc-5606c8aa489f

   **Positional arguments:**

   -  **direction** The direction in which the security group rule is applied. In this 
      example, we used direction ``ingress``.
   -  **ethertype** Must be IPv4 or IPv6. In this example, we used the ethertype ``IPv4``.
   -  **port-range-min** The minimum port number in the range that is matched by the 
      security group rule. In this example, we used the minimum ``22``.
   -  **port-range-max** The maximum port number in the range that is matched by the 
      security group rule. In this example, we used the maximum ``22``.
   -  The ID of the security group. In this example, we used security group 
      ``fd269d7a-0909-488f-b5fc-5606c8aa489f``.
   -  **protocol** The protocol that is matched by the security group rule. Valid values 
      are ``null``, ``tcp``, ``udp``, and ``icmp``. In this example, we used the protocol 
      ``tcp``.

   The operation returns the response, as shown in the following output:

   .. code::  

       +-------------------+--------------------------------------+
       | Field             | Value                                |
       +-------------------+--------------------------------------+
       | direction         | ingress                              |
       | ethertype         | IPv4                                 |
       | id                | ea794fe0-5f82-4b4e-8c38-7ab5d278973a |
       | port_range_max    | 22                                   |
       | port_range_min    | 22                                   |
       | protocol          | TCP                                  |
       | remote_group_id   |                                      |
       | remote_ip_prefix  |                                      |
       | security_group_id | fd269d7a-0909-488f-b5fc-5606c8aa489f |
       | tenant_id         | 5831008                              |
       +-------------------+--------------------------------------+

#. Note the security group rule ``id`` value from the output. You will need this value for 
   verification. In this example, the ID is ``ea794fe0-5f82-4b4e-8c38-7ab5d278973a``, but 
   use the ID from your response.

#. To see the rule in your group, issue the following neutron client command, substituting 
   your own values for the ones shown:

   .. code::  

      $ neutron security-group-rule-list

   Te operation returns the response, as shown in the following output:

   .. code::  

       +--------------------------------------+----------------+-----------+----------+------------------+--------------+
       | id                                   | security_group | direction | protocol | remote_ip_prefix | remote_group |
       +--------------------------------------+----------------+-----------+----------+------------------+--------------+
       | ea794fe0-5f82-4b4e-8c38-7ab5d278973a | 1-new-tcp      | ingress   | TCP      |                  |              |
       +--------------------------------------+----------------+-----------+----------+------------------+--------------+

#. Notice that your group, ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, contains your new rule, 
   ``ea794fe0-5f82-4b4e-8c38-7ab5d278973a`` in this example.                       

#. Notice that your group, ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, contains your new 
   rule, ``ea794fe0-5f82-4b4e-8c38-7ab5d278973a`` in this example.

.. _sg-find-port-neutron:

Find the port to use on the server (nova/neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, display your server details to find the port IP address. Then find the port ID for 
that port IP address. You need the port ID to apply the security group to the server port.

#. To list server details, issue the following nova client command, substituting your 
   server ID for the ones shown:
   
   .. code::  

      $ nova show 6ae4be93-4ec7-4b55-897a-c250f3a6e161
      
   **Positional argument:**

   -  ``id``. The ID of the server to which you want to add the security group. In this 
       example, the server ID is ``6ae4be93-4ec7-4b55-897a-c250f3a6e161``.


   The operation returns the response, as shown in the following output:

   .. code::  

       +-------------------------+------------------------------------------------------------------------------------+
       | Property                | Value                                                                              |
       +-------------------------+------------------------------------------------------------------------------------+
       | OS-DCF:diskConfig       | AUTO                                                                               |
       | OS-EXT-STS:power_state  | 1                                                                                  |
       | OS-EXT-STS:task_state   | None                                                                               |
       | OS-EXT-STS:vm_state     | active                                                                             |
       | accessIPv4              | 10.22.253.123                                                                      |
       | accessIPv6              | 2001:4801:787f:205:a8bb:ccff:fe00:115                                              |
       | created                 | 2012-08-16T16:28:18Z                                                               |
       | flavor                  | ml.mid (2)                                                                         |
       | hostId                  | 33a7eeba3027491b0ea13bbd66f88421b64fcfb56031ae78f5415443                           |
       | id                      | 6ae4be93-4ec7-4b55-897a-c250f3a6e161                                               |
       | image                   | cirros-0.3.0-x86_64-disk (82e72de5-6366-4217-8c87-a570a9b17e73)                    |
       | metadata                | {}                                                                                 |
       | name                    | ata                                                                                |
       | private network         | 10.183.232.87                                                                      |
       | progress                | 100                                                                                |
       | public network          | 2001:4801:787f:205:a8bb:ccff:fe00:115, 10.22.253.123                               |
       | status                  | ACTIVE                                                                             |
       | tenant_id               | 5831008                                                                            |
       | updated                 | 2014-02-06T20:05:12Z                                                               |
       | user_id                 | 207638                                                                             |
       +-------------------------+------------------------------------------------------------------------------------+

#. Because you will apply the security group to the PublicNet port (security groups can 
   only be applied to server ports on PublicNet or ServiceNet), note the public IP address 
   (``addr``) value from the output. In this example, the IP address is ``10.22.253.123``, 
   but use the IP address from your response.

#. To find the port ID that corresponds to the port IP address, issue the following neutron 
   client command:

   .. code::  

       $ neutron port-list 

   For each port, the operation returns the result as shown in the following output:

   .. code::  

       +--------------------------------------+---------+-------------------+----------------------------------------------------------------------------------------+
       | id                                   | name    | mac_address       | fixed_ips                                                                              |
       +--------------------------------------+---------+-------------------+----------------------------------------------------------------------------------------+
       | 97bf7255-788d-4f02-b37e-993ce129f1b4 |         | AA:BB:CC:00:01:16 | {"subnet_id": "8fa2ed6d-1eb2-49e7-be66-9cb532f0d2f6", "ip_address": "10.183.232.87"}   |
       | 9dd49b03-956d-4cd5-ae23-6dbf89b76aeb |         | AA:BB:CC:00:01:15 | {"subnet_id": "7a39a7dd-ae0c-4083-b2dc-bd53aad0c3e8", "ip_address": "10.22.253.123"}   |
       +--------------------------------------+---------+-------------------+----------------------------------------------------------------------------------------+
                           

#. Note the ``id`` of the port that contains the target port IP address that you identified. 
   In this example, the port ID is ``9dd49b03-956d-4cd5-ae23-6dbf89b76aeb``, but use the 
   value from your response for the next step.
   
.. _sg-apply-ssh-to-port-neutron:

Apply security group with SSH rule to a port on the server (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, apply the security group to the server port. Then test the security group rule.

#. To apply the group (in this example ``fd269d7a-0909-488f-b5fc-5606c8aa489f``) to the 
   port, issue the following neutron client command, substituting your port ID and security 
   group for the ones shown.

   **Positional arguments:**

   -  The port ID to which the security group is attached. In this example, the port ID is 
      ``9dd49b03-956d-4cd5-ae23-6dbf89b76aeb``.

   -  ``security-group``. The security group. In this example, the security group ID is 
      ``fd269d7a-0909-488f-b5fc-5606c8aa489f``.

   .. code::  

      $ neutron port-update <9dd49b03-956d-4cd5-ae23-6dbf89b76aeb> --security-group <fd269d7a-0909-488f-b5fc-5606c8aa489f>

   The operation returns the result as shown in the following output:

   .. code::  

       +-----------------------+----------------------------------------------------------------------------------------------------------------+
       | Field                 | Value                                                                                                          |
       +-----------------------+----------------------------------------------------------------------------------------------------------------+
       | admin_state_up        | True                                                                                                           |
       | allowed_address_pairs |                                                                                                                |
       | device_id             |                                                                                                                |
       | device_owner          |                                                                                                                |
       | fixed_ips             | {"subnet_id": "3d8e2de1-18ad-4a41-8adf-56e057d6b411", "ip_address": "2001:4801:787f:205:a8bb:ccff:fe00:115"},  |
       |                       | {"subnet_id": "7a39a7dd-ae0c-4083-b2dc-bd53aad0c3e8", "ip_address": "10.22.253.123"}                           |
       | id                    | 9dd49b03-956d-4cd5-ae23-6dbf89b76aeb                                                                           |
       | mac_address           | AA:BB:CC:00:01:15                                                                                              |
       | name                  |                                                                                                                |
       | network_id            | 03f240c5-6fb8-47a0-860a-c7ba83be519f                                                                           |
       | security_groups       | fd269d7a-0909-488f-b5fc-5606c8aa489f                                                                           |
       | status                | ACTIVE                                                                                                         |
       | tenant_id             | 5831008                                                                                                        |
       +-----------------------+----------------------------------------------------------------------------------------------------------------+


#. Notice that your security group, in this example ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, 
   is listed in the port details, meaning it was successfully applied.

#. Test the port by pinging the IP address. This test will fail, as the following example 
   shows, because the rule that was applied does not permit ICMP traffic. You will add a 
   rule for ICMP traffic in the next steps!

   .. code::  

       $ PING 10.22.253.123 (10.22.253.123): 56 data bytes
       Request timeout for icmp_seq 0
       Request timeout for icmp_seq 1
       Request timeout for icmp_seq 2                    
                       
.. _sg-add-icmp-rule-neutron:

Add a rule for ICMP traffic (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, add a rule for ICMP traffic to the security group. Then verify the rule, and ensure 
that the security group contains the rule.

#. To add the rule, issue the following neutron client command, substituting your own 
   values for the ones shown:

   .. code::  

      $ neutron security-group-rule-create \
           --direction ingress \
           --ethertype IPv4 \
           --port-range-min null \
           --port-range-max null \
           --protocol icmp \
           fd269d7a-0909-488f-b5fc-5606c8aa489f

   **Positional arguments:**

   -  **direction** The direction in which the security group rule is applied. In this 
      example, we used direction ``ingress``.
   -  **ethertype** Must be IPv4 or IPv6. In this example, we used the ethertype ``IPv4``.
   -  **port-range-min** The minimum port number in the range that is matched by the 
      security group rule. In this example, we used the minimum ``null``.
   -  **port-range-max** The maximum port number in the range that is matched by the 
      security group rule. In this example, we used the maximum ``null``.
   -  The name or ID of the network. In this example, we use the network ID, which is 
      ``fd269d7a-0909-488f-b5fc-5606c8aa489f``.
   -  **protocol** The protocol that is matched by the security group rule. Valid values 
      are ``null``, ``tcp``, ``udp``, and ``icmp``. In this example, we used the protocol ``icmp``.

   The operation returns the response, as shown in the following output:

   .. code::  

       +-------------------+--------------------------------------+
       | Field             | Value                                |
       +-------------------+--------------------------------------+
       | direction         | ingress                              |
       | ethertype         | IPv4                                 |
       | id                | 483b107a-dbf8-41a9-8494-f47558b58524 |
       | port_range_max    | null                                 |
       | port_range_min    | null                                 |
       | protocol          | ICMP                                 |
       | remote_group_id   |                                      |
       | remote_ip_prefix  |                                      |
       | security_group_id | fd269d7a-0909-488f-b5fc-5606c8aa489f |
       | tenant_id         | 5831008                              |
       +-------------------+--------------------------------------+

#. Note the security group rule ID value from the output. You will need this value for 
   verification. In this example, the ID is ``483b107a-dbf8-41a9-8494-f47558b58524``, but 
   use the ID from your response.

#. To see the rule in your group, issue the following neutron client command, substituting 
   your own values for the ones shown:

   .. code::  

      $ neutron security-group-rule-list

   The operation returns the response, as shown in the following output:

   .. code::  

       +--------------------------------------+----------------+-----------+----------+------------------+--------------+
       | id                                   | security_group | direction | protocol | remote_ip_prefix | remote_group |
       +--------------------------------------+----------------+-----------+----------+------------------+--------------+
       | ea794fe0-5f82-4b4e-8c38-7ab5d278973a | 1-new-tcp      | ingress   | TCP      |                  |              |
       | 483b107a-dbf8-41a9-8494-f47558b58524 | 1-new-tcp      | ingress   | ICMP     |                  |              |
       +--------------------------------------+----------------+-----------+----------+------------------+--------------+

#. Notice that your group, ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, contains both your 
   rules, ``483b107a-dbf8-41a9-8494-f47558b58524`` and 
   ``ea794fe0-5f82-4b4e-8c38-7ab5d278973a`` in this example.

.. _sg-apply-icmp-to-port-neutron:

Apply security group with ICMP rule to the port on the server (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, apply the security group to the server port. Then test the security group rule.

#. To apply the group, in this example ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, to the 
   port, issue the following neutron client command, substituting your port ID for the one 
   shown:

   .. code::  

      $ neutron port-update <9dd49b03-956d-4cd5-ae23-6dbf89b76aeb> --security-group <fd269d7a-0909-488f-b5fc-5606c8aa489f>
   
   **Positional arguments:**

   -  The port ID to which the security group is attached. In
      this example, the port ID is
      ``9dd49b03-956d-4cd5-ae23-6dbf89b76aeb``.
   -  ``security-group``. The security group. In this example, the
      security group ID is ``fd269d7a-0909-488f-b5fc-5606c8aa489f``.
      
   The operation returns the result as shown in the following output:

   .. code::  

       +-----------------------+----------------------------------------------------------------------------------------------------------------+
       | Field                 | Value                                                                                                          |
       +-----------------------+----------------------------------------------------------------------------------------------------------------+
       | admin_state_up        | True                                                                                                           |
       | allowed_address_pairs |                                                                                                                |
       | device_id             |                                                                                                                |
       | device_owner          |                                                                                                                |
       | fixed_ips             | {"subnet_id": "3d8e2de1-18ad-4a41-8adf-56e057d6b411", "ip_address": "2001:4801:787f:205:a8bb:ccff:fe00:115"},  |
       |                       | {"subnet_id": "7a39a7dd-ae0c-4083-b2dc-bd53aad0c3e8", "ip_address": "10.22.253.123"}                           |
       | id                    | 9dd49b03-956d-4cd5-ae23-6dbf89b76aeb                                                                           |
       | mac_address           | AA:BB:CC:00:01:15                                                                                              |
       | name                  |                                                                                                                |
       | network_id            | 03f240c5-6fb8-47a0-860a-c7ba83be519f                                                                           |
       | security_groups       | fd269d7a-0909-488f-b5fc-5606c8aa489f                                                                           |
       | status                | ACTIVE                                                                                                         |
       | tenant_id             | 5831008                                                                                                        |
       +-----------------------+----------------------------------------------------------------------------------------------------------------+


#. Notice that your security group, in this example ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, 
   is listed in the port details, meaning it was successfully applied.

#. Test the port by pinging the IP address. This test will succeed, as the following example 
   shows, because the rule applied explicitly permits ICMP traffic.

   .. code::

       $ PING 10.22.253.123 (10.22.253.123): 56 data bytes
       64 bytes from 10.22.253.123: icmp_seq=0 ttl=55 time=85.080 ms
       64 bytes from 10.22.253.123: icmp_seq=1 ttl=55 time=84.263 ms
       64 bytes from 10.22.253.123: icmp_seq=2 ttl=55 time=148.971 ms                   
                       
