cis_test_name="Ensure SSH IgnoreRhosts is enabled"

function cis_test_run()
{
    grep "^\s*IgnoreRhosts" /etc/ssh/sshd_config | grep -q "IgnoreRhosts\s*yes" || return $?
}
