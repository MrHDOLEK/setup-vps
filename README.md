# Ansible: VPS Setup

## Requirements

- docker
- docker-compose
  or
- python
- ansible installed for your local machine

## What is set up ?

- AppArmor
- Auditd
- Cron
- Iptables
- journald
- sshd
- sysctl
- timesyncd
- fail2ban
- docker and docker-compose
- create user
- off root login
- remove unnecessary services

## Setup

1. `cp inventory.example inventory`
2. You need to change these variables in the inventory file to
    - debian -> Ip address or hostname
    - ansible_user=test -> The name of the user by which we will initiate the server. Ideally, it should be root or a
      user in the sudo group
    - ansible_ssh_pass=test -> Password to user above
3. You must replace in the vps.yml this value
    - username -> The username to which we will be logging in
    - password -> Hash of your password. To create it you need to run this
      command `make create_password PASS=<your password>`

### By docker

1. `make start` or `docker-compose up -d`
2. `make bash` or `docker exec -it <container id> bash`
3. `ansible-playbook -i inventory vps.yml`
4. If we want to install the selected modules then `ansible-playbook -i inventory vps.yml --tags "user,docker"`

### By ansible for local machine

1. `ansible-galaxy install -r requirements.yml`
2. `ansible-playbook -i inventory vps.yml`
3. If we want to install the selected modules then `ansible-playbook -i inventory vps.yml --tags "user,docker"`

## All commands

- `make help`

## FAQ

##

**Q:** Where can I get knowledge in linux administration ? ?

**A:** Collection of
knowledge [mikrus](https://www.notion.so/Biblioteka-Mikrusa-3c757621cf9b4fbfb3909fc04a77dbcf?p=9003f1758646468ebe6dbb5afb1a8f4d&pm=s)

##
