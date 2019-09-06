# Ansible Vagrant Examples

This repository contains a collection of example virtual machines running various applications. The VMs are created via Vagrant and provisioned via Ansible.

You can `cd` into any of the included directories and run `vagrant up`, and a generic Linux VM will be booted and configured in a few minutes. You just need to install [Vagrant](http://vagrantup.com/), [VirtualBox](https://www.virtualbox.org/), and [Ansible](http://www.ansible.com/). View the included README.md file in any of the subdirectories to find out more about the particular VM.

All of these examples use a combination of [roles I've added to Ansible Galaxy](https://servercheck.in/blog/using-ansible-galaxy), and were created to help demonstrate Ansible's simplicity and flexibility.

Read more about Ansible and how I use it to manage infrastructure in [Ansible for DevOps](https://www.ansiblefordevops.com/), a book I've written.

# VMs/Apps Currently Present

- **AWX** (`awx` - Ansible AWX (CI/CD system for running Ansible playbooks)
- **Docker** (`docker` - Docker container building and management (builds a simple LAMP stack).
- **Drupal** (`drupal` - LAMP/LEMP-based Content Management System)
- **ELK** (`elk` - Log monitoring (Elasticsearch, Logstash, Kibana) and forwarding (Logstash forwarder))
- **GitLab** (`gitlab` - Ruby-based GitHub-like Git web interface)
- **Vault-Enterprise** (`vault-enterprise` - HashiCorp Vault Enterprise server

## License

MIT license.

## Author Information

Created in 2014 by [Jeff Geerling](https://www.jeffgeerling.com/), author of [Ansible for DevOps](https://www.ansiblefordevops.com/).
