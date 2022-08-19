cis_test_name="Ensure SSH warning banner is configured"

function cis_test_run()
{
    grep -qE "^Banner\s+" /etc/ssh/sshd_config || return $?
}
