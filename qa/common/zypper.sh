#!/bin/bash
# This file is part of the sesdev-qa integration test suite

set -e

#
# zypper-specific helper functions
#

function _dump_salt_master_zypper_repos {
    zypper lr -upEP
}

function _zypper_ref_on_master {
    set +x
    for delay in 60 60 60 60 ; do
        zypper --non-interactive --gpg-auto-import-keys refresh && break
        sleep $delay
    done
    set -x
}

function _zypper_install_on_master {
    set -x
    zypper --non-interactive install --no-recommends $@
    set +x
}

