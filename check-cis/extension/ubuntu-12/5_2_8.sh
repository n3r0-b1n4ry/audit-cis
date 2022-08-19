cis_test_name="Ensure SSH root login is disabled"

function cis_test_run()
{
    cmd=$(grep "^PermitRootLogin" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"PermitRootLogin no"* ]]; then
        return 0
    fi
    return 1
}

