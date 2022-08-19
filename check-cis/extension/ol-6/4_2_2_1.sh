cis_test_name="Ensure syslog-ng service is enabled"

function cis_test_run()
{
    systemctl is-enabled syslog-ng 2>/dev/null | grep enabled || return $?
}
