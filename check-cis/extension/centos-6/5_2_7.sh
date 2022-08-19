cis_test_name="Ensure SSH HostbasedAuthentication is disabled"

function cis_test_run()
{
    grep "^\s*HostbasedAuthentication" /etc/ssh/sshd_config | grep -q "HostbasedAuthentication\s*no" || return $?
}
