#!/bin/bash

# Define the variables
read -p "Enter the playbook path: " playbook_path
read -p "Enter the name of the new role: " role_name
read -p "Your name: " AUTHOR
read -p "Enter the current date: " DATE
read -p "Briefly explain what this new role does: " INTRODUCTION
role_path="${role_name}"

#Check if role already exists
if [ -d "${role_path}" ]; then
  echo "Role ${role_name} already exists. Delete the existing role and try again."
  exit 1
fi

# Create the directory structure of the new role using ansible-galaxy
ansible-galaxy init ${role_name}

#We take the tasks apart
cat $playbook_path > $role_name/tasks/main.yml
sed -n -i '/tasks/,/always\|rescue\|handler/p' $role_name/tasks/main.yml; sed -i 's/tasks://g;s/always://g;s/rescue://g;s/handler://g' $role_name/tasks/main.yml

#We take the variables apart
cat $playbook_path > $role_name/vars/main.yml
sed -n -i '/vars/,/tasks/p' $role_name/vars/main.yml; sed -i 's/vars://g;s/tasks://g' $role_name/vars/main.yml

# Creating CHANGELOG.md file

cat << EOF > $role_name/CHANGELOG.md
# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - DATE
EOF

sed -i "s/DATE/$DATE/g" $role_name/CHANGELOG.md

# Creating README.md file

cat << EOF > $role_name/README.md
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


$ ./ansible_role_converter.sh\
Enter the playbook path: playbook.yml\
Enter the name of the new role: lnx_new_role\
Enter the current date Ex: 28 FEB 2023: 24 FEB 2023\
Briefly explain what this new role does: This is a new role\
- Role lnx_new_role was created successfully
Playbook playbook.yml has been converted to role lnx_new_role in lnx_new_role\


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

AUTHOR

## License

Copyright (c) 2023
EOF

sed -i "s/NAME_ROLE/$role_name/g" $role_name/README.md
sed -i "s/INTRODUCTION/$INTRODUCTION/g" $role_name/README.md
sed -i "s/AUTHOR/$AUTHOR/g" $role_name/README.md

echo "Playbook ${playbook_path} has been converted to role ${role_name} in ${role_path}"
