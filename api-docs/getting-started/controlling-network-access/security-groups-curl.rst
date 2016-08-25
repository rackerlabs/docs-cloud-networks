.. _using-security-groups-with-curl:

Using security groups and rules with cURL
-----------------------------------------

This section provides steps for creating, using, and modifying security groups
and rules by using cURL.

.. _sg-creating-group-curl:

Creating a security group (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps show you how to create a security group.

#. Issue the following cURL command, substituting your own values for the ones
   shown.

   **Create security group with cURL request**

   .. code::

      $ curl -i $API_ENDPOINT/security-groups \
              -X 'POST' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "X-User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -d '{"security_group":{"name":"1-new-tcp",
                 "description":"security group for webservers"}}' | python -m json.tool

   **Create security group with cURL response**

   .. code::

       {
           "security_group": {
               "description": "security group for webservers",
               "id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
               "name": "1-new-tcp",
               "security_group_rules": [],
               "tenant_id": "5831008"
           }
       }


#. Note the security group ``id`` value from the output. You will use this
   value in later activities. In this example, the ID is
   ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, but use the ID from your response.

.. _sg-adding-ssh-rule-curl:

Adding a rule for SSH traffic (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, add a rule for SSH traffic to the security group. Then verify the rule,
and ensure that the security group contains the rule.

#. To add the rule, issue the following cURL command, substituting your
   own values for the ones shown.

   **Add SSH rule with cURL request**

   .. code::

      $ curl -i $API_ENDPOINT/security-group-rules \
              -X 'POST' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -d '{"security_group_rule":{"direction":"ingress","port_range_min":"22",
                 "ethertype":"IPv4","port_range_max":"22","protocol":"tcp",
                 "security_group_id":"fd269d7a-0909-488f-b5fc-5606c8aa489f"}}' \
                 | python -m json.tool

   **Add SSH rule with cURL response**

   .. code::

       {
           "security_group_rule": {
               "direction": "ingress",
               "ethertype": "IPv4",
               "id": "ea794fe0-5f82-4b4e-8c38-7ab5d278973a",
               "port_range_max": 22,
               "port_range_min": 22,
               "protocol": "TCP",
               "remote_group_id": null,
               "remote_ip_prefix": null,
               "security_group_id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
               "tenant_id": "5831008"
           }
       }


#. Note the security group rule ``id`` value from the output. You will need
   this value for verification. In this example, the ID is
   ``ea794fe0-5f82-4b4e-8c38-7ab5d278973a``, but use the ID from your response.

#. To see the rule, issue the following cURL command.

   **List security group rules with cURL request**

   .. code::

      $ curl -i $API_ENDPOINT/security-group-rules \
              -X 'GET' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "X-User-Agent: python-novaclient" \
              -H "Accept: application/json" | python -m json.tool

   **List security group rules with cURL response**

   .. code::

       {
           "security_group_rules": [
               {
                   "direction": "ingress",
                   "ethertype": "IPv4",
                   "id": "ea794fe0-5f82-4b4e-8c38-7ab5d278973a",
                   "port_range_max": 22,
                   "port_range_min": 22,
                   "protocol": "TCP",
                   "remote_group_id": null,
                   "remote_ip_prefix": null,
                   "security_group_id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
                   "tenant_id": "5831008"
               }
           ]
       }


#. Notice that your new rule, ``ea794fe0-5f82-4b4e-8c38-7ab5d278973a`` in this
   example, is included in the list of rules.

#. To see the rule in your group, issue the following cURL command.

   **List security groups with cURL request**

   .. code::

      $ curl -i $API_ENDPOINT/security-groups \
              -X 'GET' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "X-User-Agent: python-novaclient" \
              -H "Accept: application/json" | python -m json.tool

   **List security groups with cURL response**

   .. code::

       {
           "security_groups": [
               {
                   "description": "security group for webservers",
                   "id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
                   "name": "1-new-tcp",
                   "security_group_rules": [
                       {
                           "direction": "ingress",
                           "ethertype": "IPv4",
                           "id": "ea794fe0-5f82-4b4e-8c38-7ab5d278973a",
                           "port_range_max": 22,
                           "port_range_min": 22,
                           "protocol": "TCP",
                           "remote_group_id": null,
                           "remote_ip_prefix": null,
                           "security_group_id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
                           "tenant_id": "5831008"
                       }
                   ],
                   "tenant_id": "5831008"
               }
           ]
       }


#. Notice that your group, ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, contains
   your new rule, ``ea794fe0-5f82-4b4e-8c38-7ab5d278973a`` in this example.

.. _sg-finding-port-curl:

Finding the port to use on the server (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, display your server details to find the port IP address. Then find the
port ID for that port IP address. You need the port ID to apply the security
group to the server port.


#. To list server details, issue the following cURL command,
   substituting your account and server ID for the ones shown.

   **List server details with cURL request**

   .. code::

      $ curl -k -i https://dfw.servers.api.rackspacecloud.com/v2/$TENANT_ID/servers/6ae4be93-4ec7-4b55-897a-c250f3a6e161 \
              -X 'GET' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" | python -m json.tool

   **Positional arguments:**

   -  The ID of the server to which you want to add the security group. In this
      example, the server ID is ``6ae4be93-4ec7-4b55-897a-c250f3a6e161``.

   **List server details with cURL response**

   .. code::

       {
           "server": {
               "OS-DCF:diskConfig": "AUTO",
               "OS-EXT-STS:power_state": 1,
               "OS-EXT-STS:task_state": null,
               "OS-EXT-STS:vm_state": "active",
               "RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId": "9dac16e82bb789cf0e5f6f0b7f3bc47e737a57ab756678e557462b12",
               "accessIPv4": "10.22.253.123",
               "accessIPv6": "2001:4801:787f:205:a8bb:ccff:fe00:115",
               "addresses": {
                   "private": [
                       {
                           "addr": "10.183.232.87",
                           "version": 4
                       }
                   ],
                   "public": [
                       {
                           "addr": "2001:4801:787f:205:a8bb:ccff:fe00:115",
                           "version": 6
                       },
                       {
                           "addr": "10.22.253.123",
                           "version": 4
                       }
                   ]
               },
               "config_drive": "",
               "created": "2015-02-10T22:50:31Z",
               "flavor": {
                   "id": "2",
                   "links": [
                       {
                           "href": "https://qe-ord.servers.api.rackspacecloud.com/5831008/flavors/2",
                           "rel": "bookmark"
                       }
                   ]
               },
               "hostId": "33a7eeba3027491b0ea13bbd66f88421b64fcfb56031ae78f5415443",
               "id": "6ae4be93-4ec7-4b55-897a-c250f3a6e161",
               "image": {
                   "id": "25ced0f6-c86a-4a80-b4ec-80feff2dd8e1",
                   "links": [
                       {
                           "href": "https://qe-ord.servers.api.rackspacecloud.com/5831008/images/25ced0f6-c86a-4a80-b4ec-80feff2dd8e1",
                           "rel": "bookmark"
                       }
                   ]
               },
               "key_name": null,
               "links": [
                   {
                       "href": "https://qe-ord.servers.api.rackspacecloud.com/v2/5831008/servers/6ae4be93-4ec7-4b55-897a-c250f3a6e161",
                       "rel": "self"
                   },
                   {
                       "href": "https://qe-ord.servers.api.rackspacecloud.com/5831008/servers/6ae4be93-4ec7-4b55-897a-c250f3a6e161",
                       "rel": "bookmark"
                   }
               ],
               "metadata": {},
               "name": "ata",
               "progress": 100,
               "status": "ACTIVE",
               "tenant_id": "5831008",
               "updated": "2015-02-10T22:52:56Z",
               "user_id": "207638"
           }
       }

#. Because you will apply the security group to the PublicNet port, note the
   public IP address (``addr``) value from the output. In this example, the IP
   address is ``10.22.253.123``, but use the IP address from your response.

#. To find the port ID that corresponds to the port IP address, issue the
   following cURL command.

   **List ports with cURL request**

   .. code::

      $ curl -i $API_ENDPOINT/ports \
              -X 'GET' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "X-User-Agent: python-novaclient" \
              -H "Accept: application/json" | python -m json.tool

   **List ports with cURL response**

   .. code::

           "ports": [
               {
                   "admin_state_up": true,
                   "device_id": "6ae4be93-4ec7-4b55-897a-c250f3a6e161",
                   "device_owner": "compute:None",
                   "fixed_ips": [
                       {
                           "ip_address": "10.183.232.87",
                           "subnet_id": "8fa2ed6d-1eb2-49e7-be66-9cb532f0d2f6"
                       }
                   ],
                   "id": "97bf7255-788d-4f02-b37e-993ce129f1b4",
                   "mac_address": "AA:BB:CC:00:01:16",
                   "name": "",
                   "network_id": "11111111-1111-1111-1111-111111111111",
                   "security_groups": [],
                   "status": "ACTIVE",
                   "tenant_id": "5831008"
               },
               {
                   "admin_state_up": true,
                   "device_id": "6ae4be93-4ec7-4b55-897a-c250f3a6e161",
                   "device_owner": "compute:None",
                   "fixed_ips": [
                       {
                           "ip_address": "10.22.253.123",
                           "subnet_id": "7a39a7dd-ae0c-4083-b2dc-bd53aad0c3e8"
                       },
                       {
                           "ip_address": "2001:4801:787f:205:a8bb:ccff:fe00:115",
                           "subnet_id": "3d8e2de1-18ad-4a41-8adf-56e057d6b411"
                       }
                   ],
                   "id": "9dd49b03-956d-4cd5-ae23-6dbf89b76aeb",
                   "mac_address": "AA:BB:CC:00:01:15",
                   "name": "",
                   "network_id": "00000000-0000-0000-0000-000000000000",
                   "security_groups": [],
                   "status": "ACTIVE",
                   "tenant_id": "5831008"
               }
           ]
       }


#. Note the ``id`` of the port that contains the target port IP address
   that you identified. In this example, the port ID is
   ``9dd49b03-956d-4cd5-ae23-6dbf89b76aeb``, but use the value from your
   response for the next step.

.. _sg-applying-ssh-to-port-curl:

Applying security group with SSH rule to a port on the server (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, apply the security group to the server port. Then test the security
group rule.

#. To apply the group (in this example
   ``fd269d7a-0909-488f-b5fc-5606c8aa489f``) to the port, issue the following
   cURL command, substituting your port ID for the one shown.

   **Apply security group to port with cURL request**

   .. code::

      $ curl -i $API_ENDPOINT/ports/9dd49b03-956d-4cd5-ae23-6dbf89b76aeb \
              -X 'PUT' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -d '{"port": {"security_groups": ["fd269d7a-0909-488f-b5fc-5606c8aa489f"]}}' \
              | python -m json.tool

   **Positional argument:**

   -  The port ID to which the security group is attached. In this example, the
      port ID is ``9dd49b03-956d-4cd5-ae23-6dbf89b76aeb``.

   **Apply security group to port with cURL response**

   .. code::

        {
           "port": {
               "status": "ACTIVE",
               "name": "",
               "admin_state_up": true,
               "network_id": "00000000-0000-0000-0000-000000000000",
               "tenant_id": "5831008",
               "device_owner": "compute:None",
               "mac_address": "AA:BB:CC:00:01:15",
               "fixed_ips": [
                   {
                       "subnet_id": "7a39a7dd-ae0c-4083-b2dc-bd53aad0c3e8",
                       "ip_address": "10.22.253.123"
                   },
                   {
                       "subnet_id": "3d8e2de1-18ad-4a41-8adf-56e057d6b411",
                       "ip_address": "2001:4801:787f:205:a8bb:ccff:fe00:115"
                   }
               ],
               "id": "9dd49b03-956d-4cd5-ae23-6dbf89b76aeb",
               "security_groups": [
                   "fd269d7a-0909-488f-b5fc-5606c8aa489f"
               ],
               "device_id": "6ae4be93-4ec7-4b55-897a-c250f3a6e161"
           }
       }

#. Notice that your security group, in this example
   ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, is listed in the port details,
   meaning it was successfully applied.

#. Test the port by pinging the IP address. This test will fail, as the
   following example shows, because the rule that was applied does not permit
   ICMP traffic. You will add a rule for ICMP traffic in the next steps!

   .. code::

       $ PING 10.22.253.123 (10.22.253.123): 56 data bytes
       Request timeout for icmp_seq 0
       Request timeout for icmp_seq 1
       Request timeout for icmp_seq 2

.. _sg-adding-icmp-rule-curl:

Adding a rule for ICMP traffic (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, add a rule for ICMP traffic to the security group. Then verify the rule,
and ensure that the security group contains the rule.

#. To add the rule, issue the following cURL command, substituting your own
   values for the ones shown.

   **Add ICMP rule with cURL request**

   .. code::

      $ curl -i $API_ENDPOINT/security-group-rules \
              -X 'POST' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -d '{"security_group_rule":{"direction":"ingress", "port_range_min":null,
                 "ethertype":"IPv4", "port_range_max":null, "protocol":"icmp",
                 "remote_ip_prefix":null,
                 "security_group_id":"fd269d7a-0909-488f-b5fc-5606c8aa489f"}}' \
                 | python -m json.tool

   **Add ICMP rule with cURL response**

   .. code::

       {
           "security_group_rule": {
               "direction": "ingress",
               "ethertype": "IPv4",
               "id": "483b107a-dbf8-41a9-8494-f47558b58524",
               "port_range_max": null,
               "port_range_min": null,
               "protocol": "ICMP",
               "remote_group_id": null,
               "remote_ip_prefix": null,
               "security_group_id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
               "tenant_id": "5831008"
           }
       }


#. Note the security group rule ``id`` value from the output. You will need
   this value for verification. In this example, the ID is
   ``483b107a-dbf8-41a9-8494-f47558b58524``, but use the ID from your response.

#. To see the rule, issue the following cURL command.

   **List security group rules with cURL request**

   .. code::

      $ curl -i $API_ENDPOINT/security-group-rules \
              -X 'GET' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "X-User-Agent: python-novaclient" \
              -H "Accept: application/json" | python -m json.tool

   **List security group rules with cURL response**

   .. code::

       {
           "security_group_rules": [
            {
                   "direction": "ingress",
                   "ethertype": "IPv4",
                   "id": "483b107a-dbf8-41a9-8494-f47558b58524",
                   "port_range_max": null,
                   "port_range_min": null,
                   "protocol": "ICMP",
                   "remote_group_id": null,
                   "remote_ip_prefix": null,
                   "security_group_id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
                   "tenant_id": "5831008"
               },
               {
                   "direction": "ingress",
                   "ethertype": "IPv4",
                   "id": "ea794fe0-5f82-4b4e-8c38-7ab5d278973a",
                   "port_range_max": 22,
                   "port_range_min": 22,
                   "protocol": "TCP",
                   "remote_group_id": null,
                   "remote_ip_prefix": null,
                   "security_group_id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
                   "tenant_id": "5831008"
               }
           ]
       }

#. Notice that your new rule, ``483b107a-dbf8-41a9-8494-f47558b58524`` in this
   example, is included in the list of rules.

#. To see the rule in your group, issue the following cURL command.

   **List security groups with cURL request**

   .. code::

      $ curl -i $API_ENDPOINT/security-groups \
              -X 'GET' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "X-User-Agent: python-novaclient" \
              -H "Accept: application/json" | python -m json.tool

   **List security groups with cURL response**

   .. code::

       {
           "security_groups": [
               {
                   "description": "security group for webservers",
                   "id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
                   "name": "1-new-tcp",
                   "security_group_rules": [
                       {
                           "direction": "ingress",
                           "ethertype": "IPv4",
                           "id": "483b107a-dbf8-41a9-8494-f47558b58524",
                           "port_range_max": null,
                           "port_range_min": null,
                           "protocol": "ICMP",
                           "remote_group_id": null,
                           "remote_ip_prefix": null,
                           "security_group_id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
                           "tenant_id": "5831008"
                       },
                       {
                           "direction": "ingress",
                           "ethertype": "IPv4",
                           "id": "ea794fe0-5f82-4b4e-8c38-7ab5d278973a",
                           "port_range_max": 22,
                           "port_range_min": 22,
                           "protocol": "TCP",
                           "remote_group_id": null,
                           "remote_ip_prefix": null,
                           "security_group_id": "fd269d7a-0909-488f-b5fc-5606c8aa489f",
                           "tenant_id": "5831008"
                       }
                   ],
                   "tenant_id": "5831008"
               }
           ]
       }

#. Notice that your group, ``fd269d7a-0909-488f-b5fc-5606c8aa489f``,
   contains both your rules, ``483b107a-dbf8-41a9-8494-f47558b58524`` and
   ``ea794fe0-5f82-4b4e-8c38-7ab5d278973a`` in this example.

.. _sg-applying-icmp-to-port-curl:

Applying security group with ICMP rule to the port on the server (cURL)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, apply the security group to the server port. Then test the security
group rule.

#. To apply the group, in this example
   ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, to the port, issue the following
   cURL command, substituting your port ID for the one shown.

   **Apply security group to port with cURL request**

   .. code::

      $ curl -i $API_ENDPOINT/ports/9dd49b03-956d-4cd5-ae23-6dbf89b76aeb \
              -X 'PUT' \
              -H "Content-Type: application/json" \
              -H "X-Auth-Token: $AUTH_TOKEN" \
              -H "User-Agent: python-novaclient" \
              -H "Accept: application/json" \
              -d '{"port": {"security_groups": ["fd269d7a-0909-488f-b5fc-5606c8aa489f"]}}' \
              | python -m json.tool

   **Positional argument:**

   -  The port ID to which the security group is attached. In this example, the
      port ID is ``9dd49b03-956d-4cd5-ae23-6dbf89b76aeb``.


   **Apply security group to port with cURL response**

   .. code::

        {
           "port": {
               "status": "ACTIVE",
               "name": "",
               "admin_state_up": true,
               "network_id": "00000000-0000-0000-0000-000000000000",
               "tenant_id": "5831008",
               "device_owner": "compute:None",
               "mac_address": "AA:BB:CC:00:01:15",
               "fixed_ips": [
                   {
                       "subnet_id": "7a39a7dd-ae0c-4083-b2dc-bd53aad0c3e8",
                       "ip_address": "10.22.253.123"
                   },
                   {
                       "subnet_id": "3d8e2de1-18ad-4a41-8adf-56e057d6b411",
                       "ip_address": "2001:4801:787f:205:a8bb:ccff:fe00:115"
                   }
               ],
               "id": "9dd49b03-956d-4cd5-ae23-6dbf89b76aeb",
               "security_groups": [
                   "fd269d7a-0909-488f-b5fc-5606c8aa489f"
               ],
               "device_id": "6ae4be93-4ec7-4b55-897a-c250f3a6e161"
           }
       }

#. Notice that your security group, in this example
   ``fd269d7a-0909-488f-b5fc-5606c8aa489f``, is listed in the port details,
   meaning it was successfully applied.

#. Test the port by pinging the IP address. This test will succeed, as the
   following example shows, because the rule applied explicitly permits ICMP
   traffic.

   .. code::

       $ PING 10.22.253.123 (10.22.253.123): 56 data bytes
       64 bytes from 10.22.253.123: icmp_seq=0 ttl=55 time=85.080 ms
       64 bytes from 10.22.253.123: icmp_seq=1 ttl=55 time=84.263 ms
       64 bytes from 10.22.253.123: icmp_seq=2 ttl=55 time=148.971 ms

