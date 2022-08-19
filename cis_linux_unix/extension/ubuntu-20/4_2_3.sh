cis_test_name="Ensure rsyslog or syslog-ng is installed"

function cis_test_run()
{
    cmd=$(dpkg -s rsyslog)
    if [[ "$cmd" == *"installed"* ]]; then
        return 0
    else
        cmd=$(dpkg -s syslog-ng)
        if [[ "$cmd" == *"installed"* ]]; then
            return 0
        fi
    fi
    return 1
}

