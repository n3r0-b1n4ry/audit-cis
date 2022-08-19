cis_test_name="Ensure loopback traffic is configured"

function cis_test_run()
{
    cmd=$(iptables -L INPUT -v -n)
    if [[ "$cmd" == *"ACCEPT all -- lo * 0.0.0.0/0"* ]]; then
        if [[ "$cmd" == *"DROP all -- * * 127.0.0.0/8"* ]]; then
            cmd=$(iptables -L OUTPUT -v -n)
            if [[ "$cmd" == *"ACCEPT all -- lo * 0.0.0.0/0"* ]]; then
                return 0
            fi
        fi
    fi
    return 1
}

