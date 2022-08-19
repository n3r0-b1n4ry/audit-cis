cis_test_name="Ensure SSH root login is disabled"

function cis_test_run()
{
    grep "^\s*PermitRootLogin" /etc/ssh/sshd_config | grep -q "PermitRootLogin\s*no" || return $?
}
