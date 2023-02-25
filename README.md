# Ansible Collection - ansible_role_converter

## Introduction

This script convert a ansible playbook in role.

## Framework or Coding Technology

-----BEGIN TECH-----\
N/A
-----END TECH-----


## Execution methods

1. Download the script in the same path as the playbook to be converted 
2. Execute the script and fill in the questions

### Example Playbook


```
$ ./ansible_role_converter.sh
Enter the playbook path: playbook.yml
Enter the name of the new role: lnx_new_role
Enter the current date Ex: 28 FEB 2023: 24 FEB 2023
Briefly explain what this new role does: This is a new role
- Role lnx_new_role was created successfully
Playbook playbook.yml has been converted to role lnx_new_role in lnx_new_role

```

## Variables

N/A

## Dependencies

| **Software/Framework/Code repository**  | **Version/Description**  |
|:-----------------------------------:|:------------:|
| bash | 2.0 |

## Supporting Documents, Handbooks, QPs and TOPs

## Tested Versions

| **Operating System**
|:------------:|
| RHEL9
| RHEL8
| RHEL7

## Supported Infrastructures

N/A

## Manual Tests

N/A

## Deviations and open defects

N/A

## Author Information

Nestor Avelino

## License

Copyright (c) 2023
