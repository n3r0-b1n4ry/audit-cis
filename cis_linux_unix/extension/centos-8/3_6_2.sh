cis_test_name="Ensure default deny firewall policy"

function cis_test_run()
{
    cmd="$(iptables -L | egrep "Chain INPUT")"
    if [[ "$cmd" != *"policy DROP"* ]]; then
        return 1
    fi
    cmd="$(iptables -L | egrep "Chain FORWARD")"
    if [[ "$cmd" != *"policy DROP"* ]]; then
        return 1
    fi
    cmd="$(iptables -L | egrep "Chain OUTPUT")"
    if [[ "$cmd" != *"policy DROP"* ]]; then
        return 1
    fi
    return 0
}

