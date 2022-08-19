cis_test_name="Ensure iptables is installed"

function cis_test_run()
{
    cmd=$(dpkg -s iptables)
    if [[ "$cmd" == *"installed"* ]]; then
        return 0
    fi
    return 1
}

