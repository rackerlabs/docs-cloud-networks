Security Groups
---------------

This section describes the API operations for security groups. For general information about 
security groups and security group rules, see :ref:`Security groups concepts <cn-dg-concepts-security>`.

.. note::
	The Security Groups API is currently in Limited Availability. It is available only to 
	Managed Infrastructure customers and not to RackConnect or Managed Operations customers. 
	To use this feature, contact Rackspace Support.


.. toctree::
    :maxdepth: 2

    List (GET /v2.0/security-groups) <get-list-security-groups-v2.0-security-groups>
    Create (POST /v2.0/security-groups) <post-create-security-group-v2.0-security-groups>
    Show details (GET /v2.0/security-groups/{security_group_id}) <get-show-security-group-v2.0-security-groups-security-group-id>
    Delete (DELETE /v2.0/security-groups/{security_group_id}) <delete-delete-security-group-v2.0-security-groups-security-group-id>

Security Groups Rules
---------------------

.. toctree::
    :maxdepth: 2
        
    List (GET /v2.0/security-group-rules) <get-list-security-group-rules-v2.0-security-group-rules>
    Create (POST /v2.0/security-group-rules) <post-create-security-group-rule-v2.0-security-group-rules>
    Show details (GET /v2.0/security-group-rules/{rules-security-groups-id}) <get-show-security-group-rule-v2.0-security-group-rules-rules-security-groups-id>
    Delete (DELETE /v2.0/security-group-rules/{rules-security-groups-id}) <delete-delete-security-group-rule-v2.0-security-group-rules-rules-security-groups-id>