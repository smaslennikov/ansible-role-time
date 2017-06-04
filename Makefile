#!/usr/bin/env make -f

SHELL:=/bin/bash

ROLE_NAME:=$(shell tests/runc get-role-name)
IMAGE:=naftulikay/$(shell echo "$${os:-centos}")-vm:latest
SYSTEMD:=$(shell test "$${os:-trusty}" == "trusty" && echo false || echo true)
NO_CLEAN:=$(shell echo "$${no_clean:-n}")

.PHONY: all

validate:
	@if [ "$(ROLE_NAME)" == "" ]; then \
		echo "Unable to detect role name in Makefile." ; \
		exit 1 ; \
	fi

clean:
	@# if it's running, stop it, which will remove it
	@if [ "$(NO_CLEAN)" != "y" ]; then \
		tests/runc status >/dev/null && tests/runc stop || true ; \
	else \
		echo "WARNING: Not cleaning any existing container." ; \
	fi

start:
	@# start it on up y'all
	@if ! tests/runc status >/dev/null ; then \
		tests/runc start $(IMAGE) $(SYSTEMD) ; \
	fi

status:
	@tests/runc status

stop:
	@tests/runc stop

test: validate clean start
	# Install Galaxy Dependencies
	@tests/runc exec ansible-galaxy install -r /etc/ansible/roles/$(ROLE_NAME)/tests/requirements.yml
	# Run Playbook
	tests/runc exec ansible-playbook \
		-e degoss_dump_output=true \
		-e time_force_sync=true \
		-e degoss_no_clean=$$([ "$(NO_CLEAN)" == "y" ] && echo true || echo false) \
		/etc/ansible/roles/$(ROLE_NAME)/tests/playbook.yml
