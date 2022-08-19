cis_test_name="Ensure SSH HostbasedAuthentication is disabled"

function cis_test_run()
{
    cmd=$(grep "^HostbasedAuthentication" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"HostbasedAuthentication no"* ]]; then
        return 0
    fi
    return 1
}

