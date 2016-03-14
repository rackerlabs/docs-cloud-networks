=========================
Role Based Access Control
=========================

Role Based Access Control (RBAC) restricts access to the capabilities of Rackspace Cloud 
services, including the Cloud Networks API, to authorized users only. RBAC enables 
Rackspace Cloud customers to specify which account users of their Cloud account have access 
to which Cloud Networks API service capabilities, based on roles defined by Rackspace 
(see :ref:`Roles Available for Cloud Networks <rbac-roles>`). The permissions to perform certain 
operations in Cloud Networks API – create, read, update, delete – are assigned to specific 
roles. The account owner user assigns these roles, either global (multiproduct) or 
product-specific (for example, Cloud Networks), to account users.

Assigning Roles to Account Users
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The account owner (identity:user-admin) can create account users on the account and then 
assign roles to those users. The roles grant the account users specific permissions for 
accessing the capabilities of the Cloud Networks service. Each account has only one account 
owner, and that role is assigned by default to any Rackspace Cloud account when the account 
is created.

See the :rax-devdocs:`Cloud Identity Client Developer Guide <cloud-identity/v2/developer-guide/#document-overview>` 
for information about how to perform the following tasks:

* :rax-devdocs:`Add account users <cloud-identity/v2/developer-guide/#add-user>`  

* :rax-devdocs:`Add role to user <cloud-identity/v2/developer-guide/#add-role-to-user>`  

* :rax-devdocs:`Delete global role from user <cloud-identity/v2/developer-guide/#delete-global-role-from-user>` 

.. note::

    The account owner (identity:user-admin) role cannot hold any additional roles because 
    it already has full access to all capabilities.

.. _rbac-roles:

Roles Available for Cloud Networks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Three roles (observer, creator, and admin) can be used to access the Cloud Networks API 
specifically. The following list describes these roles and their permissions.

**Cloud Networks Product Roles and Permissions**

- **cloudNetworks:admin** - This role provides Create, Read, Update, and Delete permissions 
  in Cloud Networks, where access is granted.

- **cloudNetworks:creator** - This role provides Create, Read, and Update permissions in 
  Cloud Networks, where access is granted.

- **cloudNetworks:observer** - This role provides Read permission in Cloud Networks, where 
  access is granted.

Additionally, two multiproduct roles apply to all products. Users with multiproduct roles 
inherit access to future products when those products become RBAC-enabled. The following 
list describes these roles and their permissions.

**Multiproduct (Global) Roles and Permissions**

- **admin** - This role provides Create, Read, Update, and Delete permissions in all products, 
  where access is granted.

- **observer** - This role provides Read permission in all products, where access is granted.

Resolving Conflicts Between Roles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The account owner can set roles for both multiproduct and Cloud Networks scope, and it is 
important to understand how any potential conflicts among these roles are resolved. When 
two roles appear to conflict, the role that provides the more extensive permissions takes 
precedence. Therefore, admin roles take precedence over observer and creator roles, because 
admin roles provide more permissions.

The following scenarios show examples of how potential conflicts between user roles in the 
Control Panel are resolved:

**Scenario 1:**

*Configuration:* User is assigned the following roles: multiproduct **observer** and Cloud Networks **admin**

*Control Panel View:* Appears that the user has only the multiproduct **observer** role.

*Permissions:* The user can perform product admin functions in the control panel for 
Cloud Networks only. The user has the **observer** role for the rest of the products.

**Scenario 2:**

*Configuration:* User is assigned the following roles: multiproduct **admin** and Cloud Networks **observer**

*Control Panel View:* Appears that the user has only the multiproduct **admin** role.

*Permissions:* The user can perform product admin functions in the control panel for all 
of the products. The Cloud Networks **observer** role is ignored.

RBAC Permissions Cross-reference to Cloud Networks API Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

API operations for Cloud Networks may or may not be available to all roles. To see which 
operations are permitted to invoke which calls, please review 
:how-to:`Detailed Permissions Matrix for RBAC<detailed-permissions-matrix-for-cloud-networks>`.

