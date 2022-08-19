cis_test_name="Ensure rsyslog is configured to send logs to a remote log host"

function cis_test_run()
{
    cmd="$(grep -q "^\*.\*[^I][^I]*@" /etc/rsyslog.conf 2>/dev/null)"
    if [[ "$cmd" != "" ]]; then
        return 0
    fi
    return 1
}