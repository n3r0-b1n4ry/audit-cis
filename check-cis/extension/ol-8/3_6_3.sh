cis_test_name="Ensure loopback traffic is configured"

function cis_test_run()
{
    accept="ACCEPT[[:space:]]+all[[:space:]]+--[[:space:]]+lo[[:space:]]+\*[[:space:]]+0\.0\.0\.0\/0[[:space:]]+0\.0\.0\.0\/0"
    accept2="ACCEPT[[:space:]]+all[[:space:]]+--[[:space:]]+\*[[:space:]]+lo[[:space:]]+0\.0\.0\.0\/0[[:space:]]+0\.0\.0\.0\/0"
    drop="DROP[[:space:]]+all[[:space:]]+--[[:space:]]+\*[[:space:]]+\*[[:space:]]+127\.0\.0\.0\/8[[:space:]]+0\.0\.0\.0\/0"
    iptables -L INPUT -v -n | egrep -q ${accept} || return 1
    iptables -L INPUT -v -n | egrep -q ${drop} || return 1
    iptables -L OUTPUT -v -n | egrep -q ${accept2} || return 1
    return 0
}
