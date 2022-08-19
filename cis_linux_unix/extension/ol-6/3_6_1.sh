cis_test_name="Ensure iptables is installed"

function cis_test_run()
{
    rpm -q iptables | grep -E "iptables-" || return $?
}
