cis_test_name="Ensure rsyslog Service is enabled"

function cis_test_run()
{
    cmd=$(systemctl is-enabled rsyslog)
    if [[ "$cmd" == *"enabled"* ]]; then
        return 0
    fi
    return 1
}

