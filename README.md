# ansible-role-time [![Build Status][img-build-status]][build-status]

Installs and configures time synchronization on a machine using `ntpd` or `systemd-timesyncd`. This role is targeted at
providing a time _client_ to keep time in sync with other servers; as opposed to installing and configuring `ntpd` as an
actual time server for others to use.

Available on Ansible Galaxy at [`naftulikay.time`][galaxy].

## Requirements

Officially tested operating systems are listed in the Galaxy manifest; beyond that, a system must be able to run either
timesyncd or ntp to synchronize the time.

## Role Variables

For now, none are applicable and all may be overwritten at runtime. Later refactoring may make specifying custom NTP
and fallback NTP servers possible.

## Dependencies

None.

## Example Playbook

Here are some example playbooks to get started with.

### Defaults

Simply get that time syncing.

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
