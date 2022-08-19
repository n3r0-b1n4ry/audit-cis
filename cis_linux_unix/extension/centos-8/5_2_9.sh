cis_test_name="Ensure SSH PermitEmptyPasswords is disabled"

function cis_test_run()
{
    grep "^\s*PermitEmptyPasswords" /etc/ssh/sshd_config | grep -q "PermitEmptyPasswords\s*no" || return $?
}
