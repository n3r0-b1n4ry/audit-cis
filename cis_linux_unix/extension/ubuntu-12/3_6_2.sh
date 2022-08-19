cis_test_name="Ensure default deny firewall policy"

function cis_test_run()
{
    cmd=$(iptables -L)
    if [[ "$cmd" == *"Chain INPUT (policy DROP)"* ]] || [[ "$cmd" == *"Chain INPUT (policy REJECT)"* ]]; then
        if [[ "$cmd" == *"Chain FORWARD (policy DROP)"* ]] || [[ "$cmd" == *"Chain FORWARD (policy REJECT)"* ]]; then
            if [[ "$cmd" == *"Chain OUTPUT (policy DROP)"* ]] || [[ "$cmd" == *"Chain OUTPUT (policy REJECT)"* ]]; then
                return 0
            fi
        fi
    fi
    return 1
}

