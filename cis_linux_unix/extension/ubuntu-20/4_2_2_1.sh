cis_test_name="Ensure syslog-ng service is enabled"

function cis_test_run()
{
    cmd=$(systemctl is-enabled syslog-ng)
    if [[ "$cmd" == *"enabled"* ]]; then
        return 0
    fi
    return 1
}

