cis_test_name="Ensure SSH Protocol is set to 2"

function cis_test_run()
{
    grep "^\s*Protocol" /etc/ssh/sshd_config | grep -q "Protocol\s*2" || return $?
}
