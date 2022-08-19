cis_test_name="Ensure SSH X11 forwarding is disabled"

function cis_test_run()
{
    grep "^\s*X11Forwarding" /etc/ssh/sshd_config | grep -q "X11Forwarding\s*no" || return $?
}
