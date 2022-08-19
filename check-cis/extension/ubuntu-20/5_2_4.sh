cis_test_name="Ensure SSH X11 forwarding is disabled"

function cis_test_run()
{
    cmd=$(grep "^X11Forwarding" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"X11Forwarding no"* ]]; then
        return 0
    fi
    return 1
}

