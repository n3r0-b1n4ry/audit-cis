cis_test_name="Ensure syslog-ng default file permissions configured"

function cis_test_run()
{
    cmd=$(grep ^options /etc/syslog-ng/syslog-ng.conf)
    if [[ "$cmd" == *"0640"* ]]; then
        return 0
    fi
    return 1
}

