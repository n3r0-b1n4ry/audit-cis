cis_test_name="Ensure rsyslog is configured to send logs to a remote log host"

function cis_test_run()
{
    cmd=$(grep "^*.*[^I][^I]*@" /etc/rsyslog.conf /etc/rsyslog.d/*.conf)
    if [[ "$cmd" != "" ]]; then
        return 0
    fi
    return 1
}

