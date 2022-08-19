cis_test_name="Ensure SSH warning banner is configured"

function cis_test_run()
{
    cmd=$(grep "^Banner" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"Banner /etc/issue.net"* ]]; then
        return 0
    fi
    return 1
}

