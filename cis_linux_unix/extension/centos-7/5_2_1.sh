cis_test_name="Ensure permissions on /etc/ssh/sshd_config are configured"

function cis_test_run()
{
    stat -L -c "%a %u %g" /etc/ssh/sshd_config | grep -q "600 0 0$" || return $?
}
