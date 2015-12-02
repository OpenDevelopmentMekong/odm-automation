# odm-automation

Ansible playboks for automatic staging and deployment

# Contents

## deploy.sh

A bash wrapper script calling ansible playbooks that allows OpenDevelopmentMekong developers to update the code base of the following modules and environments:

### modules

- **ckan**: Script updates all ckanext plugins maintained by ODM to their latest code and restarts the ckan instance
- **wp**: Script goes through all WP plugins and themes being maintained by ODM as submodules pulling their latest code.

### environments

- **dev**
- **prod**

## Pre-requisites

Developers need to install Ansible (http://docs.ansible.com/ansible/intro_installation.html#getting-ansible) on their machines to be able to run these scripts.

## Usage

### Authorization

For using this scripts developers MUST coordinate with system administrator and place their public key on the authorized-keys file for both Pre-production and Production server instances.

### Configuration

Configure the code repositories and branches to be deployed on **group_vars** folder

### Execute

Once this is done, scripts can be executed as follows:

```
./server.sh [wp|ckan] [dev|production]
```

Alternativelly, the ansible playbooks found on ansible/ can be executed independently using:

```
ansible-playbook ansible/<PLAYBOOK_FILE>.yml -i ansible/stage -u root
```

## TODO

 - [ ] Enable deployment to production environment

# Copyright and License

This material is copyright (c) 2014-2015 East-West Management Institute, Inc. (EWMI).

It is open and licensed under the GNU General Public License (GPL) v3.0 whose full text may be found at:

http://www.fsf.org/licensing/licenses/gpl-3.0.html
