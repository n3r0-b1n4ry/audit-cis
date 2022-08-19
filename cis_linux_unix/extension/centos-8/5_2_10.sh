cis_test_name="Ensure SSH PermitUserEnvironment is disabled"

function cis_test_run()
{
    grep "^\s*PermitUserEnvironment" /etc/ssh/sshd_config | grep -q "PermitUserEnvironment\s*no" || return $?
}
