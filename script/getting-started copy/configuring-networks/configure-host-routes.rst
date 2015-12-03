=====================
Configure host routes
=====================

At server boot time, you can use the host routes in the *``subnets``*
resource to pass specific static routes to the server.

The following flow chart shows the steps for configuring host routes.
Detailed steps are provided in this section.

**Figure 10.1. Steps to configure host routes**

|Steps to configure host routes|

The sections are also organized by example type. To simplify your path
through this chapter, decide whether you prefer neutron-client or cURL
examples.

**Next step:** Choose one of the following methods:

-  `Configure host routes with neutron <chr_neutron_neutron.html>`__

-  `Configure host routes with cURL <chr_neutron_curl.html>`__

Configure host routes with neutron
----------------------------------

These sections walk you through configuring host routes by using the
neutron client.

**Start here:** `Create a network (neutron
client) <neutron_create_network_chr_neutron.html>`__

Create a network (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After you create a network, copy its network ID. You use this ID to
create a subnet and boot the server.

#. Issue the following neutron client command, substituting your own
   values for the ones shown.

   -  The network name. In this example, the network name is
      ``Rackernet``.

   .. code::  

      $ neutron net-create Rackernet

   **Positional argument:**

   **Output:**

   The command returns the response, as shown in the following output:

   .. code::  

       +----------------+--------------------------------------+
       | Field          | Value                                |
       +----------------+--------------------------------------+
       | admin_state_up | True                                 |
       | id             | a8fde776-e80f-47bb-a050-0c057d89afc3 |
       | name           | Rackernet                            |
       | shared         | False                                |
       | status         | ACTIVE                               |
       | subnets        |                                      |
       | tenant_id      | 5831008                              |
       +----------------+--------------------------------------+

#. Copy the ``id`` value from the output. You will use this value when
   you create a subnet, provision your server, or perform other related
   activities. In this example, the ID is
   ``a8fde776-e80f-47bb-a050-0c057d89afc3``, but use the ID from your
   response.

**Next step:** `Create a subnet with host routes (neutron
client) <neutron_create_subnet_chr_neutron.html>`__

Create a subnet with host routes (neutron client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create a subnet with host routes, you specify a network, an IP
address, allocation pools, and host routes for your subnet.

#. Issue the following cURL command, substituting your own values for
   the ones shown.

   **Positional argument:**

   -  **ip-version** The version of the subnet IP. In this example, the
      version is ``4``.

   -  **allocation-pool** The start and end addresses for one or more
      allocation pools. In this example, there are two pools
      ``start=192.168.5.3,end=192.168.5.100`` and
      ``start=192.168.5.103,end=192.168.5.254``.

   -  **host-route** A list of host route dictionaries for the subnet.
      In this example, we used
      ``"destination": "1.1.1.0/24", "nexthop":                                     "192.168.5.254"``.

   -  **tenant-id** The tenant ID. In this example, we used the tenant
      ID ``5831008``.

   -  The network ID or name. In this example, we used the network ID
      ``a8fde776-e80f-47bb-a050-0c057d89afc3``.

   -  The network CIDR. In this example, the CIDR is ``192.168.5.0/24``.

   .. code::  

                                   $ neutron subnet-create \
           --ip-version 4 \
           --allocation-pool start=192.168.5.3,end=192.168.5.100 \
           --allocation-pool start=192.168.5.103,end=192.168.5.254 \
           --host-route destination=1.1.1.0/24,nexthop=192.168.5.254 \
           --tenant-id 5831008 \
           a8fde776-e80f-47bb-a050-0c057d89afc3 192.168.5.0/24

   **Output:**

   The command returns the response, as shown in the following output:

   .. code::  

       +------------------+-----------------------------------------------------------+
       | Field            | Value                                                     |
       +------------------+-----------------------------------------------------------+
       | allocation_pools | {"start": "192.168.5.3", "end": "192.168.5.100"}          |
       |                  | {"start": "192.168.5.103", "end": "192.168.5.254"}        |
       | cidr             | 192.168.5.0/24                                            |
       | dns_nameservers  |                                                           |
       | enable_dhcp      |                                                           |
       | gateway_ip       |                                                           |
       | host_routes      | {"destination": "1.1.1.0/24", "nexthop": "192.168.5.254"} |
       | id               | 98c1af30-05c9-4502-8b1f-9bffde843cba                      |
       | ip_version       | 4                                                         |
       | name             |                                                           |
       | network_id       | a8fde776-e80f-47bb-a050-0c057d89afc3                      |
       | tenant_id        | 5831008                                                   |
       +------------------+-----------------------------------------------------------+

#. Note the host\_routes attribute with the destination of
   ``1.1.1.0/24`` and the nexthop of ``192.168.5.254``.

**Next step:** `Boot Server (nova
client) <neutron_boot_server_chr_nova.html>`__

Boot a Server (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to boot server with the nova client,
using the network ID of the network you created in the first step of
this procedure. You need the following information:

-  The name of the new server. Use a name of your choice.

-  **image** The image ID.

-  **flavor** The flavor ID.

-  **nic**The network ID of the network, which is
   ``net-id=a8fde776-e80f-47bb-a050-0c057d89afc3``.

#. Issue the following nova client command:

   .. code::  

       $ nova boot ata --image ffa476b1-9b14-46bd-99a8-862d1d94eb7a /
                               --flavor 2 --nic net-id=a8fde776-e80f-47bb-a050-0c057d89afc3

   The operation returns information about the new server, as shown in
   the following example:

   .. code::  

       +-------------------------+-----------------------------------------------------------------+
       | Property                | Value                                                           |
       +-------------------------+-----------------------------------------------------------------+
       | OS-DCF:diskConfig       | AUTO                                                            |
       | OS-EXT-STS:power_state  | 0                                                               |
       | OS-EXT-STS:task_state   | scheduling                                                      |
       | OS-EXT-STS:vm_state     | building                                                        |
       | accessIPv4              |                                                                 |
       | accessIPv6              |                                                                 |
       | adminPass               | ugZmn5Le6S8y                                                    |
       | created                 | 2014-02-06T20:05:12Z                                            |
       | flavor                  | m1.mid (2)                                                      |
       | hostId                  |                                                                 |
       | id                      | a1061a57-0136-4c29-aac1-8b1a646a3001                            |
       | image                   | cirros-0.3.0-x86_64-disk (82e72de5-6366-4217-8c87-a570a9b17e73) |
       | metadata                | {}                                                              |
       | name                    | ata                                                             |
       | progress                | 0                                                               |
       | security_groups         | default                                                         |
       | status                  | BUILD                                                           |
       | tenant_id               | 5831008                                                         |
       | updated                 | 2014-02-06T20:05:12Z                                            |
       | user_id                 | 28be72f8fc5b45589c93f55274e459ce                                |
       +-------------------------+-----------------------------------------------------------------+

#. Copy the ``id`` value from the output for future reference. In this
   example, the ID is ``a1061a57-0136-4c29-aac1-8b1a646a3001``, but use
   the ID from your response.

**Next step:** `Verify the IP on the server port (nova
client) <neutron_verify_ip_chr_nova.html>`__

Verify the IP on the server port (nova client)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following step shows you how to verify the IP address on the server
port. In this case, the IP address should be ``192.168.5.3`` from the
start of the allocation pool.

#. Issue the following nova command:

   .. code::  

       $ nova list a1061a57-0136-4c29-aac1-8b1a646a3001

   **Positional arguments:**

   -  The server ID. In this example, the ID is
      ``a1061a57-0136-4c29-aac1-8b1a646a3001``.

   **Output:**

   The command returns the response, as shown in the following output:

   .. code::  

       +-------------------------+------------------------------------------------------------------------------------+
       | Property                | Value                                                                              |
       +-------------------------+------------------------------------------------------------------------------------+
       | OS-DCF:diskConfig       | AUTO                                                                               |
       | OS-EXT-STS:power_state  | 1                                                                                  |
       | OS-EXT-STS:task_state   | None                                                                               |
       | OS-EXT-STS:vm_state     | active                                                                             |
       | accessIPv4              | 10.23.233.124                                                                      |
       | accessIPv6              | 2001:4801:787f:205:bccb:feff:fe00:189                                              |
       | created                 | 2012-08-16T16:28:18Z                                                               |
       | flavor                  | 8GB Standard Instance (6)                                                          |
       | hostId                  | 0488142a8f859cb4020234cc235f8cd8a22bee126726025d70c0b9ba                           |
       | id                      | a1061a57-0136-4c29-aac1-8b1a646a3001                                               |
       | image                   | cirros-0.3.0-x86_64-disk (82e72de5-6366-4217-8c87-a570a9b17e73)                    |
       | metadata                | {}                                                                                 |
       | name                    | ata                                                                                |
       | Rackernet               | 192.168.5.3                                                                        |
       | private network         | 10.181.192.114                                                                     |
       | progress                | 100                                                                                |
       | public network          | 2001:4801:787f:205:bccb:feff:fe00:189, 10.23.233.124                               |
       | status                  | ACTIVE                                                                             |
       | tenant_id               | 5831008                                                                            |
       | updated                 | 2014-02-06T20:05:12Z                                                               |
       | user_id                 | 207638                                                                             |
       +-------------------------+------------------------------------------------------------------------------------+

#. Note the IP address on the ``public`` interface (in this case,
   ``10.23.233.124``). Use this to log in to the server in the next
   step.

**Next step:** `Log in to the server and verify the route
(ssh) <neutron_verify_route_chr_sshneutron.html>`__

Log in to the server and verify the route (ssh)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following steps show you how to log in to the server and verify that
the host route is configured correctly by using the command line.

#. Issue the following command at the prompt, substituting your own
   values for the ones shown:

   .. code::  

                               $ ssh root@10.23.233.124

   The command returns output like the following example:

   .. code::  

       The authenticity of host '10.23.233.124 (10.23.233.124)' can't be established.
       RSA key fingerprint is 87:b6:8f:7a:44:80:a4:58:f8:9b:09:82:d4:b0:f9:bf.
       Are you sure you want to continue connecting (yes/no)? yes
       Warning: Permanently added '10.23.233.124' (RSA) to the list of known hosts.
       root@10.23.233.124's password:


#. Enter your password when prompted.

#. Issue the following command at the prompt:

   .. code::  

      root@ata:~# route

   The command returns output like the following example:

   .. code::  

       Kernel IP routing table
       Destination Gateway Genmask Flags Metric Ref Use Iface
       default 10.23.233.1 0.0.0.0 UG 100 0 0 eth0
       1.1.1.0 192.168.5.254 255.255.255.0 UG 0 0 0 eth2
       10.23.233.0 * 255.255.255.0 U 0 0 0 eth0
       10.181.192.0 * 255.255.248.0 U 0 0 0 eth1
       192.168.5.0 * 255.255.255.0 U 0 0 0 eth2
                           

   Notice the route ``1.1.1.0`` with Gateway ``192.168.5.254`` in the
   preceding output. That is what was expected.

**Next topic:** `Provision additional IP address and dual-stack IP
addresses on an isolated network port <provision_additional_ips.html>`__


