cis_test_name="Ensure rsyslog Service is enabled"

function cis_test_run()
{
    systemctl is-enabled rsyslog 2>/dev/null | grep enabled || return $?
}
