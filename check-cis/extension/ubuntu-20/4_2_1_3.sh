cis_test_name="Ensure rsyslog default file permissions configured"

function cis_test_run()
{
    cmd=$(grep ^\$FileCreateMode /etc/rsyslog.conf /etc/rsyslog.d/*.conf)
    if [[ "$cmd" == *"0640"* ]]; then
        return 0
    fi
    return 1
}

