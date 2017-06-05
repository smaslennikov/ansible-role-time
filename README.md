# ansible-role-time [![Build Status][img-build-status]][build-status]

Installs and configures time synchronization on a machine using `ntpd` or `timesyncd`.

Available on Ansible Galaxy at [`naftulikay.time`][galaxy].

## Requirements

Officially tested operating systems are listed in the Galaxy manifest; beyond that, a system must be able to run either
timesyncd or ntp to synchronize the time.

## Role Variables

Please tour `vars/main.yml` and `defaults/main.yml` for a view into other variables, if any.

<dl>
  <dt><code>time_ntp_servers</code></dt>
  <dd></dd>
  <dt><code>time_ntp_fallback_servers</code></dt>
  <dd></dd>
  <dt><code>time_force_sync_interval</code></dt>
  <dd></dd>
</dl>

## Dependencies

None.

## Example Playbook

Here are some example playbooks to get started with.

### Defaults

Lorem ipsum.

```yaml
---
- name: install
  hosts: all
  become: true
  roles:
    - role: time
```

## License

MIT

 [build-status]: https://travis-ci.org/naftulikay/ansible-role-time
 [img-build-status]: https://travis-ci.org/naftulikay/ansible-role-time.svg?branch=master
 [galaxy]: https://galaxy.ansible.com/naftulikay/time/
