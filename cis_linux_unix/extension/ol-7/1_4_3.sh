cis_test_name="Ensure authentication required for single user mode"

function cis_test_run()
{
    cmd=$(grep /sbin/sulogin /usr/lib/systemd/system/rescue.service)
    if [[ "$cmd" != 'ExecStart=-/bin/sh -c "(/usr)?/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"' ]]; then
        cmd="$(grep /sbin/sulogin /usr/lib/systemd/system/emergency.service)"
        if [[ "$cmd" != 'ExecStart=-/bin/sh -c "(/usr)?/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"' ]]; then
            return 0
        fi
    fi
    return 1
}

